Scriptname MQ305UnityArmillaryScript extends ReferenceAlias

Event OnLoad()
    (Self.GetRef() as ArmillaryScript).BuildCompleteArmillary()
EndEvent