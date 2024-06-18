Scriptname TestArtifactVision extends ObjectReference

VisualEffect Property P_ArtifactVisionFX_AO Auto Const Mandatory
WwiseEvent Property P_AMBArtifactVisionAEvent Auto Const Mandatory

ObjectReference Property P_LightsOff Auto Const

Event OnActivate(ObjectReference akActionRef)
  Debug.Trace("Activated by " + akActionRef)
     if akActionRef == Game.GetPlayer()
      ; your code here.
		
		
		;Game.ForceFirstPerson()
 		
		InputEnableLayer myLayer = InputEnableLayer.Create()
		myLayer.DisablePlayerControls()

		P_ArtifactVisionFX_AO.Play(Game.GetPlayer(), 35)

		 P_LightsOff.Disable()

		int instanceID =  P_AMBArtifactVisionAEvent.play(Game.GetPlayer()) 
 

	if P_AMBArtifactVisionAEvent.PlayAndWait(Game.GetPlayer())
   		 Debug.Trace("P_AMBArtifactVisionAEvent has finished playing!")
		myLayer.EnablePlayerControls()

		P_LightsOff.Enable()
		P_FadetoBlackImod.Apply()
	else
  		  Debug.Trace("P_AMBArtifactVisionAEvent failed to play")
	endIf
		
		utility.wait(2)
		P_FadetoBlackImod.Remove()
   endif
EndEvent





ImageSpaceModifier Property P_FadetoBlackImod Auto Const Mandatory
