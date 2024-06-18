;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_AustinF_HeatLeechRobot_000F31DC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Robot.GetActorRef().SetUnconscious()
Alias_HeatLeech_A1.GetActorRef().Disable()
Alias_HeatLeech_A3.GetActorRef().Disable()
Alias_HeatLeech_B1.GetActorRef().Disable()
Alias_HeatLeech_B3.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Robot.GetActorRef().SetUnconscious()

SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
If Utility.RandomInt(0,100) < Game.GetPlayer().GetLevel()
   Alias_HeatLeech_A1.GetActorRef().Enable()
EndIf 

If Utility.RandomInt(0,100) < Game.GetPlayer().GetLevel()
   Alias_HeatLeech_B1.GetActorRef().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Robot.GetActorRef().SetUnconscious(False)
Alias_Robot.GetActorRef().EvaluatePackage()

SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
If Utility.RandomInt(0,100) < Game.GetPlayer().GetLevel()
   Alias_HeatLeech_A3.GetActorRef().Enable()
EndIf 

Alias_HeatLeech_B3.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HeatLeech_A1 Auto Const Mandatory

ReferenceAlias Property Alias_HeatLeech_A3 Auto Const Mandatory

ReferenceAlias Property Alias_HeatLeech_B1 Auto Const Mandatory

ReferenceAlias Property Alias_HeatLeech_B3 Auto Const Mandatory

ReferenceAlias Property Alias_Robot Auto Const Mandatory
