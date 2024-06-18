Scriptname COM_Quest_Andreja_Q01_TomisarScript extends ReferenceAlias

ReferenceAlias Property Alias_Andreja Auto Const

Quest Property COM_Quest_Andreja_Q01 Auto Const




Event OnLoad()
	RegisterForHitEvent(Self, Alias_Andreja.GetRef())
	Debug.Trace("COM_Quest_Andreja_Q01: Tomisar Registered for Hit Event")
EndEvent



Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

; if we're being hit by Andreja, she gets credit for the kill

if AkAggressor == Alias_Andreja.GetActorRef()
	(akTarget as actor).Kill()
	COM_Quest_Andreja_Q01.SetStage(395)
else
	RegisterForHitEvent(Self, Alias_Andreja.GetRef())
endif

EndEvent

Event OnDeath(ObjectReference AkKiller)

Debug.Trace("COM_Quest_Andreja_Q01: OnDeath Registered")

;Andreja didn't get credit, the player does
	if COM_Quest_Andreja_Q01.GetStageDone(395)==0

		Debug.Trace("COM_Quest_Andreja_Q01: OnDying: S	tage 395 Not Set")
		
		;if player didn't agree to do the kiling via scene, set appropriate stage

			Debug.Trace("COM_Quest_Andreja_Q01: OnDeath: Player is Killer")
			if COM_Quest_Andreja_Q01.GetStageDone(375)==0
				COM_Quest_Andreja_Q01.SetStage(399)
			endif

	endif

;set final stage wrapping up Tomisar's death for subsequent scenes
	COM_Quest_Andreja_Q01.SetStage(400)
	Debug.Trace("COM_Quest_Andreja_Q01: OnDying: Stage 400 Set")

EndEvent


