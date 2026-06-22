;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_GG_Mark_0018BC56 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
City_GG_Connections.Start()
City_GG_Connections.SetStage(1000)
Game.GetPlayer().AddPerk(Intimidation)
Game.GetPlayer().MoveTo(Alias_EdgeMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
City_GG_Connections.Start()
City_GG_Connections.SetStage(1000)
Game.GetPlayer().AddPerk(Intimidation)
SetStage(300)
Game.GetPlayer().Moveto(UC_GG_Connect_DebugMarker01)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Bonifac.GetRef().Moveto(Game.GetPlayer())
Alias_CaptiveMarker.GetRef().Moveto(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Swap out the keyword on the location
Alias_DungeonLoc.GetLocation().RemoveKeyword(LocEncCrimsonFleet_Exclusive)
Alias_DungeonLoc.GetLocation().AddKeyword(LocEncEcliptic_Exclusive)

;Turn off the eavesdropping scene in the dungeon
Alias_EavesdroppingTrigger.GetRef().Disable()
Alias_EavesdroppingEnemies.GetRef().Disable()

;Replace eavesdropping enemies with lvlHumanHostile
Alias_QuestEnemies.GetRef().Enable()

Actor MalACT = Alias_Maldonado.GetActorRef()
Actor BonACT = Alias_Bonifac.GetActorRef()

;Turn on Maldonado
MalAct.Enable()
MalAct.EvaluatePackage()

;Get Bonifac set up
BonACT.Moveto(Alias_CaptiveMarker.GetRef())
BonACT.SetRestrained()
BonACT.AddToFaction(PlayerAllyFaction)
BonACT.IgnoreFriendlyHits()

if BonACT.IsDisabled()
  BonACT.Enable()
endif

BonACT.EvaluatePackage()

;Turn off all the story corpses
Alias_Corpses.DisableAll()

SetObjectiveDisplayed(100)

;Collect the enemies
City_GG_Mark_EnemyHolder.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
City_GG_Mark_110_Bonifac_Attract.Start()

;Turn off the Courier's corpse from City_GG_Connections
Alias_CourierCorpse.GetRef().Disable()
Alias_MurderEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_Bonifac.GetActorRef().SetRestrained(false)
Alias_BonCaptiveAlias.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetStage(200)
City_GG_Mark_155_Bon_FindAWeapon.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(110)

if !GetStageDone(310)
  SetObjectiveDisplayed(200)

  Actor BonACT = Alias_Bonifac.GetActorRef()
  BonACT.AddToFaction(PlayerAllyFaction)
  (SQ_Followers as SQ_FollowersScript).SetRoleActive(BonACT, false)
  (SQ_Followers as SQ_FollowersScript).CommandFollow(BonACT)
else
  SetObjectiveDisplayed(310)
endif

;Player now knows that Bonifac was kidnapped. Tag that Starborn AV
Game.GetPlayer().SetValue(UC_GG_Mark_Foreknowledge_BonifacKidnappedAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

Actor BonACT = Alias_Bonifac.GetActorRef()
Actor PlayACT = Game.GetPlayer()

if PlayACT.IsInCombat() || BonACT.IsInCombat()
  SetObjectiveDisplayed(261)
else
  SetObjectiveDisplayed(250)
endif

(SQ_Followers as SQ_FollowersScript).SetRoleInactive(BonACT, false)
BonACT.MoveTo(Alias_BonifacTeleportMarker.GetRef())

City_GG_Mark_260_MalBonifac_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0263_Item_00
Function Fragment_Stage_0263_Item_00()
;BEGIN CODE
SetObjectiveCompleted(261)

if GetStageDone(250)
  SetObjectiveDisplayed(250)
endif

if GetStageDone(310) && !GetStageDone(314)
  City_GG_Mark_310_Bonifac_MeetAtGG.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0265_Item_00
Function Fragment_Stage_0265_Item_00()
;BEGIN CODE
Alias_Maldonado.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0267_Item_00
Function Fragment_Stage_0267_Item_00()
;BEGIN CODE
Alias_Bonifac.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(250)
SetObjectiveDisplayed(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0285_Item_00
Function Fragment_Stage_0285_Item_00()
;BEGIN CODE
Actor BonACT = Alias_Bonifac.GetActorRef()
ActorBase BonBase = BonAct.GetBaseObject() as ActorBase
BonACT.AddKeyword(COM_NotCivilian)
BonBase.SetEssential(false)
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(BonACT, false)
BonACT.RemoveFromFaction(PlayerAllyFaction)
BonACT.IgnoreFriendlyHits(false)
BonACT.AddToFaction(PlayerEnemyFaction)
BonACT.AddToFaction(City_GG_Mark_MaldonadoEnemyFaction)
BonACT.StartCombat(Game.GetPlayer())

SetObjectiveCompleted(270)
SetObjectiveDisplayed(285)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
Actor MalACT = Alias_Maldonado.GetActorRef()
MalACT.SetProtected(false)
MalACT.AddToFaction(PlayerEnemyFaction)
MalACT.StartCombat(Game.GetPlayer())

if City_GG_Mark_260_MalBonifac_Intro.IsPlaying()
  City_GG_Mark_260_MalBonifac_Intro.Stop()
endif

if GetStageDone(200) && !GetStageDone(299) && !GetStageDone(310)
  SetObjectiveCompleted(270)
  SetObjectiveDisplayed(290)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0295_Item_00
Function Fragment_Stage_0295_Item_00()
;BEGIN CODE
GG_Mark_KilledBonifac.SetValue(1)
SetObjectiveCompleted(200)

;Turn off the Maldonado/Bonifac trigger
Setstage(307)

if !GetStageDone(299)
  if !GetStageDone(310) && !GetStageDone(285)
    City_GG_Mark_295_Bonifac_MalDead.Start()
  endif

  SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
SetObjectiveCompleted(285)
SetObjectiveDisplayed(310)
GG_Mark_BlockHelenaScene.SetValue(0)

Utility.Wait(1.0)

City_GG_Mark_299_Mal_PostBonDeath.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(290)
SetObjectiveDisplayed(300)

;Bonifac no longer needs to be allies with the player
Actor BonACT = Alias_Bonifac.GetActorRef()
BonACT.RemoveFromFaction(PlayerAllyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_Data.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(270)
SetObjectiveCompleted(300)

;Turn off the Maldonado/Bonifac trigger
Setstage(307)

if GetStageDone(190)

  if GetStageDone(263) && !GetStageDone(314) && !GetStageDone(280)
    City_GG_Mark_310_Bonifac_MeetAtGG.Start()
  endif
  
  ;GEN-511711
  ;If the player betrayed Bonifac, but hasn't killed him yet,
  ;Don't progress the quest till he's dead
  if GetStageDone(280) && !GetStageDone(299)
    GG_Mark_BlockHelenaScene.SetValue(1)
  else
    SetObjectiveDisplayed(310)
  endif
endif

if GetStageDone(190) || GetStageDone(200)
    (SQ_Followers as SQ_FollowersScript).SetRoleInactive(Alias_Bonifac.GetActorRef(), false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0311_Item_00
Function Fragment_Stage_0311_Item_00()
;BEGIN CODE
;Kill Bonifac's wrap-up scene if it is still running
if City_GG_Mark_310_Bonifac_MeetAtGG.IsPlaying()
  City_GG_Mark_310_Bonifac_MeetAtGG.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
Alias_Maldonado.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
GG_Mark_PlayerToldHelenaBonifacDead.Setvalue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0965_Item_00
Function Fragment_Stage_0965_Item_00()
;BEGIN CODE
GG_Mark_PlayerToldHelenaAboutMaldonado.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Data.GetRef())

;If he's alive, get Bonifac back to Gagarin
Actor BonACT = Alias_Bonifac.GetActorRef()
if !BonACT.IsDead()
  BonACT.MoveTo(BonifacTeleportMarker)
endif

;Turn off the Courier's corpse from City_GG_Connections one more time, just in case
Alias_CourierCorpse.GetRef().Disable()
Alias_MurderEnableMarker.GetRef().Disable()

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Bonifac Auto Const Mandatory

ReferenceAlias Property Alias_CaptiveMarker Auto Const Mandatory

ReferenceAlias Property Alias_Maldonado Auto Const Mandatory

ReferenceAlias Property Alias_BonCaptiveAlias Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

Scene Property City_GG_Mark_295_Bonifac_MalDead Auto Const Mandatory

Scene Property City_GG_Mark_110_Bonifac_Attract Auto Const Mandatory

Scene Property City_GG_Mark_310_Bonifac_MeetAtGG Auto Const Mandatory

ReferenceAlias Property Alias_Data Auto Const Mandatory

ReferenceAlias Property Alias_EdgeMarker Auto Const Mandatory

ReferenceAlias Property Alias_BossContainer Auto Const Mandatory

ObjectReference Property UC_GG_Connect_DebugMarker01 Auto Const Mandatory

Scene Property City_GG_Mark_155_Bon_FindAWeapon Auto Const Mandatory

Scene Property City_GG_Mark_260_MalBonifac_Intro Auto Const Mandatory

Scene Property City_GG_Mark_299_Mal_PostBonDeath Auto Const Mandatory

ObjectReference Property BonifacTeleportMarker Auto Const Mandatory

ReferenceAlias Property Alias_CourierCorpse Auto Const Mandatory

GlobalVariable Property GG_Mark_KilledBonifac Auto Const Mandatory

GlobalVariable Property GG_Mark_PlayerToldHelenaBonifacDead Auto Const Mandatory

ReferenceAlias Property Alias_BonifacTeleportMarker Auto Const Mandatory

Quest Property City_GG_Connections Auto Const Mandatory

Perk Property BackgroundBouncer Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

ActorValue Property UC_GG_Mark_Foreknowledge_BonifacKidnappedAV Auto Const Mandatory

LocationAlias Property Alias_DungeonLoc Auto Const Mandatory

Keyword Property LocEncEcliptic_Exclusive Auto Const Mandatory

Keyword Property LocEncCrimsonFleet_Exclusive Auto Const Mandatory

ReferenceAlias Property Alias_EavesdroppingTrigger Auto Const Mandatory

Perk Property Intimidation Auto Const Mandatory

RefCollectionAlias Property Alias_Corpses Auto Const Mandatory

GlobalVariable Property GG_Mark_ReturnedSlate Auto Const Mandatory

GlobalVariable Property GG_Mark_PlayerToldHelenaAboutMaldonado Auto Const Mandatory

ReferenceAlias Property Alias_MurderEnableMarker Auto Const Mandatory

Keyword Property COM_NotCivilian Auto Const Mandatory

ReferenceAlias Property Alias_EavesdroppingEnemies Auto Const Mandatory

ReferenceAlias Property Alias_QuestEnemies Auto Const Mandatory

Quest Property City_GG_Mark_EnemyHolder Auto Const Mandatory

GlobalVariable Property GG_Mark_BlockHelenaScene Auto Const Mandatory

Faction Property City_GG_Mark_MaldonadoEnemyFaction Auto Const Mandatory
