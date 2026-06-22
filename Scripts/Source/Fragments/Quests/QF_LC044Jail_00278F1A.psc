;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC044Jail_00278F1A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_JailTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN AUTOCAST TYPE LC044Jail_QuestScript
Quest __temp = self as Quest
LC044Jail_QuestScript kmyQuest = __temp as LC044Jail_QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_JailDoor.GetRef().SetOpen(false)
Alias_JailDoor.GetRef().SetLockLevel(25)
Alias_NPCJailGuard.GetActorRef().Enable()
Alias_EavesdropTriggerEscape01.GetRef().Enable()
Alias_EavesdropTriggerEscape02.GetRef().Enable()
RI04.setstage(410)

Game.GetPlayer().MoveTo(Alias_LC044JailPlayerMarker.getref())

kmyQuest.StartJailTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0028_Item_00
Function Fragment_Stage_0028_Item_00()
;BEGIN CODE
LC044GuardJailScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
LC044RyujinIndustriesHQ.SetFactionOwner(LC044RyujinGuardCrimeFaction)
Game.GetPlayer().RemoveFromFaction(LC044RyujinGuardCrimeFaction)
Game.GetPlayer().AddToFaction(LC044RyujinGuardEnemeyFaction)
LC044_EscapeCell_EavesdroppingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property LC044RyujinGuardEnemeyFaction Auto Const

ReferenceAlias Property Alias_NPCJailGuard Auto Const Mandatory

Scene Property LC044GuardJailScene Auto Const

Faction Property LC044RyujinGuardCrimeFaction Auto Const

ReferenceAlias Property Alias_EavesdropTriggerEscape01 Auto Const Mandatory

ReferenceAlias Property Alias_EavesdropTriggerEscape02 Auto Const Mandatory

Cell Property LC044RyujinIndustriesHQ Auto Const

Scene Property LC044_EscapeCell_EavesdroppingScene Auto Const

Scene Property LC044_EscapeCell02_EavesdroppingScene Auto Const

Quest Property RI04 Auto Const

Quest Property LC044 Auto Const

ReferenceAlias Property Alias_LC044JailPlayerMarker Auto Const Mandatory

ReferenceAlias Property Alias_JailDoor Auto Const Mandatory

ReferenceAlias Property Alias_JailTrigger Auto Const Mandatory
