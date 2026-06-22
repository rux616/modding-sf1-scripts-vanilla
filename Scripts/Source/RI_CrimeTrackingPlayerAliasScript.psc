Scriptname RI_CrimeTrackingPlayerAliasScript extends ReferenceAlias

LocationAlias Property RadiantLocation Auto Const Mandatory
Int Property iStartTrackingStage Auto Const Mandatory
Int Property iStopTrackingStage Auto Const Mandatory
Int Property iPreReqTrackingStage Auto Const Mandatory
Keyword Property ActorTypeHuman Auto Const Mandatory
Perk Property RI_BountyTrackingPerk Auto Const Mandatory

Event OnKill(ObjectReference akVictim)
Debug.Trace(Self + "RI_CRIME: OnKill Event fired. akVictime = " + akVictim)
    Quest MyQuest = GetOwningQuest()

    If MyQuest.GetStageDone(iStartTrackingStage)
    Debug.Trace(Self + "RI_CRIME: Tracking stage is DONE.")
        If akVictim.GetCurrentLocation() == RadiantLocation.GetLocation() && akVictim.HasKeyword(ActorTypeHuman)
            Debug.Trace(Self + "RI_CRIME: Player passed OnKill event in location. Increment iBodyCount + 1")
            (MyQuest as RI_CrimeTrackingQuestScript).iBodyCount += 1
        EndIf
    EndIf

EndEvent

Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, int aeCrimeType)
    
    Quest MyQuest = GetOwningQuest()

    If MyQuest.GetStageDone(iStartTrackingStage)
        If akLocation == RadiantLocation.GetLocation()
            (MyQuest as RI_CrimeTrackingQuestScript).iTimesArrested += 1

            If aeCrimeType <= 1
                Debug.Trace(Self + "RI_CRIME: Player passed OnPlayerArrested event in location. Increment iTheftArrest + 1")
                (MyQuest as RI_CrimeTrackingQuestScript).iTheftArrest += 1
            ElseIf aeCrimeType == 3
                Debug.Trace(Self + "RI_CRIME: Player passed OnPlayerArrested event in location. Increment iAttemptedMurderArrest + 1")
                (MyQuest as RI_CrimeTrackingQuestScript).iAttemptedMurderArrest += 1
            ElseIf aeCrimeType == 4
                Debug.Trace(Self + "RI_CRIME: Player passed OnPlayerArrested event in location. Increment iMurderArrest + 1")
                (MyQuest as RI_CrimeTrackingQuestScript).iMurderArrest += 1
            EndIf

        EndIf
    EndIf

EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
Debug.Trace(Self + "RI_CRIME: OnLocationChanged Event fired. Old Location: " + akOldLoc + " New Location: " + akNewLoc)

    Location LocationToCheck = RadiantLocation.GetLocation()
    Actor PlayerRef = Game.GetPlayer()
    Quest MyQuest = GetOwningQuest()

    If MyQuest.GetStageDone(iPreReqTrackingStage)
    Debug.Trace(Self + "RI_CRIME: Passed GetStageDone Check for stage " + iStartTrackingStage)
        If akNewLoc == LocationToCheck
        Debug.Trace(Self + "RI_CRIME: Passed NEW LocationToCheck which is " + LocationToCheck + " so add perk.")
            Game.GetPlayer().AddPerk(RI_BountyTrackingPerk)
        EndIf
        If akOldLoc == LocationToCheck
        Debug.Trace(Self + "RI_CRIME: Passed OLD LocationToCheck which is " + LocationToCheck + " so remove perk.")
            PlayerRef.RemovePerk(RI_BountyTrackingPerk)
        EndIf

    EndIf

EndEvent