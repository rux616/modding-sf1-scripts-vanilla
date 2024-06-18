Scriptname LC115CombatStateChange extends RefCollectionAlias

Quest Property RI05 Auto Const Mandatory
GlobalVariable Property RI05_LC115PreviouslyExplored Auto Const Mandatory

Group QuestStages_Properties
  Int Property iLC115Hostile = 10 Auto Const
  Int Property iLC115Shutdown = 1000 Auto Const
  Int Property iRI05FindImogene = 600 Auto Const
  Int Property iRI05TalkToDalton = 1200 Auto Const
EndGroup

Event OnLoad(ObjectReference akSenderRef)
	RegisterForRemoteEvent(self, "OnCombatStateChanged")
EndEvent

Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, int aeCombatState)
  If aeCombatState > 0
    If RI05.GetStageDone(iRI05FindImogene) && !RI05.GetStageDone(iRI05TalkToDalton)
      GetOwningQuest().SetStage(iLC115Hostile)
    Else
      RI05_LC115PreviouslyExplored.SetValue(1)
      GetOwningQuest().SetStage(iLC115Shutdown)
    EndIf
  EndIf
EndEvent