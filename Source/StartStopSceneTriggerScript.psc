Scriptname StartStopSceneTriggerScript extends ObjectReference Const
{A trigger which will start or stop a scene on actor enter or exit.}

scene property sceneToStartOnEnter auto const
{Okay to leave blank - we'll just skip it if so}
scene property sceneToStartOnExit auto const
{Okay to leave blank - we'll just skip it if so}
scene property sceneToStopOnEnter auto const
{Okay to leave blank - we'll just skip it if so}
scene property sceneToStopOnExit auto const
{Okay to leave blank - we'll just skip it if so}
quest property questToCheck auto const
{only used if a pre-req stage is specified.}
int property preRequisiteStage auto const
{if specified, scenes will only be started/stopped if this stage is done}
bool property bDisableAfterEnter = TRUE auto const
bool property bDisableAfterExit = TRUE auto const

EVENT OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == game.getPlayer() && (sceneToStopOnExit || sceneToStartOnExit)    	
		bool bDoWork = FALSE
		if preRequisiteStage
			; a pre-req stage is set!
			if questToCheck.getStageDone(preRequisiteStage)
				bDoWork = TRUE
			endif
		else
			;no stage was setF
			bDoWork = TRUE
		endif

		if bDoWork
			if sceneToStopOnExit
				sceneToStopOnExit.stop()
			endif
			if sceneToStartOnExit
				sceneToStartOnExit.start()
			endif
			if bDisableAfterExit
				self.disable()
			endif
		endif
	endif
EndEvent

EVENT OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == game.getPlayer() && (sceneToStoponEnter || sceneToStartonEnter)
    	bool bDoWork = FALSE
		if preRequisiteStage
			; a pre-req stage is set!
			if questToCheck.getStageDone(preRequisiteStage)
				bDoWork = TRUE
			endif
		else
			;no stage was set
			bDoWork = TRUE
		endif

		if bDoWork
			if sceneToStoponEnter
				sceneToStoponEnter.stop()
			endif
			if sceneToStartonEnter
				sceneToStartonEnter.start()
			endif
			if bDisableAfterEnter
				self.disable()
			endif
		endif
	endif
EndEvent