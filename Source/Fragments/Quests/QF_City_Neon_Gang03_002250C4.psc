;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Gang03_002250C4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Add all the Strikers to the Striker Ref Collection
Alias_StrikerLeaders.AddRef(Alias_Aura.GetRef())
Alias_StrikerLeaders.AddRef(Alias_Briggs.GetRef())
Alias_StrikerLeaders.AddRef(Alias_Hatchet.GetRef())
Alias_StrikerLeaders.AddRef(Alias_Vogal.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Gang03_OutsideFinalMarker_Aura)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(700)

; Get all the bad guys to show up
Alias_Disciples_Hangout01.EnableAll()
Alias_Disciples_Hangout02.EnableAll()
Alias_HoltHenley.GetRef().Enable()
Alias_Disciple01Leader.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE Gang03_Script
Quest __temp = self as Quest
Gang03_Script kmyQuest = __temp as Gang03_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.HangOutsCleared()

; Have the other hangouts been cleared
if ( GetStageDone(500) && GetStageDone(600) )
  SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
; Start her scene
Gang03_0400_GangEncounter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; If you succeed in the speech check, then you get to mosey on
SetStage(400)

;Get Gang at Hangout 1 Moving
Alias_Disciple01Leader.GetActorRef().EvaluatePackage()
Alias_Disciples_Hangout01.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
; Make them fight now
Alias_Disciple01Leader.GetActorRef().RemoveFromAllFactions()
Alias_Disciple01Leader.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_Disciple01Leader.GetActorRef().StartCombat(Game.GetPlayer())

Alias_Disciples_Hangout01.RemoveFromFaction(DisciplesGangFaction)
Alias_Disciples_Hangout01.AddToFaction(PlayerEnemyFaction)
Alias_Disciples_Hangout01.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE Gang03_Script
Quest __temp = self as Quest
Gang03_Script kmyQuest = __temp as Gang03_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.HangOutsCleared()

; If you made a deal with Holt, you've broken it here
SetObjectiveDisplayed(520, FALSE)

; And set the Strikers to essential in case you agreed to betray them
; Go ahead and make the Strikers vulnerable
Actor aPlayer = Game.GetPlayer() as Actor
Actor aTarg = Alias_Briggs.GetActorRef()
aTarg.SetEssential(TRUE)

aTarg = Alias_Hatchet.GetActorRef()
aTarg.SetEssential(TRUE)

aTarg = Alias_Aura.GetActorRef()
aTarg.SetEssential(TRUE)

aTarg = Alias_Vogal.GetActorRef()
aTarg.SetEssential(TRUE)

; Have the other hangouts been cleared
if ( GetStageDone(400) && GetStageDone(600) )
  SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
; Start his scene
Gang03_0500_HoltEncounter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Make them fight now
;Alias_Disciples_Hangout02.RemoveFromFaction(DisciplesGangFaction)
Alias_Disciples_Hangout02.AddToFaction(PlayerEnemyFaction)
Alias_Disciples_Hangout02.StartCombatAll(Game.GetPlayer())

Actor aTarg = Alias_HoltHenley.GetActorRef()
aTarg.AddToFaction(PlayerEnemyFaction)
aTarg.SetValue(Aggression, 2.0)
aTarg.StartCombat(Game.GetPlayer())
aTarg.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(520)

; Go ahead and make the Strikers vulnerable
Actor aPlayer = Game.GetPlayer() as Actor
Actor aTarg = Alias_Briggs.GetActorRef()
aTarg.SetEssential(FALSE)

aTarg = Alias_Hatchet.GetActorRef()
aTarg.SetEssential(FALSE)

aTarg = Alias_Aura.GetActorRef()
aTarg.SetEssential(FALSE)

aTarg = Alias_Vogal.GetActorRef()
aTarg.SetEssential(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE Gang03_Script
Quest __temp = self as Quest
Gang03_Script kmyQuest = __temp as Gang03_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.HangOutsCleared()

; Have the other hangouts been cleared
if ( GetStageDone(400) && GetStageDone(500) )
  SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
; Removing the hostile group from the generic faction
;   then adding it to the PlayerEnemy faction.
Alias_Disciples_Hangout03.RemoveFromFaction(DisciplesGangFaction)
Alias_Disciples_Hangout03.AddToFaction(PlayerEnemyFaction)

Alias_Disciples_Hangout03.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

; Clear out the optional objective if you haven't done it yet
if ( !GetStageDone(200) )
  SetObjectiveDisplayed(200, FALSE)
endif

; Enable the finale bad guys now, too
Alias_Disciples_Warehouse.StartCombatAll(Game.GetPlayer())

; Move everyone where they belong for the finale
Alias_Aura.GetRef().MoveTo(Gang03_OutsideFinalMarker_Aura)
Alias_Briggs.GetRef().MoveTo(Gang03_OutsideFinalMarker_Briggs)
Alias_Hatchet.GetRef().MoveTo(Gang03_OutsideFinalMarker_Hatchet)
Alias_Vogal.GetRef().MoveTo(Gang03_OutsideFinalMarker_Vogal)

; If they got armor - put them in it
if ( GetStageDone(200) )
  Alias_Aura.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet)
  Alias_Briggs.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet)
  Alias_Hatchet.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet)
  Alias_Vogal.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)
SetObjectiveDisplayed(520, FALSE)

; Spawn in the baddies
Alias_Disciples_Warehouse.EnableAll()

; Make it so the Strikers are friendly to the player
Alias_Aura.GetActorRef().AddToFaction(PlayerFaction)
Alias_Briggs.GetActorRef().AddToFaction(PlayerFaction)
Alias_Hatchet.GetActorRef().AddToFaction(PlayerFaction)
Alias_Vogal.GetActorRef().AddToFaction(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
; Ping all of them so they move
Alias_Aura.GetActorRef().EvaluatePackage()
Alias_Briggs.GetActorRef().EvaluatePackage()
Alias_Hatchet.GetActorRef().EvaluatePackage()
Alias_Vogal.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
; If the Strikers are joining you - then have them come in now
if ( GetStageDone(810) )
  ObjectReference oTarg = Gang03_FinaleEntranceMarker
  Alias_Aura.GetRef().MoveTo(oTarg)
  Alias_Briggs.GetRef().MoveTo(oTarg)
  Alias_Hatchet.GetRef().MoveTo(oTarg)
  Alias_Vogal.GetRef().MoveTo(oTarg)
  SetStage(825)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200, FALSE)
SetObjectiveDisplayed(700, FALSE)
SetObjectiveCompleted(520)
SetObjectiveDisplayed(1200)

; Go ahead and make the Strikers hostile
Actor aPlayer = Game.GetPlayer() as Actor
Actor aTarg = Alias_Briggs.GetActorRef()
aTarg.SetEssential(FALSE)
aTarg.StartCombat(aPlayer)

aTarg = Alias_Hatchet.GetActorRef()
aTarg.SetEssential(FALSE)
aTarg.StartCombat(aPlayer)

aTarg = Alias_Aura.GetActorRef()
aTarg.SetEssential(FALSE)
aTarg.StartCombat(aPlayer)

aTarg = Alias_Vogal.GetActorRef()
aTarg.SetEssential(FALSE)
aTarg.StartCombat(aPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0875_Item_00
Function Fragment_Stage_0875_Item_00()
;BEGIN CODE
; Remove the objective to kill the Disciples - the player is committed
SetObjectiveDisplayed(800, FALSE)

; All the Strikers go hostile
SetStage(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE Gang03_Script
Quest __temp = self as Quest
Gang03_Script kmyQuest = __temp as Gang03_Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

;If Player has crime, clear it now (Neon only!) - otherwise Owen will break this quest
CrimeFactionNeon.SetCrimeGold(0)
CrimeFactionNeon.SetCrimeGoldViolent(0)

; Move Owen over here
Alias_OwenDexler.GetRef().MoveTo(Gang03_OutsideFinalMarker_Owen)
Alias_OwenDexler.GetRef().Enable()

; Play the Owen yelling scene
Gang03_0900_OwenArrives.Start()

; Get people to look right in the end
Alias_Aura.GetRef().AddKeyword(AnimFlavorCrouching)

; Move all the end people over
ObjectReference oTarg = Gang03_FinaleEntranceMarker
if ( !GetStageDone(810) )
  kmyQuest.MoveStriker(Alias_Aura.GetActorRef())
  kmyQuest.MoveStriker(Alias_Briggs.GetActorRef())
  kmyQuest.MoveStriker(Alias_Hatchet.GetActorRef())
  kmyQuest.MoveStriker(Alias_Vogal.GetActorRef())
  Alias_Aura.GetActorRef().EvaluatePackage()
  Alias_Briggs.GetActorRef().EvaluatePackage()
  Alias_Hatchet.GetActorRef().EvaluatePackage()
  Alias_Vogal.GetActorRef().EvaluatePackage()
else 
  ; Otherwise - have them go downstairs right now
  Alias_Aura.GetActorRef().EvaluatePackage()
  Alias_Briggs.GetActorRef().EvaluatePackage()
  Alias_Hatchet.GetActorRef().EvaluatePackage()
  Alias_Vogal.GetActorRef().EvaluatePackage()
endif
Alias_OwenDexler.GetRef().MoveTo(oTarg)

; Enable Owen's Security
Alias_BackupSecurity.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)

Alias_Briggs.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Flag this for New Game+
Game.GetPlayer().SetValue(Gang03_Foreknowledge_HelpedStrikersAV, 1.0)

FFNeonZ10.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

FFNeonZ10.Start()

; Now end the quest
SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Get rid of the extra security people
Alias_BackupSecurity.DisableAll()

; If the Strikers are still alive, then give them Neon Security Outfits
if ( GetStageDone(1100) )
  Alias_Aura.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet)
  Alias_Briggs.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet)
  Alias_Hatchet.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet)
  Alias_Vogal.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet)

  ; Then move them to their new home
  Alias_Aura.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker)
  Alias_Briggs.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker)
  Alias_Hatchet.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker)
  Alias_Vogal.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Gang03_OutsideFinalMarker_Briggs Auto Const Mandatory

ObjectReference Property Gang03_OutsideFinalMarker_Aura Auto Const Mandatory

ObjectReference Property Gang03_OutsideFinalMarker_Vogal Auto Const Mandatory

ReferenceAlias Property Alias_Aura Auto Const Mandatory

ReferenceAlias Property Alias_Briggs Auto Const Mandatory

ReferenceAlias Property Alias_Vogal Auto Const Mandatory

RefCollectionAlias Property Alias_Disciples_Warehouse Auto Const Mandatory

ObjectReference Property Gang03_OutsideFinalMarker_Owen Auto Const Mandatory

ReferenceAlias Property Alias_OwenDexler Auto Const Mandatory

ReferenceAlias Property Alias_Hatchet Auto Const Mandatory

ObjectReference Property Gang03_OutsideFinalMarker_Hatchet Auto Const Mandatory

RefCollectionAlias Property Alias_Disciples_Hangout01 Auto Const Mandatory

RefCollectionAlias Property Alias_Disciples_Hangout02 Auto Const Mandatory

RefCollectionAlias Property Alias_Disciples_Hangout03 Auto Const Mandatory

ReferenceAlias Property Alias_HoltHenley Auto Const Mandatory

ReferenceAlias Property Alias_Disciple01Leader Auto Const Mandatory

Scene Property Gang03_0400_GangEncounter Auto Const Mandatory

Scene Property Gang03_0500_HoltEncounter Auto Const Mandatory

ObjectReference Property Gang03_FinaleEntranceMarker Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

RefCollectionAlias Property Alias_StrikerLeaders Auto Const Mandatory

Scene Property Gang03_0900_OwenArrives Auto Const Mandatory

RefCollectionAlias Property Alias_BackupSecurity Auto Const Mandatory

Outfit Property Outfit_Scum_NoHelmet Auto Const Mandatory

Outfit Property Outfit_Clothes_Neon_Security_NoHelmet Auto Const Mandatory

ObjectReference Property Gang03_PostQuestStrikerMarker Auto Const Mandatory

ActorValue Property Gang03_Foreknowledge_HelpedStrikersAV Auto Const Mandatory

Keyword Property AnimFlavorArmsCrossedCasual Auto Const Mandatory

Keyword Property AnimFlavorCrouching Auto Const Mandatory

Faction Property DisciplesGangFaction Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

Quest Property FFNeonZ10 Auto Const Mandatory
