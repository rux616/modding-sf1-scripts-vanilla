Scriptname REParentScript extends Quest Conditional

; Kill the actor and apply a force to make the body fall in a more natural way
; NOTE: this function will wait for actor to have 3D (up to a failsafe amount of seconds)
; abKillSilent: true = use KillSilent instead of Kill
Function KillWithForce(Actor akVictim, Actor akKiller = None, bool abKillSilent = true)
	debug.trace(self + " KillWithForce akVictim=" + akVictim + " akKiller=" + akKiller)
	; wait for 3D to load - a little bit
	int waitCount = 0
	float afForceMagnitude = 150.0
	while !akVictim.Is3DLoaded() && waitCount < 10
		debug.trace(self + "KillWithForce - waiting for 3D")
		waitCount = waitCount + 1
		utility.wait(0.5)
	endWhile

	if abKillSilent
		akVictim.KillSilent(akKiller)
	else
		akVictim.Kill(akKiller)
	endif

	if akVictim.Is3DLoaded()
		int aiForceDirection = Utility.RandomInt(1, 4)
		debug.trace(self + "KillWithForce - applying magnitude " + afForceMagnitude + " direction " + aiForceDirection)
		akVictim.ApplyHavokImpulse(0, 0, 1.0, 250)
		utility.wait(0.2)
		debug.trace(self + "KillWithForce - placing explosion")
		akVictim.PlaceAtMe(REDeathExplosion)
	endif

endFunction

Function KillWithForceNoWait(Actor akVictim, Actor akKiller = None, bool abKillSilent = true)
	Var[] akArgs = new Var[3]
	akArgs[0] = akVictim
	akArgs[1] = akKiller
	akArgs[2] = abKillSilent
	CallFunctionNoWait("KillWithForce", akArgs)
endFunction

function LootContainer(ObjectReference lootingRef, ObjectReference targetRef)
	debug.trace(self + " LootContainer: " + lootingRef + " looting " + targetRef)
	targetRef.RemoveAllItems(lootingRef)
	targetRef.AddKeyword(RELootedCorpse)
endFunction

; update global cooldown timer
function UpdateGlobalCooldown()
	REGlobalCooldown.SetValue(GameDaysPassed.GetValue() + GlobalCooldownDays)
endFunction

; utility function
; NOTE: ALWAYS KILLS IF IT DOESN'T ENABLE
function RandomlyEnableOrKill(ReferenceAlias theAlias, int PercentChanceEnable = 50, int PercentChanceKill = 50)
	RandomlyEnableOrKillActor(theAlias.GetActorRef(), PercentChanceEnable, PercentChanceKill)
endFunction

function RandomlyEnableOrKillCollection(RefCollectionAlias theCollection, int PercentChanceEnable = 50, int PercentChanceKill = 50, int minimumEnableCount = 1)
	int i = 0
	while i < theCollection.GetCount()
		Actor theActor = theCollection.GetAt(i) as Actor
		if i < minimumEnableCount
			theActor.Enable()
		else
			RandomlyEnableOrKillActor(theActor, PercentChanceEnable, PercentChanceKill)
		endif
		i += 1
	endWhile
endFunction

function RandomlyEnableOrKillActor(Actor theActor, int PercentChanceEnable = 50, int PercentChanceKill = 50)
	if theActor
		if Utility.RandomInt() <= PercentChanceEnable
			theActor.Enable()
			if Utility.RandomInt() <= PercentChanceKill
				theActor.KillSilent()
			endif
		else
			theActor.KillSilent()
		endif
	endif
endFunction

function SendCleanupEvent()
	debug.trace(self + " SendCleanupEvent")
	SendCustomEvent("RECheckForCleanup")
endFunction


;/ PROPERTIES AND VARIABLES /;

CustomEvent RECheckForCleanup		; custom event to tell RE quests to check for cleanup

Group ConstProperties 
	Faction Property REPlayerFriend Auto Const Mandatory
	Faction Property REPlayerEnemy Auto Const Mandatory


	Faction Property REIgnoreForCleanup Auto Const Mandatory
	{ add actors to this faction to have them ignored during cleanup check
	  i.e. quest can clean up even if they are loaded/alive
	}

	GlobalVariable Property GameDaysPassed Auto Const Mandatory

	GlobalVariable Property REGlobalCooldown Auto Const Mandatory
	{ global variable which holds the time that GameDaysPassed has to exceed before another RE can trigger }

	float Property GlobalCooldownDays = 0.00 Auto
	{ how long after a RE is triggered before another encounter can trigger? }

	Explosion Property REDeathExplosion Auto Const Mandatory

	Keyword Property RELootedCorpse Auto Conditional Const Mandatory

	Keyword Property LocTypeStarSystem Auto Conditional Const Mandatory
	{ use to check for system locations }
endGroup


;Group CustomFlags
	; flags for RE quests that need to be saved globally

;endGroup

