;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_OliveB_000C68A9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Nilesh.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Alias_Guard.GetActorRef().RemoveFromFaction(GuardFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_OliveBranch_GuardDistraction.Stop()
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetObjectiveSkipped(20)
SetObjectiveSkipped(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetObjectiveDisplayed(20)
Alias_SeedMarker.GetRef().EnableNoWait()

ObjectReference PlayerRef = Game.GetPlayer()
ObjectReference SeedRef = PlayerRef.PlaceAtMe(City_NA_Z_OliveBranch_Seed)

Alias_Seeds.ForceRefTo(SeedRef)
PlayerRef.AddItem(SeedRef)

ObjectReference GuardRef = Alias_Guard.GetRef()
ObjectReference GuardMarkerRef = Alias_GuardMarker.GetRef()

if GuardRef.GetDistance(GuardMarkerRef) > 10
    GuardRef.MoveTo(GuardMarkerRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
City_Z_OliveBranch_NoActivate.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
City_NewAtlantis_Z_OliveBranch_Guard.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_02
Function Fragment_Stage_0020_Item_02()
;BEGIN CODE
if Game.GetPlayer().IsDetectedBy(Alias_Guard.GetActorRef())
    City_NewAtlantis_Z_OliveBranch_Guard.Start()
else
    SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
SetObjectiveSkipped(10)
SetObjectiveSkipped(25)
SetObjectiveCompleted(20)
Game.GetPlayer().RemoveItem(City_NA_Z_OliveBranch_Seed)
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_SeedMarker.GetRef().DisableNoWait()
Game.GetPlayer().RemoveItem(City_NA_Z_OliveBranch_Seed)
SetObjectiveCompleted(10)
SetObjectiveSkipped(20)
if !GetStageDone(25)
    SetObjectiveSkipped(25)
endif
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
Alias_SeedMarker.GetRef().DisableNoWait()
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Guard.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property City_NA_Z_OliveBranch_Seed Auto Const Mandatory

ReferenceAlias Property Alias_Seeds Auto Const Mandatory

Scene Property City_NewAtlantis_Z_OliveBranch_Guard Auto Const Mandatory

ReferenceAlias Property Alias_SeedMarker Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

ReferenceAlias Property Alias_GuardMarker Auto Const Mandatory

ReferenceAlias Property Alias_Nilesh Auto Const Mandatory

Faction Property GuardFaction Auto Const Mandatory

Message Property City_Z_OliveBranch_NoActivate Auto Const Mandatory

Scene Property City_NewAtlantis_Z_OliveBranch_GuardDistraction Auto Const Mandatory
