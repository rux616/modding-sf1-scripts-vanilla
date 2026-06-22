;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ_HunterPreMQ106_0021B201 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;move Hunter to New Atlantis

Actor HunterREF = Alias_Hunter.GetActorRef()
HunterREF.Disable()
HunterREF.moveto(PreMQ106_NA_HunterMarker)
HunterRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;move to Akila
Actor HunterREF = Alias_Hunter.GetActorRef()

HunterREF.Disable()
HunterREF.moveto(PreMQ106_Akila_HunterMarker)
HunterREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_Hunter.GetActorRef()
HunterREF.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;scripting fires in his alias script then calls this stage
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_Hunter.GetActorRef()
HunterREF.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

ObjectReference Property MQHoldingCellCenterMarker Auto Const Mandatory

ObjectReference Property PreMQ106_NA_HunterMarker Auto Const Mandatory

ObjectReference Property PreMQ106_Akila_HunterMarker Auto Const Mandatory
