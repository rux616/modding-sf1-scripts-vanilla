;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_Sabotage01_RIR04_0013F73D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE RI_CrimeTrackingQuestScript
Quest __temp = self as Quest
RI_CrimeTrackingQuestScript kmyQuest = __temp as RI_CrimeTrackingQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetRewardValues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

ObjectReference TriggerRef = Alias_DevicePlacementTrigger.GetRef()
ObjectReference MarkerRef = Alias_PrimaryRef.GetRef()
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ObjectReference MarkerRef = Alias_PrimaryRef.GetRef()
Alias_PrimaryRefLinkedRef.ForceRefTo(MarkerRef.GetLinkedRef())
Alias_Guard.GetRef().MoveTo(Alias_PrimaryRefLinkedRef.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE RI_CrimeTrackingQuestScript
Quest __temp = self as Quest
RI_CrimeTrackingQuestScript kmyQuest = __temp as RI_CrimeTrackingQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MissionSabotageQuestScript
Quest __temp = self as Quest
MissionSabotageQuestScript kmyQuest = __temp as MissionSabotageQuestScript
;END AUTOCAST
;BEGIN CODE
(RI_RadiantSupport as RI_RadiantSupportQuestScript).MBCompleted()

kmyQuest.MissionComplete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RI_RadiantSupport Auto Const Mandatory

ReferenceAlias Property Alias_PrimaryRef Auto Const Mandatory

ReferenceAlias Property Alias_DevicePlacementTrigger Auto Const Mandatory

Keyword Property CrimeFactionNeon_Keyword Auto Const Mandatory

Keyword Property CrimeFactionFreestar_Keyword Auto Const Mandatory

Keyword Property CrimeFactionUC_Keyword Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

Faction Property CrimeFactionFreestar Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Keyword Property CrimeFactionHopeTown_Keyword Auto Const Mandatory

ReferenceAlias Property Alias_PrimaryRefLinkedRef Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory
