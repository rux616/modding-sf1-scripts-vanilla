Scriptname LoadElevatorManagerScript extends ObjectReference conditional
; The LoadElevatorManagerScript script manages travel between the floors of an elevator system. 
; Every load elevator setup includes a single LoadElevator_ManagerMarker reference, with an instance of this script.
;
; LoadElevatorManagerScript is responsible for:
;   1. Assisting LoadElevatorFloorScripts during their initialization (for example, supplying the correct Message names for elevator buttons).
;   2. Handling floor travel requests (when the player attempts to travel between floors).
;   3. Controlling elevator "operationality" (whether or not elevator doors opens, and if travel between floors is possible).

group MessageCustomization CollapsedOnRef
{Change these properties to affect Message Boxes seen by the player}
    Message property ChooseFloorMessage auto const mandatory
    {The text displayed on elevator buttons, when more than two floors are present}

    Message property InaccessibleFloorMessage auto const mandatory
    {The text displayed when a player attempts to travel to an inaccessible floor}

    Message property LockedFloorMessage auto const mandatory
    {The text displayed when a player selects a locked floor}

    Message property NotOperatingMessage auto const mandatory
    {The text displayed when the elevator is "off", and the Player tried to request travel to another floor}
endGroup

group TwoFloorElevator
{Only set these properties if your elevator has exactly two floors.}
    Message property FirstFloorName auto
    Message property SecondFloorName auto
endGroup

group ThreeOrMoreFloorElevator
{Only set these properties if your elevator has three or more floors.}
    Message property FloorNames auto
endGroup

group OperationCustomization
    bool property IsOperational = true auto conditional
    {Non-operational elevators won't accept travel requests, and their doors won't open based on Actor proximity.}
endGroup

group AutofillProperties CollapsedOnRef
    WWiseEvent property QST_MQ207C_Elevator_Activate_Fail_WEF auto const mandatory
    WWiseEvent property OBJ_Elevator_Generic_02_Depart_WEF auto const mandatory
endGroup

function SetFirstFloorName(Message newFloorName)
    FirstFloorName = newFloorName

    LoadElevatorFloorScript[] loadElevatorFloors = GetLoadElevatorFloors()

    if(loadElevatorFloors.Length != 2)
        DefaultScriptFunctions.Trace(self, "Assigning First Floor Name on an elevator which does not have 2 floors.", true, "LoadElevators")
        return
    endIf

    loadElevatorFloors[1].SetElevatorButtonName(newFloorName)
endfunction

function SetSecondFloorName(Message newFloorName)
    SecondFloorName = newFloorName

    LoadElevatorFloorScript[] loadElevatorFloors = GetLoadElevatorFloors()

    if(loadElevatorFloors.Length != 2)
        DefaultScriptFunctions.Trace(self, "Assigning First Floor Name on an elevator which does not have 2 floors.", true, "LoadElevators")
        return
    endIf

    loadElevatorFloors[0].SetElevatorButtonName(newFloorName)
endfunction

function SetFloorNames(Message newFloorNames)
    FloorNames = newFloorNames
endfunction

; Returns the appropriate Message form, to override the name of an individual elevator button.
; For elevators with 2 floors, we return the name of the opposite floor. for elevators with >2 floors, we return a "Choose Floor" Message.
Message function GetButtonMessageForFloor(int floorIndex)
    LoadElevatorFloorScript[] loadElevatorFloors = GetLoadElevatorFloors()

    if(loadElevatorFloors.Length > 2)
        if(ChooseFloorMessage == None)
            DefaultScriptFunctions.Trace(self, "ChooseFloorMessage not found.", true, "LoadElevators")
        endIf

        return ChooseFloorMessage
    elseif(floorIndex == 0)
        if(SecondFloorName == None)
            DefaultScriptFunctions.Trace(self, "SecondFloorName not found.", true, "LoadElevators")
        endIf

        return SecondFloorName
    elseif(floorIndex == 1)
        if(FirstFloorName == None)
            DefaultScriptFunctions.Trace(self, "FirstFloorName not found.", true, "LoadElevators")
        endIf

        return FirstFloorName
    endIf
endFunction

; Called externally, to request that the Player be teleported to the elevator car on a specific floor.
function RequestFloorTravel(int currentFloor, ObjectReference requester)
    int requestedFloor

    LoadElevatorFloorScript[] loadElevatorFloors = GetLoadElevatorFloors()

    ; temporary array of invisible elevator doors, which we'll use to populate the FloorNames Message form. This is used by the UI, to hide inaccessible floors from the list, and to decorate restricted floors with a "(Restricted)" suffix.
    ; doors will be added here in reverse order. This is intentional: elevator floor names are also listed in reverse ofder, as Menu Items in Message forms. This is so that they will display properly in Message Boxes.
    ObjectReference[] reversemanagerDoors = new ObjectReference[loadElevatorFloors.Length]

    int i = 0
    while(i < reversemanagerDoors.Length)
        LoadElevatorFloorScript loadElevator = loadElevatorFloors[i] as LoadElevatorFloorScript

        reversemanagerDoors[loadElevatorFloors.Length - i - 1] = loadElevator.GetManagerDoor()

        i = i + 1
    endWhile

    if(loadElevatorFloors.Length > 2)
        if(FloorNames == None)
            DefaultScriptFunctions.Trace(self, "FloorNames Message not found.", true, "LoadElevators")
            return
        endIf

        FloorNames.AttachLoadDoors(reversemanagerDoors)
    endIf

    ; If this elevator has more than two floors, we show the player a message box and ask them to choose a target floor:
    if(loadElevatorFloors.Length > 2)
        if(FloorNames == None)
            DefaultScriptFunctions.Trace(self, "FloorNames not found.", true, "LoadElevators")
            return
        endIf

        int floorChoice = FloorNames.Show()

        ; Here we check to see if the user has backed out of the "Choose Floor" Message Box. This will return either -1, or a number larger than the length of the floor choice array.
        if(floorChoice == -1 || floorChoice > loadElevatorFloors.Length - 1)
            return
        endIf

        ; At this point, we assume that the player has intentionally chosen a floor they'd like to travel to.
        ; We need to reverse the index returned by this Message Box. This is because the floor names are listed in reverse order in the 'FloorNames' Message form.
        ; Here's an example list of floor names, as they might appear in a 'FloorNames' Message form:
        ;
        ; [0] - "Third Floor"
        ; [1] - "Second Floor"
        ; [2] - "First Floor"
        ;
        ; Notice that the first floor's name has the highest index (2). This is done so that the floor names are displayed properly in the Message Box UI, without needing special UI support.
        ; But - this means that we must reverse the index returned by that message box, before using it:
        requestedFloor = loadElevatorFloors.Length - 1 - floorChoice
    
    ; If the player has just two floors, then we can assume they are trying to travel to the floor they are not currently on:
    elseif(currentFloor == 0)
        requestedFloor = 1
    elseif(currentFloor == 1)
        requestedFloor = 0
    endIf

    TravelToFloor(currentFloor, requestedFloor, loadElevatorFloors, requester)
endfunction

function TravelToRandomFloor(ObjectReference requester)
    LoadElevatorFloorScript[] loadElevatorFloors = GetLoadElevatorFloors()

    int randomFloorIndex = Utility.RandomInt(0, loadElevatorFloors.Length - 1)

    TravelToFloor(-1, randomFloorIndex, loadElevatorFloors, requester, true)
endFunction

function TravelToFloor(int currentFloor, int requestedFloor, LoadElevatorFloorScript[] loadElevatorFloors, ObjectReference requester, bool ignoreFloorRestrictions = false)
    LoadElevatorFloorScript loadElevatorFloor = loadElevatorFloors[requestedFloor]

    ; If the player chooses their current floor from the 'Choose Floor' list, we just play the 'arrival' chime sound.
    if(requestedFloor == currentFloor)
        loadElevatorFloor.PlayArrivalSound(false)
        return
    endIf

    ; If the chosen floor is inaccessible, we cancel the travel request, and display a "inaccessible floor" message.
    if(!loadElevatorFloor.IsAccessible())
        QST_MQ207C_Elevator_Activate_Fail_WEF.Play(requester)
        InaccessibleFloorMessage.Show()
        return
    endIf

    ; Each elevator car has an invisible door inside. When a player needs to travel to a different floor, we find and activate the correct door.
	ObjectReference managerDoor = loadElevatorFloor.GetManagerDoor()

	if(managerDoor != None)
        ; Travel to a specific floor can be "restricted", by giving its floor a required key (the actual lock value of the door is ignored, since the key is required each time).
        ; Here, we check to see if the lobby door has a required key. If the player doesn't have it, we cancel the travel request and display a "restricted floor" message.
        Key requiredKey = managerDoor.GetKey()

        if(ignoreFloorRestrictions == false && requiredKey != NONE && requester.GetItemCount(requiredKey) == 0)
            LockedFloorMessage.Show()
            return
        endIf

        ; if execution has reached this point, either the floor didn't require a key, or the player had it. We now send the player to the requested floor:
        if(OBJ_Elevator_Generic_02_Depart_WEF != None)
            OBJ_Elevator_Generic_02_Depart_WEF.Play(requester)
        else
            DefaultScriptFunctions.Trace(self, "OBJ_Elevator_Generic_02_Depart_WEF not found.", true, "LoadElevators")
        endIf

		managerDoor.Activate(requester)
    else
        DefaultScriptFunctions.Trace(self, "Manager door not found.", true, "LoadElevators")
	endIf
endFunction

; Lets you control whether or not the elevator will accept travel requests. 
; When IsOperational == false, walking in front of an elevator's doors will not open them. Activation of elevator buttons is also blocked, and NPCS will not attempt to use the elavtor.
function SetElevatorOperational(bool operational)
    IsOperational = operational

    LoadElevatorFloorScript[] loadElevatorFloors = GetLoadElevatorFloors()

    int i = 0
    while(i < loadElevatorFloors.Length)
        LoadElevatorFloorScript floorScript = loadElevatorFloors[i]

        if(operational != floorScript.IsFloorOperational())
            floorScript.SetElevatorFloorOperational(operational)
        endIf

        i += 1
    endWhile
endFunction

bool function GetElevatorOperational()
    return IsOperational
endfunction

LoadElevatorFloorScript[] function GetLoadElevatorFloors()
    return GetLinkedRefChain() as LoadElevatorFloorScript[]
endfunction