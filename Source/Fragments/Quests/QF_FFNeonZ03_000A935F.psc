;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ03_000A935F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
FFNeonZ03_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetObjectiveDisplayed(20)
FFNeonZ03_SpeechChallengeQuest.Start()
Alias_Warlord.GetRef().EnableNoWait()
Actor DiscipleRef = Alias_Disciple.GetActorRef()
DiscipleRef.EnableNoWait()
DiscipleRef.SetValue(Aggression, 0)

; Close the pointer quest
FFNeonGuardPointer_Z03.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(30)
Game.GetPlayer().AddItem(Alias_Credits.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveSkipped(10)
SetObjectiveSkipped(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Actor WarlordRef = Alias_Warlord.GetActorRef()
Actor DiscipleRef = Alias_Disciple.GetActorRef()

WarlordRef.SetValue(Aggression, 1)
DiscipleRef.SetValue(Aggression, 1)
WarlordRef.AddtoFaction(PlayerEnemyFaction)
WarlordRef.StartCombat(Game.GetPlayer())
DiscipleRef.AddtoFaction(PlayerEnemyFaction)
DiscipleRef.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Alias_Credits.GetRef())
FFNeonZ03_SpeechChallengeQuest.Stop()
Alias_Warlord.GetRef().DisableNoWait()
Alias_Disciple.GetRef().DisableNoWait()
FFNeonZ03_SpeechChallengeQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
ObjectReference StyxRef = Alias_Styx.GetRef()

;StyxRef.RemoveMod(bot_ModelA_Styx_Graffiti_01)
;StyxRef.AttachMod(bot_ModelA_Civ_01)

Alias_Styx.GetRef().DisableNoWait()
Alias_FCNeonStyxClean.ForceRefTo(Alias_StyxPost.GetRef())
DialogueFCNeon.SetStage(200)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Styx Auto Const Mandatory

ObjectMod Property bot_ModelA_Styx_Graffiti_01 Auto Const Mandatory

ObjectMod Property bot_ModelA_Civ_01 Auto Const Mandatory

Quest Property FFNeonZ03_SpeechChallengeQuest Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Warlord Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_Credits Auto Const Mandatory

ReferenceAlias Property Alias_Disciple Auto Const Mandatory

Quest Property DialogueFCNeon Auto Const Mandatory

Scene Property FFNeonZ03_Scene Auto Const Mandatory

Quest Property FFNeonGuardPointer_Z03 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_FCNeonStyxClean Auto Const Mandatory

ReferenceAlias Property Alias_StyxPost Auto Const Mandatory
