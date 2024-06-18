;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_ChowTime_00076277 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
Utility.Wait(0.5)
OE_KT_ChowTime_Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Utility.Wait(0.5)
OE_KT_ChowTime_Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Utility.Wait(0.5)
OE_KT_ChowTime_Scene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Utility.Wait(0.5)
OE_KT_ChowTime_Scene04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Food_Any)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor RangerRef = Alias_NPC_Ranger.GetActorRef()
RangerRef.SetOutfit(Outfit_Freestar_Militia_Hat)

SetStage(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
int random = Utility.RandomInt()

if random > 0
    SetStage(20)
else
    Alias_NPC_Ranger.GetRef().DisableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property OE_KT_ChowTime_Scene01 Auto Const Mandatory

Scene Property OE_KT_ChowTime_Scene02 Auto Const Mandatory

Scene Property OE_KT_ChowTime_Scene03 Auto Const Mandatory

Scene Property OE_KT_ChowTime_Scene04 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Ranger Auto Const Mandatory

LeveledItem Property LL_Food_Any Auto Const Mandatory

Scene Property OE_KT_MoveCustomMarkers Auto Const Mandatory

Outfit Property Outfit_Freestar_Militia_Hat Auto Const Mandatory

VoiceType Property MarineMale01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Captain Auto Const Mandatory
