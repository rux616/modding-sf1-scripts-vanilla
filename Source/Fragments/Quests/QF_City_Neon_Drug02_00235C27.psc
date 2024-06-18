;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Drug02_00235C27 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; Here are the research mats the player needs to discover the recipe to Amp
Game.GetPlayer().AddItem(Drug02_AmpResearch)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(100)
SetStage(150)
SetStage(200)
SetStage(250)
SetStage(260)
Game.GetPlayer().MoveTo(Alias_Valentina.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
; Does the Player know how to make Amp
If Game.IsResearchComplete(Drug_Research_PerformanceEnhancement_01) == 0
SetObjectiveDisplayed(150)
ElseIf Game.IsResearchComplete(Drug_Research_PerformanceEnhancement_01) == 1
SetObjectiveDisplayed(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(260)
Alias_JobTerminal.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveCompleted(260)
SetObjectiveDisplayed(300)

; Make Xenofresh public - so there's not trespassing
LC168Xenofresh.SetPublic(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
Drug02_275_ValentinaLibby.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(325)

; Give the player the Clean Suit
Game.GetPlayer().AddAliasedItem(Clothes_Hazmat_Xenofresh_Suit_01, Alias_CleanSuit)

;This is where Aurora Recipe is unlocked for Player on Pharma Stations
Drug02_AuroraMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
SetObjectiveCompleted(325)
SetObjectiveDisplayed(350)

; Walk and talk starts
Drug02_325_ValentinaWalkAndTalk.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
SetObjectiveDisplayed(375)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(375)
SetObjectiveDisplayed(410)

Alias_Valentina.GetActorRef().EvaluatePackage()
Utility.Wait(10)

SetStage(405)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN AUTOCAST TYPE City_Neon_Drug02_Script
Quest __temp = self as Quest
City_Neon_Drug02_Script kmyQuest = __temp as City_Neon_Drug02_Script
;END AUTOCAST
;BEGIN CODE
; Add the ingredients you have to grab
kmyQuest.AddItemsToHopper()

; Move the conveyor belt
Alias_ConveyorBelt.GetRef().PlayAnimation("play01")

; The scene controlling the timer starts
Drug02_425a_Aurora.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(410)
SetObjectiveDisplayed(420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveCompleted(420)
SetObjectiveDisplayed(430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(430)
SetObjectiveDisplayed(440)

; Move the conveyor belt
Alias_ConveyorBelt.GetRef().PlayAnimation("play02")

; Wait a little bit then start the game for real
Utility.Wait(5.0)

SetStage(440)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
City_Neon_Drug_Game.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(450)
SetObjectiveDisplayed(500)

; Valentina announces the break is over
Drug02_450_BreakTime.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
; Make Robie show up in the break room
Alias_Robie.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(575)

; Enable Bayu's guards
Alias_BayuGuards.EnableAll()

; Remove all the shop patrons
Alias_ShopPatrons.DisableAll()

; Move Benjamin to Yannick
Alias_BenjaminBayu.GetRef().MoveTo(Drug02_FinaleMarker_Bayu)
Alias_Yannick.GetRef().MoveTo(Drug02_FinaleMarker_Yannick)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
SetObjectiveCompleted(575)
SetObjectiveDisplayed(600)

; When you get near the guards - one talks
Drug02_575_GuardAlert.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0585_Item_00
Function Fragment_Stage_0585_Item_00()
;BEGIN CODE
Alias_BenjaminBayu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE City_Neon_Drug02_Script
Quest __temp = self as Quest
City_Neon_Drug02_Script kmyQuest = __temp as City_Neon_Drug02_Script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

Alias_BenjaminBayu.GetActorRef().EvaluatePackage()

; Start up the next quest in the line
City_Neon_Drug03.Start()
City_Neon_Drug03.SetActive()

;EVPs
Alias_BayuGuards.EvaluateAll()
Alias_BenjaminBayu.GetActorRef().EvaluatePackage()

; Flag this for New Game+
Game.GetPlayer().SetValue(Drug02_Foreknowledge_YannickBayuAV, 1.0)

; Unlock door and re-enable fast travel
kmyQuest.ReleasePlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Make all the guards go away
Alias_BayuGuards.EnableAll(FALSE)

; Make the shop patrons come back
Alias_ShopPatrons.EnableAll()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property Drug02_275_ValentinaLibby Auto Const Mandatory
Scene Property Drug02_325_ValentinaWalkAndTalk Auto Const Mandatory
Scene Property Drug02_450_BreakTime Auto Const Mandatory

ReferenceAlias Property Alias_CleanSuit Auto Const Mandatory
ReferenceAlias Property Alias_BenjaminBayu Auto Const Mandatory
ReferenceAlias Property Alias_Yannick Auto Const Mandatory
ReferenceAlias Property Alias_Robie Auto Const Mandatory

Quest Property City_Neon_Drug03 Auto Const Mandatory

ReferenceAlias Property Alias_Valentina Auto Const Mandatory

Quest Property City_Neon_Drug_Game Auto Const Mandatory

Scene Property Drug02_575_GuardAlert Auto Const Mandatory

RefCollectionAlias Property Alias_BayuGuards Auto Const Mandatory

ObjectReference Property Drug02_FinaleMarker_Bayu Auto Const Mandatory

ObjectReference Property Drug02_FinaleMarker_Yannick Auto Const Mandatory

LeveledItem Property Drug02_AmpResearch Auto Const Mandatory

ActorValue Property Drug02_Foreknowledge_YannickBayuAV Auto Const Mandatory

Cell Property LC168Xenofresh Auto Const Mandatory

ReferenceAlias Property Alias_ConveyorBelt Auto Const Mandatory

RefCollectionAlias Property Alias_ShopPatrons Auto Const Mandatory

ReferenceAlias Property Alias_JobTerminal Auto Const Mandatory

Armor Property Clothes_Hazmat_Xenofresh_Suit_01 Auto Const Mandatory

Message Property Drug02_AuroraMessage Auto Const Mandatory

Scene Property Drug02_425a_Aurora Auto Const Mandatory

ResearchProject Property Drug_Research_PerformanceEnhancement_01 Auto Const Mandatory
