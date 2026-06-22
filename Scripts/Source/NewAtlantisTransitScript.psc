ScriptName NewAtlantisTransitScript extends ObjectReference
{Controls the transit system for New Atlantis}

String Property offRamp = "offRamp" Auto Const
{event to call the car off the line}
String Property onRamp = "takeOff" Auto Const
{event to call the car back on the line}
String Property offRampDone = "IdleStop" Auto Const
{event that fires when offRamp is done}
Keyword Property LinkCustom01 Auto Const


;**********************************************

ObjectReference myTrack
ObjectReference myLinkCustom01
Bool carWaiting = FALSE
Bool playerInsideCar = FALSE

;**********************************************

Event OnLoad()
	myTrack = getLinkedRef()
	myLinkCustom01 = getLinkedRef(LinkCustom01)
	RegisterForRemoteEvent(myLinkCustom01, "OnTriggerEnter")
	RegisterForRemoteEvent(myLinkCustom01, "OnTriggerLeave")
	RegisterForRemoteEvent(myTrack, "OnActivate")
EndEvent

;**********************************************

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == game.GetPlayer() && carWaiting == FALSE)
    	myTrack.PlayAnimationAndWait(offRamp, offRampDone)
    	carWaiting = TRUE
    	;car is off track and waiting, enable the trigger that lets us know when player is in the car
    	myLinkCustom01.enable()

    EndIf
EndEvent

;**********************************************

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
	if(akActionRef == game.GetPlayer())
		if(carWaiting == TRUE)
			;player is inside parked car
			playerInsideCar = TRUE
		EndIf
		RegisterForRemoteEvent(myLinkCustom01, "OnTriggerEnter")
	EndIf
EndEvent

;**********************************************

Event ObjectReference.OnTriggerLeave(ObjectReference akSender, ObjectReference akActionRef)
	if(akActionRef == game.GetPlayer())
		playerInsideCar = FALSE
		RegisterForRemoteEvent(myLinkCustom01, "OnTriggerLeave")
	EndIf
EndEvent

;**********************************************

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	 if(akActionRef == game.GetPlayer())
   		if(carWaiting == TRUE && playerInsideCar == TRUE)
   			;player is inside a stopped car and wants to get back on track
   			carWaiting = FALSE
   			myTrack.PlayAnimation(onRamp)
   		elseif(carWaiting == FALSE)
   			;player is riding car and wants to stop at next station
   			myTrack.PlayAnimationAndWait(offRamp, offRampDone)
   			carWaiting = TRUE
   		EndIf
		RegisterForRemoteEvent(myTrack, "OnActivate")
   EndIf
EndEvent

;**********************************************