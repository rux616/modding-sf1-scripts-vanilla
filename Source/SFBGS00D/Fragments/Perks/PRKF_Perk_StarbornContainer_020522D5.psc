;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Perks:PRKF_Perk_StarbornContainer_020522D5 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
(SQ_StarbornContainer as SFBGS00D:SQ_StarbornContainerScript).TryToUpgradeStarbornContainer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SQ_StarbornContainer Auto Const Mandatory
