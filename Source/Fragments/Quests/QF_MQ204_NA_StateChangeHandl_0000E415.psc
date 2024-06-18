;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ204_NA_StateChangeHandl_0000E415 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;enable weather
;UC04_PlayerOnly_WeatherTrigger.Enable()

;turn off spaceport crowds
UC04_DisableSpaceportCrowds.SetValueInt(1)

;turn on signs
UC04_Spaceport_WarningSign_EnableMarker.disable()

;turn on geometry
UC03_Spaceport_EnableMArker.Disable()

;turn on actors
MQ204_Spaceport_EnableMarker_Actors.Disable()

;chisolm scene should be disabled for now
If FFNewAtlantis01.IsRunning()
  FFNewAtlantis01.SetStage(2)
EndIf

;Tommy bitlow should be disabled for now
Actor TommyREF = Alias_TommyBitlow.GetActorRef()
TommyREF.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQ204_NA_StateChangeHandlerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If UC04_AttackActive.GetValueInt() == 0
  ;reset spaceport crowds
  UC04_DisableSpaceportCrowds.SetValueInt(0)
  ;turn off signs
  UC04_Spaceport_WarningSign_EnableMarker.Enable()
  ;turn off special statics
  UC03_Spaceport_EnableMArker.Enable()
  ;turn off special actors
  MQ204_Spaceport_EnableMarker_Actors.Enable()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;make sure we remove music
_MUSExplore_WwiseSilence.Remove()

;chisolm scene should be turned back on
If FFNewAtlantis01.IsRunning()
  FFNewAtlantis01.SetStage(3)
EndIf

If CF05.GetStageDone(703)
  CF05.SetStage(704)
EndIF

;Tommy bitlow should be enabled
Actor TommyREF = Alias_TommyBitlow.GetActorRef()
TommyREF.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Activator Property UC04_PlayerOnly_WeatherTrigger Auto Const Mandatory

GlobalVariable Property UC04_DisableSpaceportCrowds Auto Const Mandatory

ObjectReference Property UC04_Spaceport_WarningSign_EnableMarker Auto Const Mandatory

ObjectReference Property UC03_Spaceport_EnableMarker Auto Const Mandatory

Scene Property MQ204_NA_StateChangeHandlerScene Auto Const Mandatory

MusicType Property _MUSExplore_WwiseSilence Auto Const Mandatory

ObjectReference Property MQ204_Spaceport_EnableMarker_Actors Auto Const Mandatory

Quest Property FFNewAtlantis01 Auto Const Mandatory

ReferenceAlias Property Alias_TommyBitlow Auto Const Mandatory

GlobalVariable Property UC04_AttackActive Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory
