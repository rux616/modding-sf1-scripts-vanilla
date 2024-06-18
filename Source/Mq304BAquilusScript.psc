Scriptname Mq304BAquilusScript extends ReferenceAlias

ActorValue Property QuantumEssence Mandatory Const Auto
Message Property QuantumEssenceAddMSG Mandatory Const Auto
Spell Property FortifyQuantumEssenceSpell Mandatory Const Auto
EffectShader Property Starborn_DeathShader Mandatory Const Auto

Event OnDying(ObjectReference akKiller)
    Actor SelfREF = Self.GetActorRef()

    SelfREF.BlockActivation(true, true)

    Starborn_DeathShader.Play(SelfREF, 5.0)

    ;add Quantum Essence to the killer, unless that killer is a player teammate
    If (akKiller as Actor).IsPlayerTeammate()
        FortifyQuantumEssenceSpell.Cast(SelfREF, Game.GetPlayer()) ;player gets the Quantum Essence if teammate kills Starborn
    Else
        FortifyQuantumEssenceSpell.Cast(SelfREF, akKiller)
    EndIf
    QuantumEssenceAddMSG.Show()
EndEvent

Event OnDeath(ObjectReference akKiller)
    Utility.Wait(6.0) ;give the FX some time, and then disable
    Self.GetActorRef().Disable()
EndEvent