Scriptname POI027_ProbeContainerScript extends ObjectReference

Keyword property POI027_ProbeFireEffectsKeyword auto const
Keyword property POI027_WaterEffectsKeyword auto const
Keyword property POI027_CreaturesKeyword auto const
Keyword property LinkCustom01 auto const
Faction property POI027_AngryCreatureFaction auto const
ActorValue property Aggression auto const
ActorValue property POI027_ProbeEngineActive auto const

Event OnLoad()
    AddInventoryEventFilter(NONE)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
    ; probe fire effects
    ObjectReference[] probeFireEffects = GetRefsLinkedToMe(POI027_ProbeFireEffectsKeyword)

    int iProbeFireEffect = 0
    while(iProbeFireEffect < probeFireEffects.length)
        ObjectReference probeFireEffect = probeFireEffects[iProbeFireEffect]

        probeFireEffect.Disable()

        iProbeFireEffect += 1
    endWhile

    ; water effects
    ObjectReference[] waterEffects = GetRefsLinkedToMe(POI027_WaterEffectsKeyword)

    int iWaterEffect = 0
    while(iWaterEffect < waterEffects.length)
        ObjectReference waterEffect = waterEffects[iWaterEffect]

        waterEffect.Disable()

        iWaterEffect += 1
    endWhile

    ; creatures
    ObjectReference[] creatures = GetRefsLinkedToMe(POI027_CreaturesKeyword)

    Actor player = Game.GetPlayer()

    int iCreature = 0
    while(iCreature < creatures.length)
        Actor creature = creatures[iCreature] as Actor

        creature.SetFactionOwner(POI027_AngryCreatureFaction)

        creature.SetLinkedRef(player, LinkCustom01)

        creature.SetValue(POI027_ProbeEngineActive, 0)
        creature.SetValue(Aggression, 2)
		creature.EvaluatePackage()

        iCreature += 1
    endWhile
EndEvent