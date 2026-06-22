;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestAustinFQuest_00110F07 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader")
readerScript.CallFunction("GotoSuccessState", None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader")
readerScript.CallFunction("ResetIDCardReader", None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader")
readerScript.CallFunction("GotoLockdownState", None)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_IDReader Auto Const Mandatory
