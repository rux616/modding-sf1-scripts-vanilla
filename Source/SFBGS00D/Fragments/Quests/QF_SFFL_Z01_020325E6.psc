;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_Z01_020325E6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;------------------------------ [Quest Stage] ------------------------------

;Set up quest
   SetStage(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Failed to load code for fragment Fragment_Stage_0005_Item_00
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;------------------------------ STAGE 10 ------------------------------

;Teleport to Sehoy to start the quest

SetStage(120)

ObjectReference Sehoy = Alias_Sehoy.GetRef()
Game.GetPlayer().MoveTo(Sehoy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;------------------------------ STAGE 20 ------------------------------

;Teleport to Gabrielle's ship location after talking to Sehoy
SetStage(130)

ObjectReference Gabbie = Alias_Gabrielle.GetRef()
Game.GetPlayer().MoveTo(Gabbie)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;------------------------------ STAGE 30 ------------------------------

;Teleport to Sehoy after learning about Gabrielle's fate

ObjectReference Sehoy = Alias_Sehoy.GetRef()
Game.GetPlayer().MoveTo(Sehoy)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
;------------------------------ STAGE 105 ------------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Failed to load code for fragment Fragment_Stage_0110_Item_00
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;------------------------------ STAGE 120 ------------------------------

;Talk with Sehoy

ObjectREference Sehoy = alias_Sehoy.getreference()
Sehoy.SetValue(DockingPermission, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;------------------------------ STAGE 125 ------------------------------
SetObjectiveDisplayed(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;------------------------------ STAGE 130 ------------------------------
;Start SFFL_Z01_SE2
   SFFL_Z01_SE2.Start()
   SetObjectiveCompleted(125)
   SetObjectiveDisplayed(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;------------------------------ STAGE 140 ------------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0146_Item_00
Function Fragment_Stage_0146_Item_00()
;BEGIN CODE
;------------------------------ STAGE 146 ------------------------------
;Add Love Slate to Player's inventory and remove from Ship Inventory

ObjectReference LoveSlate = Alias_LoveSlate.GetRef()
ObjectReference ShipIn = ShipInventory.GetRef()

ShipIn.RemoveItem(LoveSlate)
Game.GetPlayer().Additem(LoveSlate, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0148_Item_00
Function Fragment_Stage_0148_Item_00()
;BEGIN CODE
;------------------------------ STAGE 148 ------------------------------
;Add Death Slate to Player's inventory and remove from Ship Inventory

ObjectReference DeathSlate = Alias_DeathSlate.GetRef()
ObjectReference ShipIn = ShipInventory.GetRef()

ShipIn.RemoveItem(DeathSlate)
Game.GetPlayer().Additem(DeathSlate, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;------------------------------ STAGE 150 ------------------------------

;save that the player picked up the Death Slate

If GetStageDone(160)
SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
;------------------------------ STAGE 160 ------------------------------

;save that the player picked up the Love Slate

If GetStageDone(150)
SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;------------------------------ STAGE 200 ------------------------------
;Rerun (or let stay running) SFFL_Z01_SE1 to get back to Sehoy

   SetObjectiveCompleted(140)
   SetObjectiveDisplayed(200)
   SetObjectiveDisplayed(201)

;Save point for Starborn Dialogue

Game.GetPlayer().SetValue(SFFL_Z01ForeknowledgeAV,1)

SetStage(201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;------------------------------ STAGE 250 ------------------------------

;Objective Completed
   SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;------------------------------ STAGE 255 ------------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;Failed to load code for fragment Fragment_Stage_0260_Item_00
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
;------------------------------ STAGE 270 ------------------------------

;If Player lied to Sehoy Complete the tell objective
   SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;Failed to load code for fragment Fragment_Stage_0280_Item_00
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;------------------------------ STAGE 300 ------------------------------


Utility.Wait(4)

;Set Stage to 999
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
;------------------------------ STAGE 305 ------------------------------


Utility.Wait(4)

;Set Stage to 999
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Failed to load code for fragment Fragment_Stage_0310_Item_00
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;------------------------------ STAGE 350 ------------------------------

;Fail stages if player is on those objectives
   if IsObjectiveDisplayed(125) == 1
      SetObjectiveFailed(125)
   Endif

   if IsObjectiveDisplayed(130) == 1
      SetObjectiveFailed(130)
   Endif

   if IsObjectiveDisplayed(140) == 1
      SetObjectiveFailed(140)
   Endif

   if IsObjectiveDisplayed(200) == 1
      SetObjectiveFailed(200)
   Endif

;Setstage to 9999
SetStage(9999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
;------------------------------ STAGE 999 ------------------------------
Utility.Wait(4)
SFFL_Z01_SE1.SetStage(800)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN CODE
;------------------------------ STAGE 9999 ------------------------------
SFFL_Z01_SE2.SetStage(1000)
SFFL_Z01_SE2.Stop()
SFFL_Z01_SE1.SetStage(1000)
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFFL_Z01_SE1 Auto Const

Quest Property SFFL_Z01_SE2 Auto Const

ReferenceAlias Property Alias_Sehoy Auto Const

ReferenceAlias Property Alias_GabrielleLocation Auto Const

ReferenceAlias Property Alias_LoveSlate Auto Const

ReferenceAlias Property Alias_DeathSlate Auto Const

ReferenceAlias Property ShipInventory Auto Const

ReferenceAlias Property Alias_Gabrielle Auto Const

ActorValue Property SFFL_Z01ForeknowledgeAV Auto Const

ActorValue Property DockingPermission Auto Const
