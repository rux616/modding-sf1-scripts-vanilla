Scriptname LC044_LightSwitchAliasScript extends ReferenceAlias

ReferenceAlias Property LightsToEnable Auto Const Mandatory
ReferenceAlias Property LightsToDisable Auto Const 

Event OnActivate(ObjectReference akActionRef)

    ObjectReference LightsEnableRef = LightsToEnable.GetRef()

    If LightsEnableRef.IsEnabled()
        LightsEnableRef.Disable()
        If LightsToDisable.GetRef() != None
            LightsToDisable.GetRef().Enable()
        EndIf
    Else
        LightsEnableRef.Enable()
        If LightsToDisable.GetRef() != None
            LightsToDisable.GetRef().Disable()
        EndIf
    EndIf

EndEvent
