Scriptname TestGym_FXSeqOnOff extends ObjectReference

String Property SeqName = "TestSmoothLoop01" Auto

Bool Property OnOff = false Auto

ObjectReference Property TargetArt Auto

Event OnActivate(ObjectReference akActionRef)
if OnOff == true 
	OnOff = false
 	 Debug.Trace("Turning off smooth loop ")
	; stop seq
	TargetArt.StopSequence(SeqName)

elseif OnOff == false 
	OnOff = true
 	 Debug.Trace("Turning on smooth loop ")
	; play seq
	TargetArt.StartSequence(SeqName, true)

endif

EndEvent



