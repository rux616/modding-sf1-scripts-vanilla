Scriptname LvlStarbornScript extends Actor

Spell Property ffStarbornTeleport Mandatory Const Auto
Spell Property ffStarbornDeath Mandatory Const Auto
ActorValue Property QuantumEssence Mandatory Const Auto
Message Property QuantumEssenceAddMSG Mandatory Const Auto
Spell Property FortifyQuantumEssenceSpell Mandatory Const Auto
EffectShader Property Starborn_DeathShader Mandatory Const Auto

Auto State WaitingForLoad
    Event OnLoad()
        GotoState("HasLoaded")
        ffStarbornTeleport.Cast(Self, Self)
    EndEvent
EndState

State HasLoaded
    Event OnLoad()
        ;do nothing
    EndEvent
EndState

Event OnLoad()
    ;do nothing
EndEvent

Event OnDying(ObjectReference akKiller)
    Self.BlockActivation(true, true)
    ;ffStarbornDeath.Cast(Self, Self)
    Starborn_DeathShader.Play(Self)
EndEvent

Event OnDeath(ObjectReference akKiller)
    ;add Quantum Essence to the killer, unless that killer is a player teammate
    If (akKiller as Actor).IsPlayerTeammate()
        FortifyQuantumEssenceSpell.Cast(Self, Game.GetPlayer()) ;player gets the Quantum Essence if teammate kills Starborn
    Else
        FortifyQuantumEssenceSpell.Cast(Self, akKiller)
    EndIf
    QuantumEssenceAddMSG.Show()

    Utility.Wait(5.0) ;give the FX some time, and then disable
    Disable()
EndEvent

Function TeleportIn()
    ffStarbornTeleport.Cast(Self, Self)
EndFunction

Function TeleportOut()
    ffStarbornDeath.Cast(Self, Self)
EndFunction