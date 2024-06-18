Scriptname DDR018TowerLiftScript extends ObjectReference Const

ObjectReference Property myMoveHelper Mandatory Const Auto
ObjectReference Property myMoveMarker Mandatory Const Auto


Event OnActivate(ObjectReference akActionRef)
    Utility.Wait(1.5)
    myMoveHelper.TranslateToRef(myMoveMarker, 1)
EndEvent