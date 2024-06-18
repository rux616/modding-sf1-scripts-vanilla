;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_CL02_0012E145 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;bagMan jumps in after beacon activates
;once ship is loaded, test for distance to player
;if successful, head towards player, go to next stage

; Have a message pop up to orient the player
SE_CL02Message.Show()

; Disable activation of the beacon 
Alias_Beacon.GetRef().BlockActivation(TRUE)

utility.wait(4)

bagMan.GetShipRef().EnableWithGravJump()
  
if bagMan.GetShipRef().WaitFor3DLoad()
  bagMan.GetShipRef().EvaluatePackage()
else
  ;3d didn't load, so fallback here?
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;hails player and starts the scenes

Utility.Wait(1.3)
bagMan_Hail.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;bagman jumps out based on player response

utility.wait(4)
bagMan.GetShipRef().DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;bagman opens shop based on player response
;figure out how to get a ship to vend

;ships jumps out after player done venderatoring
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;bagman becomes hostile based on player response

bagMan.GetShipRef().StartCombat(Alias_Player.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property bagMan Auto Const

Scene Property bagMan_Hail Auto Const

SpaceshipReference Property Alias_bagMan Auto Const

ReferenceAlias Property Alias_Player Auto Const

ReferenceAlias Property Alias_Beacon Auto Const Mandatory

Message Property SE_CL02Message Auto Const Mandatory
