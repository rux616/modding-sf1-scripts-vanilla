Scriptname FFLodge04QuestScript extends Quest

ObjectReference Property PlaqueRef_Sam_Bar Auto Const

ObjectReference Property PlaqueRef_Andreja_Bar Auto Const

ObjectReference Property PlaqueRef_Barrett_Bar Auto Const

ObjectReference Property PlaqueRef_Sam_Garden Auto Const

ObjectReference Property PlaqueRef_Andreja_Garden Auto Const

ObjectReference Property PlaqueRef_Barrett_Garden Auto Const

ObjectReference Property PlaqueRef_Sam_Center Auto Const

ObjectReference Property PlaqueRef_Andreja_Center Auto Const

ObjectReference Property PlaqueRef_Barrett_Center Auto Const

ReferenceAlias Property DeadCompanion Auto Const


Function EnablePlaque()

	Debug.Trace("FFLodge04 Function Started")

	if DeadCompanion.GetActorReference() == Andreja.GetActorReference()

		Debug.Trace("FFLodge04 - Andreja Died")
		if GetStageDone(10)
			PlaqueRef_Andreja_Center.Enable()
			Debug.Trace("FFLodge04 - Andreja - Stage 10 Result")
		elseif GetStageDone(20)
			PlaqueRef_Andreja_Garden.Enable()
			Debug.Trace("FFLodge04 - Andreja - Stage 20 Result")
		elseif GetStageDone(30)
			PlaqueRef_Andreja_Bar.Enable()
			Debug.Trace("FFLodge04 - Andreja - Stage 30 Result")
		else
			PlaqueRef_Andreja_Center.Enable()
			Debug.Trace("FFLodge04 - Andreja - Stage 40 Result")
		endif
	elseif DeadCompanion.GetActorReference() == Barrett.GetActorReference()
		if GetStageDone(10)
			PlaqueRef_Barrett_Center.Enable()
		elseif GetStageDone(20)
			PlaqueRef_Barrett_Garden.Enable()
		elseif GetStageDone(30)
			PlaqueRef_Barrett_Bar.Enable()
		else
			PlaqueRef_Barrett_Garden.Enable()
		endif
	elseif DeadCompanion.GetActorReference() == Sam.GetActorReference()
		if GetStageDone(10)
			PlaqueRef_Sam_Center.Enable()
		elseif GetStageDone(20)
			PlaqueRef_Sam_Garden.Enable()
		elseif GetStageDone(30)
			PlaqueRef_Sam_Bar.Enable()
		else
			PlaqueRef_Sam_Bar.Enable()
		endif
	endif
	SetStage(200)



EndFunction
ReferenceAlias Property Andreja Auto Const

ReferenceAlias Property Barrett Auto Const

ReferenceAlias Property Sam Auto Const
