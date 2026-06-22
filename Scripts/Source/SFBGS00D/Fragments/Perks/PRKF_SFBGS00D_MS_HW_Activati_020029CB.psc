;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Perks:PRKF_SFBGS00D_MS_HW_Activati_020029CB Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ObjectReference CellDoorRef = akTargetRef.GetLinkedRef(LinkCustom01)
CellDoorRef.SetLockLevel(0)
CellDoorRef.SetOpen(true)
akTargetRef.DisableNoWait()
SFBGS00D_MS_HW_Quest.SetStage(StageToSet)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const Mandatory

Int Property StageToSet Auto Const

Quest Property SFBGS00D_MS_HW_Quest Auto Const Mandatory
