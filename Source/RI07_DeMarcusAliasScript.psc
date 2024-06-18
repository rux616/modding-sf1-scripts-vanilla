Scriptname RI07_DeMarcusAliasScript extends ReferenceAlias

Int Property iStageToSet Auto Const
Int Property iPreReqStage Auto Const
Int Property iTurnOffStage Auto Const

MagicEffect Property SocialSkill_Manipulation Auto Const Mandatory

Event OnAliasInit()
    RegisterForMagicEffectApplyEvent(Self, akEffectFilter = SocialSkill_Manipulation)
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)

    If akEffect == SocialSkill_Manipulation
    
        Quest OwningQuest = GetOwningQuest()

        If OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage)
            OwningQuest.SetStage(iStageToSet)
        EndIf

    EndIf

EndEvent
