Scriptname RI02_PlayerAliasScript extends ReferenceAlias

Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const Mandatory
GlobalVariable Property RI02_AstralLoungeBodyCount Auto Const Mandatory
Int Property iStartTrackingStage Auto Const Mandatory

Event OnKill(ObjectReference akVictim)

    Quest MyQuest = GetOwningQuest()

    If MyQuest.GetStageDone(iStartTrackingStage)
        If akVictim.GetCurrentLocation() == CityNeonTradeTowerAstralLoungeLocation
            RI02_AstralLoungeBodyCount.SetValue(RI02_AstralLoungeBodyCount.GetValue() + 1)
        EndIf
    EndIf

EndEvent