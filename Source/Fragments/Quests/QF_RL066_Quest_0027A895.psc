;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RL066_Quest_0027A895 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;int instanceMachine = wwe_Machine.Play(MachineSound)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
LC178_Sound02.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
LC178_Sound01.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
LC178_Sound03.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;disable sound
;play shutdown event on sound
MachineSound.Disable()
;int instanceMachine = wwe_Machine.Play(MachineSound)
;WwiseEvent.StopInstance(instanceMachine)
utility.wait(3.0)
EnableMarker.disable()
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MachineSound Auto Const

WwiseEvent Property wwe_Machine Auto Const

ObjectReference Property enableMarker Auto Const

ObjectReference Property LC178_Sound01 Auto Const

ObjectReference Property LC178_Sound02 Auto Const

ObjectReference Property LC178_Sound03 Auto Const
