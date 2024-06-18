;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_Partin_000D5430 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Zawadi.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start()
Alias_Trigger.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
if !GetStageDone(30)
    SetObjectiveFailed(10)
    SetStage(6)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Alias_Hadiyah.GetRef().DisableNoWait()
Alias_Zawadi.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

ObjectReference PlayerRef = Game.GetPlayer()
ObjectReference QuestItem = PlayerRef.PlaceAtMe(UC_NA_Z_PartingGift_Book)

PlayerRef.AddItem(Credits, 1000)
Alias_Letter.ForceRefTo(QuestItem)
PlayerRef.AddItem(QuestItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
Game.GetPlayer().RemoveItem(UC_NA_Z_PartingGift_Book)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0039_Item_00
Function Fragment_Stage_0039_Item_00()
;BEGIN CODE
if !GetStageDone(2)
    SetStage(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Actor ZawadiRef = Alias_Zawadi.GetActorRef()
Actor HadiRef = Alias_Hadiyah.GetActorRef()

ZawadiRef.Moveto(Alias_Chair.GetRef())
ZawadiRef.EvaluatePackage()

HadiRef.MoveTo(XmarkerHaddie)
HadiRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
ObjectReference HaddieRef = Alias_Hadiyah.GetRef()
ObjectReference ZawadiRef = Alias_Zawadi.GetRef()
ObjectReference HRailRef = Alias_Railing60.GetRef()
ObjectReference ZRailRef = Alias_Couch.GetRef()

HRailRef.SetActorOwner(UC_CY_HaddieGustavsson)
ZRailRef.SetActorOwner(UC_NA_Zawadi)

ZawadiRef.MoveTo(ZRailRef)
HaddieRef.MoveTo(HRailRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
ObjectReference HRailRef = Alias_Railing60.GetRef()
ObjectReference ZRailRef = Alias_Couch.GetRef()

HRailRef.SetActorOwner(None)
ZRailRef.SetActorOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
ObjectReference HaddieRef = Alias_Hadiyah.GetRef()
ObjectReference ZawadiRef = Alias_Zawadi.GetRef()
ObjectReference HRailRef = Alias_Railing90h.GetRef()
ObjectReference ZRailRef = Alias_Railing90z.GetRef()

ZawadiRef.MoveTo(ZRailRef)
HaddieRef.MoveTo(HRailRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Zawadi.GetRef().DisableNoWait()
Alias_Zawadi.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveSkipped(10)
SetObjectiveSkipped(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CreditGlobal Auto Const Mandatory

Book Property UC_NA_Z_PartingGift_Book Auto Const Mandatory

ReferenceAlias Property Alias_Letter Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_Trigger Auto Const Mandatory

ReferenceAlias Property Alias_Zawadi Auto Const Mandatory

ReferenceAlias Property Alias_Hadiyah Auto Const Mandatory

ReferenceAlias Property Alias_Chair Auto Const Mandatory

Scene Property City_NewAtlantis_Z_PartingGift_ZawadiHaddie Auto Const Mandatory

ReferenceAlias Property Alias_Couch Auto Const Mandatory

ReferenceAlias Property Alias_Railing60 Auto Const Mandatory

ActorBase Property UC_CY_HaddieGustavsson Auto Const Mandatory

ActorBase Property UC_NA_Zawadi Auto Const Mandatory

ReferenceAlias Property Alias_Railing90z Auto Const Mandatory

ReferenceAlias Property Alias_Railing90h Auto Const Mandatory

ObjectReference Property XmarkerHaddie Auto Const Mandatory
