Scriptname SQ_CaptiveScript extends Quest
{sends the CaptiveSetFree event for DefaultCaptiveXXX scripts to respond to.}

Group Autofill
    AffinityEvent Property SQ_Captive_Freed  Mandatory Const Auto
	AffinityEvent Property SQ_Wounded_Actor_Healed Mandatory Const Auto
	SQ_FollowersScript Property SQ_Followers Mandatory Const Auto
	ReferenceAlias Property PrimaryActor Mandatory Const Auto
endGroup

CustomEvent CaptiveSetFree
CustomEvent WoundedActorHealed

Function SendCaptiveSetFree(Actor captive, bool playerIsLiberator = true, bool showInventory = false)

	var[] akArgs = new var[3]
	akArgs[0] = captive
	akArgs[1] = playerIsLiberator
	akArgs[2] = showInventory


	Trace(self, "SendCaptiveSetFree() captive: " + captive + ", playerIsLiberator: " + playerIsLiberator + ", showInventory: " + showInventory)
	SendCustomEvent("CaptiveSetFree", akArgs)

	SQ_Captive_Freed.Send(akTarget = captive)
EndFunction

Function SendWoundedActorHealed(Actor woundedActor, bool playerIsHealer = true)

	var[] akArgs = new var[3]
	akArgs[0] = woundedActor
	akArgs[1] = playerIsHealer

	Trace(self, "SendWoundedActorHealed() woundedActor: " + woundedActor + ", playerIsHealer: " + playerIsHealer)
	SendCustomEvent("WoundedActorHealed", akArgs)

	SQ_Wounded_Actor_Healed.Send(akTarget = woundedActor)
EndFunction

; Used by the SQ_Captive Quest's Follower dialogue for telling the freed captive to wait.
Function CaptiveFollowerWaitSceneEnded()
	Actor primaryActorRef = PrimaryActor.GetActorReference()
	
	Trace(self, "WaitSceneEnded()... calling SQ_Followers.CommandWait() primaryActorRef: " + primaryActorRef)
	SQ_Followers.CommandWait(primaryActorRef)
EndFunction

; Used by the SQ_Captive Quest's Follower dialogue for telling the freed captive to resume following.
Function CaptiveFollowerFollowSceneEnded()
	Actor primaryActorRef = PrimaryActor.GetActorReference()

	Trace(self, "FollowSceneEnded()... calling SQ_Followers.CommandFollow() primaryActorRef: " + primaryActorRef)
	SQ_Followers.CommandFollow(primaryActorRef)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Captive",  string SubLogName = "SQ_CaptiveScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Captive",  string SubLogName = "SQ_CaptiveScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction