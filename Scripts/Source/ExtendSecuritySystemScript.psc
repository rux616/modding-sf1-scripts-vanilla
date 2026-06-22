Scriptname ExtendSecuritySystemScript extends securitysystemscript Const
{Example Script for Extending SecuritySystemScript}

Event SQ_ParentScript.SQ_AlarmTriggeredOn(SQ_ParentScript source, Var[] akArgs)
    Location alarmLocation = akArgs[0] as Location
    if alarmLocation == MyLocation
       GetLinkedRef().Enable(self)
    endif
EndEvent