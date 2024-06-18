;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB15_00057FE8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Play the reaction scene
Utility.Wait(5.0)
SE_FAB15_100_MantisRecognized.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Break off all fighting
SpaceshipReference srTarg = Alias_Spacer01.GetRef() as SpaceshipReference 
srTarg.AddToFaction(CaptiveFaction)
srTarg.StopCombat()

srTarg = Alias_Spacer02.GetRef() as SpaceshipReference 
srTarg.AddToFaction(CaptiveFaction)
srTarg.StopCombat()

srTarg = Alias_Spacer03.GetRef() as SpaceshipReference 
srTarg.AddToFaction(CaptiveFaction)
srTarg.StopCombat()

srTarg = Alias_Merchant.GetRef() as SpaceshipReference 
srTarg.AddToFaction(CaptiveFaction)
srTarg.StopCombat()
srTarg.SetEssential(FALSE)   ; Now the player can kill the ship if he likes
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; The spacers grav jump out
SpaceshipReference srTarg = Alias_Spacer01.GetRef() as SpaceshipReference 
srTarg.DisableWithGravJumpNoWait()

Utility.wait(1)

srTarg = Alias_Spacer02.GetRef() as SpaceshipReference 
srTarg.DisableWithGravJumpNoWait()

Utility.wait(1)

srTarg = Alias_Spacer03.GetRef() as SpaceshipReference 
srTarg.DisableWithGravJumpNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Merchant ships leaves
SpaceshipReference srTarg = Alias_Merchant.GetRef() as SpaceshipReference 
srTarg.DisableWithGravJumpNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 300)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SE_FAB15_100_MantisRecognized Auto Const Mandatory

ReferenceAlias Property Alias_Spacer01 Auto Const Mandatory

ReferenceAlias Property Alias_Spacer02 Auto Const Mandatory

ReferenceAlias Property Alias_Spacer03 Auto Const Mandatory

ReferenceAlias Property Alias_Merchant Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory
