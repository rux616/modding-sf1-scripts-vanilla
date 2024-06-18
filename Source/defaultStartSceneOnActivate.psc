Scriptname defaultStartSceneOnActivate extends ObjectReference Const
{Simple script to start a scene when clicking on the reference.  Useful for things like intercoms.}

Scene Property SceneToPlay Auto Const

Event OnActivate(ObjectReference akActionRef)
    if ( Game.GetPlayer() == akActionRef && !SceneToPlay.isPlaying() )
    	SceneToPlay.start()
    endif
EndEvent