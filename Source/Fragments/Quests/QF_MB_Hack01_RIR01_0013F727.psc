;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_Hack01_RIR01_0013F727 Extends Quest Hidden Const

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

ObjectReference TerminalRef = Alias_PrimaryRef.GetRef()
TerminalRef.Lock()
TerminalRef.SetLockLevel(25)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(Alias_DataDisk.GetRef())
PlayerRef.AddItem(Digipick, 2)
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
;BEGIN AUTOCAST TYPE MissionHackQuestScript
Quest __temp = self as Quest
MissionHackQuestScript kmyQuest = __temp as MissionHackQuestScript
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

MiscObject Property Digipick Auto Const Mandatory

ReferenceAlias Property Alias_DataDisk Auto Const Mandatory
