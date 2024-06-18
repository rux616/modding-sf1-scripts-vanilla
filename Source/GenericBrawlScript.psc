Scriptname GenericBrawlScript extends Quest Conditional

function StartBrawl(bool bStart = true)
	Actor OpponentREF = Opponent.GetActorRef()
	Actor OpponentFriendREF =  OpponentFriend.GetActorRef()

	debug.trace(self + " StartBrawl: " + opponentRef)
	OpponentRef.SetNoBleedoutRecovery(bStart)
	OpponentREF.AllowBleedoutDialogue(bStart)

	(Opponent as GenericBrawlOpponentAliasScript).StartUpdateTimer(bStart)
	if OpponentFriendREF
		OpponentFriendRef.SetNoBleedoutRecovery(bStart)
		(OpponentFriend as GenericBrawlOpponentAliasScript).StartUpdateTimer(bStart)
	endif

	if bStart
		;remove player's weapons
		Game.GetPlayer().EquipItem(Unarmed, abSilent=True)
		OpponentREF.EquipItem(Unarmed, abSilent=True)

		OpponentREF.StartCombat(Game.GetPlayer())
		; if opponent friend exists, start combat as well
		if OpponentFriendREF
			OpponentFriendREF.EquipItem(Unarmed, abSilent=True)
			OpponentFriendREF.StartCombat(Game.GetPlayer())
		endif

		; player allies
		int i = 0
		while i < PlayerAllies.GetCount()
			Actor theAlly = (PlayerAllies.GetAt(i) as Actor)
			if theAlly
				theAlly.EquipItem(Unarmed, abSilent=True)
				theAlly.StartCombat(OpponentREF)
				OpponentRef.StartCombat(theAlly)
				if OpponentFriendREF
					theAlly.StartCombat(OpponentFriendREF)
					OpponentFriendREF.StartCombat(theAlly)
				endif
			endif
			i += 1
		endWhile
	endif
endFunction

function OpponentDefeated()
	debug.trace(self + " OpponentDefeated")
	; opponent is down, cue victory dialogue
	StopBrawlCombat()
	Opponent.GetActorRef().ModValue(GenericBrawlLoser, 1)
	StartEndingTimer()
endFunction

function PlayerDefeated()
	debug.trace(self + " PlayerDefeated")
	StopBrawlCombat()
	Opponent.GetActorRef().ModValue(GenericBrawlWinner, 1)
	StartEndingTimer()
endFunction

; utility function to stop everybody involved
function StopBrawlCombat()
	Actor OpponentREF = Opponent.GetActorRef()
	Actor OpponentFriendREF =  OpponentFriend.GetActorRef()
	Game.GetPlayer().StopCombatAlarm()
	OpponentRef.StopCombatAlarm()
	if OpponentFriendREF
		OpponentFriendREF.StopCombatAlarm()
	endif
endFunction

; start failsafe ending timer
function StartEndingTimer()
	StartTimer(EndTime, EndTimerID)
endFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == EndTimerID
		debug.trace(self + " End Timer expired - stopping")
		Stop()
	endif
endEvent

int property EndTimerID = 1 auto const
float property EndTime = 30.0 auto const

ReferenceAlias Property Opponent const auto
ReferenceAlias Property OpponentFriend const auto

RefCollectionAlias Property PlayerAllies const auto

Weapon Property Unarmed const auto

ActorValue Property GenericBrawlWinner Auto Const

ActorValue Property GenericBrawlLoser Auto Const

int property EndBrawlStage = 200 auto const
int property PlayerWinsStage = 15 auto const
int property PlayerDefeatedStage = 180 auto const
int property CheatingStage = 150 auto const
int property QuestDoneStage = 250 auto const
{ quests can look for this stage to be done to trigger 'react to end of brawl' content }