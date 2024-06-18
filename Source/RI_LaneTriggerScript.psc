Scriptname RI_LaneTriggerScript extends ReferenceAlias

Scene Property DialogueFCRyujinTower_Lane_GreetingsScene Auto Const Mandatory
GlobalVariable Property RI_LaneGreetingTracker Auto Const Mandatory
GlobalVariable Property GameDay Auto Const Mandatory
Int Property StageToCheck Auto Const Mandatory
Quest Property RI01 Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
    
    Float iCurrentDay = GameDay.GetValue()
    If RI01.GetStageDone(StageToCheck)
        If akActionRef == Game.GetPlayer() && RI_LaneGreetingTracker.GetValue() != iCurrentDay
            DialogueFCRyujinTower_Lane_GreetingsScene.Start()
            RI_LaneGreetingTracker.SetValue(iCurrentDay)        
        EndIf
    EndIf
EndEvent

