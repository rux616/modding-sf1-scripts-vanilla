;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ401b_001A9053 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MQ401VariantQuestScript
Quest __temp = self as Quest
MQ401VariantQuestScript kmyQuest = __temp as MQ401VariantQuestScript
;END AUTOCAST
;BEGIN CODE
MQ401_SkipMQ.SetValueInt(1)

(MQ401 as MQ401QuestScript).NormalStart()

kmyquest.EnableQuestActors()

Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef()
OtherPlayerREF.Disable()
OtherPlayerREF.moveto(MQ401B_OtherPlayerMarker)
OtherPlayerREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ401b_001_LodgeIntro.Start()

Actor PlayerRef = Game.GetPlayer()
if PlayerRef.HasPerk(Trait_KidStuff)
  TraitKidStuff.SetStageNoWait(25)
endif

; If the player has the Starter Home trait, queue up the quest
If PlayerRef.HasPerk(Trait_StarterHome)
  TraitStarterHome.SetStageNoWait(100)
Else
  TraitStarterHome.Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_OtherPlayer.GetActorRef().AddtoFaction(PotentialCrewFaction)
OtherYouEliteCrewQuest.SetStage(1)
MQ401.SetStage(300)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property ConstellationFaction Auto Const Mandatory

Key Property LodgeKey Auto Const Mandatory

Quest Property MQ402 Auto Const Mandatory

Quest Property MQ401 Auto Const Mandatory

ReferenceAlias Property Alias_OtherPlayer Auto Const Mandatory

Faction Property AvailableCrewFaction Auto Const Mandatory

Scene Property MQ401b_001_LodgeIntro Auto Const Mandatory

Faction Property PotentialCrewFaction Auto Const Mandatory

GlobalVariable Property MQ401_SkipMQ Auto Const Mandatory

Quest Property OtherYouEliteCrewQuest Auto Const

ObjectReference Property MQ401B_OtherPlayerMarker Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property Trait_StarterHome Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory
