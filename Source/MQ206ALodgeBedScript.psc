Scriptname MQ206ALodgeBedScript extends ReferenceAlias

Message Property MessageToShow Auto Const Mandatory

Int Property Button1StageToSet=17 Auto Const

Int Property PrereqStageDone=15 Const Auto

Int Property TurnOffStageDone=20 Const Auto

Int Property TurnOffStageDone02=30 Const Auto

Event OnActivate(ObjectReference akActionRef)

    If AkActionREF == Game.GetPlayer()
        Quest myQuest = GetOwningQuest()
        If (myQuest.GetStageDone(PrereqStageDone)) && (myQuest.GetStageDone(TurnOffStageDone) == False) && (myQuest.GetStageDone(TurnOffStageDone02) == False)
            int iButton = MessageToShow.Show()
            if iButton == 1
                myQuest.SetStage(Button1StageToSet)
            EndIf
        EndIf
    EndIf
EndEvent