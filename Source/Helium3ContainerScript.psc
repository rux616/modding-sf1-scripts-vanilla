Scriptname Helium3ContainerScript extends ObjectReference
{script for helium 3 container}

String property myOpenAnimation = "play01" auto Const
String property myCloseAnimation = "play02" auto Const
MiscObject property myMiscItem auto Const
Bool property startOpen = FALSE auto
Message property myMessage auto

ObjectReference playerRef
Bool isOpen

;************************************************

Event OnLoad()
    playerRef = game.GetPlayer()
    if (startOpen == TRUE)
    	isOpen = TRUE
    	Utility.wait(5.0)
    	PlayAnimationAndWait(myOpenAnimation, "done")
    endif
EndEvent

;************************************************

Event OnActivate(ObjectReference akActionRef)
    if (akActionRef == playerRef)
    	if(isOpen == TRUE)
			if(playerRef.GetItemCount(myMiscItem) > 0)
				isOpen = FALSE
				playerRef.RemoveItem(myMiscItem, 1)
				PlayAnimationAndWait(myCloseAnimation, "done")
			else
				myMessage.Show()
			endif
		else
			isOpen = TRUE
			PlayAnimationAndWait(myOpenAnimation, "done")
			playerRef.AddItem(myMiscItem, 1)
		endif
    endif
EndEvent

;************************************************