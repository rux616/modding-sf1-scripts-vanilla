Scriptname StarbornTempleQuestScript extends Quest

Struct ArtifactPower
    MiscObject Artifacts
    Spell ArtifactPower
    bool HasAcquiredArtifact
    bool HasAcquiredPower
    bool HasTemplePowerSpawned
    bool NoTempleSpawn ;this artifact has a specific Temple that is spawned, not a random one
    LocationAlias TempleName
    Activator EmbeddedArtifact
    Message TempleStarbornName
    string PowerVisionBink = "artifactvision.bk2"
    WwiseEvent VisionAudio
EndStruct

ArtifactPower[] Property Playthrough1ArtifactPowers Auto
ArtifactPower[] Property currentPlaythroughArtifacts Auto

LocationAlias Property StarbornTempleLocation Mandatory Const Auto
ReferenceAlias Property StarbornTemplePowerTrigger Mandatory Const Auto

ActorValue Property PlayerUnityTimesEntered Mandatory Const Auto

Spell Property ArtifactPower_GrantSpell_Inner_Demon Mandatory Const Auto
MiscObject Property Artifact_SIGMA Mandatory Const Auto

RefCollectionAlias Property MQ00_ArtifactsHolder Mandatory Const Auto

GlobalVariable Property MQUndiscoveredTemples Mandatory Const Auto

GlobalVariable Property MQ401_SkipMQ Mandatory Const Auto

Event OnQuestInit()
    currentPlaythroughArtifacts = new ArtifactPower[0]
    Debug.Trace(self + "Playthrough 1 artifacts " + Playthrough1ArtifactPowers)
    if Game.GetPlayer().GetValue(PlayerUnityTimesEntered) == 0
        currentPlaythroughArtifacts = Playthrough1ArtifactPowers
        Debug.Trace("My temp artifacts are " + currentPlaythroughArtifacts)
    ElseIf Game.GetPlayer().GetValue(PlayerUnityTimesEntered) > 0
        ;WJS - Artifacts are now always randomized in NG
        RandomizeArtifactArray()
    EndIf
EndEvent

ObjectReference Function PlaceArtifact(Int ArtifactNumber, ObjectReference ArtifactMarker)
    ;place the appropriate Artifact at the spot specified, returning the object reference so the quest calling the function and update RefAliases
    ;Remember when calling this function that ArtifactNumber is actually N-1, since the Artifacts are held in an array that begins with 0
    ;start the Artifacts disabled, so that the quest can determine when the Artifact appears in the world and RefAliases can trigger OnLoad events
    ObjectReference ArtifactItemPlaced
    If (ArtifactNumber >= 0) && (ArtifactNumber < currentPlaythroughArtifacts.length)
        ArtifactItemPlaced = ArtifactMarker.PlaceAtMe(currentPlaythroughArtifacts[ArtifactNumber].Artifacts, abInitiallyDisabled=True, abDeleteWhenAble=False)
        MQ00_ArtifactsHolder.AddRef(ArtifactItemPlaced) ;make sure this Artifact is a quest object
        return ArtifactItemPlaced
    Else
        Debug.Trace(Self + "Function PlaceArtifact: Invalid Artifact Item Index Number. Number given was: " + ArtifactNumber)
    EndIf
EndFunction

ObjectReference Function PlaceEmbeddedArtifact(Int ArtifactNumber, ObjectReference ActivatorREF)
    ;swap the current embedded Artifact Activator with the approprate one based on the given Artifact
    ObjectReference ArtifactEmbeddedPlaced
    If (ArtifactNumber >= 0) && (ArtifactNumber < currentPlaythroughArtifacts.length)
        ArtifactEmbeddedPlaced = ActivatorREF.PlaceAtMe(currentPlaythroughArtifacts[ArtifactNumber].EmbeddedArtifact, abDeleteWhenAble=False)
        ActivatorREF.DisableNoWait()
        return ArtifactEmbeddedPlaced
    Else
        Debug.Trace(Self + "Function Artifact: Invalid Artifact Item Index Number. Number given was: " + ArtifactNumber)
    EndIf
EndFunction

ObjectReference Function PlaceArtifactAndAttach(Int ArtifactNumber, ObjectReference ArtifactMarker, ObjectReference akAttachRef)
    ;place the appropriate Artifact and attach it to the given object, returning the object reference so the quest calling the function and update RefAliases
    ;Remember when calling this function that ArtifactNumber is actually N-1, since the Artifacts are held in an array that begins with 0
    ;start the Artifacts disabled, so that the quest can determine when the Artifact appears in the world and RefAliases can trigger OnLoad events
    ObjectReference ArtifactItemPlaced
    If (ArtifactNumber >= 0) && (ArtifactNumber < currentPlaythroughArtifacts.length)
        ArtifactItemPlaced = ArtifactMarker.PlaceAtMe(currentPlaythroughArtifacts[ArtifactNumber].Artifacts, abInitiallyDisabled=True, abDeleteWhenAble=False)
        ArtifactItemPlaced.AttachTo(akAttachRef)
        return ArtifactItemPlaced
    Else
        Debug.Trace(Self + "Function PlaceArtifact: Invalid Artifact Item Index Number. Number given was: " + ArtifactNumber)
    EndIf
EndFunction

Int Function CheckPlayerArtifactForPower()
    ;check to see if the player has acquired any Artifact that can grant a power but hasn't yet, then return that Artifact number
    ;if no qualifying Artifact is found, then return -1
    int currentElement = 0
    int ArtifactNumberFound = -1
    While (currentElement < currentPlaythroughArtifacts.length)
        Bool currentHasAcquiredArtifact = currentPlaythroughArtifacts[currentElement].HasAcquiredArtifact
        Bool currentHasAcquiredPower = currentPlaythroughArtifacts[currentElement].HasAcquiredPower
        Bool currentHasTemplePowerSpawned = currentPlaythroughArtifacts[currentElement].HasTemplePowerSpawned
        Bool currentNoTempleSpawn = currentPlaythroughArtifacts[currentElement].NoTempleSpawn

        If (currentHasAcquiredArtifact==True) && (currentHasAcquiredPower==False) && (currentHasTemplePowerSpawned==False)
            If (currentNoTempleSpawn==False) || (MQ401_SkipMQ.GetValueInt()>=1) ;if skipping the MQ, we ignore the NoTempleSpawn flag (primarily for Barrett's quest since he might not be there)
                ArtifactNumberFound = currentElement
                Return ArtifactNumberFound
            EndIf
        EndIf
        currentElement+=1
    EndWhile
    Return ArtifactNumberFound
EndFunction

Function SetPlayerAcquiredPower(Int ArtifactNumber)
    currentPlaythroughArtifacts[ArtifactNumber].HasAcquiredPower = True
    Int iTemples = MQUndiscoveredTemples.GetValueInt() ;update UI value for Temples left to discover
    MQUndiscoveredTemples.SetValue(iTemples - 1)
    If MQUndiscoveredTemples.GetValueInt() < 0 ;if we somehow end up at a negative value, clamp to 0
        MQUndiscoveredTemples.SetValueInt(0)
    EndIf
EndFunction

Function SetPlayerFoundTemple(Int ArtifactNumber)
    currentPlaythroughArtifacts[ArtifactNumber].HasTemplePowerSpawned = True
EndFunction

Int Function FindSigmaArtifactBarrett()
    ;find the Sigmar Artifact and return its place in the array
    int currentElement = 0
    int ArtifactNumberFound = -1
    While (currentElement < currentPlaythroughArtifacts.length)
        MiscObject currentArtifact = currentPlaythroughArtifacts[currentElement].Artifacts

        If (currentArtifact==Artifact_SIGMA)
            ArtifactNumberFound = currentElement
            Return ArtifactNumberFound
        EndIf
        currentElement+=1
    EndWhile
    Return ArtifactNumberFound
EndFunction

Function SetPlayerAcquiredArtifact(Int ArtifactNumber)
    ;set the given Artifact as having been acquired by the player this playthrough
    If (ArtifactNumber >= 0) && (ArtifactNumber < currentPlaythroughArtifacts.length)
        currentPlaythroughArtifacts[ArtifactNumber].HasAcquiredArtifact = True
        Int iTemples = MQUndiscoveredTemples.GetValueInt() ;update UI value for Temples left to discover
        MQUndiscoveredTemples.SetValue(iTemples + 1)
    Else
        Debug.Trace(Self + "Function SetPlayerAcquiredArtifact: Invalid Artifact Item Index Number. Number given was: " + ArtifactNumber)
    EndIf
EndFunction

ArtifactPower[] ArtifactArrayCopy

Function RandomizeArtifactArray()
    ArtifactArrayCopy = Playthrough1ArtifactPowers
    Debug.Trace(self + "Array BEFORE randomization is " + ArtifactArrayCopy)

    ;the first three Artifacts and the last are always the same
    currentPlaythroughArtifacts.Add(ArtifactArrayCopy[0])
    currentPlaythroughArtifacts.Add(ArtifactArrayCopy[1])
    currentPlaythroughArtifacts.Add(ArtifactArrayCopy[2])
    ArtifactArrayCopy.Remove(2)
    ArtifactArrayCopy.Remove(1)
    ArtifactArrayCopy.Remove(0)

    int randomArrayIndex
    ArtifactPower currentArtifactPower
    While (ArtifactArrayCopy.length > 0)
        randomArrayIndex = Utility.RandomInt(0, ArtifactArrayCopy.Length - 1)
        currentArtifactPower = ArtifactArrayCopy[randomArrayIndex]
        currentPlaythroughArtifacts.Add(currentArtifactPower)
        ArtifactArrayCopy.Remove(randomArrayIndex)
        ;Debug.Trace(self + "Array before randomization is " + ArtifactArrayCopy)
        Debug.Trace("Current randomized artifact array is " + currentPlaythroughArtifacts)
    EndWhile 
    Debug.Trace(self + "Array AFTER randomization is " + currentPlaythroughArtifacts)
EndFunction

Debug Function DebugSetArtifactPowers()
    SetArtifactAndPower(4, game.GetPlayer().GetCurrentLocation())
    Debug.Trace(self + "My location is " + game.GetPlayer().GetCurrentLocation())
EndFunction

Function SetArtifactAndPower(int iArtifact, location TempleLocation)
    ;Find the Temple Rename Location alias and force this Temple Location into that alias to rename it
    currentPlaythroughArtifacts[iArtifact].TempleName.ForceLocationTo(TempleLocation)

    ;make sure we know this temple has spawned if the player doesn't acquire the power right away
    currentPlaythroughArtifacts[iArtifact].HasTemplePowerSpawned = True

    ;set the correct Artifact to check and the power to give on the temple triggers
    StarbornTempleLocation.ForceLocationTo(TempleLocation)
    StarbornTemplePowerTrigger.RefillAlias()
    Spell myPower = currentPlaythroughArtifacts[iArtifact].ArtifactPower
    SBPowerCollectionActivatorScript PowerTriggerREF = StarbornTemplePowerTrigger.GetRef() as SBPowerCollectionActivatorScript
    String myPowerVisionBink = currentPlaythroughArtifacts[iArtifact].PowerVisionBink
    WwiseEvent myVisionAudio = currentPlaythroughArtifacts[iArtifact].VisionAudio

    PowerTriggerREF.UpdatePowerProperties(myPower, myPowerVisionBink, myVisionAudio)
EndFunction

Function RenameTempleStarborn(int iArtifact, Actor akStarborn)
    ;rename this actor to be the Temple-specific name based on which Artifact the Temple is tied to
    akStarborn.SetOverrideName(currentPlaythroughArtifacts[iArtifact].TempleStarbornName) 
EndFunction