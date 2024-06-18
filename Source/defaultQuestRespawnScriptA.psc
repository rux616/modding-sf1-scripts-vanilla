Scriptname defaultQuestRespawnScriptA extends defaultQuestRespawnScript  Default
{Simple script to respawn Aliases that have the DefaultAliasRespawnScriptA on them.}

import Utility
import debug

; call this when you want to try to respawn
function TryToRespawn(ReferenceAlias aliasToRespawn)
	Debug.Trace("Catch")
 	DefaultScriptFunctions.Trace(self, "Respawn called by " + aliasToRespawn, ShowTraces)
	if ( startStage == 0 || (startStage > 0 && GetStageDone(startStage)) ) && ( doneStage == 0 || ( doneStage > 0 && !GetStageDone(doneStage) ) ) && ( respawnPool == 0 || (respawnPool > 0 && respawnCount < respawnPool ) )
		respawnCount = respawnCount + 1
		; wait for respawn time
 		DefaultScriptFunctions.Trace(self, "Waiting to respawn...", ShowTraces)
		Wait( RandomInt(respawnTimeMin, respawnTimeMax) )
 		DefaultScriptFunctions.Trace(self, "Finding a respawn spot", ShowTraces)
		if (aliasToRespawn as defaultAliasRespawnScriptA).RespawningOn
			Respawn(aliasToRespawn)
		else
 			DefaultScriptFunctions.Trace(self, "Didn't respawn " + aliasToRespawn + " - current actor no longer set to respawn", ShowTraces)
		endif
	endif
endFunction