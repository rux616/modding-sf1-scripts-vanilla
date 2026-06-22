;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_TheKin_0009BD47 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_TheBoot.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_TriggerVolume.GetRef().DisableNoWait()
Alias_TriggerVolume01.GetRef().DisableNoWait()

Actor TahirRef = Alias_TahirVala.GetActorRef()
ObjectReference TahirSeat = Alias_TahirSeat.GetRef()
SQ_Followers.SetRoleInactive(Alias_TahirVala.GetActorRef())
City_NAZ_TahirFollow_Global.SetValue(1)
TahirRef.MoveTo(TahirSeat)
TahirRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_01
Function Fragment_Stage_0001_Item_01()
;BEGIN CODE
SetObjectiveCompleted(10, false)
SetObjectiveDisplayed(20, false)
SetObjectiveDisplayed(10, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SQ_Followers.SetRoleActive(Alias_TahirVala.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
City_NA_Z_TKoS_UCTahirScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_UCGuard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Actor TahirRef = Alias_TahirVala.GetActorRef()
SQ_Followers.SetRoleActive(TahirRef)
TahirRef.EvaluatePackage()
Alias_TriggerVolume.GetRef().EnableNoWait()
Alias_TriggerVolume01.GetRef().EnableNoWait()
City_NAZ_TahirFollow_Global.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_01
Function Fragment_Stage_0007_Item_01()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

Alias_TahirVala.GetRef().EnableNoWait()
Alias_UCGuard.GetRef().EnableNoWait()
Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_02_Medium)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
if !GetStageDone(50)
    SetObjectiveDisplayed(20)
endif
SetObjectiveDisplayed(30)

ObjectReference PlayerRef = Game.GetPlayer()
ObjectReference MisoRef = PlayerRef.PlaceAtMe(Miso_Soup_Individual)
Alias_Miso.ForceRefTo(MisoRef)
PlayerRef.AddItem(MisoRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetStage(2)
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Alias_Kay.GetRef().MoveTo(Alias_KayWait.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
Game.GetPlayer().RemoveItem(Alias_Miso.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
City_NA_Z_TKoS_End_Tahir.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Actor TahirRef = Alias_TahirVala.GetActorRef()

if Game.GetPlayer().GetDistance(TahirRef) < 12
    City_NA_Z_TKoS_End_Tahir.Start()
endif

Alias_TriggerVolume.GetRef().DisableNoWait()
Alias_TriggerVolume01.GetRef().DisableNoWait()

SQ_Followers.SetRoleInactive(TahirRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Alias_Miso.Clear()
Alias_TahirVala.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if !FFNewAtlantis06.GetStageDone(60) || FFNewAtlantis06.GetStageDone(200)
   Alias_TahirVala.GetRef().DisableNoWait()
endif
Alias_UCGuard.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

sq_followersscript Property SQ_Followers Auto Const Mandatory

ReferenceAlias Property Alias_TahirVala Auto Const Mandatory

Potion Property Food_RS_Tavern_VeggieGrinder Auto Const Mandatory

ReferenceAlias Property Alias_Miso Auto Const Mandatory

Scene Property City_NA_Z_TKoS_End_Tahir Auto Const Mandatory

Potion Property Miso_Soup_Individual Auto Const Mandatory

ReferenceAlias Property Alias_UCGuard Auto Const Mandatory

Scene Property City_NA_Z_TKoS_UCTahirScene Auto Const Mandatory

ReferenceAlias Property Alias_TahirSeat Auto Const Mandatory

GlobalVariable Property City_NAZ_TahirFollow_Global Auto Const Mandatory

ReferenceAlias Property Alias_TriggerVolume Auto Const Mandatory

ReferenceAlias Property Alias_TriggerVolume01 Auto Const Mandatory

Quest Property City_NewAtlantis_Z_TheBoot Auto Const Mandatory

ReferenceAlias Property Alias_Kay Auto Const Mandatory

ReferenceAlias Property Alias_KayWait Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const Mandatory

Quest Property FFNewAtlantis06 Auto Const Mandatory
