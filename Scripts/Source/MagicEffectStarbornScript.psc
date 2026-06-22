Scriptname MagicEffectStarbornScript extends ActiveMagicEffect

Spell Property ffStarbornTeleport Mandatory Const Auto
Spell Property ffStarbornDeath Mandatory Const Auto
ActorValue Property QuantumEssence Mandatory Const Auto
Message Property QuantumEssenceAddMSG Mandatory Const Auto
Spell Property FortifyQuantumEssenceSpell Mandatory Const Auto
EffectShader Property Starborn_DeathShader Mandatory Const Auto
Keyword Property NoLoot Mandatory Const Auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    ffStarbornTeleport.Cast(akCaster, akCaster)
    RegisterForRemoteEvent(akCaster, "OnLoad")
    RegisterForRemoteEvent(akCaster, "OnDying")
    RegisterForRemoteEvent(akCaster, "OnDeath")
EndEvent

Auto State WaitingForLoad
    Event ObjectReference.OnLoad(ObjectReference akSender)
        GotoState("HasLoaded")
        ffStarbornTeleport.Cast(akSender, akSender)
    EndEvent
EndState

State HasLoaded
    Event ObjectReference.OnLoad(ObjectReference akSender)
        ;do nothing
    EndEvent
EndState

Event ObjectReference.OnLoad(ObjectReference akSender)
    ;do nothing
EndEvent

Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
    akSender.BlockActivation(true, true)
    ;ffStarbornDeath.Cast(Self, Self)
    Starborn_DeathShader.Play(akSender, 5.0)

    ;Don't add Quantum Essence if this is a Parallel Self or Inner Demon duplicate.
    if (!akSender.HasKeyword(NoLoot))
        ;add Quantum Essence to the killer, unless that killer is a player teammate
        If (akKiller as Actor).IsPlayerTeammate()
            FortifyQuantumEssenceSpell.Cast(akSender, Game.GetPlayer()) ;player gets the Quantum Essence if teammate kills Starborn
        Else
            FortifyQuantumEssenceSpell.Cast(akSender, akKiller)
        EndIf
        QuantumEssenceAddMSG.Show()
    EndIf
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
    Utility.Wait(6.0) ;give the FX some time, and then disable
    akSender.Disable()
EndEvent