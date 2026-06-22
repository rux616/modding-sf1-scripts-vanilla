Scriptname MQ101BarrettShipScript extends ReferenceAlias

Event OnShipTakeOff(bool abComplete)
	Quest myQuest = GetOwningQuest()
	if (abComplete==false) && myQuest.GetStageDone(320)
    		myQuest.SetStage(345)
	endIf
endEvent

Event OnShipLanding(bool abComplete)
	Quest myQuest = GetOwningQuest()
	;Stage 170 is where we enable Barrett's ship. Make sure we're at that point
	If abComplete && myQuest.GetStageDone(170)
		MyQuest.SetStage(180) ;enable the trigger volume that will progress the quest
	EndIf
EndEvent