;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_BE_EC02_01064828 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Activate ship computers but deny access except for Cockpit computer
SFFL_BE_EC02_TerminalAccessDenied.SetValue(1.0)

Alias_Computers.EnableAll()
Alias_cockpitComputer.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SpaceEncounter.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor Dax = Alias_DaxBurroughs.GetActorRef() as Actor
Dax.SetLookAt(Game.GetPlayer(),true)
Dax.EvaluatePackage()
Utility.Wait(2.25)

if (SpaceEncounter.IsStageDone(90))
    Dax.StartCombat(Game.GetPlayer())
else
    Scene_200_DaxIntro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor Dax = Alias_DaxBurroughs.GetActorRef() as Actor
Dax.SetValue(Aggression,0)
Dax.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
Game.GetPlayer().Additem(DaxCredits)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().ClearLookAt()
SpaceEncounter.SetStage(150)
SpaceEncounter.SetObjectiveDisplayed(300)

SFFL_BE_EC02_350_SettingSelfDestruct.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SpaceEncounter.SetStage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
Alias_SelfDestructAlarm.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
Alias_SelfDestructAlarm.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Actor Dax = Alias_DaxBurroughs.GetActorRef() as Actor
Dax.SetValue(Aggression,1)
DaxFaction.SetPlayerEnemy()
Dax.ClearLookAt()
SpaceEncounter.SetStage(870)
;SFFL_BE_EC02_400_DaxRetreat.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SpaceEncounter.SetStage(880)
Utility.Wait(3.0)

SpaceEncounter.SetStage(890)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DaxBurroughs Auto Const Mandatory

Scene Property Scene_200_DaxIntro Auto Const Mandatory

Quest Property SpaceEncounter Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Scene Property SFFL_BE_EC02_400_DaxRetreat Auto Const Mandatory

Faction Property DaxFaction Auto Const Mandatory

RefCollectionAlias Property Alias_Computers Auto Const Mandatory

ReferenceAlias Property Alias_cockpitComputer Auto Const Mandatory

GlobalVariable Property SFFL_BE_EC02_TerminalAccessDenied Auto Const Mandatory

Scene Property SelfDestructAlarmScene Auto Const Mandatory

Scene Property SFFL_BE_EC02_350_SettingSelfDestruct Auto Const Mandatory

LeveledItem Property DaxCredits Auto Const
{Amount of credits Dax will give the player if successfully pushed.}

ReferenceAlias Property Alias_SelfDestructAlarm Auto Const Mandatory
