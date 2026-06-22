Scriptname SocialSkill_Manipulation_CommandOnHit extends ActiveMagicEffect

Faction Property CharmFaction Auto
bool Property bMakePlayerTeammate = false Auto
int Property AllowForTeammate = 0 Auto  
Topic Property CombatTopicToSay  Auto  
GlobalVariable Property WICastNonHostileTimer  Auto  
GlobalVariable Property GameDaysPassed  Auto  
Topic Property TopicToSay Auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

; ;	debug.trace(self + "OnEffectStart(" + akTarget + "," + akCaster + ")")
Actor myTarget = akTarget as Actor
	myTarget.AddToFaction(CharmFaction)
	if bMakePlayerTeammate
		myTarget.SetPlayerTeammate(true, true)
	myTarget.SetCanDoCommand(true)
	myTarget.SetCommandState(true)
	endif



;	If myTarget != Game.GetPlayer()
;		If myTarget.GetCurrentScene() == None
;			If GameDaysPassed.value > WICastNonHostileTimer.value
;				If AllowForTeammate == 0
;					If myTarget.IsCommandedActor() == 0 || myTarget.IsPlayerTeammate() == 0
;						If myTarget.IsInCombat() == 0
; ;							debug.trace(self + "OnEffectStart() will call Say(" + TopicToSay + ")")
;							WICastNonHostileTimer.SetValue(GameDaysPassed.GetValue() + 0.01)
;							myTarget.Say(TopicToSay)
;						ElseIf CombatTopicToSay != None
;							WICastNonHostileTimer.SetValue(GameDaysPassed.GetValue() + 0.01)
;							myTarget.Say(CombatTopicToSay)
;						EndIf
;					EndIf
;				ElseIf myTarget.IsPlayerTeammate() == 1
; ;					debug.trace(self + "OnEffectStart() will call Say(" + TopicToSay + ")")
;					WICastNonHostileTimer.SetValue(GameDaysPassed.GetValue() + 0.01)
;					myTarget.Say(TopicToSay)
;				EndIf
;			EndIf
;		EndIf
;	EndIf

EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
Actor myTarget = akTarget as Actor
	myTarget.RemoveFromFaction(CharmFaction)
	if bMakePlayerTeammate
		myTarget.SetPlayerTeammate(false, false)
	endif
EndEvent


