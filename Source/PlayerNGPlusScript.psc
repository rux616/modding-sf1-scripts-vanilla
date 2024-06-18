Scriptname PlayerNGPlusScript extends Actor Const

ActorValue Property PlayerUnityTimesEntered Mandatory Const Auto
EffectShader Property Starborn_DeathShader Mandatory Const Auto

Event OnDying(ObjectReference akKiller)
    If ((Self.GetValue(PlayerUnityTimesEntered) as int) >= 1)
        Starborn_DeathShader.Play(Self)
    EndIf
EndEvent