;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_LC088_Key_600_OperationsI_003AD201 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open.Play(Alias_Ops_EntryDoor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WwiseEvent Property DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open Auto Const Mandatory

ReferenceAlias Property Alias_Ops_EntryDoor Auto Const
