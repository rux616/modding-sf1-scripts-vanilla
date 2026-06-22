;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueECSConstant_00360D4F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_DianaBrackenridge.GetRef().MoveTo(Alias_DianaIntroMarker01.GetRef())
Alias_BomaniRida.GetRef().MoveTo(Alias_BomaniIntroMarker01.GetRef())
Alias_MabhutiDaCosta.GetRef().MoveTo(Alias_MabhutiIntroMarker01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
DialogueECS_Establishing01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DialogueECS_Establishing01.Stop()
DialogueECS_Establishing02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
DialogueECS_Establishing03.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BomaniRida Auto Const Mandatory

ReferenceAlias Property Alias_DianaBrackenridge Auto Const Mandatory

ReferenceAlias Property Alias_MabhutiDaCosta Auto Const Mandatory

ReferenceAlias Property Alias_IntroGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_IntroGuard02 Auto Const Mandatory

ReferenceAlias Property Alias_IntroGuard03 Auto Const Mandatory

ReferenceAlias Property Alias_DianaIntroMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_BomaniIntroMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_MabhutiIntroMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_DianaBridgeMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_BomaniBridgeMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_MabhutiHomeMarker01 Auto Const Mandatory

Scene Property DialogueECS_Establishing01 Auto Const Mandatory

Scene Property DialogueECS_Establishing02 Auto Const

Scene Property DialogueECS_Establishing03 Auto Const
