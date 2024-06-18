;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_PlantEvidence01_RIR02_0013F2C8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE ri_crimetrackingquestscript
Quest __temp = self as Quest
ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
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

ObjectReference ContainerRef = Alias_PrimaryRef.GetRef()
ContainerRef.Enable()
ContainerRef.Lock()
ContainerRef.SetLockLevel(25)

Game.GetPlayer().AddItem(Digipick, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE ri_crimetrackingquestscript
Quest __temp = self as Quest
ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
SetStage(95)
Alias_PrimaryRef.GetRef().RemoveItem(Alias_Evidence.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MissionPlantEvidenceQuestScript
Quest __temp = self as Quest
MissionPlantEvidenceQuestScript kmyQuest = __temp as MissionPlantEvidenceQuestScript
;END AUTOCAST
;BEGIN CODE
(RI_RadiantSupport as RI_RadiantSupportQuestScript).MBCompleted()

kmyQuest.MissionComplete()
Alias_PrimaryRef.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RI_RadiantSupport Auto Const Mandatory

ReferenceAlias Property Alias_PrimaryRef Auto Const Mandatory

Keyword Property NoLoot Auto Const Mandatory

ReferenceAlias Property Alias_Evidence Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory
