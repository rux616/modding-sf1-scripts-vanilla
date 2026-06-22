Scriptname MQArtifactAliasScript extends ReferenceAlias

Message Property MQ_ArtifactDepositMSG Auto Const Mandatory
Int Property StageToSet Auto Const
WwiseEvent Property WwiseEvent_AMBArtifactVision Mandatory Const Auto
Quest Property MQ00 Mandatory Const Auto
ReferenceAlias Property SoundMarker01 Const Auto
ReferenceAlias Property SoundMarker02 Const Auto
ReferenceAlias Property FloaterMarker01 Const Auto

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			ObjectReference myRef = Self.GetRef()
			;show the helper message if the player hasn't drilled out the mineral bed
			If myRef.GetCurrentDestructionStage() < 3
				MQ_ArtifactDepositMSG.Show()
			Else
				GotoState("HasBeenTriggered")
				;disable sound markers near artifact
				SoundMarker01.GetRef().DisableNoWait()
				SoundMarker02.GetRef().DisableNoWait()
				;grant vision
				Game.FadeOutGame(true, true, 0.0, 0.5, true)
				Utility.Wait(0.5)
				(MQ00 as MQ00QuestScript).PlayArtifactVision()
				myRef.Disable()
				FloaterMarker01.GetRef().DisableNoWait() ;disable enable parent of artifact crystal floaters
				Game.FadeOutGame(False, true, 0.0, 0.5)
				;advance quest
				GetOwningQuest().SetStage(StageToSet)
			EndIf
		EndIf
	EndEvent
EndState

State HasBeenTriggered
	Event OnActivate(ObjectReference akActionRef)
		;empty state
	EndEvent
EndState