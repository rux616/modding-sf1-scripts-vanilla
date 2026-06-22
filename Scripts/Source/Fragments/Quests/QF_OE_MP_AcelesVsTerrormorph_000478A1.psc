;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_AcelesVsTerrormorph_000478A1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
If OEDebug.GetValue() == 0
   SetStage(5) 
Else
   SetStage(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; Determine Main Terrormorph Difficulty
If Utility.RandomInt(1,3) == 1
   SetStage(10) 
Else 
   SetStage(20)
EndIf

; Determine whether there's an add
If Utility.RandomInt(1,4) == 1
   SetStage(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph.GetRef()
ObjectReference Terrormorph = Alias_Terrormorph_Main.GetRef()

If Terrormorph && AmbushFurniture
   Terrormorph.Enable()
   Terrormorph.MoveTo(AmbushFurniture)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph.GetRef()
ObjectReference Terrormorph = Alias_Terrormorph_Alt.GetRef()

If Terrormorph && AmbushFurniture
   Terrormorph.Enable()
   Terrormorph.MoveTo(AmbushFurniture)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If GetStageDone(30)
   SetStage(210)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph_Add.GetRef()
ObjectReference Terrormorph = Alias_Terrormorph_Add.GetRef()

If Terrormorph && AmbushFurniture
   Terrormorph.Enable()
   Terrormorph.MoveTo(AmbushFurniture)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Terrormorph_Main Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Alt Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Add Auto Const Mandatory

GlobalVariable Property OEDebug Auto Const Mandatory

ReferenceAlias Property Alias_Furniture_Ambush_Terrormorph Auto Const Mandatory

ReferenceAlias Property Alias_Furniture_Ambush_Terrormorph_Add Auto Const Mandatory
