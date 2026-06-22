Scriptname MQ204HunterScript extends ReferenceAlias

ActorValue Property Health Mandatory Const Auto
Int Property HunterDamagedStage=700 Const Auto
Explosion Property LC165_ScriptedTeleportSourceExplosion Const Auto
EffectShader Property Starborn_DeathShader Const Auto
ObjectReference Property MQHoldingCellCenterMarker Const Auto

Event OnAliasInit()
    ;we want to know if the Hunter is ever at half health
    Actor HunterREF = Self.GetActorRef()
    Float iHalfHealth = HunterREF.GetValue(Health) / 2
    RegisterForActorValueLessThanEvent(Self.GetActorRef(), Health, iHalfHealth)
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)

    Actor HunterREF = Self.GetActorRef()
    HunterREF.SetUnconscious()
    HunterREF.BlockActivation(True, True)
    HunterREF.StopCombat()
    HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
    Starborn_DeathShader.Play(HunterREF)

    ;move back to the holding cell
    Utility.Wait(3.0)
    HunterREF.Disable()
    HunterREF.Moveto(MQHoldingCellCenterMarker)
    HunterREF.ResetHealthAndLimbs()
    Float iHalfHealth = HunterREF.GetValue(Health) / 2
    RegisterForActorValueLessThanEvent(Self.GetActorRef(), Health, iHalfHealth)
    HunterREF.SetUnconscious(False)
    HunterREF.BlockActivation(False, False)
    HunterREF.Enable()

    GetOwningQuest().SetStage(HunterDamagedStage)
EndEvent