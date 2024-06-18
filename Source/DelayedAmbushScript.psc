Scriptname DelayedAmbushScript extends Actor
{script for actors who enable and come out of ambush
when their linked actor dies
(e.g. molerats)}

Keyword Property LinkAmbushChild const auto

bool Property TopLevelActor = false auto
{Set this if the actor is the top actor}
ObjectReference myAmbushChild

bool bInitialized = false

Function Initialize()
	if !bInitialized
		bInitialized = true
	    ; if my linked ref is alive, register for OnDeath and disable
	    myAmbushChild = GetLinkedRef(LinkAmbushChild)
	    if !myAmbushChild || !TopLevelActor
	    	Disable()
	    endif
	endif
EndFunction

Event OnDeath(ObjectReference akKiller)
	if myAmbushChild
		myAmbushChild.Activate(myAmbushChild)
	endif
EndEvent



;MasterAmbush Stuff
;**********************************************

Event onReset()
	;messagebox ("in reset")
	self.setValue(Suspicious, fACtorVariableonReset)
	self.setValue(Aggression, fAggressionOnReset)
	self.evaluatePackage()
endEvent

;**********************************************

auto State waiting
	;The actor can exit the furniture in multiple ways.  We need to listen for all of these
	;events and if any are called, then go to All Done state, since we don't need to listen
	;for any other events because any of the events will get the actor out of the furniture.

	Event OnLoad()
		Initialize()
		if Is3DLoaded()
			RegisterForHitEvent(self) ; anyone hits us
		endIf
	endEvent

	Event OnUnload()
		UnregisterForAllHitEvents()
	EndEvent
	
	;Handle Activation
	Event onActivate(ObjectReference triggerRef)
		;trace("in onactivate")
		Actor actorRef = triggerRef as Actor
		Enable()
		if((actorRef == game.getPlayer()) || (ambushOnTrigger == true))
			;player has activated actor, so leave state
			gotoState("allDone")
		else
			;trigger activated them, so set their aggression to 2, but do not leave state
			self.setValue(Aggression, fAggression)
			self.EvaluatePackage()
		endif
	endEvent
	
	;Handle onHit
	Event onHit(ObjectReference akTarget, objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		;trace("in onhit")
		gotoState("allDone")
	endEvent
	
	;Handle other cases that cause them to come out of furniture
	
	;Using onGetUp as a safety net
	Event onGetUp(ObjectReference myFurniture)
		Cell parentCell = GetParentCell()
		;trace("in getup")
		if (parentCell && parentCell.IsAttached() && (is3DLoaded()))
			gotoState("allDone")
		endif
	endEvent
	
	Event OnCombatStateChanged(ObjectReference actorRef,int aeCombatState)
		;trace("in combatstatechanged")
		if (aeCombatState != 0) ; 0 = not in combat, so non-0 means we entered combat
			gotoState("allDone")
		endIf
	endEvent
	
	;if any of the events above are caught, we leave this state, but first we need to take care
	;of setting up everything we need when we get out of our furniture.
	Event onEndState(string asNewState)
		;trace("in end state")
		;handle things like lids that are the linkedRef of the furniture
		if(getLinkedRef())
			getLinkedRef().activate(self)
		endif
		
		if(getNthLinkedRef(1))
			getNthLinkedRef(1).activate(self)
		endif
		
		if(getNthLinkedRef(2))
			getNthLinkedRef(2).activate(self)
		endif
		
		;set actor variables
		self.setValue(Suspicious, fACtorVariable)
		self.setValue(Aggression, fAggression)
		self.evaluatePackage()
		
		;check to see if actor has a linkedRef with this keyword, if so, then activate it
		if (GetLinkedRef(linkKeyword) as objectReference)
			(getLinkedRef(linkKeyword) as objectReference).activate(self)
		endif
	endEvent
endState

;**********************************************

State allDone
	;do nothing
endState
	
;**********************************************

float property fActorVariable = 1.0 auto hidden
{By default this property is set to 1.} 

float property fActorVariableOnReset = 0.0 auto hidden

float property fAggression = 2.0 auto
{
By default this property is set to 2 (very aggressive).
0 - Unaggressive - will not initiate combat
1 - Aggressive - will attack enemies on sight
2 - Very Aggressive - Will attack enemies and neutrals on sight
3 - Frenzied - Will attack anyone else
}

float property fAggressionOnReset = 0.0 auto hidden

keyword property linkKeyword auto const
{if this has a linkedRef with this keyword, we will activate it once when hit, activated, or on combat begin}

bool property ambushOnTrigger = True auto const
{By default, this is set to false. Set to true if you want encounter to come out of ambush when player enters trigger}

ActorValue property Aggression auto const
ActorValue property Suspicious auto const