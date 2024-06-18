;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ101LandingEncounter01_00068EA8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;enable all pirates
Alias_Pirate01.GetRef().EnableNoWait()
Alias_Pirate02.GetRef().EnableNoWait()
Alias_Pirate03.GetRef().EnableNoWait()
Alias_Pirate04.GetRef().EnableNoWait()
Alias_Pirate05.GetRef().EnableNoWait()
Alias_Pirate06.GetRef().EnableNoWait()
Alias_Pirate07.GetRef().EnableNoWait()

Actor player = Game.GetPlayer() 

Alias_Pirate01.GetActorRef().StartCombat(player)
Alias_Pirate02.GetActorRef().StartCombat(player)
Alias_Pirate03.GetActorRef().StartCombat(player)
Alias_Pirate04.GetActorRef().StartCombat(player)
Alias_Pirate05.GetActorRef().StartCombat(player)
Alias_Pirate06.GetActorRef().StartCombat(player)
Alias_Pirate07.GetActorRef().StartCombat(player)

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_AllPiratesRefColl Auto Const Mandatory

ReferenceAlias Property Alias_Pirate01 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate02 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate03 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate04 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate05 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate06 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate07 Auto Const Mandatory
