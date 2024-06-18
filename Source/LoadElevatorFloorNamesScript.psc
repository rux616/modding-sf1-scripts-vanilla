Scriptname LoadElevatorFloorNamesScript extends ObjectReference

group TwoFloorElevator
    {Only set these properties if your elevator has exactly two floors.}
    Message property Floor0Name auto Const
    Message property Floor1Name auto Const
endGroup

group ThreeOrMoreFloorElevator
    {Only set these properties if your elevator has three or more floors.}
    Message property FloorNameList auto Const
endGroup

Message function GetFloor0Name()
    return Floor0Name
endFunction

Message function GetFloor1Name()
    return Floor1Name
endFunction

Message function GetFloorNameList()
    return FloorNameList
endFunction