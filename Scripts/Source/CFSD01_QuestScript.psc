Scriptname CFSD01_QuestScript extends Quest

ActorValue Property CFSD01Evidence Auto Const Mandatory
ActorValue Property CFSD01EvidenceTotal Auto Const Mandatory
Book[] Property EvidenceList Auto Const Mandatory
Quest Property LC082 Mandatory Const Auto
Quest Property LC088_Key Mandatory Const Auto
Quest Property CF01 Mandatory Const Auto
Quest Property CF04 Mandatory Const Auto
Quest Property CF05 Mandatory Const Auto
Quest Property CF06 Mandatory Const Auto

Group Autofill
ReferenceAlias Property CFSD01_Evidence_CF01_Kemp Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF03_Carter Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF03_LockRiots Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF04_Rokov Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF04_GalbankScheme Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF05_Daiyu Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF05_ComSpike Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF06_BayuGenerdyne Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF06_AyumiKomiko Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF06_EstelleVincent Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CF07_KryxFate Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CFKeyZ01_Maddie Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_CFKeyZ02_Kirova Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_MSC_Durand Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_MSC_Voss Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_MSC_Jaso Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_MSC_Chunks Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_MSC_Chiroptera Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_MSC_HopeTown Mandatory Const Auto
ReferenceAlias Property CFSD01_Evidence_MSC_Kreet Mandatory Const Auto
ReferenceAlias Property CFSD01_AdlerKemp Mandatory Const Auto
ReferenceAlias Property CFSD01_EstelleVincent Mandatory Const Auto
ReferenceAlias Property CFSD01_LarryDumbrosky Mandatory Const Auto
ReferenceAlias Property CFSD01_HuanDaiyu Mandatory Const Auto
ReferenceAlias Property CFSD01_EvgenyRokov Mandatory Const Auto
ReferenceAlias Property CFSD01_Delgado Mandatory Const Auto
ReferenceAlias Property CFSD01_AyumiKomiko Mandatory Const Auto
EndGroup

Actor PlayerRef

Event OnQuestInit()
    PlayerRef = Game.GetPlayer()
EndEvent

Function EvidenceCheck()
    ;We are checking an array of all the Evidence Fragments to see if the Player has any - controls the Objectives and Scenes
    int i = 0
    While (i < EvidenceList.Length)
        If PlayerRef.GetItemCount(EvidenceList[i]) >= 1
            PlayerRef.SetValue(CFSD01Evidence,1)
            SetObjectiveDisplayed(100,0)
            SetObjectiveDisplayed(200,1)
            Return
        EndIf
        i = i + 1
    EndWhile
        PlayerRef.SetValue(CFSD01Evidence,0)
            SetObjectiveDisplayed(100,1)
            SetObjectiveDisplayed(200,0)
EndFunction

Function EvidenceCounter()
    ;Every time an Evidence Fragment is turned in, increment the AV by 1 and check for Story Scene Availability
    PlayerRef.ModValue(CFSD01EvidenceTotal,1)
    If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 3
        SetStage(310)
    EndIf
    If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 7
        SetStage(330)
    EndIf
    If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 11    
        SetStage(350)
    EndIf
    If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 15
        SetStage(1000)
    EndIf
EndFunction

Function DebugAddAll()

PlayerRef.AddItem(CFSD01_Evidence_CF01_Kemp.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF03_Carter.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF03_LockRiots.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF04_Rokov.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF04_GalbankScheme.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF05_Daiyu.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF05_ComSpike.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF06_BayuGenerdyne.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF06_AyumiKomiko.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF06_EstelleVincent.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CF07_KryxFate.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CFKeyZ01_Maddie.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_CFKeyZ02_Kirova.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_MSC_Durand.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_MSC_Voss.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_MSC_Jaso.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_MSC_Chunks.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_MSC_Chiroptera.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_MSC_HopeTown.GetRef())
PlayerRef.AddItem(CFSD01_Evidence_MSC_Kreet.GetRef())

EndFunction

Function JailCheck()
    ;When Player leaves Vigilance, check if a piece of evidence has been turned in and then place prisoner in jail
    If ((GetStageDone(15) == 1) && (!GetStageDone(410))) && CF01.IsCompleted()
        (LC082 as LC082_BrigQuestScript).AddPrisoner(CFSD01_AdlerKemp.GetActorRef(),1)
        SetStage(410)
    EndIf

     If ((GetStageDone(45) == 1) && (!GetStageDone(420))) && CF04.IsCompleted()
        (LC082 as LC082_BrigQuestScript).AddPrisoner(CFSD01_EvgenyRokov.GetActorRef(),2)
        SetStage(420)
    EndIf

    If CF04.GetStageDone(158) == 0
        If ((GetStageDone(55) == 1) && (!GetStageDone(460))) && CF04.IsCompleted()
            (LC082 as LC082_BrigQuestScript).AddPrisoner(CFSD01_LarryDumbrosky.GetActorRef(),7)
            SetStage(460)
        EndIf
   EndIf

    If ((GetStageDone(65) == 1) && (!GetStageDone(430))) && CF05.IsCompleted()
        (LC082 as LC082_BrigQuestScript).AddPrisoner(CFSD01_HuanDaiyu.GetActorRef(),3)
        SetStage(430)
    EndIf

    If ((GetStageDone(85) == 1) && (!GetStageDone(440))) && CF06.IsCompleted()
        (LC082 as LC082_BrigQuestScript).AddPrisoner(CFSD01_EstelleVincent.GetActorRef(),4)
        SetStage(440)
    EndIf

    If CF06.GetStageDone(70) == 0
        If ((GetStageDone(105) == 1) && (!GetStageDone(470))) && CF06.IsCompleted()
            (LC082 as LC082_BrigQuestScript).AddPrisoner(CFSD01_AyumiKomiko.GetActorRef(),8)
            SetStage(470)
        EndIf
    EndIf

    If ((LC088_Key.GetStageDone(650) == 1) && (!GetStageDone(450)))
        (LC082 as LC082_BrigQuestScript).AddPrisoner(CFSD01_Delgado.GetActorRef(),5)
        SetStage(450)
    EndIf

EndFunction