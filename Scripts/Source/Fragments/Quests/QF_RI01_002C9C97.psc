;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI01_002C9C97 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_NeonStartMarker.GetRef())
Alias_YukoSerrano.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_NewAtlantisStartMarker.GetRef())
Alias_YukoSerrano.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
LC044.SetStage(350)
LC044.SetStage(400)
SetStage(100)
SetStage(150)
SetStage(200)
Alias_YukoSerrano.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
LC044.SetStage(350)
LC044.SetStage(400)
SetStage(500)
Alias_YukoSerrano.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
LC044.SetStage(350)
LC044.SetStage(400)

Alias_AlexisPryce.GetRef().MoveTo(Alias_RyujinAlexisConferenceChair.GetRef())
Alias_CamdenCho.GetRef().MoveTo(Alias_RyujinCamdenConferenceChair.GetRef())
Alias_GenevieveMonohan.GetRef().MoveTo(Alias_RyujinGenevieveConferenceChair.GetRef())
Alias_LindenCalderi.GetRef().MoveTo(Alias_RyujinLindenConferenceChair.GetRef())
SetStage(800)

Game.GetPlayer().MoveTo(Alias_RyujinImogeneQS.GetRef())
Alias_YukoSerrano.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
LC044.SetStage(350)
LC044.SetStage(400)
SetStage(800)
Alias_YukoSerrano.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
Alias_YukoSerrano.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayedAtTop(200)

If IsObjectiveDisplayed(150)
     SetObjectiveCompleted(150)
EndIf

LC044.SetStage(350)
LC044.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
RI01_200_Lane_GreetingScene.Start()
SetObjectiveDisplayed(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(220)
SetObjectiveDisplayed(230)
Alias_LaneGarza.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
RI01_230_Lane_FollowScene.Start()
Alias_PathingOperative.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetObjectiveCompleted(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
RI01_250_Imogene_IntroScene.Start()
Alias_LaneGarza.GetActorRef().EvaluatePackage()

If IsObjectiveDisplayed(210)
     SetObjectiveDisplayed(210, False, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
Alias_PathingOperative.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(230)
  SetObjectiveDisplayed(230, false)
endif

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE RI01_QuestScript
Quest __temp = self as Quest
RI01_QuestScript kmyQuest = __temp as RI01_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FreezeControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
If IsObjectiveDisplayed(210)
     SetObjectiveDisplayed(210, False, False)
EndIf

Utility.Wait(3)
RI01_250_Imogene_IntroScene.Stop()
RI01_400_Imogene_InterviewScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
RI01_Track_PlayerWhateverItTakes.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0411_Item_00
Function Fragment_Stage_0411_Item_00()
;BEGIN CODE
RI01_Track_PlayerWillRunThePlace.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE RI01_QuestScript
Quest __temp = self as Quest
RI01_QuestScript kmyQuest = __temp as RI01_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
kmyQuest.UnfreezeControls()

Game.GetPlayer().AddPerk(FactionRyujinIndustriesPerk)
PlayerJoined_Ryujin.SetValue(1)
PlayerFaction.SetAlly(RyujinIndustriesFaction)
RI01_JobAdRadio.SetStage(1000)

Alias_NeonTerraBrewCustomer01.GetRef().Enable()
Alias_NeonTerraBrewCustomer01.GetRef().MoveTo(Alias_NeonTerraBrewSceneMarker01.GetRef())
Alias_NeonTerraBrewCustomer02.TryToEnable()
Alias_NeonTerraBrewCustomer03.TryToEnable()
Alias_NeonTerraBrewCustomer04.TryToEnable()

ObjectReference ChairRef = Alias_RyujinPlayerChair.GetRef()
If ChairRef.IsFurnitureInUse()
     ChairRef.Activate(Game.GetPlayer())
EndIf

Actor TBEmployeeRef = Alias_NeonTerraBrewEmployee.GetActorRef()
TBEmployeeRef.RemoveFromFaction(CrimeFactionNeon)
TBEmployeeRef.AddAliasedItem(RI01_TerraBrewOrder, Alias_TerraBrewCoffeeOrder)
TBEmployeeRef.SetValue(Assistance, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN CODE
RI01_500_Customer02_CommentScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0516_Item_00
Function Fragment_Stage_0516_Item_00()
;BEGIN CODE
RI01_500_Customer03_CommentScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
Actor TomoRef = Alias_TomoHigashi.GetActorRef()
TomoRef.Enable()
Game.GetPlayer().StopCombatAlarm()
RI01_500_Tomo_ConfrontationScene.Start()
Alias_NeonTerraBrewEmployee.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
If GetStageDone(700)
     SetStage(800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Alias_TomoHigashi.GetRef().Enable()
Alias_TomoHigashi.GetActorRef().SetEssential(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

Actor TBEmployeeRef = Alias_NeonTerraBrewEmployee.GetActorRef()
TBEmployeeRef.AddToFaction(CrimeFactionNeon)
TBEmployeeRef.SetCrimeFaction(CrimeFactionNeon)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0628_Item_00
Function Fragment_Stage_0628_Item_00()
;BEGIN CODE
RI01_Track_PlayerPromisedTomo.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0629_Item_00
Function Fragment_Stage_0629_Item_00()
;BEGIN CODE
RI01_Track_PlayerPromisedTomo.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(630)
Actor TomoRef = Alias_TomoHigashi.GetActorRef()

TomoRef.SetEssential(False)
TomoRef.RemoveFromFaction(CrimeFactionNeon)
TomoRef.AddToFaction(PlayerEnemyFaction)
TomoRef.SetValue(Confidence, 4)
TomoRef.SetValue(Aggression, 2)
TomoRef.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
Alias_TomoHigashi.GetActorRef().SetProtected(False)
Alias_TomoHigashi.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(630)
SetStage(700)
RI01_TomoDead.SetValue(1)
Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage()
Alias_TomoHigashi.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

If !GetStageDone(520)
     RI01_700_Companion_TomoPromiseScene.Start()
EndIf

If GetStageDone(530)
     SetStage(800)
EndIf

Actor TomoRef = Alias_TomoHigashi.GetActorRef()

TomoRef.SetEssential(False)
TomoRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN CODE
Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_TerraBrewCoffeeOrder.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage()

; Move the conference room NPCs into position
Alias_AlexisPryce.GetRef().MoveTo(Alias_RyujinAlexisConferenceChair.GetRef())
Alias_CamdenCho.GetRef().MoveTo(Alias_RyujinCamdenConferenceChair.GetRef())
Alias_GenevieveMonohan.GetRef().MoveTo(Alias_RyujinGenevieveConferenceChair.GetRef())
Alias_LindenCalderi.GetRef().MoveTo(Alias_RyujinLindenConferenceChair.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetStage(900)
SetStage(1000)
SetStage(1100)
SetStage(1200)

; Note that adding coffee to the player, then removing it, and then
; adding it to Imogene is intentional for messaging and inventory
; purposes.
ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
PlayerRef.AddItem(RI01_YukoCoffee, 1, abSilent = True)
PlayerRef.AddAliasedItem(RI01_ImogeneCoffee, Alias_CoffeeImogene)
PlayerRef.RemoveItem(RI01_ImogeneCoffee)
Alias_ImogeneSalzo.GetRef().AddItem(RI01_ImogeneCoffee)
PlayerRef.RemoveItem(RI01_TerraBrewOrder, 99, abSilent = True)
PlayerRef.AddAliasedItem(RI01_AlexisCoffee, Alias_CoffeeAlexis, 1, abSilent = True)
PlayerRef.AddAliasedItem(RI01_CamdenCoffee, Alias_CoffeeCamden, 1, abSilent = True)
PlayerRef.AddAliasedItem(RI01_GenevieveCoffee, Alias_CoffeeGenevieve, 1, abSilent = True)
PlayerRef.AddAliasedItem(RI01_LindenCoffee, Alias_CoffeeLinden, 1, abSilent = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0905_Item_00
Function Fragment_Stage_0905_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI01_AlexisCoffee)
Alias_AlexisPryce.GetRef().AddItem(RI01_AlexisCoffee)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
PlayerKnows_Bayu.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)

If GetStageDone(1050) && GetStageDone(1150) && GetStageDone(1250)
     SetStage(1300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)

;Achievement Unlocked
Game.AddAchievement(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1005_Item_00
Function Fragment_Stage_1005_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI01_CamdenCoffee)
Alias_CamdenCho.GetRef().AddItem(RI01_CamdenCoffee)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)

If GetStageDone(950) && GetStageDone(1150) && GetStageDone(1250)
     SetStage(1300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1105_Item_00
Function Fragment_Stage_1105_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI01_GenevieveCoffee)
Alias_GenevieveMonohan.GetRef().AddItem(RI01_GenevieveCoffee)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)

If GetStageDone(950) && GetStageDone(1050) && GetStageDone(1250)
     SetStage(1300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1205_Item_00
Function Fragment_Stage_1205_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI01_LindenCoffee)
Alias_LindenCalderi.GetRef().AddItem(RI01_LindenCoffee)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)

If GetStageDone(950) && GetStageDone(1050) && GetStageDone(1150)
     SetStage(1300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1300)
RIR01.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NeonStartMarker Auto Const Mandatory

Scene Property RI01_250_Imogene_IntroScene Auto Const Mandatory

Scene Property RI01_400_Imogene_InterviewScene Auto Const Mandatory

ReferenceAlias Property Alias_RyujinCoffeeMarker Auto Const Mandatory

MiscObject Property RI01_TerraBrewOrder Auto Const Mandatory

Scene Property RI01_510_Tomo_ConfrontationScene Auto Const Mandatory

ReferenceAlias Property Alias_TomoHigashi Auto Const Mandatory

Quest Property RIR01 Auto Const Mandatory

ReferenceAlias Property Alias_NewAtlantisStartMarker Auto Const Mandatory

GlobalVariable Property RI01_Track_PlayerWillRunThePlace Auto Const Mandatory

GlobalVariable Property RI01_Track_PlayerWhateverItTakes Auto Const Mandatory

GlobalVariable Property RI01_Track_PlayerPromisedTomo Auto Const Mandatory

Scene Property RI01_700_Companion_TomoPromiseScene Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

ReferenceAlias Property Alias_TerraBrewCoffeeOrder Auto Const Mandatory

Scene Property RI01_500_Tomo_ConfrontationScene Auto Const Mandatory

Scene Property RI01_200_Lane_GreetingScene Auto Const Mandatory

ReferenceAlias Property Alias_LaneGarza Auto Const Mandatory

Scene Property RI01_230_Lane_FollowScene Auto Const Mandatory

GlobalVariable Property RI01_TomoDead Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

ReferenceAlias Property Alias_NeonTerraBrewTomoMarker Auto Const Mandatory

ReferenceAlias Property Alias_NeonTerraBrewCustomer01 Auto Const Mandatory

ReferenceAlias Property Alias_NeonTerraBrewCustomer02 Auto Const Mandatory

ReferenceAlias Property Alias_NeonTerraBrewCustomer03 Auto Const Mandatory

ReferenceAlias Property Alias_NeonTerraBrewCustomer04 Auto Const Mandatory

ReferenceAlias Property Alias_NeonTerraBrewSceneMarker01 Auto Const Mandatory

Scene Property RI01_500_Customer03_CommentScene Auto Const Mandatory

Scene Property RI01_500_Customer02_CommentScene Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_RyujinCounter Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

GlobalVariable Property PlayerJoined_Ryujin Auto Const Mandatory

Faction Property RyujinIndustriesFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

GlobalVariable Property PlayerKnows_Bayu Auto Const Mandatory

ReferenceAlias Property Alias_GenevieveMonohan Auto Const Mandatory

ReferenceAlias Property Alias_LindenCalderi Auto Const Mandatory

ReferenceAlias Property Alias_CamdenCho Auto Const Mandatory

ReferenceAlias Property Alias_AlexisPryce Auto Const Mandatory

ReferenceAlias Property Alias_RyujinAlexisConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_RyujinCamdenConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_RyujinGenevieveConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_RyujinLindenConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_RyujinImogeneQS Auto Const Mandatory

MiscObject Property RI01_ImogeneCoffee Auto Const Mandatory

MiscObject Property RI01_LindenCoffee Auto Const Mandatory

MiscObject Property RI01_GenevieveCoffee Auto Const Mandatory

MiscObject Property RI01_CamdenCoffee Auto Const Mandatory

MiscObject Property RI01_AlexisCoffee Auto Const Mandatory

ReferenceAlias Property Alias_CoffeeCamden Auto Const Mandatory

ReferenceAlias Property Alias_CoffeeLinden Auto Const Mandatory

ReferenceAlias Property Alias_CoffeeGenevieve Auto Const Mandatory

ReferenceAlias Property Alias_CoffeeAlexis Auto Const Mandatory

ReferenceAlias Property Alias_CoffeeImogene Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneSalzo Auto Const Mandatory

Potion Property RI01_YukoCoffee Auto Const Mandatory

ActorValue Property RI01_Completed Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

ReferenceAlias Property Alias_YukoSerrano Auto Const Mandatory

ReferenceAlias Property Alias_RyujinPlayerChair Auto Const Mandatory

Location Property CityNeonLocation Auto Const Mandatory

ReferenceAlias Property Alias_NeonTerraBrewEmployee Auto Const Mandatory

ReferenceAlias Property Alias_NeonTerraBrewTomoStartMarker Auto Const Mandatory

ActorValue Property Confidence Auto Const Mandatory

ActorValue Property Assistance Auto Const Mandatory

ReferenceAlias Property Alias_PathingOperative Auto Const Mandatory
