Scriptname MQ305UnityRampScript extends ReferenceAlias

Event OnLoad()
    ;make sure ramp is down on load
    Self.GetRef().PlayAnimation("Landed")
EndEvent