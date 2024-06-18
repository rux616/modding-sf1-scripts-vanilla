;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_TheBoo_000D700D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Antonio.GetRef())
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 500)
SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 1000)
SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(UC_Den_Z_TheBoot_Boots, 1)
SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_TheKindnessOfStrangers.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor AltaRef = Alias_Altagracia.GetActorRef()

Alias_Antonio.GetRef().MoveTo(Alias_AntonioStart.GetRef())
AltaRef.MoveTo(Alias_Altastart.GetRef())
AltaRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_TheBoot_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
SetObjectiveFailed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_TheBoot_Buyer.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Actor AltaRef = Alias_Altagracia.GetActorRef()
AltaRef.EvaluatePackage()
AltaRef.SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
Actor Buyer = Alias_Buyer.GetActorRef()
ObjectReference Seat = Buyer.GetLinkedRef()

Buyer.EnableNoWait()
Buyer.SnapIntoInteraction(Seat)
Alias_CrateActivator.GetRef().EnableNoWait()
Alias_Crate.GetRef().EnableNoWait()

ObjectReference PlayerRef = Game.GetPlayer()
ObjectReference BootsRef = PlayerRef.PlaceAtMe(UC_Den_Z_TheBoot_Boots)

Alias_Boots.ForceRefTo(BootsRef)
PlayerRef.AddItem(BootsRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60, false)
SetObjectiveDisplayed(60, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveSkipped(70)
SetObjectiveDisplayed(80)
Alias_CrateActivator.GetRef().DisableNoWait()
Game.GetPlayer().RemoveItem(Alias_Boots.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetObjectiveSkipped(60)
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
Alias_CrateActivator.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
if GetStageDone(75)
    Alias_MarkerFlip.GetRef().DisableNoWait()
endif
Alias_Buyer.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
if !GetStageDone(75)
    Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Alias_MarkerFlip.GetRef().EnableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Antonio Auto Const Mandatory

ReferenceAlias Property Alias_Altagracia Auto Const Mandatory

ReferenceAlias Property Alias_AntonioStart Auto Const Mandatory

ReferenceAlias Property Alias_AltaStart Auto Const Mandatory

Scene Property City_NewAtlantis_Z_TheBoot_Intro Auto Const Mandatory

ReferenceAlias Property Alias_Buyer Auto Const Mandatory

GlobalVariable Property CreditsRewardMiscQuestSmall Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const Mandatory

GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const Mandatory

ReferenceAlias Property Alias_Crate Auto Const Mandatory

ReferenceAlias Property Alias_CrateActivator Auto Const Mandatory

MiscObject Property UC_Den_Z_TheBoot_Boots Auto Const Mandatory

ReferenceAlias Property Alias_Boots Auto Const Mandatory

Scene Property City_NewAtlantis_Z_TheBoot_Buyer Auto Const Mandatory

ReferenceAlias Property Alias_MarkerFlip Auto Const Mandatory

Quest Property City_NewAtlantis_Z_TheKindnessOfStrangers Auto Const Mandatory
