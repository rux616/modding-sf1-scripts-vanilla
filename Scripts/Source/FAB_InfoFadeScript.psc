Scriptname FAB_InfoFadeScript extends TopicInfo
{This allows fading out/in when an info begins/ends}

Bool Property OnBegin = True Const Auto
{If True (default), stop camera when the Info begins. If False then stop camera when the info ends.}

Bool Property FadeOut = True Const Auto
{If True (default), fade out the camera - if False then fade back in}

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if OnBegin == True
 		FadeOutNow()
  	endif
endEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if OnBegin == False
 		FadeOutNow()
  	endif
endEvent

Function FadeOutNow()
    if ( FadeOut == TRUE )
        Game.FadeOutGame(true, true, 0.0, 1.0, true)
    else
        Game.FadeOutGame(false, true, 0.0, 1.0)
    EndIf
EndFunction