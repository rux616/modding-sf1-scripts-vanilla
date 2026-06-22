Scriptname SFBGS00D:SFFL_MS03_Support_QuestScript extends Quest

Group NPCProperties
    ReferenceAlias Property Yura Auto Const Mandatory
    ReferenceAlias Property Roman Auto Const Mandatory
    ReferenceAlias Property Atka Auto Const Mandatory
    ReferenceAlias Property Milli Auto Const Mandatory
    RefCollectionAlias Property Freelancers Auto Const Mandatory
EndGroup

Group PostQuestHandlingProperties
    LocationAlias Property Location_AtkasHouse Auto Const Mandatory
    LocationAlias Property Location_Anchorpoint Auto Const Mandatory
    Location Property SMuphrid_PMuphridIV_Surface Auto Const Mandatory
    Faction Property SFFL_CrimeFactionAnchorpoint Auto Const Mandatory
    ReferenceAlias Property PlayerShip Auto Const Mandatory
    ReferenceAlias Property Yura_AHMoveMarker Auto Const Mandatory
    ReferenceAlias Property Yura_APMoveMarker Auto Const Mandatory
    ReferenceAlias Property Roman_APMoveMarker Auto Const Mandatory
    ReferenceAlias Property Roman_MGMoveMarker Auto Const Mandatory
    GlobalVariable Property SFFL_MS03_PQ_AHChance Auto Const Mandatory
    GlobalVariable Property SFFL_MS03_PQ_APChance Auto Const Mandatory
    GlobalVariable Property SFFL_MS03_PQ_APFurnitureChoice Auto Const Mandatory
    GlobalVariable Property SFFL_MS03_YuraAndRomanTogether Auto Const Mandatory
    GlobalVariable Property SFFL_MS03_StartedPQ Auto Const Mandatory
EndGroup

Group HostileProperties
    LocationAlias Property Location_MaintenanceGarage Auto Const Mandatory
    RefCollectionAlias Property Hostiles Auto Const Mandatory
    Faction Property PlayerEnemyFaction Auto Const Mandatory
    ActorValue Property Aggression Auto Const Mandatory
    GlobalVariable Property SFFL_MS03_HostileSetup_AH Auto Const Mandatory
    GlobalVariable Property SFFL_MS03_HostileSetup_APorGarage Auto Const Mandatory
    Quest Property SFFL_MS03 Auto Const Mandatory
    Int Property iMS03FailStage = 4000 Auto Const Mandatory
    Int Property iMS03OpenedDoorStage = 3010 Auto Const Mandatory
EndGroup

Function PostQuestSetup()
    RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
    RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
EndFunction

; Check for the player ship leaving the area to officially start post quest setups.
Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
    Debug.Trace(Self + "SFFL_MS03: OnLocationChanged Event fired: akSender: " + akSender + " New location: " + akNewLoc + "Old location: " + akOldLoc)
    If akSender == PlayerShip && SFFL_MS03_StartedPQ.GetValue() == 0
        If (akOldLoc == SMuphrid_PMuphridIV_Surface || SMuphrid_PMuphridIV_Surface.IsChild(akOldLoc))&& SFFL_MS03_YuraAndRomanTogether.GetValue() >= 0
            SFFL_MS03_StartedPQ.SetValue(1)
        EndIf
    EndIf
EndEvent

; As the player moves between locations, roll chances for Yura and/or Roman to appear.
Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)

    Debug.Trace(Self + "SFFL_MS03: OnLocationChanged Event fired: akSender: " + akSender + " New location: " + akNewLoc + "Old location: " + akOldLoc)
    If akSender == Game.GetPlayer()

        If SFFL_MS03_StartedPQ.GetValue() == 0
            If (akOldLoc == SMuphrid_PMuphridIV_Surface || SMuphrid_PMuphridIV_Surface.IsChild(akOldLoc))&& SFFL_MS03_YuraAndRomanTogether.GetValue() >= 0
                SFFL_MS03_StartedPQ.SetValue(1)
            EndIf
        Else
            Debug.Trace(Self + "SFFL_MS03: OnLocationChanged: akSender is Player and Post Quest has started.")
            If akNewLoc == Location_AtkasHouse.GetLocation() && Game.GetDieRollSuccess(SFFL_MS03_PQ_AHChance.GetValueInt())
                Debug.Trace(Self + "SFFL_MS03: New location is Atka's House and Game.GetDieRollSuccess passed.")

                Actor YuraRef = Yura.GetActorRef()
                Actor RomanRef = Roman.GetActorRef()

                YuraRef.MoveTo(Yura_AHMoveMarker.GetRef())

                If SFFL_MS03_HostileSetup_AH.GetValue() == 0
                    RomanRef.MoveTo(Roman_MGMoveMarker.GetRef())
                Else
                    RomanRef.MoveTo(Yura_AHMoveMarker.GetRef())
                EndIf

                If YuraRef.IsDisabled()
                    YuraRef.Enable()
                EndIf

                YuraRef.RemoveFromFaction(SFFL_CrimeFactionAnchorpoint)
                YuraRef.EvaluatePackage()

                If RomanRef.IsDisabled()
                    RomanRef.Enable()
                EndIf

                RomanRef.RemoveFromFaction(SFFL_CrimeFactionAnchorpoint)
                RomanRef.EvaluatePackage()

            ElseIf akNewLoc == Location_Anchorpoint.GetLocation() && SFFL_MS03_HostileSetup_AH.GetValue() == 0

                If Game.GetDieRollSuccess(SFFL_MS03_PQ_APChance.GetValueInt())
                    Debug.Trace(Self + "SFFL_MS03: GetDieRollSuccess passed. Move Yura and Roman to Anchorpoint.")
                    ; If the player got Yura and Roman together, roll to see which set of furnitures they would appear in.
                    If SFFL_MS03_YuraAndRomanTogether.GetValue() == 1
                        SFFL_MS03_PQ_APFurnitureChoice.SetValueInt(Utility.RandomInt(1, 2))
                    EndIf

                    Actor YuraRef = Yura.GetActorRef()   
                    YuraRef.AddToFaction(SFFL_CrimeFactionAnchorpoint)
                    YuraRef.MoveTo(Yura_APMoveMarker.GetRef())
                    YuraRef.EvaluatePackage()

                    Actor RomanRef = Roman.GetActorRef()
                    RomanRef.AddToFaction(SFFL_CrimeFactionAnchorpoint)
                    RomanRef.MoveTo(Roman_APMoveMarker.GetRef())
                    RomanRef.EvaluatePackage()
                    
                EndIf
            
            EndIf

        EndIf

    EndIf
       
EndEvent

Function FailQuestSetup()
    Debug.Trace(Self + "SFFL_MS03: FailQuestSetup function called.")
    SFFL_MS03.SetStage(iMS03FailStage)
    If SFFL_MS03.GetStageDone(iMS03OpenedDoorStage)
        SetHostileAH()
    Else
        SetHostileAPorGarage()
        Yura.GetRef().Disable()
        Atka.GetRef().Disable()
    EndIf
EndFunction

Function SetHostileAH()
    Debug.Trace(Self + "SFFL_MS03: SetHostileAH function called.")
    SFFL_MS03_HostileSetup_AH.SetValue(1)
    Hostiles.AddRef(Atka.GetRef())
    Hostiles.AddRef(Milli.GetRef())
    Hostiles.AddRef(Yura.GetRef())
    Hostiles.AddRefCollection(Freelancers)
    UpdateHostiles()
EndFunction

Function SetHostileAPorGarage()
    Debug.Trace(Self + "SFFL_MS03: SetHostileAPorGarage function called.")
    SFFL_MS03_HostileSetup_APorGarage.SetValue(1)
    Hostiles.AddRef(Yura.GetRef())
    Hostiles.AddRefCollection(Freelancers)
    UpdateHostiles()
EndFunction

Function UpdateHostiles()
    Debug.Trace(Self + "SFFL_MS03: UpdateHostiles function called.")
    Int i = 0
    While i < Hostiles.GetCount()
        Actor ChosenActor = Hostiles.GetAt(i) as Actor
        If ChosenActor.IsInLocation(Location_Anchorpoint.GetLocation())
            ChosenActor.Disable()
        EndIf
        ChosenActor.AddToFaction(PlayerEnemyFaction)
        ChosenActor.SetValue(Aggression, 2)
        i += 1
    EndWhile
EndFunction