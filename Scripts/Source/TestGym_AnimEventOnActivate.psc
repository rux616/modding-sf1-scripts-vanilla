Scriptname TestGym_AnimEventOnActivate extends ObjectReference Const

{Tests brads stuff}

ObjectReference Property PipeArt Auto Const



Event OnLoad()

endEvent

Event OnActivate(ObjectReference akActionRef)

if 1> 0 
 	 Debug.Trace("Hello Brad ")

	; Play the  animation on the switch
	PipeArt .PlayAnimation("Play01")

	Utility.Wait(3) 

	PipeArt .PlayAnimation("StopEffect")
endif

EndEvent

