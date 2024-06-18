;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_DerelictCreatures01_0013EC55 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
SpaceshipReference enemyShipRef = Alias_EnemyShip.GetRef() as SpaceshipReference
int NumCrew = enemyShipRef.GetBaseValue(PSpaceshipCrew) as int
int maxCreatures = PBE_DerelictCreaturesMax.GetValue() as int

if (NumCrew >= maxCreatures)
  NumCrew = maxCreatures
endif

kMyQuest.SetupGenericCrew(kMyQuest.CrewData, 0, numCrew, kMyQuest.CONST_SpawnPattern_Random, kMyQuest.CONST_SpawnPrioritization_None)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_enemyShip Auto Const Mandatory

ActorValue Property PSpaceshipCrew Auto Const Mandatory

GlobalVariable Property PBE_DerelictCreaturesMax Auto Const Mandatory
