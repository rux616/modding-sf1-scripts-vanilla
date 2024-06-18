Scriptname SG02_SatelliteScript extends ReferenceAlias

int Property ShutdownStage Const Auto
{If this stage is set, stop trying to destroy this object}

bool Property DamageOnce = false Auto
{Make sure we're only damaging this object the first time it loads in}

Event OnLoad()
    ; As soon as the satellite is loaded - damage it

    if !DamageOnce && !GetOwningQuest().GetStageDone(ShutdownStage)
        DamageOnce = true
        SELF.GetRef().TryToSetEssential()
        SELF.GetRef().DamageObject(1.8)
    endif
EndEvent

Function Fix()
    SELF.GetRef().Repair()
EndFunction