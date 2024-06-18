Scriptname FAB_PlaySoundScript extends TopicInfo Const

WwiseEvent Property SoundToPlay Auto Const
Bool Property bPlayOnEnd = TRUE Auto Const

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if bPlayOnEnd == FALSE
 		SoundToPlay.Play(Game.GetPlayer())
  	endif
endEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if bPlayOnEnd == TRUE
 		SoundToPlay.Play(Game.GetPlayer())
  	endif
endEvent