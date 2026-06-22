Scriptname TestJeffBScaredycatScript extends ObjectReference  

WwiseEvent Property mySoundEvent Auto Const
ImageSpaceModifier Property myImageSpace Auto Const
Keyword Property LinkCustom01 Auto Const

bool doOnce = False
ObjectReference myActor
ObjectReference player
ObjectReference[] LinkedRefs

;********************************************

Event OnLoad()
	myActor = getLinkedRef(LinkCustom01)
	player = game.GetPlayer()
	LinkedRefs = getLinkedRefChain(LinkCustom01)
    RegisterForHitEvent(myActor, player)
EndEvent

;********************************************

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == player && doOnce == False)
    	doOnce = True
    	int instanceID = mySoundEvent.play(getLinkedRef())
    	myImageSpace.Apply()
    	myActor.EnableNoWait()
    	Utility.wait(0.5)
    	myImageSpace.Remove()
    endIf
EndEvent

;********************************************

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    if(akTarget == myActor && akAggressor == player)
    	myActor.Disable()
    	int i = 1
    	While(i <= LinkedRefs.length)
    		(LinkedRefs[i] as Actor).SetGhost(True)
    		LinkedRefs[i].EnableNoWait()
    		i = i + 1
    	EndWhile
    else
    	RegisterForHitEvent(myActor, player)
    endIf
EndEvent

;********************************************