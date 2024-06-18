;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestCFOutfit_003EA3D7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_SysDef.GetRef().DisableNoWait()
Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet)
Alias_Delgado.GetRef().MoveTo(Game.GetPlayer())
Alias_Mathis.GetRef().MoveTo(Game.GetPlayer())
Alias_Naeva.GetRef().MoveTo(Game.GetPlayer())
Alias_Estelle.GetRef().EnableNoWait()
Alias_Estelle.GetRef().MoveTo(Game.GetPlayer())
Alias_Huan.GetRef().EnableNoWait()
Alias_Huan.GetRef().MoveTo(Game.GetPlayer())
Alias_Adler.GetRef().EnableNoWait()
Alias_Adler.GetRef().MoveTo(Game.GetPlayer())

Alias_Rokov.GetActorRef().SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03)
Alias_Rokov.GetRef().MoveTo(Game.GetPlayer())
Alias_Rokov.GetRef().DisableNoWait()
Alias_Rokov.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Delgado Auto Const Mandatory

ReferenceAlias Property Alias_Estelle Auto Const Mandatory

ReferenceAlias Property Alias_Mathis Auto Const Mandatory

ReferenceAlias Property Alias_Rokov Auto Const Mandatory

ReferenceAlias Property Alias_Huan Auto Const Mandatory

ReferenceAlias Property Alias_Adler Auto Const Mandatory

ReferenceAlias Property Alias_Naeva Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

ActorBase Property RokovBase Auto Const Mandatory

Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const Mandatory

ReferenceAlias Property Alias_SysDef Auto Const Mandatory
