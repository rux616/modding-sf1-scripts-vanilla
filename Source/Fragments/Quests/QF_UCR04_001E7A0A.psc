;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UCR04_001E7A0A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Set up things on the base quest
DialogueRedDevilsHQ.SetStage(1)

;Get the player in place
Game.GetPlayer().Moveto(Alias_DebugMarker.GetRef())

;Turn on the RDHQ Map Marker
Alias_RDHQMapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Set up the base quest
DialogueRedDevilsHQ.SetStage(1)

SetStage(500)
Game.GetPlayer().AddItem(UCR04_SpecimenSample, UCR04_SamplesTotalRequired.GetValueInt())
Game.GetPlayer().MoveTo(UCR04_DebugMarker)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE UCR04QuestScript
Quest __temp = self as Quest
UCR04QuestScript kmyQuest = __temp as UCR04QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_ActiveUCR04Instance.ForceRefTo(Game.GetPlayer())

;SF1695 - Only add the perk if the player doesn't have it
;But we'll leave it on there permanently
;And turn it off via keywords
Actor PlayACT = Game.GetPlayer()
if !PlayACT.HasPerk(UCR04_HarvestSamplePerk)
  PlayACT.AddPerk(UCR04_HarvestSamplePerk)
endif

kmyquest.PrepQuest()

UCR04_100_Jakob_StartUp.Start()

;Close out Jakob's intro scene
if !DialogueRedDevilsHQ.GetStageDone(200)
  DialogueRedDevilsHQ.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110, false, false)
SetObjectiveDisplayed(111, false, false)
SetObjectiveDisplayed(500)

;Turn on the Xenobio NPC
Alias_DropOffNPC.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Game.GetPlayer().RemovePerk(UCR04_HarvestSamplePerk)

;Turn off the drop-off NPC if they're no longer loaded
ObjectReference XBRef = Alias_DropOffNPC.GetRef()
if !XBRef.Is3DLoaded() && XBRef.IsEnabled()
  XBRef.Disable()
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_ActiveUCR04Instance.Clear()
ObjectReference PlayREF = Game.GetPlayer()
PlayREF.RemoveItem(UCR04_SpecimenSample, PlayRef.GetItemCount(UCR04_SpecimenSample))

;SF1695: Player could lose the UCR04 harvesting perk due
;to timing issues, so we're just going to leave it on the player 
;Game.GetPlayer().RemovePerk(UCR04_HarvestSamplePerk)

;Turn off the drop-off NPC if they're no longer loaded
ObjectReference XBRef = Alias_DropOffNPC.GetRef()
if !XBRef.Is3DLoaded() && XBRef.IsEnabled()
  XBRef.Disable()
endif

UCR04_TimesCompleted.SetValue(UCR04_TimesCompleted.GetValue() + 1.0)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UCR04_TimesCompleted Auto Const Mandatory

Quest Property DialogueRedDevilsHQ Auto Const Mandatory

MiscObject Property UCR04_SpecimenSample Auto Const Mandatory

ReferenceAlias Property Alias_DebugMarker Auto Const Mandatory

ObjectReference Property UCR04_DebugMarker Auto Const Mandatory

GlobalVariable Property UCR04_SamplesTotalRequired Auto Const Mandatory

Message Property UCR04_DEBUG_HadrianForKaiser Auto Const Mandatory

Quest Property DialogueUCFaction Auto Const Mandatory

Perk Property UCR04_HarvestSamplePerk Auto Const Mandatory

ReferenceAlias Property Alias_DropOffNPC Auto Const Mandatory

Scene Property UCR04_100_Jakob_StartUp Auto Const Mandatory

ReferenceAlias Property Alias_RDHQMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_ActiveUCR04Instance Auto Const Mandatory
