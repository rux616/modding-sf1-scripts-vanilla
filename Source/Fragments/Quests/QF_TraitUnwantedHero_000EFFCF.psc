;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TraitUnwantedHero_000EFFCF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Trait_UH_SpeechChallengeQuest.Start()
Alias_AdoringFan.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_AdoringFan.GetRef().MoveTo(Alias_NewAtlantisMarker.GetRef())
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_01
Function Fragment_Stage_0001_Item_01()
;BEGIN CODE
SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Alias_AdoringFan.GetRef().MoveTo(Alias_NeonMarker.GetRef())
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_01
Function Fragment_Stage_0002_Item_01()
;BEGIN CODE
SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Alias_AdoringFan.GetRef().MoveTo(Alias_AkilaCityMarker.GetRef())
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_01
Function Fragment_Stage_0003_Item_01()
;BEGIN CODE
SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_AdoringFan.GetActorRef().EvaluatePackage()
CREW_EliteCrew_AdoringFan.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
TraitUnwantedHero_AttackedByPlayer.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(TRAIT_UnwantedHero)
Game.GetPlayer().MoveTo(Alias_AdoringFan.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Trait_UH_FollowerGlobal.SetValue(2)
;Actor FanRef = Alias_AdoringFan.GetActorRef()
;SQ_Followers.SetRoleActive(FanRef)

CREW_EliteCrew_AdoringFan.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Actor FanRef = Alias_AdoringFan.GetActorRef()

Trait_UH_FollowerGlobal.SetValue(0)
CREW_EliteCrew_AdoringFan.SetStage(15)
FanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Trait_UH_FollowerGlobal.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Actor FanRef = Alias_AdoringFan.GetActorRef()

SQ_Followers.SetRoleInactive(FanRef)
FanRef.MoveTo(Alias_NewAtlantisMarker.GetRef())
FanRef.EvaluatePackage()

Trait_UH_FollowerGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Actor FanRef = Alias_AdoringFan.GetActorRef()

SQ_Followers.SetRoleInactive(FanRef)
FanRef.MoveTo(Alias_NeonMarker.GetRef())
FanRef.EvaluatePackage()

Trait_UH_FollowerGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Actor FanRef = Alias_AdoringFan.GetActorRef()

SQ_Followers.SetRoleInactive(FanRef)
FanRef.MoveTo(Alias_AkilaCityMarker.GetRef())
FanRef.EvaluatePackage()

Trait_UH_FollowerGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
Trait_UH_FollowerGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
TraitUnwantedHero_DialogueGreets.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
Trait_UH_HitGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Trait_UH_FollowerGlobal.SetValue(2)
Actor FanRef = Alias_AdoringFan.GetActorRef()
SQ_Followers.SetRoleActive(FanRef)
FanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
Trait_UH_FollowerGlobal.SetValue(2)
Actor FanRef = Alias_AdoringFan.GetActorRef()
SQ_Followers.CommandFollow(FanRef)
FanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Trait_UH_FollowerGlobal.SetValue(1)
Actor FanRef = Alias_AdoringFan.GetActorRef()
SQ_Followers.CommandWait(FanRef)
FanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
int random = Utility.RandomInt(0, 100)

if GetStageDone(5) && random < FollowPlayerOnStartOdds
    Trait_UH_FollowerGlobal.SetValue(4)
else
    Trait_UH_FollowerGlobal.SetValue(3)
endif


Trait_UH_HitGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Trait_UH_AdoringFanGift, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Game.GetPlayer().RemovePerk(TRAIT_UnwantedHero)
Alias_FanDisplayName.ForceRefTo(Alias_AdoringFan.GetRef())
SetStage(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
Trait_UH_WarningMessageEssential.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

PlayerRef.AddItem(ToiletPaperRoll01Empty)
PlayerRef.AddItem(Credits, 50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
Actor FanRef = Alias_AdoringFan.GetActorRef()
FanRef.EnableNoWait()
FanRef.SetProtected(true)
FanRef.EvaluatePackage()
Alias_NATMarker.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Actor FanRef = Alias_AdoringFan.GetActorRef()
FanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0666_Item_00
Function Fragment_Stage_0666_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
SetStage(50)
CREW_EliteCrew_AdoringFan.SetStage(9999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_AdoringFan.GetRef().DisableNoWait()
CREW_EliteCrew_AdoringFan.Stop()
Trait_UH_SpeechChallengeQuest.Stop()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Trait_UH_FollowerGlobal Auto Const Mandatory

ReferenceAlias Property Alias_AdoringFan Auto Const Mandatory

MiscObject Property ToiletPaperRoll01Empty Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

LeveledItem Property LL_Trait_UH_AdoringFanGift Auto Const Mandatory

Perk Property TRAIT_UnwantedHero Auto Const

ReferenceAlias Property Alias_NewAtlantisMarker Auto Const Mandatory

ReferenceAlias Property Alias_AkilaCityMarker Auto Const Mandatory

ReferenceAlias Property Alias_NeonMarker Auto Const Mandatory

Scene Property TraitUnwantedHero_AttackedByPlayer Auto Const Mandatory

Int Property FollowPlayerOnStartOdds Auto Const Mandatory

Quest Property Trait_UH_SpeechChallengeQuest Auto Const Mandatory

ReferenceAlias Property Alias_FanDisplayName Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Auto Const Mandatory


Scene Property TraitUnwantedHero_DialogueGreets Auto Const Mandatory

Quest Property CREW_EliteCrew_AdoringFan Auto Const

Message Property Trait_UH_WarningMessageEssential Auto Const Mandatory

ReferenceAlias Property Alias_NATMarker Auto Const Mandatory

GlobalVariable Property Trait_UH_FanClubFee Auto Const Mandatory

Faction Property PotentialCrewFaction Auto Const Mandatory

GlobalVariable Property Trait_UH_HitGlobal Auto Const Mandatory
