;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_R02_0202A418 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
DialogueQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;get random ints
;1 = general npc, 2 = captive npc

SFFL_R02_RandomInt.SetValue(Utility.RandomInt(1,2))

;set bribe amount 
SFFL_R02_BribeAmount.SetValue(Utility.RandomInt(100,2500))
UpdateCurrentInstanceGlobal(SFFL_R02_BribeAmount)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;objectives
SetObjectiveDisplayed(200)

;spin up random int again to decide if npc is going to beg/bribe
SFFL_R02_RandomInt.SetValue(Utility.RandomInt(1,10))

setstage(201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN CODE
;objectives
SetObjectiveDisplayed(201)

;spin up random int again to decide if npc is going to beg/bribe
SFFL_R02_RandomInt.SetValue(Utility.RandomInt(1,10))

setstage(202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
if getstagedone(201) == 1
  ;handle generic npc
  Alias_GenNPC.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Alias_GenNPC.GetActorRef().StartCombat(Game.GetPlayer())
elseif getstagedone(202) == 1
  ;handle captive npc 
  Actor Captive = Alias_CaptiveNPC.GetActorRef()
  Captive.EvaluatePackage()
  Captive.RemoveFromFaction(CaptiveFaction)
  Captive.AddtoFaction(PlayerEnemyFaction)
  Captive.Startcombat(Game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
if getstagedone(201) == 1
  Alias_GenNPC.GetActorRef().RemoveItem(Alias_ProofOfDeath.GetRef())
  Game.GetPlayer().AddItem(Alias_ProofOfDeath.GetRef())
elseif getstagedone(202) == 1
  Alias_CaptiveNPC.GetActorRef().RemoveItem(Alias_ProofOfDeath01.GetRef())
  Game.GetPlayer().AddItem(Alias_ProofofDeath01.GetRef())
endif

SetStage(250)
SetObjectiveDisplayed(200,0)

;mod the TargetLetGo global
LetTargetGo.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;mod kill count global
KillCount.Mod(1)

;if player killed 10 targets, give them the achievement
if KillCount.GetValue() >= 10
  Game.AddAchievement(78)
endif

;handle objectives
SetObjectiveDisplayed(225)

if isobjectivedisplayed(200) == 1
  SetObjectiveCompleted(200)
elseif isobjectivedisplayed(201) == 1
  SetObjectiveCompleted(201)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(250)
SetObjectiveCompleted(225)

;handle objective if you pickpocket target and don't kill them/talk to them
if isobjectivecompleted(200) == 0 && isobjectivedisplayed(200) == 1
   SetObjectiveDisplayed(200, 0)
elseif isobjectivecompleted(201) == 0 && isobjectivedisplayed(201) == 1
   SetObjectiveDisplayed(201, 0) 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Alias_ProofOfDeath.GetRef())

;mod completion tracker global
TimesCompleted.Mod(1)

;start the cooldown
Cooldown.SetValue(GameDaysPassed.GetValue()+1.5)

;set the starborn actor value 
Game.GetPlayer().SetValue(SFFL_R02_Completed, 1)

;start misc dialogue quest
DialogueQuest.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Alias_ProofOfDeath.GetRef())

;mod completion tracker global
TimesCompleted.Mod(1)

;start the cooldown
Cooldown.SetValue(GameDaysPassed.GetValue()+1.5)

;set the starborn actor value 
Game.GetPlayer().SetValue(SFFL_R02_Completed, 1)

;start misc dialogue quest
DialogueQuest.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_02
Function Fragment_Stage_1000_Item_02()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Alias_ProofOfDeath.GetRef())

;mod completion tracker global
TimesCompleted.Mod(1)

;start misc dialogue quest
DialogueQuest.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SFFL_R02_RandomInt Auto Const Mandatory

ReferenceAlias Property Alias_GenNPC Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_ProofOfDeath Auto Const Mandatory

GlobalVariable Property SFFL_R02_BribeAmount Auto Const Mandatory

GlobalVariable Property LetTargetGo Auto Const Mandatory

GlobalVariable Property TimesCompleted Auto Const Mandatory

ReferenceAlias Property Alias_CaptiveNPC Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

ReferenceAlias Property Alias_ProofOfDeath01 Auto Const Mandatory

GlobalVariable Property Cooldown Auto Const Mandatory

GlobalVariable Property GameDaysPassed Auto Const Mandatory

ActorValue Property SFFL_R02_Completed Auto Const Mandatory

Quest Property DialogueQuest Auto Const Mandatory

GlobalVariable Property KillCount Auto Const Mandatory
