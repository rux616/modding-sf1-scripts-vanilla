;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB18c_00042C53 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Spawn Genghis Khan in view

SpaceshipReference sShip
SpaceshipReference sPlayer = Alias_PlayerShip.GetRef() as SpaceshipReference 
sShip = sPlayer.PlaceShipAtMeOffset(GenghisBaseShip, 50.0, 750.0, abInitiallyDisabled=TRUE, akAliasToFill=Alias_GenghisKhan)
sShip.EnableWithGravJumpNoWait()
sShip.SetValue(DockingPermission, 4.0)  ; No docking with Genghis Khan
;sShip.SetValue(Aggression, 2.0)

; Play an intro line
Utility.Wait(10.0)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SE_FAB18c_100_SpawnLine.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Make his ship go hostile
SpaceshipReference sGenghis = Alias_GenghisKhan.GetRef() as SpaceshipReference 
SpaceshipReference sPlayer = Alias_PlayerShip.GetRef() as SpaceshipReference 
sGenghis.RemoveFromAllFactions()
sGenghis.SetValue(Aggression, 3.0)
sGenghis.StartCombat(sPlayer)
sGenghis.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Make it so Genghis won't show up again
MS02_GenghisReactivity.SetValue(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_GenghisKhan Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

SpaceshipBase Property GenghisBaseShip Auto Const

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property MS02_GenghisReactivity Auto Const Mandatory

Scene Property SE_FAB18c_100_SpawnLine Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
