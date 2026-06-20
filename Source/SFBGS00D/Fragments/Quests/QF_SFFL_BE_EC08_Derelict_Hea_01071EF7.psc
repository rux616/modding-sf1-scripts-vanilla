;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_BE_EC08_Derelict_Hea_01071EF7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_BE_EC08_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_BE_EC08_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_BE_EC08_QuestScript
;END AUTOCAST
;BEGIN CODE
;Activate and setup Computers
kmyQuest.EmergencyMenu(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_BE_EC08_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_BE_EC08_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_BE_EC08_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TurnOffLights()

Alias_LockableDoors.RefillAlias()

SpaceEncounter.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_SelfDestructAlarm.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_SelfDestructAlarm.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_InteriorLights Auto Const Mandatory

ReferenceAlias Property Alias_ModuleCockpit Auto Const Mandatory

RefCollectionAlias Property Alias_Computers Auto Const Mandatory

Quest Property SpaceEncounter Auto Const Mandatory

RefCollectionAlias Property Alias_LockableDoors Auto Const Mandatory

GlobalVariable Property BE_EC08_NoConnection Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_enemyShip Auto Const Mandatory

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

;Scene Property SFFL_BE_EC08_Derelict_Leeches_200_Alarm Auto Const Mandatory

Keyword Property LocTypeShowSpacesuit Auto Const Mandatory

ReferenceAlias Property Alias_SelfDestructAlarm Auto Const Mandatory
