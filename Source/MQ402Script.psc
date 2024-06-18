Scriptname MQ402Script extends Quest

Struct LodgeArtifacts
    Int ArtifactNumber
    ObjectReference PlacementMarker
    ReferenceAlias ArtifactRefAlias
EndStruct

LodgeArtifacts[] Property LodgeArtifactsArray Mandatory Const Auto
Quest Property StarbornTempleQuest Mandatory Const Auto
GlobalVariable Property MQ402LodgeActorsSkip Mandatory Const Auto
ReferenceAlias Property Andreja Mandatory Const Auto
ReferenceAlias Property Barrett Mandatory Const Auto
ReferenceAlias Property SamCoe Mandatory Const Auto
ReferenceAlias Property CoraCoe Mandatory Const Auto
Faction Property AvailableCompanionFaction Mandatory Const Auto
ObjectReference Property Lodge_RoomMarker_Library01 Mandatory Const Auto
Quest Property COM_Companion_Andreja Mandatory Const Auto

Function AddLodgeArtifacts(Actor akActorRef)
;give the player all the Artifacts that the Lodge collects during the Skip Main Quest path
    int currentElement = 0
    while (currentElement < LodgeArtifactsArray.Length)
        int CurrentArtifactNumber = LodgeArtifactsArray[currentElement].ArtifactNumber
        ObjectReference CurrentPlacementMarker = LodgeArtifactsArray[currentElement].PlacementMarker
        ReferenceAlias CurrentRefAlias = LodgeArtifactsArray[currentElement].ArtifactRefAlias

        ObjectReference ArtifactREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(CurrentArtifactNumber, CurrentPlacementMarker)
        ArtifactREF.Enable()
        akActorRef.AddItem(ArtifactREF) ;give Artifact to the Actor specified in the function
        CurrentRefAlias.ForceRefTo(ArtifactREF) ;variant quests need to be able to point to these Artifacts via external link
        ;set this artifacts as having been acquired for Temple finding purposes
        (StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(CurrentArtifactNumber)
        currentElement += 1
    endWhile
EndFunction

Function EnableLodgeActors()
    ;Andreja, Barrett, Sam, and Cora need to be at the Lodge if we've skipped the Main Quest
    Actor AndrejaREF = Andreja.GetActorRef()
    Actor BarrettREF = Barrett.GetActorRef()
    Actor SamCoeREF = SamCoe.GetActorRef()
    Actor CoraCoeREF = CoraCoe.GetActorRef()

    MQ402LodgeActorsSkip.SetValueInt(1)
    AndrejaREF.AddToFaction(AvailableCompanionFaction)
    BarrettREF.AddToFaction(AvailableCompanionFaction)
    SamCoeREF.AddToFaction(AvailableCompanionFaction)

    AndrejaREF.EvaluatePackage()
    BarrettREF.EvaluatePackage()
    SamCoeREF.EvaluatePackage()
    CoraCoeREF.EvaluatePackage()

    AndrejaREF.moveto(Lodge_RoomMarker_Library01)
    BarrettREF.moveto(Lodge_RoomMarker_Library01)
    SamCoeREF.moveto(Lodge_RoomMarker_Library01)
    CoraCoeREF.moveto(Lodge_RoomMarker_Library01)     

    ;skip Andreja's intro scenes
    COM_Companion_Andreja.SetStage(50)
    COM_Companion_Andreja.SetStage(100)     
EndFunction
