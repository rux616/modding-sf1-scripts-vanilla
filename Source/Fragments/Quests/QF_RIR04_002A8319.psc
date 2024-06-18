;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RIR04_002A8319 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
RI02.Start()
RI02.SetStage(600)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_ImogeneQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
RI02.CompleteQuest()
SetStage(100)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_ImogeneQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
RI02.CompleteQuest()
SetStage(300)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_ImogeneQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
RI02.CompleteQuest()
SetStage(100)
SetStage(150)
SetStage(200)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Imogene.GetRef().AddItem(Alias_Device.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)
RI02.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
Game.GetPlayer().AddItem(Alias_Device.GetRef())

Location ChosenLocation = Alias_ChosenLocation.GetLocation()

If (ChosenLocation != CityNeonLocation) && !(CityNeonLocation.IsChild(ChosenLocation))
     SetObjectiveDisplayed(150)     
     If ChosenLocation.HasKeyword(LocTypeStarstationInterior)
          SetStage(155)
     EndIf
     Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap()
     Alias_ChosenMapMarker.GetRef().AddToMapScanned()
Else
     SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Place the xmarker at the packin and set ownership for crime.
ObjectReference TriggerRef = Alias_DevicePlacementTrigger.GetRef()
ObjectReference MarkerRef = Alias_LocationMarker.GetRef()

TriggerRef.MoveTo(MarkerRef)

Location MyLocation = MarkerRef.GetCurrentLocation()

If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
     TriggerRef.SetFactionOwner(CrimeFactionNeon)
EndIf
If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) || MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword)
     TriggerRef.SetFactionOwner(CrimeFactionFreestar)
EndIf
If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
     TriggerRef.SetFactionOwner(CrimeFactionUC)
EndIf

Alias_LocationMarkerLinkedRef.ForceRefTo(MarkerRef.GetLinkedRef())
Alias_Guard.GetRef().MoveTo(Alias_LocationMarkerLinkedRef.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

Game.GetPlayer().RemoveItem(Alias_Device.GetRef())

Alias_PlacedDevice.GetRef().MoveTo(Alias_LocationMarker.GetRef(), abMatchRotation = True)

RIR05_QuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE RI_CrimeTrackingQuestScript
Quest __temp = self as Quest
RI_CrimeTrackingQuestScript kmyQuest = __temp as RI_CrimeTrackingQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Device Auto Const Mandatory

ReferenceAlias Property Alias_HoldingCellMarker Auto Const Mandatory

MiscObject Property RIR04_Device Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory

Quest Property RI02 Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

GlobalVariable Property RIR04_RadiantAvailable Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

Quest Property RIR05 Auto Const Mandatory

Location Property CityNeonLocation Auto Const Mandatory

LocationAlias Property Alias_ChosenLocation Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneQS Auto Const Mandatory

Keyword Property RIR05_QuestStartKeyword Auto Const Mandatory

ReferenceAlias Property Alias_LocationMarker Auto Const Mandatory

ReferenceAlias Property Alias_DevicePlacementTrigger Auto Const Mandatory

ReferenceAlias Property Alias_DevicePlanted Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

Keyword Property CrimeFactionNeon_Keyword Auto Const Mandatory

ReferenceAlias Property Alias_PlacedDevice Auto Const Mandatory

Keyword Property LocTypeStarstationInterior Auto Const Mandatory

ReferenceAlias Property Alias_ChosenMapMarker Auto Const Mandatory

Keyword Property CrimeFactionUC_Keyword Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Faction Property CrimeFactionFreestar Auto Const Mandatory

Keyword Property CrimeFactionFreestar_Keyword Auto Const Mandatory

ReferenceAlias Property Alias_LocationMarkerLinkedRef Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

Keyword Property CrimeFactionHopeTown_Keyword Auto Const Mandatory
