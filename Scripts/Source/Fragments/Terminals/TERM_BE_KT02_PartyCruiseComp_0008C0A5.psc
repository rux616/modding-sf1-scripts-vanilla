;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_BE_KT02_PartyCruiseComp_0008C0A5 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
BE_KT02.SetShipGravity(0)
SoundEffect.Play(Game.GetPlayer())
Alias_EnableMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
BE_KT02.SetShipGravity(1)
SoundEffect.Play(Game.GetPlayer())
Alias_EnableMarker.GetRef().EnableNoWait()
Alias_AllCrew.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bescript Property BE_KT02 Auto Const Mandatory

WwiseEvent Property SoundEffect Auto Const Mandatory

ReferenceAlias Property Alias_EnableMarker Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory
