Scriptname ArmillaryScript extends ObjectReference

Struct ArtifactStruct
	MiscObject ArtifactMiscObject
	String ArtifactAnimation = "None"
	Bool IsArtifactAdded ;track if this Artifact is now part of this Armillary
EndStruct

ArtifactStruct[] Property ArtifactArray Auto
RefCollectionAlias Property MQ00_ArtifactsHolder Mandatory Const Auto
Quest Property MQ305 Mandatory Const Auto
GlobalVariable Property MQArmillaryCompleteGlobal Mandatory Const Auto
Quest Property MQ101 Mandatory Const Auto
Location Property CityNewAtlantisLodgeLocation Mandatory Const Auto
Int Property ArmillaryTogetherStage = 1635 Const Auto
Quest Property MQ00 Mandatory Const Auto
ReferenceAlias Property Artifact01QuestObject Mandatory Const Auto
ReferenceAlias Property Artifact02QuestObject Mandatory Const Auto
ConditionForm Property MQ104AArtifactCollectionActivateCheck Mandatory Const Auto

Event OnLoad()
	If IsDisabled() == False
		AssembleArmillary()

		;if we're on MQ101, show the initial pieces
		If Self.IsInLocation(CityNewAtlantisLodgeLocation) && (MQ101.GetStageDone(ArmillaryTogetherStage) == False) && (MQ101.IsRunning())
			PlayAnimation("AlphaStart") 
		EndIf
	EndIf
EndEvent

Function AssembleArmillary()
	;check which Artifacts have been added and play the appropriate anims

	;set the graph to use the instant anims
	SetAnimationVariableBool("IsInstantInit", True)

    int currentElement = 0
	Bool ArmillaryOpened = False
    while (currentElement < ArtifactArray.Length)
		String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation
		Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded

        If (CurrentIsArtifactAdded)
			If ArmillaryOpened == false ;make sure the open animation plays if we have any artifact pieces
				PlayAnimation("AlphaStart") 
				PlayAnimation("Open")
				ArmillaryOpened=true
			EndIf
			If (CurrentAnimation != "None")
				PlayAnimation(CurrentAnimation)
			EndIf
		EndIf
 
        currentElement += 1
    endWhile

	;set the graph to no longer use the instant anims
	SetAnimationVariableBool("IsInstantInit", False)
EndFunction

Function BuildArmillary(Actor akActorREF, ObjectReference akMountOrScreen=None)
	;if we have advanced to MQ305, show the warning message box right away
	If MQ305.IsRunning()
		MQ305.SetStage(40)
	EndIf

	;play the intial setup anims
	PlayAnimation("Open")

	;remove any Artifacts from the Actor and play their associated anims
	int currentElement = 0
	while (currentElement < ArtifactArray.Length)
		MiscObject CurrentArtifactObject = ArtifactArray[currentElement].ArtifactMiscObject
		String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation
		Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded
		
		If akActorREF.GetItemCount(CurrentArtifactObject) >= 1
			Bool SkipCurrentArtifact = false

			if !MQ104AArtifactCollectionActivateCheck.IsTrue() && (Artifact01QuestObject.GetRef().GetBaseObject() == CurrentArtifactObject || Artifact02QuestObject.GetRef().GetBaseObject() == CurrentArtifactObject)
				SkipCurrentArtifact = true
			endif

			if !SkipCurrentArtifact
				akActorREF.RemoveItem(CurrentArtifactObject, 9999, absilent=true)
				If CurrentAnimation != "None"
					self.PlayAnimation(CurrentAnimation)
				EndIf
				ArtifactArray[currentElement].IsArtifactAdded = True
			endif
		EndIf

		;if we have advanced to MQ305, then failsafe the Armillary to always complete
		If MQ305.IsRunning()
			If ArtifactArray[currentElement].IsArtifactAdded == False
				self.PlayAnimation(CurrentAnimation)
				ArtifactArray[currentElement].IsArtifactAdded = True
			EndIf
		EndIf

		currentElement += 1
	endWhile
	MQ00_ArtifactsHolder.RemoveAll() ;clear quest object holder ref alias collection
	CheckArmillaryComplete() ;check if the Armillary is fully assembled
	If akMountOrScreen != None ;if we're passing in a player built mount or screen, then save which refs they are
		(MQ00 as MQ00QuestScript).ArmillaryPlaced(Self, akMountOrScreen)
	EndIf
EndFunction

Function BuildCompleteArmillary()
	;always build the full Armillary, ignoring objects the player has
	int currentElement = 0
	while (currentElement < ArtifactArray.Length)
		String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation
		self.PlayAnimation(CurrentAnimation)
		currentElement += 1
	endWhile
EndFunction

Function CheckArmillaryComplete()
	;check if all the Artifacts have been added
	int iArtifactsCollected = 0
	int iMaxArtifacts = ArtifactArray.Length
    int currentElement = 0
    while (currentElement < ArtifactArray.Length)
		Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded

        If CurrentIsArtifactAdded
			iArtifactsCollected += 1
		EndIf
 
        currentElement += 1
    endWhile

	If iArtifactsCollected >= iMaxArtifacts
		;if the Armillary is complete, update values
		MQArmillaryCompleteGlobal.SetValueInt(1)
	Else
		MQArmillaryCompleteGlobal.SetValueInt(0)
	EndIf

	If MQ305.IsRunning() 
		;MQ305 also needs knows if you're placing a complete Armillary or one that needs pieces added
        Int iArmillaryComplete = MQArmillaryCompleteGlobal.GetValueInt()
        (MQ305 as MQ305Script).ArmillaryPlaced(iArmillaryComplete)
    EndIf
EndFunction

Function PackupArmillary(Actor akActorREF)
	;remove all Artifacts in this Armillary and give them to the Actor
	int currentElement = 0
	while (currentElement < ArtifactArray.Length)
		MiscObject CurrentArtifactObject = ArtifactArray[currentElement].ArtifactMiscObject
		Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded

		If CurrentIsArtifactAdded == True
			akActorREF.AddAliasedItem(CurrentArtifactObject, MQ00_ArtifactsHolder, absilent=true)
			ArtifactArray[currentElement].IsArtifactAdded = False
		EndIf

		currentElement += 1
	endWhile

	;reset the Armillary animation state
	Self.PlayAnimation("Close")
	MQArmillaryCompleteGlobal.SetValueInt(0)
	(MQ00 as MQ00QuestScript).ArmillaryRemoved()
EndFunction

Function MQ101ArmillaryComesTogether()
	;special function for the scene where the Armillary comes together for the first time
	Self.PlayAnimation("Activate")

	ArtifactArray[0].IsArtifactAdded=True
	ArtifactArray[5].IsArtifactAdded=True
	ArtifactArray[18].IsArtifactAdded=True
EndFunction

Function DebugSetArtifactAdded(Int iArtifactNumber)
	ArtifactArray[iArtifactNumber].IsArtifactAdded=True
EndFunction