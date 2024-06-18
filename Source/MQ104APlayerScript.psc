Scriptname MQ104APlayerScript extends ReferenceAlias

Int Property PlayerPowerPrereqStage=710 Const Auto
Int Property PlayerPowerSetStage=720 Const Auto
Spell Property PlayerFirstPower Mandatory Const Auto
Location Property CityNewAtlantisLodgeLocation Const Auto

Event OnSpellCast(Form akSpell)
    ;advance the quest if we're at the point where Constellation wants you to demonstrate your new power
    If (akSpell == PlayerFirstPower) && (Game.GetPlayer().IsInLocation(CityNewAtlantisLodgeLocation))
        Quest MyQuest = GetOwningQuest()
        If (MyQuest.GetStageDone(PlayerPowerPrereqStage)) && (MyQuest.GetStageDone(PlayerPowerSetStage) == 0)
           MyQuest.SetStage(PlayerPowerSetStage)
        EndIf
    EndIf
EndEvent