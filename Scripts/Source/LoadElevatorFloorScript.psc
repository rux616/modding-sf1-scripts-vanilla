Scriptname LoadElevatorFloorScript extends ObjectReference
; The LoadElevatorFloorScript script controls the behavior of a single elevator car, on a single floor.
;
; LoadElevatorFloorScript is responsible for:
;	1. Initializing a single elevator car, on a single floor.
;   2. Opening and closing the elevator's proximity-based doors, when an Actor walks in front of them (or when they travel to that floor from another elevator).
;   3. Managing an elevator floor's 'accessibility' (whether or not Actors can travel to it).
;	4. Playing sounds and effects, when an Actor arrives on an elevator floor.

group NoTouch CollapsedOnRef
{These properties should only be set in the base form.}
	Keyword property ProximityTriggerKeyword auto const mandatory
	Keyword property OccupancyTriggerKeyword auto const mandatory
	Keyword property LobbyDoorKeyword auto const mandatory
	Keyword property CosmeticEntranceDoorKeyord auto const mandatory
	Keyword property FloorRequestTargetKeyword auto const mandatory
	Keyword property LoadElevatorManagerKeyword auto const mandatory
	GlobalVariable property DoorControlTimerSeconds auto const mandatory
	GlobalVariable property ArrivalSequenceWaitSeconds auto const mandatory
endGroup

group Customization
{Set these properties to customize how your elevator floor behaves.}
	WwiseEvent property OBJ_Elevator_Generic_02_Arrive_WEF auto const
	{The sound that players when the player arrives on this floor.}

	WwiseEvent property OBJ_Elevator_Generic_02_Arrive_Chime_WEF auto const
	{The sound that players when non-player Actors arrive on this floor.}
endGroup

ObjectReference[] cosmeticEntranceDoors
ObjectReference[] proximityTriggers
ObjectReference[] occupancyTriggers
ObjectReference[] allTriggers
int doorControlTimerID = 0 const
int lockLevelUnlocked = 0 const
int lockLevelInaccessible = 254 const
bool isFloorOperational = true

; A struct used during initialization
struct LoadElevatorFloorSetupData
	int floorIndex
	LoadElevatorManagerScript managerScript
	Message buttonActivationMessage
endStruct

; Each elevator car is initialized, OnLoad.
Event OnLoad()
	; find and cache "manager door". This is an invisible door which sits inside of the "LoadElevatorManager" room - a small, empty room which houses load doors leading to each of the elevator system's floors.
	ObjectReference managerDoor = GetManagerDoor()

	if(managerDoor == None)
		DefaultScriptFunctions.Trace(self, "Manager door not found.", true, "LoadElevators")
	endIf

	; Get setup data for this Load Elevator floor.
	LoadElevatorFloorSetupData setupData = GetLoadElevatorFloorSetupDataRecursive(self)

	if(setupData == NONE)
		DefaultScriptFunctions.Trace(self, "LoadElevatorFloorSetupData was None.", true, "LoadElevators")
	endIf

	; initialize any buttons inside of the elevator car - these are activated by players to travel between floors of the elevator.
	ObjectReference[] elevatorButtons = GetLinkedRefChain(FloorRequestTargetKeyword)

	int i = 0
	while(i < elevatorButtons.Length)
		LoadElevatorRequestFloorOnActivate elevatorButton = elevatorButtons[i] as LoadElevatorRequestFloorOnActivate
		elevatorButton.AssignLoadElevatorData(setupData.floorIndex, setupData.managerScript)
		elevatorButton.AssignButtonName(setupData.buttonActivationMessage)

		i += 1
	endWhile

	; cache cosmetic elevator doors. These doors are purely cosmetic: they open when any Actor is in front of the elevator, and then close later, when the area is clear.
	cosmeticEntranceDoors = GetRefsLinkedToMe(CosmeticEntranceDoorKeyord)

	; cache proximity and occupation triggers. These are the triggered used to detect Actors in front of, and inside, the elevator car.
	proximityTriggers = GetRefsLinkedToMe(ProximityTriggerKeyword)
	occupancyTriggers = GetRefsLinkedToMe(OccupancyTriggerKeyword)
	allTriggers = new ObjectReference[proximityTriggers.Length + occupancyTriggers.Length]

	int iTrigger = 0
	i = 0
	while(i < proximityTriggers.Length)
		allTriggers[iTrigger] = proximityTriggers[i]
		iTrigger += 1
		i += 1
	endWhile

	i = 0
	while(i < occupancyTriggers.Length)
		allTriggers[iTrigger] = occupancyTriggers[i]
		iTrigger += 1
		i += 1
	endWhile

	if(setupData.managerScript.GetElevatorOperational())
		RegisterTriggerEvents(allTriggers)
	else
		managerDoor.Disable()
		BlockElevatorButtonActivation(true, true)
		isFloorOperational = false

		RegisterTriggerEvents(occupancyTriggers)
	endIf

	; test triggers for initial occupancy
	ObjectReference[] triggers = None

	; if the elevator is operational, we check all of its triggers to see if any Actors are occupying them already.
	; if the elevator is not opperational, we still check it's occupancy triggers. We never let an Actor get stuck inside the elevator.
	if(isFloorOperational)
		triggers = allTriggers
	else
		triggers = occupancyTriggers
	endIf

	; the actual occupancy test
	bool triggersAreOccupied = AreTriggersOccupied(triggers)

	if(triggersAreOccupied)
		; if the triggers contained an actor, open the doors, and check for occupancy again in a moment. We also switch to a state where OnTriggerEnter event are temporarily ignored.
		GotoState("DoorsAreOpenState")
		SetAllDoorsOpen(true)
		StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID)
	endIf
endEvent

Event OnUnload()
	UnregisterTriggerEvents(allTriggers)

	cosmeticEntranceDoors.Clear()
	proximityTriggers.Clear()
	occupancyTriggers.Clear()
	allTriggers.Clear()
EndEvent

function SetElevatorButtonName(Message buttonName)
	; initialize any buttons inside of the elevator car - these are activated by players to travel between floors of the elevator.
	ObjectReference[] elevatorButtons = GetLinkedRefChain(FloorRequestTargetKeyword)

	int i = 0
	while(i < elevatorButtons.Length)
		LoadElevatorRequestFloorOnActivate elevatorButton = elevatorButtons[i] as LoadElevatorRequestFloorOnActivate
		elevatorButton.AssignButtonName(buttonName)

		i += 1
	endWhile
endFunction

; Returns the accessible state of this floor (Can Actors travel here?).
; This returns false is this floor's manager door has a lock level of 254. It returns true if the door has any other lock level.
bool function IsAccessible()
	return GetManagerDoor().GetLockLevel() != lockLevelInaccessible
endFunction

; Set whether or not any Actor can travel to this floor. Inaccessible floors will also be hidden from the "Choose Floor" Message Box.
function SetAccessible(bool accessible)
	ObjectReference managerDoor = GetManagerDoor()
	
	if(accessible)
		managerDoor.SetLockLevel(lockLevelUnlocked)
		managerDoor.Unlock()
	else
		managerDoor.SetLockLevel(lockLevelInaccessible)
		managerDoor.Lock()
	endIf
endFunction

; Plays an arrival sound when an Actor travels to the elevator from another floor.
function PlayArrivalSound(bool isPlayer)
	
	if(isPlayer)
		; play the player arrival sound
		if(OBJ_Elevator_Generic_02_Arrive_WEF != None)
			OBJ_Elevator_Generic_02_Arrive_WEF.Play(self)
		else
			DefaultScriptFunctions.Trace(self, "OBJ_Elevator_Generic_02_Arrive_WEF not found.", true, "LoadElevators")
		endIf
	else
		; play the non-player arrival sound
		if(OBJ_Elevator_Generic_02_Arrive_Chime_WEF != None)
			OBJ_Elevator_Generic_02_Arrive_Chime_WEF.Play(self)
		else
			DefaultScriptFunctions.Trace(self, "OBJ_Elevator_Generic_02_Arrive_Chime_WEF not found.", true, "LoadElevators")
		endIf
	endIf
endFunction

; The visible elevator doors are purely cosmetic. They open when any actor paths nearby the elevator. We use triggers to detect the presence of these actors, both outside and inside of the elevator.
;
; When an Actor is detected, we immediately open the elevator's doors. We then start a looping process, which checks to see if any Actors remain inside our trigger volumes every n seconds.
; While this polling loop is ongoing, this script is moved to a separate state ("DoorAreOpenState"), in which OnTriggerEnter events are ignored.
; Only when one of these tests shows no Actors in the volumes, do we then close the elevator's doors. At this point, we return the script to it's default state, and OnTriggerEvent events are considered again.
;
; This avoids even the possibility of trigger events causing timing issues. We only ever use the first OnTriggerEnter event to begin this polling process.
event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
	; immedtaley transition to a state where we temporarily ignore future trigger events.
	GotoState("DoorsAreOpenState")
	
	; if the player can entered an "occupancy" trigger (the triggers inside of the elvator car), we assume they have just traveled to the elevator from another floor.
	if(occupancyTriggers.Find(akSender) >= 0)
		bool isPlayer = akActionRef == Game.GetPlayer()

		if(isPlayer)
			; It would be nice to replace this hard-coded wait with an event, signaling when the player has actually finished loading into the elevator (and their fade from black has completed).
			; Currently, we wait for a short time before beginning the sequence.
			Utility.Wait(ArrivalSequenceWaitSeconds.GetValue())
		endIf

		PlayArrivalSound(isPlayer)
	endIf

	; here, we open the elevator doors, in preperation for the looping occupancy check.
	SetAllDoorsOpen(true)

	; here, we begin the looping occupancy check
	StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID)
endEvent

; a state in which OnTriggerEnter events are ignored (used temporarily, while the elevator's doors are open).
state DoorsAreOpenState
event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
	; Intentionally blank. We can safety ignore OnTriggerEnter events during this time.
endEvent
endState

; The logic in this timer checks all of the elevator's trigger volumes, to see if they are occupied by any Actors.
; If true, the timer is resarted, so that the check happens again in n seconds
; If false, it is safe to close the elevator's doors and begin listening for OnTriggerEnter events again. 
event OnTimer(int aiTimerID)
	if(aiTimerID == doorControlTimerID)
		; test triggers for occupancy
		ObjectReference[] triggers

		if(isFloorOperational)
			triggers = allTriggers
		else
			triggers = occupancyTriggers
		endIf

		bool triggersAreOccupied = AreTriggersOccupied(triggers)

		if(triggersAreOccupied)
			; if the triggers atill contain an actor, check again in a moment
			StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID)
		else
			; if not, it's safe to close the door
			SetAllDoorsOpen(false)

			; Begin listening for trigger events again
			GotoState("")
		endIf
	endIf
endEvent

; Detects Actors inside a given collection of triggers.
bool function AreTriggersOccupied(ObjectReference[] triggers)
	int i = 0
	while(i < triggers.Length)
		if(triggers[i].GetTriggerObjectCount() > 0)
			return true
		endIf

		i += 1
	endWhile

	return false
endFunction

; opens all cosmetic doors for this elevator floor.
function SetAllDoorsOpen(bool setOpen)
	int iDoor = 0
	while(iDoor < cosmeticEntranceDoors.Length)

		ObjectReference cosmeticEntranceDoor = cosmeticEntranceDoors[iDoor]
		int openState = cosmeticEntranceDoor.GetOpenState()

		if(setOpen)
			if(openState == 3 || openState == 4)
				cosmeticEntranceDoor.SetOpen(true)
			endIf
		else
			if(openState == 1 || openState == 2)
				cosmeticEntranceDoor.SetOpen(false)
			endIf
		endif

		iDoor = iDoor + 1
	endWhile
endFunction

; (Used by this floor's LoadElevatorManagerScript. Never call this function directly.)
; 
; This function is called by this floor's manager script, to control its 'operational' state.
; When non-operational, this elevator car's doors will not open when an Actor walks in front of them. Its doors will still open if an Actor winds up inside of the elevator car - we never allow Actors to be trapped inside of the elevator.
; Non-operational elevator cars also block activation of their interior elevator buttons.
; The load door leading into this elevator car is also disabled, preventing NPCS from thinking they can path to this floor from another elevator.
function SetElevatorFloorOperational(bool operational)
	ObjectReference managerDoor = GetManagerDoor()

	if(operational)
		managerDoor.Enable()

		RegisterTriggerEvents(proximityTriggers)

		; unblock activation for elevator buttons
		BlockElevatorButtonActivation(false, false)
	else
		managerDoor.Disable()

		UnregisterTriggerEvents(proximityTriggers)

		; block activation for elevator buttons
		BlockElevatorButtonActivation(true, true)
	endif

	isFloorOperational = operational
endFunction

bool function IsFloorOperational()
	return isFloorOperational
endfunction

; Blocks activation for this floor's interior elevator buttons.
function BlockElevatorButtonActivation(bool blockActivation, bool blockActivationText)
	ObjectReference[] elevatorButtons = GetLinkedRefChain(FloorRequestTargetKeyword)
	
	int i = 0
	while(i < elevatorButtons.Length)
		elevatorButtons[i].BlockActivation(blockActivation, blockActivationText)

		i += 1
	endWhile
endfunction

; Registers trigger events for a given array of trigger volumes.
function RegisterTriggerEvents(ObjectReference[] triggers)
	int i = 0
	while(i < triggers.Length)
		ObjectReference trigger = triggers[i]
		RegisterForRemoteEvent(trigger, "OnTriggerEnter")
		i += 1
	endWhile
endFunction

; Unregisters trigger events for a given array of trigger volumes.
function UnregisterTriggerEvents(ObjectReference[] triggers)
	int i = 0
	while(i < triggers.Length)
		ObjectReference trigger = triggers[i]
		UnregisterForRemoteEvent(trigger, "OnTriggerEnter")
		i += 1
	endWhile
endFunction

; returns a reference to the invisible load door which is used to teleport into this elevator car.
ObjectReference function GetManagerDoor()
	ObjectReference managerDoor = GetLinkedRef(LobbyDoorKeyword)

	if(managerDoor == None)
		DefaultScriptFunctions.Trace(self, "Manager door not found.", true, "LoadElevators")
	endIf

	return managerDoor
endFunction

; Load elevators are defined by a single linkref chain, which begins at the LoadElevatorManagerMarker, and runs seqeuntially through each of the LoadElevatorFloorMarkers.
; This creates a linked-list of elevator floors, making adding, moving, or rearranging elevator floors simple in CK.
; In order for a floor script to find its manager, it marches backwards through that chain, until it reaches its manager.
LoadElevatorFloorSetupData function GetLoadElevatorFloorSetupDataRecursive(ObjectReference target, int floorIndex = 0)
	ObjectReference[] refsLinkedToMe = target.GetRefsLinkedToMe()

	if(refsLinkedToMe.Length == 0)
		DefaultScriptFunctions.Trace(self, "Elevator Floor is not linked by any references.", true, "LoadElevators")
		return None
	endIf

	ObjectReference refLinkedToMe = RefsLinkedToMe[0]

	if(refLinkedToMe.HasKeyword(LoadElevatorManagerKeyword))
		LoadElevatorFloorSetupData data = new LoadElevatorFloorSetupData

		data.floorIndex = floorIndex
		data.managerScript = refLinkedToMe as LoadElevatorManagerScript
		data.buttonActivationMessage = data.managerScript.GetButtonMessageForFloor(floorIndex)

		return data
	else
		floorIndex += 1
		return GetLoadElevatorFloorSetupDataRecursive(refLinkedToMe, floorIndex)
	endIf
endFunction