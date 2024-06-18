;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewHomesteadZ01_0021710B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
FFNewHomesteadZ01Misc.SetStage(1000)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_Bill.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
FFNewHomesteadZ01_Bill_Tour02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
SetObjectiveDisplayed(300)
FFNewHomesteadZ01_Bill_Tour03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400)
FFNewHomesteadZ01_Bill_Tour04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(450)
SetObjectiveDisplayed(500)
FFNewHomesteadZ01_Bill_Tour05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(550)
SetObjectiveDisplayed(600)
FFNewHomesteadZ01_Bill_Tour06.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(650)
SetObjectiveDisplayed(700)
FFNewHomesteadZ01_Bill_Tour07.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(750)
SetObjectiveDisplayed(800)
FFNewHomesteadZ01_Bill_Tour08.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(850)
SetObjectiveDisplayed(900)
FFNewHomesteadZ01_Bill_Tour09.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, FFNewHomesteadZ01_TourTip.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(FFNewHomesteadZ01_Foreknowledge_AV, 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property FFNewHomesteadZ01_TourTip Auto Const Mandatory

Quest Property FFNewHomesteadZ01Misc Auto Const Mandatory

ReferenceAlias Property Alias_Bill Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour01 Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour02 Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour03 Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour04 Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour05 Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour06 Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour07 Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour08 Auto Const Mandatory

Scene Property FFNewHomesteadZ01_Bill_Tour09 Auto Const Mandatory

ActorValue Property FFNewHomesteadZ01_Foreknowledge_AV Auto Const Mandatory
