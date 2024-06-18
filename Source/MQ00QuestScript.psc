Scriptname MQ00QuestScript extends Quest

Quest Property MQ204 Auto Const Mandatory
Quest Property MQ404 Mandatory Const Auto
Quest Property MQ305 Auto Const Mandatory
Int Property MQ204_PlayerSecuresArmillaryStage = 620 Auto Const
Int Property MQ204_PlayerSecuresArmillaryPrereqStage = 510 Auto Const
Int Property MQ404_PlayerSecuresArmillaryStage = 120 Auto Const
Int Property MQ404_PlayerSecuresArmillaryPrereqStage = 110 Auto Const
ReferenceAlias Property MQ00_Armillary Auto Const Mandatory
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const Mandatory
ReferenceAlias Property MQ00_ArmillaryWorkshop Mandatory Const Auto
ActorValue Property MQ_ArmillaryResourceAV Mandatory Const Auto
Int Property ArmillaryTimerID=20 Const Auto
GlobalVariable Property MQArmillaryLocation Mandatory Const Auto
GlobalVariable Property ArtifactVisionNumber Mandatory Const Auto

Int Property MQ104ATimerID=30 Const Auto
Int Property MQ104BTimerID=40 Const Auto
Int Property MQ201TimerID=50 Const Auto
Int Property MQ207BTimerID=60 Const Auto
Quest Property MQ102 Mandatory Const Auto
Quest Property MQ104A Mandatory Const Auto
Quest Property MQ104B Mandatory Const Auto
Quest Property MQ106 Mandatory Const Auto
Quest Property MQ201 Mandatory Const Auto
Quest Property MQ207 Mandatory Const Auto
Quest Property MQ207B Mandatory Const Auto
Float Property QuestCheckTimerLength=3.0 Const Auto

Struct VisionStruct
    WwiseEvent VisionWWiseEvent
    String VisionBink
EndStruct

VisionStruct[] Property VisionArray Mandatory Const Auto

Event OnTimer(int aiTimerID)
    If aiTimerID == ArmillaryTimerID
        ;Find the Armillary made from the Workshop we set from MQ204ArmillaryMountScript
        ObjectReference ArmillaryWorkshopREF = MQ00_ArmillaryWorkshop.GetRef()
        ObjectReference[] ArmillaryObjects = ArmillaryWorkshopREF.GetWorkshopResourceObjects(MQ_ArmillaryResourceAV)
	    ArmillaryPlacedOrRemoved(ArmillaryObjects[0], ArmillaryWorkshopREF) ;return the first ref found since you can only ever build one per workshop
    EndIf

    ;if PCM-related quests that should be running are not running, then try to start them
    If aiTimerID == MQ104ATimerID        
        MQ00QuestFailsafe(MQ104A, MQ104ATimerID)
    EndIf

    If aiTimerID == MQ104BTimerID
        MQ00QuestFailsafe(MQ104B, MQ104BTimerID)
    EndIf

    If aiTimerID == MQ201TimerID
        MQ00QuestFailsafe(MQ201, MQ201TimerID)
    EndIf

    If aiTimerID == MQ207BTimerID
        MQ00QuestFailsafe(MQ207B, MQ207BTimerID)
    EndIf
EndEvent

Function MQ00QuestFailsafe(Quest QuestToStart, int iQuestTimer)
    ;if PCM-related quests that should be running are not running, then try to start them
    If (QuestToStart.IsCompleted() == False) && (QuestToStart.IsRunning() == False)
        ;handle cases where this failsafe repeatedly fails to place the correct location
        QuestToStart.RemoveRequestedPCMQuestLocations()
        Bool bQuestHasStarted = QuestToStart.Start()
        If bQuestHasStarted == false
            ;if the quest didn't start, run the timer again
            StartTimer(QuestCheckTimerLength, iQuestTimer)
        Else
            ;set appropriate stage
            QuestToStart.SetStage(10)
        EndIf
    EndIf
EndFunction

Function StartArmillaryTimer(ObjectReference akReference)
    MQ00_ArmillaryWorkshop.ForceRefTo(akReference)
    StartTimer(0.5, ArmillaryTimerID)
EndFunction

Function StartMQ104AFailsafeTimer()
    StartTimer(QuestCheckTimerLength, MQ104ATimerID)
EndFunction

Function StartMQ104BFailsafeTimer()
    StartTimer(QuestCheckTimerLength, MQ104BTimerID)
EndFunction

Function StartMQ201FailsafeTimer()
    StartTimer(QuestCheckTimerLength, MQ201TimerID)
EndFunction

Function StartMQ207BFailsafeTimer()
    StartTimer(QuestCheckTimerLength, MQ207BTimerID)
EndFunction

Guard ArmillaryPlacedOrRemovedGuardWorkshop ProtectsFunctionLogic
Function ArmillaryPlacedOrRemoved(ObjectReference akReference, ObjectReference akWorkshopRef)
    LockGuard ArmillaryPlacedOrRemovedGuardWorkshop
        ;if the Resource value of the object's workshop is 0, then the Armillary was removed. Otherwise, it was placed
        If akWorkshopRef.GetValue(MQ_ArmillaryResourceAV) == 0
            ArmillaryRemoved()
        Else
            ArmillaryPlaced(akArmillary=akReference.GetLinkedRef(), akMountOrScreen=akReference)
        EndIf
    EndLockGuard
EndFunction

Function ArmillaryRemoved()
    SpaceshipReference ArmillaryShipREF = MQ00_Armillary.GetRef().GetCurrentShipRef()
    UnRegisterForRemoteEvent(ArmillaryShipREF, "OnShipSold")
    UnRegisterForRemoteEvent(ArmillaryShipREF, "OnDeath")

    MQ00_ArmillaryMountOrScreen.GetRef().PlayAnimation("Play02") ;turn screen off

    MQ00_Armillary.Clear()
    MQ00_ArmillaryMountOrScreen.Clear()
    ;update quests that are checking if the player removes the Armillary
    If MQ305.IsRunning()
        (MQ305 as MQ305Script).ArmillaryRemoved()
    EndIf
    MQArmillaryLocation.SetValueInt(0) ;track armillary dissassembled on player for Random Encounters
EndFunction

Function ArmillaryPlaced(ObjectReference akArmillary, ObjectReference akMountOrScreen)

    ;save the Armillary and the activator (either workshop mount or ship screen)
    MQ00_Armillary.ForceRefTo(akArmillary)       
    MQ00_ArmillaryMountOrScreen.ForceRefTo(akMountOrScreen)
   
    ;Track if the Armillary is on a ship or outpost
    If akMountOrScreen.GetCurrentShipRef() != None
        MQArmillaryLocation.SetValueInt(1) ;Armillary on ship
    Else
        MQArmillaryLocation.SetValueInt(2) ;Armillary at outpost
    EndIf

    ; update MQ204, which only cares if the Armillary is ever built by the player
    If (MQ204.IsRunning()) && (MQ204.GetStageDone(MQ204_PlayerSecuresArmillaryStage) == False) && (MQ204.GetStageDone(MQ204_PlayerSecuresArmillaryPrereqStage) == True)
        MQ204.SetStage(MQ204_PlayerSecuresArmillaryStage)
    EndIf

    ; update MQ404, which only cares if the Armillary is ever built by the player
    If (MQ404.IsRunning()) && (MQ404.GetStageDone(MQ204_PlayerSecuresArmillaryStage) == False) && (MQ404.GetStageDone(MQ404_PlayerSecuresArmillaryPrereqStage) == True)
        MQ404.SetStage(MQ404_PlayerSecuresArmillaryStage)
    EndIf
EndFunction


Function PlayArtifactVision()
    Int iVisionsDone = ArtifactVisionNumber.GetValueInt()
    WwiseEvent myAudio = VisionArray[iVisionsDone].VisionWWiseEvent
    String myBink = VisionArray[iVisionsDone].VisionBink

    myAudio.Play(Game.GetPlayer())
    Game.PlayBink(myBink, abMuteAudio=False, abMuteMusic=False)

    iVisionsDone += 1
    ArtifactVisionNumber.SetValueInt(iVisionsDone)
EndFunction

Function PlayArtifactVisionNoWait()
    Int iVisionsDone = ArtifactVisionNumber.GetValueInt()
    WwiseEvent myAudio = VisionArray[iVisionsDone].VisionWWiseEvent
    String myBink = VisionArray[iVisionsDone].VisionBink

    myAudio.Play(Game.GetPlayer())
    Game.PlayBinkNoWait(myBink, abMuteAudio=False, abMuteMusic=False, aPlayDuringLoadingScreen=True)

    iVisionsDone += 1
    ArtifactVisionNumber.SetValueInt(iVisionsDone)
EndFunction