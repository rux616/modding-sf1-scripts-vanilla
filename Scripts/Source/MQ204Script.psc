Scriptname MQ204Script extends Quest

InputEnableLayer Property MQ204EnableLayer Auto Hidden

Faction Property CurrentCompanionFaction Mandatory Const Auto
Message Property MQ204MedStimMSG Mandatory Const Auto
ActorValue Property Health Mandatory Const Auto
Int NumRescueAtEyeTotal=4
Int NumRescueAtEyeCount
Int Property RescuedEyeStage=390 Const Auto
Int NumRescueAtLodgeTotal=4
Int NumRescueAtLodgeCount
Int Property RescuedLodgeStage=470 Const Auto
Location Property StarStationTheEyeLocation Mandatory Const Auto
Faction Property AvailableCompanionFaction Mandatory Const Auto
RefCollectionAlias Property MQ00_ArtifactsHolder Mandatory Const Auto
Keyword Property AnimFaceArchetypeInPain Mandatory Const Auto
ReferenceAlias Property TheHunter Mandatory Const Auto
Scene Property MQ204A_013_HunterSceneRepeat Mandatory Const Auto
Explosion Property LC165_ScriptedTeleportSourceExplosion Mandatory Const Auto
ObjectReference Property EyeMarker Mandatory Const Auto
ObjectReference Property LodgeStartMarker Mandatory Const Auto
Spell Property AbStarbornTeleport Mandatory Const Auto
ReferenceAlias Property MQ00_CompanionWhoDies Mandatory Const Auto
ReferenceAlias Property Andreja Mandatory Const Auto
ReferenceAlias Property Barrett Mandatory Const Auto
ReferenceAlias Property SamCoe Mandatory Const Auto
ReferenceAlias Property SarahMorgan Mandatory Const Auto
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale Mandatory Const Auto
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToMale Mandatory Const Auto
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_MaleReactsToFemale Mandatory Const Auto
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_FemaleReactsToMale Mandatory Const Auto
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToFemale Mandatory Const Auto
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale Mandatory Const Auto
Keyword Property MQ204A_030_MaleVictim Mandatory Const Auto
Keyword Property MQ204A_030_FemaleVictim Mandatory Const Auto

Event OnQuestInit()
    SetStage(10)
EndEvent

Function SetDeathFurnitureKeywords(Actor akVictim, Actor akSurvivor, ObjectReference akFurniture)
    Actor AndrejaREF = Andreja.GetActorRef()
    Actor BarrettREF = Barrett.GetActorRef()
    Actor SamCoeREF = SamCoe.GetActorRef()
    Actor SarahMorganREF = SarahMorgan.GetActorRef()

    ;female victim
    If (akVictim == SarahMorganREF) || (akVictim==AndrejaREF)
        ;female survivor
        If (akSurvivor == SarahMorganREF) || (akSurvivor==AndrejaREF)
            akVictim.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale)
            akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale)
        ;male survivor
        Else
            akVictim.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToMale)
            akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_MaleReactsToFemale)
        EndIf
    ;male victim
    Else
        ;female survivor
        If (akSurvivor == SarahMorganREF) || (akSurvivor==AndrejaREF)
            akVictim.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToFemale)
            akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_FemaleReactsToMale)
        ;male survivor
        Else
            akVictim.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale)
            akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale)
        EndIf
    EndIf
EndFunction

;Actor could either be at Eye or at Lodge, so check which
Function RescuedActor(Actor AkActorREF)
    If akActorREF.IsInLocation(StarStationTheEyeLocation)
        CheckEyeActors()
    Else
        CheckLodgeActors()
    EndIf
    If AkActorREF != MQ00_CompanionWhoDies.GetActorRef()
        akActorRef.SetGhost(False)
    EndIf
    akActorRef.SetActivateTextOverride(None)
EndFunction

;player helps someone on the Eye, check if they've found everyone
Function CheckEyeActors()
    NumRescueAtEyeCount+=1
    If NumRescueAtEyeCount == NumRescueAtEyeTotal
        SetStage(RescuedEyeStage)
    EndIf
EndFunction

;player helps someone at the Lodge, check if they've found everyone
Function CheckLodgeActors()
    NumRescueAtLodgeCount+=1
    If NumRescueAtLodgeCount == NumRescueAtLodgeTotal
        SetStage(RescuedLodgeStage)
    EndIf
EndFunction

;common function for an actor in the Lodge or Eye that has been attacked by the Hunter
Function SetActorHunterAttacked(Actor akActorRef, bool bMoveToEye=True)
    akActorRef.SetActivateTextOverride(MQ204MedStimMSG)
    akActorRef.SetGhost()
    akActorRef.ChangeAnimFaceArchetype(AnimFaceArchetypeInPain)
EndFunction

Function MQ204MoveActor(Actor akActorREF, ObjectReference akMoveMarker=None)
    If akActorREF.IsInLocation(akMoveMarker.GetCurrentLocation())
        ;do nothing if we're already there
    ElseIf AkActorREF.IsDead()
        ;do nothing if the actor is dead
    Else
        akActorREF.Disable()
        akActorREF.Moveto(akMoveMarker)
        akActorREF.EvaluatePackage()
        akActorREF.Enable()
    EndIf
EndFunction

Function SetActorInBleedOut(Actor akActorRef)
    akActorREF.SetNoBleedoutRecovery(True)
    akActorREF.AllowBleedoutDialogue(True)
    AkActorREF.DamageValue(Health, 9999)
EndFunction

Function SetActorRecovered(Actor akActorRef)
    akActorREF.SetNoBleedoutRecovery(False)
    akActorREF.AllowBleedoutDialogue(False)
    AkActorREF.RestoreValue(Health, 9999)
EndFunction

Function PlayerReceivesArtifacts()
    ;hand over all Artifacts to the player

    Actor PlayerREF = Game.GetPlayer()
    int currentElement = 0
    while (currentElement < MQ00_ArtifactsHolder.GetCount())
        PlayerREF.additem(MQ00_ArtifactsHolder.GetAt(currentElement))
        currentElement += 1
    EndWhile
    
EndFunction

Function HunterWarps(ObjectReference akMarkerREF)
    ;move hunter to marker then call scene (unless the hunter is already close to the player)
    Actor HunterREF = TheHunter.GetActorRef()
    Actor PlayerREF = Game.GetPlayer()
    If HunterREF.GetDistance(PlayerREF) > 5   
        akMarkerREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
        HunterREF.moveto(akMarkerREF)
        ABStarbornTeleport.Cast(HunterREF, HunterREF)
        MQ204A_013_HunterSceneRepeat.Start()
    EndIf
EndFunction

Function HunterWarpEnds()
    Actor HunterREF = TheHunter.GetActorRef()
    Actor PlayerREF = Game.GetPlayer()
    HunterREF.EvaluatePackage()
    HunterREF.StartCombat(PlayerREF, True)
EndFunction