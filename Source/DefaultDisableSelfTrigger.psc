ScriptName DefaultDisableSelfTrigger extends ObjectReference
{Default script that simply activates itself once when player enters trigger, can optionally triggered by specific refs, aliases, or factions.}

import CommonArrayFunctions

bool property PlayerOnly = TRUE auto Const
{Only Player Triggers?  Default: TRUE
Must be FALSE if you put anything in the arrays.}

int property PlayerMinLevel auto Const
{Optional: If set, player must be >= PlayerMinLevel to activate this}

ObjectReference[] Property TriggeredByReferences Auto Const
{OPTIONAL: Activation will occur if Triggered by any of these references.
If ALL arrays are empty then stage is set if Triggered by anybody.}

ReferenceAlias[] Property TriggeredByAliases Auto Const
{OPTIONAL: Activation will occur if Triggered by any of these aliases.
If ALL arrays are empty then stage is set if Triggered by anybody.}

Faction[] Property TriggeredByFactions Auto Const
{OPTIONAL: Activation will occur if Triggered by any of these factions.
If ALL arrays are empty then stage is set if Triggered by anybody.}


;************************************

auto STATE Waiting
	Event onTriggerEnter(objectReference triggerRef)
		if PlayerOnly
			if triggerRef == Game.GetPlayer()
				if(PlayerMinLevel == 0 || game.getPlayer().getLevel() >= PlayerMinLevel)
						; We only care about the player, it is the player, and he either matches the min level or there isn't one. ACTIVATE!
					GoToState("DoneWaiting")
					activate(self)
				endif
			endif
		else
			if TriggeredByReferences.Length > 0 || TriggeredByAliases.Length > 0 || TriggeredByFactions.Length > 0
					; We don't care about the player, and the arrays are empty.  Doesn't matter what triggers us, ACTIVATE!
				GoToState("DoneWaiting")
				activate(self)
			else
				if CheckObjectReferenceAgainstArray(triggerRef, TriggeredByReferences) || CheckObjectReferenceAgainstReferenceAliasArray(triggerRef, TriggeredByAliases) || CheckActorAgainstFactionArray(triggerRef as Actor, TriggeredByFactions)
					if(PlayerMinLevel == 0 || game.getPlayer().getLevel() >= PlayerMinLevel)
							; We only care about the arrays, something in them triggered us, and the player matches the min level or there isn't one. ACTIVATE!
						GoToState("DoneWaiting")
						activate(self)
					endif
				endif
			endif
		endif


	endEvent
endSTATE

;************************************

STATE DoneWaiting
	;do nothing
	Event onBeginState(string asOldState)
		Disable()
	endEvent
endSTATE

