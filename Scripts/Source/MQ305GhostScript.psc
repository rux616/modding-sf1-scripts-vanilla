Scriptname MQ305GhostScript extends Actor

Spell Property AbStarbornTeleport Mandatory Const Auto
VisualEffect Property UnityActorEffect Mandatory Const Auto

Auto State WaitingForLoad
    Event OnLoad()
        GotoState("HasLoaded")
        UnityActorEffect.Play(Self)
        Self.AddSpell(AbStarbornTeleport)
        ;Utility.Wait(3.0)
        ;SetRestrained()
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