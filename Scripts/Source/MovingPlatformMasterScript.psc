Scriptname MovingPlatformMasterScript extends ObjectReference

Group requiredProperties
float property TravelSpeed = 1.0 auto const
int property StartingFloor = 0 auto const
{Starting from "0" being the first floor.}
endGroup

Group optionalProperties
bool property animateAccessoryReferences = false auto const
Keyword property accessoruReferenceKeyword auto const
endGroup

Group audioProperties
bool property UseDirectionalSoundEvents = false auto Const
{when false, the 'TravelSoundEvent' will be played, regardless of the platform's movement direction. When true, direction-specific 'Start' and 'Stop' events will be played instead.}

WwiseEvent property TravelSoundEvent auto Const
{This should be a looping sound, which plays while the moving platform is in motion.}

WwiseEvent property UpwardTravelStartsEvent auto Const
{This sound plays once, when the platform begins traveling upwards.}

WwiseEvent property UpwardTravelStopsEvent auto Const
{This sound plays once, when the platform stops traveling upwards.}

WwiseEvent property DownwardTravelStartsEvent auto Const
{This sound plays once, when the platform begins traveling downwards.}

WwiseEvent property DownwardTravelStopsEvent auto Const
{This sound plays once, when the platform stops traveling downwards.}
endGroup


Group No_Touchy CollapsedOnRef
Keyword property MovingPlatform_TranslationHelperKeyword auto const
Keyword property MovingPlatform_InteriorDoorKeyword auto const
Keyword property MovingPlatform_InteriorButtonUpKeyword auto const
Keyword property MovingPlatform_InteriorButtonDownKeyword auto const
Keyword property MovingPlatform_CallButtonFloorKeyword auto const
LocationRefType property MovingPlatform_FloorMarkerLocationRefType auto const
endGroup

bool initialized = false
ObjectReference movingPlatformBase
ObjectReference interiorDoor
ObjectReference interiorButtonUp
ObjectReference interiorButtonDown
int[] nodeMarkerIndicesByFloorIndex
ObjectReference[] nodeMarkers
ObjectReference[] callButtons
int[] floorIndicesByCallButtonIndex
int currentFloorIndex
int maxFloorIndex
bool interiorDoorIsClosing
bool movingPlatformIsMoving
int currentNodeMarkerIndex
int targetNodeMarkerIndex
int targetFloorIndex
int travelStepValue
WwiseEvent currentTravelStartEvent = None
WwiseEvent currentTravelStopEvent = None
int travelSoundInstanceID = -1
int travelStopSoundInstanceID = -1

float doorOpenSeconds = 1.5

;------------------------------------------

event OnCellLoad()
    if(initialized == false)
	    InitializeMovingPlatform()
    else
        RegisterForEvents()
    endIf
endEvent

event OnUnload()
	UnregisterFromEvents()

    WwiseEvent.StopInstance(travelSoundInstanceID)
    WwiseEvent.StopInstance(travelStopSoundInstanceID)
endEvent

;------------------------------------------

event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ; early out if activation is blocked on button
    if(akSender.IsActivationBlocked())
        return
    endIf
    
    ; early out if moving platform is currently moving (could be improved later to let players call a platform while in movement)
    if(movingPlatformIsMoving)
        return
    endIf

    if(akSender == interiorButtonUp)
        if(currentFloorIndex < maxFloorIndex)
            ProcessFloorTravelRequest(currentFloorIndex + 1)
        endIf
    elseIf(akSender == interiorButtonDown)
        if(currentFloorIndex > 0)
            ProcessFloorTravelRequest(currentFloorIndex - 1)
        endIf
    else
        int callButtonIndex = callButtons.Find(akSender)

        if(callButtonIndex > -1)
            int requestedFloorIndex = floorIndicesByCallButtonIndex[callButtonIndex]

            if(requestedFloorIndex == currentFloorIndex)
                OpenInteriorDoor()
            else
                ProcessFloorTravelRequest(requestedFloorIndex)
            endIf
        endIf
    endif
endEvent

event ObjectReference.OnTranslationAlmostComplete(ObjectReference akSender)
    if(akSender != movingPlatformBase)
        return
    endIf

    if(currentNodeMarkerIndex != targetNodeMarkerIndex)
        TravelToNextNode()
    else
        CompleteFloorTravel()
    endIf
endEvent

;------------------------------------------

function InitializeMovingPlatform()
    ; setup moving platform base
    movingPlatformBase = GetLinkedRef(MovingPlatform_TranslationHelperKeyword)

    ; setup interior door
    interiorDoor = GetLinkedRef(MovingPlatform_InteriorDoorKeyword)

    ; setup interior buttons
    interiorButtonUp = GetLinkedRef(MovingPlatform_InteriorButtonUpKeyword)
    interiorButtonDown = GetLinkedRef(MovingPlatform_InteriorButtonDownKeyword)

    ; setup floor data & call buttons
    nodeMarkers = GetLinkedRefChain()

    if(nodeMarkers.Length == 0)
        return
    endIf

    nodeMarkerIndicesByFloorIndex = new int[0]
    callButtons = new ObjectReference[0]
    floorIndicesByCallButtonIndex = new int[0]

    int i = 0
    int currentFloor = -1
    while(i < nodeMarkers.Length)
        ObjectReference nodeMarker = nodeMarkers[i]

        ; mark this node as a floor (this script supports multiple nodes between actually floors. For example, a platform could move up, the left, the up again to reach the next "floor" node. This zig-zig pattern would be made of multiple "node" markers)
        if(nodeMarker.HasLocRefType(MovingPlatform_FloorMarkerLocationRefType))
            currentFloor += 1
            nodeMarkerIndicesByFloorIndex.Add(i)

            ; store call buttons for this floor (multiple call buttons are supported for each floor)
            ObjectReference[] callButtonsForFloor = nodeMarker.GetRefsLinkedToMe(MovingPlatform_CallButtonFloorKeyword)

            int iCallButton = 0
            while(iCallButton < callButtonsForFloor.Length)
                ObjectReference callButton = callButtonsForFloor[iCallButton]

                callButtons.Add(callButton)
                floorIndicesByCallButtonIndex.Add(currentFloor)

                iCallButton += 1
            endWhile
        endIf

        i += 1
    endWhile

    ; assign current floor
    currentFloorIndex = StartingFloor

    int startingFloornodeIndex = nodeMarkerIndicesByFloorIndex[currentFloorIndex]
    ObjectReference startingNodeMarker = nodeMarkers[startingFloorNodeIndex]

    movingPlatformBase.MoveTo(startingNodeMarker)

    ; assign max floor
    maxFloorIndex = currentFloor

    ; register for remote events
    RegisterForEvents()

    ; set initialized true
    initialized = true
endFunction

function RegisterForEvents()
    ; interior buttons
    if(interiorButtonUp)
        RegisterForRemoteEvent(interiorButtonUp, "OnActivate")
    endIf

    if(interiorButtonDown)
        RegisterForRemoteEvent(interiorButtonDown, "OnActivate")
    endIf

    ; call button OnActive events
    int i = 0
    while(i < callButtons.Length)
        ObjectReference callButton = callButtons[i]

        RegisterForRemoteEvent(callButton, "OnActivate")

        i += 1
    endWhile
endFunction

function UnregisterFromEvents()
    ; interior buttons
    if(interiorButtonUp)
        UnregisterForRemoteEvent(interiorButtonUp, "OnActivate")
    endIf

    if(interiorButtonDown)
        UnregisterForRemoteEvent(interiorButtonDown, "OnActivate")
    endIf

    ; call button OnActive events
    int i = 0
    while(i < callButtons.Length)
        ObjectReference callButton = callButtons[i]

        UnregisterForRemoteEvent(callButton, "OnActivate")

        i += 1
    endWhile

    ; unregister from translation events
    UnregisterForRemoteEvent(movingPlatformBase, "OnTranslationAlmostComplete")
endFunction

function ProcessFloorTravelRequest(int requestedFloorIndex)
    ; block input
    movingPlatformIsMoving = true
    
    ; close moving platform door
    CloseInteriorDoor()

    ; prepare travel data
    currentNodeMarkerIndex = nodeMarkerIndicesByFloorIndex[currentFloorIndex]
    targetNodeMarkerIndex = nodeMarkerIndicesByFloorIndex[requestedFloorIndex]
    targetFloorIndex = requestedFloorIndex

    int nodeDistance = targetNodeMarkerIndex - currentNodeMarkerIndex
    travelStepValue = 1

    if(nodeDistance < 0)
        travelStepValue = -1
    endIf

    ; register for translation event
    RegisterForRemoteEvent(movingPlatformBase, "OnTranslationAlmostComplete")

    ; Fire WWiseEvents
    if(UseDirectionalSoundEvents)
        if(travelStepValue > 0)
            ; assign UpwardTravel WwiseEvents
            currentTravelStartEvent = UpwardTravelStartsEvent
            currentTravelStopEvent = UpwardTravelStopsEvent
        elseif(travelStepValue < 0)
            ; assign DownwardTravel WwiseEvents
            currentTravelStartEvent = DownwardTravelStartsEvent
            currentTravelStopEvent = DownwardTravelStopsEvent
        endIf
    else
        ; assign generic travel WwiseEvent
        currentTravelStartEvent = TravelSoundEvent
        currentTravelStopEvent = None
    endIf

    ; halt the current travel sound
    WwiseEvent.StopInstance(travelSoundInstanceID)

    ; play travel sound
    if(currentTravelStartEvent != None)
        travelSoundInstanceID = currentTravelStartEvent.Play(movingPlatformBase)
    endIf

    ; travel to first node
    TravelToNextNode()
endFunction

function TravelToNextNode()
    ; find next node marker
    int nextNodeMarkerIndex = currentNodeMarkerIndex + travelStepValue
    ObjectReference nextNodeMarker = nodeMarkers[nextNodeMarkerIndex]

    currentNodeMarkerIndex = nextNodeMarkerIndex

    ; play animation on accessory refereneces
    if(animateAccessoryReferences)
        string accessoryAnimationName = ""

        if(travelStepValue > 0)
            accessoryAnimationName = "Play02"
        elseif(travelStepValue < 0)
            accessoryAnimationName = "Play01"
        endIf

        ObjectReference[] accessoryReferences = GetRefsLinkedToMe(accessoruReferenceKeyword)

        int i = 0
        while(i < accessoryReferences.length)
            ObjectReference accessoryReference = accessoryReferences[i]
            accessoryReference.PlayAnimation(accessoryAnimationName)

            i = i + 1
        endWhile
    endIf

    ; translate moving platform to targetNodeMarker
    movingPlatformBase.TranslateToRef(nextNodeMarker, TravelSpeed)
endFunction


function CancelTravelAndReturnToOriginFloor()
    int returnFloorIndex = currentFloorIndex

    CompleteFloorTravel(false)

    ProcessFloorTravelRequest(returnFloorIndex)
endFunction

function CompleteFloorTravel(bool openInteriorDoor = true)
    ; halt the current travel stop sound
    WwiseEvent.StopInstance(travelStopSoundInstanceID)

    if(currentTravelStopEvent != None)
        travelStopSoundInstanceID = currentTravelStopEvent.Play(movingPlatformBase)
    endIf

    ; unregister from translation events
    UnregisterForRemoteEvent(movingPlatformBase, "OnTranslationAlmostComplete")

    ; open moving platform door
    if(openInteriorDoor)
        OpenInteriorDoor()
    endIf

    ; assign current floor index
    currentFloorIndex = targetFloorIndex

    ; unblock input
    movingPlatformIsMoving = false
endFunction

function OpenInteriorDoor()
    int openState = interiorDoor.GetOpenState()

    if(openState == 3)
        ; open door if we are trying to, and it's not already open
        interiorDoor.SetOpen()
        Utility.Wait(doorOpenSeconds)
    endIf
endFunction

function CloseInteriorDoor()
    int openState = interiorDoor.GetOpenState()

    if(openState == 1)
        interiorDoorIsClosing = true

        ; close door if we are trying to, and it's not already closed
        interiorDoor.SetOpen(false)
        Utility.Wait(doorOpenSeconds)

        interiorDoorIsClosing = false
    endIf
endFunction

bool function IsInteriorDoorClosing()
    return interiorDoorIsClosing
endFunction

float function GetDoorOpenSeconds()
    return doorOpenSeconds
endFunction

bool function IsMoving()
    return movingPlatformIsMoving
endFunction

int function GetCurrentDirection()
    return travelStepValue
endFunction