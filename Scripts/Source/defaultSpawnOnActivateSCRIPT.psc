Scriptname defaultSpawnOnActivateSCRIPT extends ObjectReference Hidden

ACTORBASE PROPERTY ActorToSpawn AUTO

OBJECTREFERENCE PROPERTY SpawnAtReference AUTO

BOOL PROPERTY PlayerActivateOnly AUTO

BOOL PROPERTY DoOnce AUTO


BOOL done=FALSE

EVENT onACTIVATE(OBJECTREFERENCE akActionRef)

	IF(!done)

		; //Check to see if we're player activate only
		IF(PlayerActivateOnly)

			IF(akActionRef == game.getPlayer())
				SpawnAtReference.placeAtMe(ActorToSpawn)

			ENDIF

		ELSEIF(!PlayerActivateOnly)
			SpawnAtReference.placeAtMe(ActorToSpawn)

		ENDIF

		; //if we're DoOnce set it up so we only go round once
		IF(DoOnce)
			done = TRUE
		ENDIF

	ENDIF

ENDEVENT