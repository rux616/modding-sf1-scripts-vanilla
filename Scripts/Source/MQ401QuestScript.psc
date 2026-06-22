Scriptname MQ401QuestScript extends Quest

Group QuestVariantsGroup
    Quest[] Property MQ401VariantsArray Const Auto
EndGroup

int Property FaceGenStage=110 const auto
Int Property PostCharGenStage=120 Const Auto
Message Property MQ401SkipCharGenMSG Const Auto
Scene Property MQ401_001_LodgeIntro Mandatory Const Auto
InputEnableLayer Property MQ401EnableLayer Auto Hidden
ActorValue Property PlayerUnityTimesEntered Mandatory Const Auto
GlobalVariable Property MQ401_VariantCurrent Mandatory Const Auto
GlobalVariable Property MQ401_VariantChance Mandatory Const Auto
GlobalVariable Property MQ401_ForceVariant Mandatory Const Auto
Quest Property MQ101 Mandatory Const Auto
ReferenceAlias Property Vasco Mandatory Const Auto
ReferenceAlias Property Heller Mandatory Const Auto
ReferenceAlias Property Lin Mandatory Const Auto
ReferenceAlias Property OroraSabine Mandatory Const Auto
ReferenceAlias Property SarahMorgan Mandatory Const Auto
ReferenceAlias Property WalterStroud Mandatory Const Auto
ReferenceAlias Property MatteoKhatri Mandatory Const Auto
ReferenceAlias Property Noel Mandatory Const Auto
ReferenceAlias Property VladimirSall Mandatory Const Auto
ReferenceAlias Property SamCoe Mandatory Const Auto
ReferenceAlias Property CoraCoe Mandatory Const Auto
ReferenceAlias Property Andreja Mandatory Const Auto
ReferenceAlias Property Barrett Mandatory Const Auto
ReferenceAlias Property Armillary Mandatory Const Auto
ObjectReference Property MQ101_VascoMarker01 Mandatory Const Auto
ObjectReference Property VecteraExteriorNPCEnableMarker Mandatory Const Auto
ObjectReference Property VecteraInteriorNPCEnableMarker Mandatory Const Auto
Quest Property MQ401_AlwaysOn Mandatory Const Auto
Quest Property MQ402 Mandatory Const Auto
Quest Property SQ_GravitationalTraits Mandatory Const Auto

Struct PlayerKnowledgeStruct
    GlobalVariable PlayerKnowledgeGlobal
    ActorValue PlayerKnowledgeAV
EndStruct
 
PlayerKnowledgeStruct[] Property PlayerKnowledgeArray Const Auto
 
Function LoadPlayerKnowledge()
;check all the relevent player knowledge actor values from the starborn save and set the equivalent global
	Actor PlayerREF = Game.GetPlayer()

    int currentElement = 0
    while (currentElement < PlayerKnowledgeArray.Length)
		Float CurrentPlayerKnowledgeAVFloat = PlayerREF.GetValue(PlayerKnowledgeArray[currentElement].PlayerKnowledgeAV)
        GlobalVariable CurrentPlayerKnowledgeGlobal = PlayerKnowledgeArray[currentElement].PlayerKnowledgeGlobal
        
        CurrentPlayerKnowledgeGlobal.SetValue(CurrentPlayerKnowledgeAVFloat)

        currentElement += 1
    endWhile
EndFunction

Event OnQuestInit()
    ;make sure the dialogue that's "always on" in New Game Plus is running
    MQ401_AlwaysOn.Start()

    ;reset any player knowledge globals
    LoadPlayerKnowledge()

    ;reset which planets have Temples by stopping and restarting the Gravitational Traits quest
    SQ_GravitationalTraits.Stop()
    SQ_GravitationalTraits.Start()

    ;roll for a random variant of MQ401
    ;only do this if the player has been through the Unity twice
    Int iVariantPercentChance = MQ401_VariantChance.GetValueInt()
    Int iVariantChanceRoll = Utility.RandomInt(0, 100)
    If (Game.GetPlayer().GetValue(PlayerUnityTimesEntered) >= 2) && (iVariantChanceRoll <= iVariantPercentChance)
        Int iTotalVariants = MQ401VariantsArray.Length - 1 ;subtract 1 since array values start at 0
        Int iVariantNumberRoll = MQ401_ForceVariant.GetValueInt()
        If iVariantNumberRoll == -1 ;if we're not forcing a variant, then roll for a random one
            iVariantNumberRoll = Utility.RandomInt(0, iTotalVariants)
        EndIf
        MQ401_VariantCurrent.SetValueInt(iVariantNumberRoll) ; for dialogue conditions across quests        
        MQ401VariantsArray[iVariantNumberRoll].Start() ;start the variant quest
    Else
        NormalStart()
    EndIf

    ; Start CharGen; the fragment calls CheckChargenMenu()
    SetStage(FaceGenStage)
EndEvent

; Catch the MenuOpen Event and set the Close Menu stage fragment which will run a scene.
Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    if (asMenuName== "ChargenMenu")
        if (abOpening == False)
            UnRegisterForMenuOpenCloseEvent("ChargenMenu")
            Game.FadeOutGame(False, True, 0.0, 0.1) ;fade in   
        endif
    endif
endEvent

; Register for the Event and force the menu to open
Function CheckChargenMenu()
    RegisterForMenuOpenCloseEvent("ChargenMenu")
    Game.ShowRaceMenu(None, 1)    
EndFunction

Function CleanUpNormalMainQuest()
    ;clean up anything in the Main Quest plus anything that wouldn't make sense in a MQ401 variant
    ;normal main quest needs to be shut down

   	;SF-15833 - Added this function call to ensure MQ101 wasn't getting shut down while it still might have saves turned off
    ;Marks MarkedForNGShutdown true on MQ101, which will cause MQ101 to shut itself down once its finished processing in MQ101Script
    debug.trace(self + "Cleaning up normal MQ from MQ401.")
    (MQ101 as MQ101Script).ShutdownMQ101ViaNG()

    ;clean up Vectera and Disable Heller, Lin, and the Argos Extractors NPC in New Atlantis
    VecteraExteriorNPCEnableMarker.DisableNoWait()
    VecteraInteriorNPCEnableMarker.DisableNoWait()
    Heller.GetActorRef().Disable()
    Lin.GetActorRef().Disable()
    OroraSabine.GetActorRef().Disable()

    ;disable all the Lodge NPCs. the variant quests will handle enabling the ones it needs
    Vasco.GetActorRef().Disable()
    SarahMorgan.GetActorRef().Disable()
    WalterStroud.GetActorRef().Disable()
    MatteoKhatri.GetActorRef().Disable()
    Noel.GetActorRef().Disable()
    VladimirSall.GetActorRef().Disable()
    SamCoe.GetActorRef().Disable()
    CoraCoe.GetActorRef().Disable()
    Andreja.GetActorRef().Disable()
    Barrett.GetActorRef().Disable()

    MQ402.Start()

    Stop() ;shutdown MQ401
EndFunction

Function NormalStart()
    ;this is the normal beginning to New Game Plus, with the Lodge waiting for the player to arrive
    MQ101.SetStage(280)
    MQ101.SetStage(310)
    MQ101.SetStage(1310)
    MQ101.SetStage(1635)
    MQ402.Start()

    ;move Vasco
    Actor VascoREF = Vasco.GetActorRef()
    VascoREF.EvaluatePackage()
    VascoREF.moveto(MQ101_VascoMarker01)

    ;enable Armillary
    Armillary.GetRef().Enable()
EndFunction

Function MQ401DisablePlayerControls()
    MQ401EnableLayer = InputEnableLayer.Create()
    MQ401EnableLayer.DisablePlayerControls()
EndFunction

Function MQ401EnablePlayerControls()
    MQ401EnableLayer = None
EndFunction