;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_GG_Connections_0018E0F9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(UC_GG_Connect_DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(200)
Game.GetPlayer().Moveto(UC_GG_Connect_DebugMarker02)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if UC_GG_Connect_Misc.IsRunning()
  UC_GG_Connect_Misc.SetStage(1000)
endif
Alias_CourierCorpse.GetRef().Enable()
Alias_MurderEnableMarker.GetRef().Enable()
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(200)

;Turn on all the scanners
(Alias_ScanPoints as UC_GG_Connect_ScannerRefColScript).BlockScannerState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_Bonifac.GetRef().Disable()

SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)

City_GG_Connections_Companion_250_RxnToCorpse.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveCompleted(120)
SetObjectiveCompleted(200)
SetObjectiveCompleted(250)
SetObjectiveDisplayed(300)

;SF1416: If the player times it right, this scene can start even if the 
;player's not around
if City_GG_Connections_Helena_120_Leads.IsPlaying()
  City_GG_Connections_Helena_120_Leads.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Package.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
UC_GG_Connect_HelenaKnowsCourierIsDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Turn off all the scanners
(Alias_ScanPoints as UC_GG_Connect_ScannerRefColScript).BlockScannerState(true)

City_GG_Mark.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CourierSlate Auto Const Mandatory

ReferenceAlias Property Alias_CourierCorpse Auto Const Mandatory

ObjectReference Property UC_GG_Connect_DebugMarker01 Auto Const Mandatory

ObjectReference Property UC_GG_Connect_DebugMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_Bonifac Auto Const Mandatory

Message Property UC_GG_Connect_Debug_RoomFullOfBlood Auto Const Mandatory

Quest Property City_GG_Mark Auto Const Mandatory

Scene Property City_GG_Connections_Helena_110_IntercomScene Auto Const Mandatory

ReferenceAlias Property Alias_Package Auto Const Mandatory

Scene Property City_GG_Connections_Companion_250_RxnToCorpse Auto Const Mandatory

Quest Property UC_GG_Connect_Misc Auto Const Mandatory

RefCollectionAlias Property Alias_ScanPoints Auto Const Mandatory

GlobalVariable Property UC_GG_Connect_HelenaKnowsCourierIsDead Auto Const Mandatory

ReferenceAlias Property Alias_MurderEnableMarker Auto Const Mandatory

Scene Property City_GG_Connections_Helena_120_Leads Auto Const Mandatory
