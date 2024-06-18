;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TraitQuest_001687DB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor aPlayer = Game.GetPlayer()
bool bExtrovert = aPlayer.HasPerk(TRAIT_Extrovert)
bool bIntrovert = aPlayer.HasPerk(TRAIT_Introvert)
bool bUniversal = aPlayer.HasPerk(TRAIT_RaisedUniversal)
bool bEnlightened = aPlayer.HasPerk(TRAIT_RaisedEnlightened)
bool bTaskmaster = aPlayer.HasPerk(TRAIT_Taskmaster)
bool bFC = aPlayer.HasPerk(TRAIT_FreestarCollectiveSettler)
bool bSerpent = aPlayer.HasPerk(TRAIT_SerpentsEmbrace)
bool bUC = aPlayer.HasPerk(TRAIT_UnitedColoniesNative)
bool bNeon = aPlayer.HasPerk(TRAIT_NeonStreetRat)

; AQUILIUS CHECK
if ( !bExtrovert && !bIntrovert && !bTaskmaster && !bUniversal )
  Alias_KeeperAquilus.Clear()
endif

; SINGH CHECK
if ( !bExtrovert && !bIntrovert && !bTaskmaster && !bEnlightened )
  Alias_AndySingh.Clear()
endif

; MIRZA CHECK
if ( !bSerpent )
  Alias_Mirza.Clear()
endif

; SAUVAGE CHECK
if ( !bNeon )
  Alias_MadameSauvage.Clear()
endif

; CARTWRIGHT CHECK
if ( !bFC )
  Alias_MayorCartwright_FC.Clear()
endif

; ROOKES CHECK
if ( !bUC )
  Alias_AdministratorRookes_UC.Clear()
endif

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN AUTOCAST TYPE defaultquestchangelocationscript
Quest __temp = self as Quest
defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
;END AUTOCAST
;BEGIN CODE
Actor aPlayer = Game.GetPlayer()
bool bExtrovert = aPlayer.HasPerk(TRAIT_Extrovert)
bool bIntrovert = aPlayer.HasPerk(TRAIT_Introvert)
bool bUniversal = aPlayer.HasPerk(TRAIT_RaisedUniversal)
bool bEnlightened = aPlayer.HasPerk(TRAIT_RaisedEnlightened)
bool bTaskmaster = aPlayer.HasPerk(TRAIT_Taskmaster)
bool bFC = aPlayer.HasPerk(TRAIT_FreestarCollectiveSettler)
bool bSerpent = aPlayer.HasPerk(TRAIT_SerpentsEmbrace)
bool bUC = aPlayer.HasPerk(TRAIT_UnitedColoniesNative)
bool bNeon = aPlayer.HasPerk(TRAIT_NeonStreetRat)

; AQUILIUS CHECK
if ( !bExtrovert && !bIntrovert && !bTaskmaster && !bUniversal )
  Alias_KeeperAquilus.Clear()
endif

; SINGH CHECK
if ( !bExtrovert && !bIntrovert && !bTaskmaster && !bEnlightened )
  Alias_AndySingh.Clear()
endif

; MIRZA CHECK
if ( !bSerpent )
  Alias_Mirza.Clear()
endif

; SAUVAGE CHECK
if ( !bNeon )
  Alias_MadameSauvage.Clear()
endif

; CARTWRIGHT CHECK
if ( !bFC )
  Alias_MayorCartwright_FC.Clear()
endif

; ROOKES CHECK
if ( !bUC )
  Alias_AdministratorRookes_UC.Clear()
endif

Alias_Player.Clear()

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_01
Function Fragment_Stage_0099_Item_01()
;BEGIN CODE
; Check to see if the Player has Kid Stuff - if so, spin up the quest
if ( Game.GetPlayer().HasPerk(TRAIT_KidStuff) )
  TraitKidStuff.Start()
endif

; Starter Home check
if ( Game.GetPlayer().HasPerk(TRAIT_StarterHome) )
  TraitStarterHome.Start()
else
  TraitStarterHome.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_02
Function Fragment_Stage_0099_Item_02()
;BEGIN CODE
TraitUnwantedHero.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_03
Function Fragment_Stage_0099_Item_03()
;BEGIN CODE
TraitWanted.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Check to see if the Player has Kid Stuff - if so, spin up the quest
if ( Game.GetPlayer().HasPerk(TRAIT_KidStuff) )
  TraitKidStuff.Start()
endif

; Starter Home check
if ( Game.GetPlayer().HasPerk(TRAIT_StarterHome) )
  TraitStarterHome.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
TraitUnwantedHero.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_02
Function Fragment_Stage_0100_Item_02()
;BEGIN CODE
TraitWanted.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Game.GetPlayer().RemovePerk(Trait_AlienDNA)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
int i = 0
while i < CREW_EliteQuests.Length
    if Crew_EliteQuests[i].GetStageDone(100)
        (Crew_EliteQuests[i] as Crew_EliteCrewQuestScript).SetCostMultAndUpdateCost(0.5)
    elseif Crew_EliteQuests[i].IsRunning()
        (Crew_EliteQuests[i] as Crew_EliteCrewQuestScript).SetCostMultAndUpdateCost(1)
    endif
i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property TRAIT_KidStuff Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitUnwantedHero Auto Const Mandatory

Quest Property TraitWanted Auto Const Mandatory

Perk Property TRAIT_AlienDNA Auto Const Mandatory

Perk Property TRAIT_StarterHome Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory

Perk Property TRAIT_Extrovert Auto Const Mandatory

Perk Property TRAIT_Introvert Auto Const Mandatory

Perk Property TRAIT_RaisedUniversal Auto Const Mandatory

Perk Property TRAIT_Taskmaster Auto Const Mandatory

Perk Property TRAIT_FreestarCollectiveSettler Auto Const Mandatory

Perk Property TRAIT_SerpentsEmbrace Auto Const Mandatory

Perk Property TRAIT_UnitedColoniesNative Auto Const Mandatory

Perk Property TRAIT_NeonStreetRat Auto Const Mandatory

ReferenceAlias Property Alias_MayorCartwright_FC Auto Const Mandatory

ReferenceAlias Property Alias_AdministratorRookes_UC Auto Const Mandatory

ReferenceAlias Property Alias_MadameSauvage Auto Const Mandatory

ReferenceAlias Property Alias_Mirza Auto Const Mandatory

ReferenceAlias Property Alias_KeeperAquilus Auto Const Mandatory

Perk Property TRAIT_RaisedEnlightened Auto Const Mandatory

ReferenceAlias Property Alias_AndySingh Auto Const Mandatory

Quest[] Property CREW_EliteQuests Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory
