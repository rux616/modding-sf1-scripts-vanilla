Scriptname TargetingEffectScript extends ActiveMagicEffect

GlobalVariable property MaxEnemiesThatCanBeAffected Mandatory Const Auto
TargetingSkillPlayerAliasScript Property TargetingSkillPlayer Mandatory Const Auto
bool modifySuccess
EffectShader Property EffectShaderToApply Auto Const Mandatory

;*****************************************************
Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    modifySuccess = TargetingSkillPlayer.TryToModifyTargetCount(1, MaxEnemiesThatCanBeAffected.GetValueInt())
    if !modifySuccess
        Dispel()
        EffectShaderToApply.Stop(akTarget)
    else
        EffectShaderToApply.Play(akTarget)
    EndIf
EndEvent

;*****************************************************

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    if modifySuccess
        TargetingSkillPlayer.TryToModifyTargetCount(-1)
        EffectShaderToApply.Stop(akTarget)
    EndIf
EndEvent