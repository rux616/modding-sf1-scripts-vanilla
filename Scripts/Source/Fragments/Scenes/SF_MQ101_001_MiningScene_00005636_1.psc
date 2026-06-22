;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_001_MiningScene_00005636_1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Game.HideTitleSequenceMenu()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
(VecteraMineElevator as ElevatorMasterScript).ResetElevator()
ElevatorStaticREF.PlayAnimation("FXLightsOff")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_Begin
Function Fragment_Phase_09_Begin()
;BEGIN CODE
Game.ShowTitleSequenceMenu()
Game.StartTitleSequence("bgs_anim")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN CODE
Game.StartTitleSequence("game_logo_anim")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN CODE
Game.StartTitleSequence("LocationCrawl_anim")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_End
Function Fragment_Phase_11_End()
;BEGIN CODE
VecteraElevatorButtonREF.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_16_Begin
Function Fragment_Phase_16_Begin()
;BEGIN CODE
ElevatorStaticREF.PlayAnimation("FXLightsOn")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ElevatorStaticREF Auto Const Mandatory

ObjectReference Property VecteraMineElevator Auto Const Mandatory

ObjectReference Property VecteraElevatorButtonREF Auto Const Mandatory

ReferenceAlias Property Heller Auto Const

ReferenceAlias Property Lin Auto Const

Armor Property Spacesuit_Miner_Backpack Auto Const Mandatory

Armor Property Spacesuit_Miner_Helmet Auto Const Mandatory

MusicType Property MUSGenesisSpecialCardTitleOpening Auto Const Mandatory
