;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_Z01_SE2_020352AB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Kill Gabrielle

Actor Gabbs = Alias_Gabrielle.GetActorRef()

Gabbs.Kill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_GabrielleShip Auto Const

ReferenceAlias Property Alias_GabrielleLocation Auto Const

ReferenceAlias Property Alias_SE2LoveSlate Auto Const

ReferenceAlias Property Alias_SE2DeathSlate Auto Const

ReferenceAlias Property Alias_01LoveSlate Auto Const

ReferenceAlias Property Alias_01DeathSlate Auto Const

ReferenceAlias Property Alias_Gabrielle Auto Const
