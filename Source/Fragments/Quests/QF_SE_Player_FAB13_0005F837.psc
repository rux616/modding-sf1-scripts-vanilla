;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB13_0005F837 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SpaceshipReference oTarg = Alias_SingingCaptain.GetRef() as SpaceshipReference
oTarg.SetValue(Aggression, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; Now the Captain sings

if ( SE_FAB13_SeaChanty.GetValue() == 0 )
  SE_FAB13_050_SeaShanty.Start()
elseif ( SE_FAB13_SeaChanty.GetValue() == 1 )
  SE_FAB13_060_SeaShanty02.Start()
else
  SE_FAB13_070_SeaShanty03.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Now the Captain sings

if ( SE_FAB13_SeaChanty.GetValue() == 0 )
  SE_FAB13_050_SeaShanty.Start()
elseif ( SE_FAB13_SeaChanty.GetValue() == 1 )
  SE_FAB13_060_SeaShanty02.Start()
else
  SE_FAB13_070_SeaShanty03.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Now he fast travels away - bye-de-bye
Utility.Wait(2.0)
(Alias_SingingCaptain.GetRef() as SpaceshipReference).DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Cycle the Sea Shanty
if ( SE_FAB13_SeaChanty.GetValue() == 2 )
  SE_FAB13_SeaChanty.SetValue(0)
else
  SE_FAB13_SeaChanty.Mod(1.0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SE_FAB13_050_SeaShanty Auto Const Mandatory

ReferenceAlias Property Alias_SingingCaptain Auto Const Mandatory

GlobalVariable Property SE_FAB13_SeaChanty Auto Const Mandatory

Scene Property SE_FAB13_060_SeaShanty02 Auto Const Mandatory

Scene Property SE_FAB13_070_SeaShanty03 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
