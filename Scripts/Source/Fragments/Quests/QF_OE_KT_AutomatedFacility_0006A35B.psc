;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_AutomatedFacility_0006A35B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_NPC_Group00.KillAll()
Alias_NPC00.GetActorRef().Kill()
Alias_NPC01.GetActorRef().Kill()
Alias_NPC02.GetActorRef().Kill()
Alias_NPC03.GetActorRef().Kill()
Alias_NPC04.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_NPC_Group00.RemovefromFaction(PlayerEnemyFaction)
Alias_NPC_Group00.AddtoFaction(REPlayerFriend)
Alias_NPC_Group00.SetValue(Aggression, 0)
Alias_NPC_Group00.StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_NPC_Group00.RemoveFromFaction(REPlayerFriend)
Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group00.SetValue(Aggression, 1)
Alias_NPC_Group00.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_01
Function Fragment_Stage_0055_Item_01()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
OE_KT_AutomatedFacility_Scene01.Stop()
OE_KT_AutomatedFacility_Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
OE_KT_AutomatedFacility_Scene01.Start()

Alias_NPC_Group00.AddRef(Alias_NPC00.GetRef())
Alias_NPC_Group00.AddRef(Alias_NPC01.GetRef())
Alias_NPC_Group00.AddRef(Alias_NPC02.GetRef())
Alias_NPC_Group00.AddRef(Alias_NPC03.GetRef())
Alias_NPC_Group00.AddRef(Alias_NPC04.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Terminal.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property OE_KT_AutomatedFacility_Scene01 Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group00 Auto Const Mandatory

ReferenceAlias Property Alias_NPC00 Auto Const Mandatory

ReferenceAlias Property Alias_NPC01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC02 Auto Const Mandatory

ReferenceAlias Property Alias_NPC03 Auto Const Mandatory

ReferenceAlias Property Alias_NPC04 Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Scene Property OE_KT_AutomatedFacility_Scene02 Auto Const Mandatory

ReferenceAlias Property Alias_Terminal Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

RefCollectionAlias Property Alias_Markers_Corpses Auto Const Mandatory
