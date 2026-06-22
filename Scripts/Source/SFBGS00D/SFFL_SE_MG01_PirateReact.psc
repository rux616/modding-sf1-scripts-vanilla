Scriptname SFBGS00D:SFFL_SE_MG01_PirateReact extends ObjectReference

{Activates spawner
}

Quest Property SEMG01 = None Auto Const

Event OnActivate(ObjectReference akActionRef)
  ;Debug.Trace("Activated by " + akActionRef)
if ( SEMG01.GetStage() != 20 )
    SEMG01.SetStage(20)
EndIf

EndEvent


