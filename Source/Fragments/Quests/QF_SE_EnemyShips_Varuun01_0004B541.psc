;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_EnemyShips_Varuun01_0004B541 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_Enemy01.GetShipRef().SetValue(Aggression, 0)
Alias_Enemy02.GetShipRef().SetValue(Aggression, 0)
Alias_Enemy03.GetShipRef().SetValue(Aggression, 0)
Alias_Enemy04.GetShipRef().SetValue(Aggression, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Utility.wait(10)
setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Enemy01.GetShipRef().SetValue(Aggression, 1)
Alias_Enemy02.GetShipRef().SetValue(Aggression, 1)
Alias_Enemy03.GetShipRef().SetValue(Aggression, 1)
Alias_Enemy04.GetShipRef().SetValue(Aggression, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Enemy01 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy02 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy03 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy04 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
