;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CFKey_TerminalQuest_001FE5C5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_TerminalRandomizer.ForceRefTo(Alias_Terminal.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
CFKey_PublicAccessTerminalGlobal.SetValue(Utility.RandomInt(0,20))
Alias_TerminalRandomizer.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CFKey_PublicAccessTerminalGlobal Auto Const Mandatory

ReferenceAlias Property Alias_TerminalRandomizer Auto Const Mandatory

ReferenceAlias Property Alias_Terminal Auto Const Mandatory
