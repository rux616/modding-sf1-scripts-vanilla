;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_LC088_1010_KibweConfronta_00270F75 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
DRS_QST_CF08_ShipA_VerticalA_Open.Play(Alias_Ops_EntryDoor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WwiseEvent Property DRS_QST_CF08_ShipA_VerticalA_Open Auto Const Mandatory

ReferenceAlias Property Alias_Ops_EntryDoor Auto Const
