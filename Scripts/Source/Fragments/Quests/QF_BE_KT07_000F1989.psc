;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_KT07_000F1989 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor[] RobotsRef = Alias_GenericRobots.GetActorArray()
Alias_GenericRobots.AddRef(Alias_PodRobot.GetRef())

int i = 0
While i < RobotsRef.Length 
    RobotsRef[i].RemoveFromFaction(CrimeFactionUC)
    RobotsRef[i].RemoveFromFaction(UCSecurityFaction)
    RobotsRef[i].AddtoFaction(PlayerEnemyFaction)
    RobotsRef[i].SetValue(Aggression, 2)
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
(Alias_PodRobot.GetRef() as RobotPodScript).WakeRobotFromPod()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

RefCollectionAlias Property Alias_GenericRobots Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Faction Property UCSecurityFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_PodRobot Auto Const Mandatory
