Scriptname MQ105_TacticalBotAliasScript extends ReferenceAlias

Int Property RobotSeesPlayerStage=650 Const Auto
Int Property RobotSeesPlayerPrereqStage=600 Const Auto

Event OnLoad()
    If (GetOwningQuest().GetStageDone(RobotSeesPlayerStage) == False)
        RegisterForDistanceLessThanEvent(self.getActorRef(), Game.GetPlayer(), 4.0)
    EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	;if the robot is ever close to the player, set quest stage
    Quest myQuest = GetOwningQuest()
    If (myQuest.GetStageDone(RobotSeesPlayerPrereqStage)) && (myQuest.GetStageDone(RobotSeesPlayerStage)==False)
        myQuest.SetStage(RobotSeesPlayerStage)
    EndIf
endEvent

Event OnUnLoad()
    UnregisterForDistanceEvents(self.getActorRef(), Game.GetPlayer())
EndEvent