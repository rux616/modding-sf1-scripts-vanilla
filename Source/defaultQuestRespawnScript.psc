Scriptname defaultQuestRespawnScript extends Quest  Default Hidden
{Simple script to respawn Aliases that have the DefaultAliasRespawnScript on them.}

import Utility
import debug

Group Respawn_Markers
	ObjectReference[] Property RespawnMarkers Auto Const
	{array of respawn markers - actors will randomly respawn at these out of player's LOS}

	ObjectReference Property RespawnMarkerFailsafe Auto Const
	{this is where I will respawn if player has LOS
	on other respawn points}
endGroup

Group Quest_Stages
	int Property StartStage = 0  Auto Const
	{Quest stage that needs to be set for respawning
	to start}

	int Property DoneStage = 0  Auto Const
	{Respawning will stop if this stage is set}
endGroup

Group Respawning_Values
	int Property RespawnTimeMin = 5 Auto
	{min time between death and respawn in seconds}

	int Property RespawnTimeMax = 10 Auto
	{max time between death and respawn in seconds}

	int Property RespawnPool = 0 Auto
	{how many NPCs can be respawned?
	0 = infinite
	}

	int Property MinRespawnDistance = 512 Auto Const
	{if the player is within this distance of a respawn point, don't use it
	}

endGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup


int Property respawnCount = 0 Auto Hidden
;how many NPCs have been respawned?


; this will always respawn (ignores all the checks and waits)
; (this is what TryToRespawn calls when ready to respawn)
function Respawn(ReferenceAlias aliasToRespawn)
	; respawn me and force me into my alias
	ObjectReference marker = GetRespawnMarker()
		DefaultScriptFunctions.Trace(self, "respawning at " + marker, ShowTraces)

	; only respawn if current alias is actually dead
	if aliasToRespawn.GetActorRef().IsDead()
		aliasToRespawn.ForceRefTo(marker.PlaceAtMe( aliasToRespawn.GetActorRef().GetBaseObject() ) )
			DefaultScriptFunctions.Trace(self, "Respawn done", ShowTraces)
	else
			DefaultScriptFunctions.Trace(self, "Didn't respawn - current actor isn't dead!", ShowTraces)
	endif
endFunction

function RespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
	; respawn new refToRespawn and force me into my alias collection
	ObjectReference marker = GetRespawnMarker()
		DefaultScriptFunctions.Trace(self, "respawning at " + marker, ShowTraces)

	; only respawn if specified actor is actually dead
	if actorToRespawn.IsDead()
		; remove dead actor from collection
		collectionToRespawn.RemoveRef(actorToRespawn)
		; create new one and add to collection
		collectionToRespawn.AddRef(marker.PlaceAtMe( actorToRespawn.GetBaseObject() ) )
			DefaultScriptFunctions.Trace(self, "Respawn done", ShowTraces)
	else
			DefaultScriptFunctions.Trace(self, "Didn't respawn - current actor isn't dead!", ShowTraces)
	endif
endFunction

; call this when you want to try to respawn
function TryToRespawn(ReferenceAlias aliasToRespawn)
	defaultAliasRespawnScript respawnAlias = aliasToRespawn as defaultAliasRespawnScript
	if respawnAlias == NONE
		Game.Warning(self + " ERROR: aliasToRespawn " + aliasToRespawn + " is not a defaultAliasRespawnScript")
		return
	endif
 	DefaultScriptFunctions.Trace(self, "TryToRespawn called by alias=" + respawnAlias, ShowTraces)
 	if ReadyToRespawn()
		if respawnAlias.RespawningOn
			Respawn(respawnAlias)
		else
 			DefaultScriptFunctions.Trace(self, "Didn't respawn " + respawnAlias + " - current actor no longer set to respawn", ShowTraces)
		endif
	endif
endFunction

; call this when you want to try to respawn
function TryToRespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
	defaultCollectionAliasRespawnScript respawnCollection = collectionToRespawn as defaultCollectionAliasRespawnScript
	if respawnCollection == NONE
		Game.Warning(self + " ERROR: collectionToRespawn " + collectionToRespawn + " is not a defaultCollectionAliasRespawnScript")
		return
	elseif actorToRespawn == NONE
	 	DefaultScriptFunctions.Trace(self, "TryToRespawnCollection called with no actorToRespawn - doing nothing", ShowTraces)
	 	return
	endif
 	DefaultScriptFunctions.Trace(self, "TryToRespawnCollection called by collection=" + respawnCollection + ", actorToRespawn=" + actorToRespawn, ShowTraces)
 	if ReadyToRespawn()
		if respawnCollection.RespawningOn
			RespawnCollection(respawnCollection, actorToRespawn)
		else
 			DefaultScriptFunctions.Trace(self, "Didn't respawn " + respawnCollection + " - collection no longer set to respawn", ShowTraces)
		endif
	endif
endFunction

; internal utility function
; checks if respawn is valid
; if not, returns false
; if valid, increments respawn counter and waits random time before returning
bool function ReadyToRespawn()
	if ( startStage == 0 || (startStage > 0 && GetStageDone(startStage)) ) && ( doneStage == 0 || ( doneStage > 0 && !GetStageDone(doneStage) ) ) && ( respawnPool == 0 || (respawnPool > 0 && respawnCount < respawnPool ) )
		respawnCount = respawnCount + 1
		; wait for respawn time
 		DefaultScriptFunctions.Trace(self, "Waiting to respawn...", ShowTraces)
		Wait( RandomInt(respawnTimeMin, respawnTimeMax) )
 		return true
 	else
 		return false
 	endif
endFunction


ObjectReference function GetRespawnMarker()
	; totally unnecessary but nice randomization of which point to choose
	int tryIndex = RandomInt(0, RespawnMarkers.Length - 1)
	DefaultScriptFunctions.Trace(self, "rolling for respawn spot... " + tryIndex, ShowTraces)

	; find a spot the player can't see
	actor playerActor = Game.GetPlayer() as actor
	ObjectReference marker	; the marker we'll return to respawn at

	int loopCount = 0	; we'll use this to make sure we only loop through once
	while loopCount < RespawnMarkers.Length
		if playerActor.HasDetectionLOS(RespawnMarkers[tryIndex]) == False && playerActor.GetDistance(RespawnMarkers[tryIndex]) > minRespawnDistance
			; player doesn't have LOS on this marker, and is outside min distance - pick it
			return RespawnMarkers[tryIndex]
		else
			loopCount = loopCount + 1
			; increment index
			if tryIndex >= RespawnMarkers.Length - 1
				; we're at the end, start over
				tryIndex = 0
			else
				tryIndex = tryIndex + 1
			endif
		endif
	endWhile

	; we didn't find a marker so use the failsafe
	return RespawnMarkerFailsafe

endFunction

