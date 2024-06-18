Scriptname DefaultCrowdEventManager extends Quest
{Handles sending events to crowds to get them to "ooh" and "ahh"

See also:
DefaultCrowdEventSenderAliasScript

}

;Used heavily by Combat Zone, see jduvall before changing this script. Thanks! :)

Struct CrowdEventData
Keyword EventKeyword
ObjectReference EventRef1
ObjectReference EventRef2
 	
EndStruct 


Group CrowdData

keyword Property CrowdEventMember const auto  
{AUTOFILL THIS -- which keyword will be used to find actors to make the crowd?}

RefCollectionAlias Property RefCollection const auto
{which Reference Collection should the crowd members be put in?}

ReferenceAlias Property FindOrigin const auto
{Which ref alias should be the origin for the find radius in which to find the crowd?}

int Property FindRadius = 5000 const auto
{Default: 5000, How big a radius around the FindOriginAlias should we look for crowd members?}

EndGroup

Group CommonEventKeywords
keyword Property CrowdEvent_OnHit const auto
{Autofill}

int Property StopSendingOnHitAfterStage const auto
{After this stage or higher, stop sending this event}

keyword Property CrowdEvent_OnCripple const auto
{Autofill}

int Property StopSendingOnCrippleAfterStage const auto
{After this stage or higher, stop sending this event}

keyword Property CrowdEvent_OnDeath const auto
{Autofill}

int Property StopSendingOnDeathAfterStage const auto
{After this stage or higher, stop sending this event}

EndGroup

Group CommonEventSenders

ReferenceAlias[] property OnHitEventSenders const auto  
{Aliases that should send the CrowdEvent_OnHit to crowd members}

ReferenceAlias[] property OnCrippleEventSenders const auto  
{Aliases that should send the CrowdEvent_OnCripple to crowd members}

ReferenceAlias[] property OnDeathEventSenders const auto  
{Aliases that should send the CrowdEvent_OnDeath to crowd members}


EndGroup

CustomEvent CrowdEvent

Event OnQuestStarted()

	RegisterForOnHitEvents()

	int i = 0
	
	i = 0
	while (i < OnCrippleEventSenders.length)
		RegisterForRemoteEvent(OnCrippleEventSenders[i], "OnCripple")
		i += 1
	endwhile
	
	i = 0
	while (i < OnDeathEventSenders.length)
		RegisterForRemoteEvent(OnDeathEventSenders[i], "OnDeath")
		i += 1
	endwhile

EndEvent

;REMOTELY REGISTERED EVENTS
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName) 
	;ASSUME this is from one of our OnHitEventSenders

	if GetStage() < StopSendingOnHitAfterStage

		SendCrowdEvent(CrowdEvent_OnHit, akTarget, akAggressor)
		RegisterForOnHitEvents()

	else
		UnregisterForOnHitEvents()
	endif

EndEvent

Event ReferenceAlias.OnCripple(ReferenceAlias akSender, ActorValue akActorValue, bool abCrippled)
	;ASSUME this is from one of our OnCrippleEventSenders

	if GetStage() < StopSendingOnCrippleAfterStage
		SendCrowdEvent(CrowdEvent_OnCripple, akSender.GetReference(), None)
	
	else
		int i = 0
		while (i < OnCrippleEventSenders.length)
			UnregisterForRemoteEvent(OnCrippleEventSenders[i], "OnCripple")
			i += 1
		endwhile

	endif
EndEvent

Event ReferenceAlias.OnDeath(ReferenceAlias akSender, ObjectReference akKiller)
	;ASSUME this is from one of our OnDeathEventSenders
	
	if GetStage() < StopSendingOnDeathAfterStage
		SendCrowdEvent(CrowdEvent_OnDeath, akSender.GetReference(), akKiller)

	else
		int i = 0
		while (i < OnDeathEventSenders.length)
			UnregisterForRemoteEvent(OnDeathEventSenders[i], "OnDeath")
			i += 1
		endwhile

	endif

EndEvent


;FUNCTIONS
Function RegisterForOnHitEvents()
	int i = 0
	while (i < OnHitEventSenders.length)
		RegisterForHitEvent(OnHitEventSenders[i])
		i += 1
	endwhile
EndFunction

Function UnregisterForOnHitEvents()
	int i = 0
	while (i < OnHitEventSenders.length)
		UnregisterForHitEvent(OnHitEventSenders[i])
		i += 1
	endwhile
EndFunction


Function SendCrowdEvent(keyword EventToSend, ObjectReference EventRef1, ObjectReference EventRef2)
	var[] args = new var[1]

	CrowdEventData myCrowdEventData = new CrowdEventData
	myCrowdEventData.EventKeyword = EventToSend
	myCrowdEventData.EventRef1 = EventRef1
	myCrowdEventData.EventRef2 = EventRef2

	args[0] = myCrowdEventData

	SendCustomEvent("CrowdEvent", args)

EndFunction

Function CreateCrowdInLoadedArea()

	debug.trace(self + "CreateCrowdInLoadedArea() started")

	location OriginLocation = FindOrigin.GetReference().GetCurrentLocation()
	int SecondsToBailout = 5
	int waitingFor = 0
	while (OriginLocation.IsLoaded() == false && waitingFor < SecondsToBailout)
		utility.wait(1)
		waitingFor += 1
		debug.trace(self + "Waiting for location to be loaded: " + OriginLocation + "; WaitingFor: " + waitingFor)
	endwhile

	ObjectReference[] foundRefs = FindOrigin.GetReference().FindAllReferencesWithKeyword(CrowdEventMember, FindRadius)

	RefCollection.RemoveAll()

	int r = 0
	while (r < foundRefs.length)
		RefCollection.AddRef(foundRefs[r])
		
		r += 1
	endwhile
	
	
	debug.trace(self + "CreateCrowdInLoadedArea() done, found:" + foundRefs)

EndFunction

