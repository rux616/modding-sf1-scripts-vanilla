;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_OldXenoweapon_00050CA4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
Actor Terrormorph = Alias_BonusTerrormorphCreature.GetActorRef()
ObjectReference Marker = Alias_AmbushSpawnMarker.GetRef()

If Terrormorph && Marker
   Terrormorph.MoveTo(Marker)
   Terrormorph.Enable()
   Terrormorph.Kill()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
If GetStageDone(220) 
   SetStage(400)
ElseIf GetStageDone(210)
   SetStage(405)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetObjectiveDisplayed(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

If Utility.RandomInt(1,2) == 1
   SetStage(450)
EndIf

If GetStageDone(420) && GetStageDone(430)
   SetStage(600) 
Else
   SetObjectiveDisplayed(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

If Utility.RandomInt(1,2) == 1
   SetStage(450)
EndIf

If GetStageDone(410) && GetStageDone(430)
   SetStage(600) 
ElseIf !GetStageDone(410) && !GetStageDone(430) 
   If Utility.RandomInt(0,1) == 0
      SetStage(410)
   Else
      SetStage(430)
   EndIf 
ElseIf GetStageDone(410)
   SetStage(430) 
Else
   SetStage(410)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

If Utility.RandomInt(1,2) == 1
   SetStage(450)
EndIf

If GetStageDone(410) && GetStageDone(420)
   SetStage(600) 
ElseIf !GetStageDone(410) && !GetStageDone(420) 
   If Utility.RandomInt(0,1) == 0
      SetStage(410)
   Else
      SetStage(420)
   EndIf 
ElseIf GetStageDone(410)
   SetStage(420) 
Else
   SetStage(410)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Actor Terrormorph = Alias_TerrormorphCreature.GetActorRef()
ObjectReference AmbushFurniture = Alias_AmbushSpawnMarker.GetRef()

SetObjectiveDisplayed(450)

If Terrormorph && AmbushFurniture 
   Terrormorph.MoveTo(AmbushFurniture)
   Terrormorph.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveDisplayed(900)

If !GetStageDone(450) 
   If Utility.RandomInt(1,3) == 1
      SetStage(450)
   EndIf 
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
If GetStageDone(205) 
   If Utility.RandomInt(1,5) == 1
      SetStage(450) 
   EndIf
ElseIf Utility.RandomInt(1,2) == 1
   SetStage(450)
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(900)
SetObjectiveCompleted(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(900)
SetObjectiveCompleted(475)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
If GetStageDone(450) || GetStageDone(475)
   SetStage(450)
   SetStage(475)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
If !GetStageDone(450) && Utility.RandomInt(1,3) == 1
   SetStage(450)
EndIf 

If !GetStageDone(475) && Utility.RandomInt(1,3) == 1
   SetStage(475)
EndIf 

If !GetStageDone(475) && !GetStageDone(450)
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
If !GetStageDone(450) && Utility.RandomInt(1,10) == 1
   SetStage(450)
EndIf 

If !GetStageDone(475) && Utility.RandomInt(1,10) == 1
   SetStage(475)
EndIf 

If !GetStageDone(475) && !GetStageDone(450)
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; NPCs
ReferenceAlias Property Alias_AcelesCreature Auto Const Mandatory
ReferenceAlias Property Alias_BonusTerrormorphCreature Auto Const Mandatory
ReferenceAlias Property Alias_TerrormorphCreature Auto Const Mandatory

; Markers
ReferenceAlias Property Alias_AmbushSpawnMarker Auto Const Mandatory
ReferenceAlias Property Alias_NPCSearchingFloorFurniture Auto Const Mandatory
ReferenceAlias Property Alias_AmbushDecoySpawnMarkerA Auto Const Mandatory
ReferenceAlias Property Alias_AmbushDecoySpawnMarkerB Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory
