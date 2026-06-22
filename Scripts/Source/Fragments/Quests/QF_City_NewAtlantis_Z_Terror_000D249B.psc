;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_Terror_000D249B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Markieff.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
ObjectReference MarkieffChair = Alias_SitMarker.GetRef()
MarkieffChair.SetActorOwner(UC_NA_MarkieffSutherland)
Alias_Markieff.GetRef().MoveTo(MarkieffChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30)
Alias_Predator.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
Alias_Employee.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveCompleted(35)
SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveSkipped(35)
SetObjectiveSkipped(45)
CompleteAllObjectives()
ObjectReference PlayerRef = Game.GetPlayer()

PlayerRef.RemoveItem(Alias_CoffeeBeans.GetRef())
if GetStageDone(25)
    PlayerRef.AddItem(Credits, 4000)
else
    PlayerRef.AddItem(Credits, 2000)
endif

Alias_Employee.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
ObjectReference PlayerRef = Game.GetPlayer()

PlayerRef.RemoveItem(Alias_CoffeeBeans.GetRef())

if GetStageDone(35)
    PlayerRef.AddItem(Credits, 6000)
else
    PlayerRef.AddItem(Credits, 3000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Employee.GetRef().DisableNoWait()
Alias_SitMarker.GetRef().SetActorOwner(None)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CreditsRewardRadiantQuestSmall Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_Predator Auto Const Mandatory

ReferenceAlias Property Alias_Kieran Auto Const Mandatory

ReferenceAlias Property Alias_Employee Auto Const Mandatory

GlobalVariable Property CreditsRewardRadiantQuestLarge Auto Const Mandatory

ReferenceAlias Property Alias_CoffeeBeans Auto Const Mandatory

ReferenceAlias Property Alias_Markieff Auto Const Mandatory

ReferenceAlias Property Alias_DawnsRoost Auto Const Mandatory

ReferenceAlias Property Alias_SitMarker Auto Const Mandatory

ActorBase Property UC_NA_MarkieffSutherland Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_03_Large Auto Const Mandatory
