;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ207_002B1B8E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Actor EmissaryREF = Alias_Emissary.GetActorRef()

Int ButtonPressed = TestMQ206AMSG.Show()
If ButtonPressed == 0
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef())
  Alias_SarahMorgan.getActorRef().disable()
ElseIf ButtonPressed == 1
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef())
  Alias_SamCoe.getActorRef().disable()
ElseIf ButtonPressed == 2
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef())
  Alias_Andreja.getActorRef().disable()
ElseIf ButtonPressed == 3
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef())
  Alias_Barrett.getActorRef().disable()
EndIf

MQ206B.SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SpaceshipReference HelixREF = Alias_HelixShip.GetShipRef()
SpaceshipReference ScorpiusREF = Alias_ScorpiusShip.GetShipRef()
Actor HunterREF = Alias_Hunter.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()

;HelixREF.MoveTo(ScorpiusOborumMarker)
HelixREF.Disable()

ScorpiusREF.Reset()
ScorpiusREF.MoveTo(HelixOborumMarker)
ScorpiusREF.Enable()

;move the Hunter and Emissary onboard
EmissaryREF.moveto(MQ207_EmissaryMarker01)
HunterREF.moveto(MQ207_HunterMarker01)

;add crime faction
HunterREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
EmissaryREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
ScorpiusREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
;make sure player cannot fight or leave
Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=False)
kmyquest.MQ207EnableLayer = InputEnableLayer.Create()
kmyquest.MQ207EnableLayer.DisablePlayerControls(abMovement=False, abFighting=True, abMenu=False, abActivate=True, abVATS=False, abFavorites=False)
kmyquest.MQ207EnableLayer.EnableFastTravel(False)
kmyquest.MQ207EnableLayer.EnableFarTravel(False)
kmyquest.MQ207EnableLayer.EnableGravJump(False)

SetObjectiveDisplayed(10)

MQ207_001b_AcceptHail.Start()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
;make sure player cannot fight or leave
kmyquest.MQ207EnableLayer = InputEnableLayer.Create()
kmyquest.MQ207EnableLayer.DisablePlayerControls(abMovement=False, abFighting=True, abMenu=False, abActivate=False, abVATS=False, abFavorites=False)
kmyquest.MQ207EnableLayer.EnableFastTravel(False)
kmyquest.MQ207EnableLayer.EnableFarTravel(False)
kmyquest.MQ207EnableLayer.EnableGravJump(False)

SetObjectiveDisplayed(10)

MQ207_001b_AcceptHail_NGPlus.Start()

;assign voicetype to Emissary based on who died
Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()

If DeadCompanionREF == Alias_SarahMorgan.GetActorRef()
  EmissaryREF.SetOverrideVoicetype(NPCFSarahMorgan)
ElseIf DeadCompanionREF == Alias_SamCoe.GetActorRef()
  EmissaryREF.SetOverrideVoicetype(NPCMSamCoe)
ElseIf DeadCompanionREF == Alias_Andreja.GetActorRef()
  EmissaryREF.SetOverrideVoicetype(NPCFAndreja)
ElseIf DeadCompanionREF == Alias_Barrett.GetActorRef()
  EmissaryREF.SetOverrideVoicetype(NPCMBarrett)
EndIf

MQ_EmissaryRevealed.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
;allow activation and saving
Game.SetInChargen(abDisableSaving=False, abDisableWaiting=False, abShowControlsDisabledMessage=False)
kmyquest.MQ207EnableLayer.EnablePlayerControls(abFighting=False, abActivate=True)

;player is allowed to Dock with the Scorpius
Game.GetPlayer().addtoFaction(MQ_HunterAllyFaction)

SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
;all companions must wait outside
kmyquest.FollowersToldtoWait = (SQ_Followers as SQ_FollowersScript).AllFollowersWait()

SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Hunter.GetActorRef().EvaluatePackage()
;play music
MUSGenesisStingerStarbornAppearC.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Actor EmissaryREF = Alias_Emissary.GetActorRef()

EmissaryREF.PlayIdle(Stage2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;assign voicetype to Emissary based on who died

Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()

If DeadCompanionREF == Alias_SarahMorgan.GetActorRef()
  EmissaryREF.SetOverrideVoicetype(NPCFSarahMorgan)
ElseIf DeadCompanionREF == Alias_SamCoe.GetActorRef()
  EmissaryREF.SetOverrideVoicetype(NPCMSamCoe)
ElseIf DeadCompanionREF == Alias_Andreja.GetActorRef()
  EmissaryREF.SetOverrideVoicetype(NPCFAndreja)
ElseIf DeadCompanionREF == Alias_Barrett.GetActorRef()
  EmissaryREF.SetOverrideVoicetype(NPCMBarrett)
EndIf

EmissaryREF.PlayIdle(Stage3)
WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(EmissaryREF)

MQ_EmissaryRevealed.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
Actor EmissaryREF = Alias_Emissary.GetActorRef()
Actor HunterREF = Alias_Hunter.GetActorRef()
EmissaryREF.PlayIdle(Stage1)
HunterREF.PlayIdle(Stage1)

EmissaryREF.RemoveItem(SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE)
EmissaryREF.EquipItem(SpaceSuit_Starborn_Companion_PlayerOrFollower)
(EmissaryREF.GetBaseObject() as ActorBase).SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, abSleepOutfit=true)
EmissaryREF.SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, abSleepOutfit=true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_Hunter.GetActorRef()

HunterRef.PlayIdle(Stage2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
kmyquest.SwitchToAquilus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
kmyquest.SwitchToHunter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(50)

SetStage(215)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
;player has talked to the Starborn in New Game Plus at least once
Game.GetPlayer().SetValue(MQ207_NGPlusCouncilAV, 1)

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;Move Emissary to Exit Marker
;Actor EmissaryREF = Alias_Emissary.GetActorRef()
;EmissaryREF.Disable()
;EmissaryREF.moveto(MQ207_FinalScene_EmissaryMarker)
;EmissaryREF.EvaluatePackage()
;EmissaryREF.Enable()

MQ207_004_LeaveScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
Alias_Emissary.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(30)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().additem(MQ301MoonBaseKey)
CompleteAllObjectives()
MQ301.SetStage(10)
MQ206C.SetStage(10)
;don't stop quest yet, wait until player leaves Oborum so we can disable the starborn ships
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
Game.GetPlayer().additem(MQ301MoonBaseKey)
CompleteAllObjectives()
MQ301.SetStage(10)
MQ206C.SetStage(10)
;don't stop quest yet, wait until player leaves Oborum so we can disable the starborn ships
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_02
Function Fragment_Stage_1000_Item_02()
;BEGIN CODE
CompleteAllObjectives()
MQ301.SetStage(130)
MQ206C.SetStage(10)
;don't stop quest yet, wait until player leaves Oborum so we can disable the starborn ships
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_03
Function Fragment_Stage_1000_Item_03()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ207EnableLayer = None

;Achievement Unlocked
Game.AddAchievement(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
;companions follow again
(SQ_Followers as SQ_FollowersScript).AllFollowersFollow(kmyquest.FollowersToldtoWait)
kmyquest.FollowersToldtoWait = None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE mq207script
Quest __temp = self as Quest
mq207script kmyQuest = __temp as mq207script
;END AUTOCAST
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
SpaceshipReference HunterShipREF = Alias_ScorpiusShip.GetShipReference()
SpaceshipReference EmissaryShipREF = Alias_HelixShip.GetShipReference()
Actor HunterREF = Alias_Hunter.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()

;player is no longer allowed to Dock with the Scorpius
Game.GetPlayer().RemoveFromFaction(MQ_HunterAllyFaction)

;disable Starborn ships
EmissaryShipREF.Disable()
HunterShipREF.Disable()

;enable Aquilus post quest dialogue
MQ207_PostQuestDialogue.Start()

;remove crime factions
HunterREF.SetCrimeFaction(MQHunterCrimeFaction)
HunterShipREF.SetCrimeFaction(MQHunterCrimeFaction)
EmissaryREF.SetCrimeFaction(None)

HunterShipREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
HunterREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
EmissaryREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)

;failsafe quest timer
(MQ00 as MQ00QuestScript).StartMQ207BFailsafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Emissary Auto Const Mandatory

Message Property MQ207HelmetRemovalMSG Auto Const Mandatory

Message Property MQ207HunterHelmetRemovalMSG Auto Const Mandatory

Scene Property MQ207_002_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

Scene Property MQ207_004_LeaveScene Auto Const Mandatory

ReferenceAlias Property Alias_HelixShip Auto Const Mandatory

ReferenceAlias Property Alias_ScorpiusShip Auto Const Mandatory

ObjectReference Property MQ207_HunterMarker01 Auto Const Mandatory

ObjectReference Property MQ207_EmissaryMarker01 Auto Const Mandatory

Faction Property MQ_EmissaryAllyFaction Auto Const Mandatory

Message Property TestMQ206AMSG Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionWhoDies Auto Const

Quest Property MQ206B Auto Const Mandatory

ObjectReference Property MQ207_FinalScene_EmissaryMarker Auto Const Mandatory

VoiceType Property NPCFSarahMorgan Auto Const Mandatory

VoiceType Property NPCMSamCoe Auto Const Mandatory

ReferenceAlias Property Alias_CompanionWhoDies Auto Const Mandatory

VoiceType Property NPCFAndreja Auto Const Mandatory

VoiceType Property NPCMBarrett Auto Const Mandatory

Quest Property MQ301 Auto Const Mandatory

Quest Property MQ206C Auto Const Mandatory

Key Property MQ301MoonBaseKey Auto Const Mandatory

Quest Property MQ207_PostQuestDialogue Auto Const Mandatory

Scene Property MQ207_001b_AcceptHail Auto Const Mandatory

Faction Property MQ_HunterAllyFaction Auto Const Mandatory

Scene Property MQ207_001b_AcceptHail_NGPlus Auto Const Mandatory

ActorValue Property MQ207_NGPlusCouncilAV Auto Const Mandatory

GlobalVariable Property MQ_EmissaryRevealed Auto Const Mandatory

Idle Property Stage2 Auto Const Mandatory

ObjectReference Property ScorpiusOborumMarker Auto Const Mandatory

ObjectReference Property HelixOborumMarker Auto Const Mandatory

MusicType Property MUSGenesisStingerStarbornAppearC Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory
Idle Property Stage1 Auto Const Mandatory

Faction Property MQEmissaryHunterCrimeFaction Auto Const Mandatory

Faction Property MQHunterCrimeFaction Auto Const Mandatory

Idle Property Stage3 Auto Const Mandatory

Idle Property Stage4 Auto Const Mandatory

Outfit Property Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter Auto Const Mandatory

Armor Property SpaceSuit_Starborn_Companion_PlayerOrFollower Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_MQ207_StarbornHelmetTransition Auto Const Mandatory

Armor Property SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE Auto Const Mandatory

Quest Property MQ00 Auto Const Mandatory
