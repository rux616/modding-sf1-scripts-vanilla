;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueParadiso_00263194 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()

myPlayer.MoveTo(Alias_Emilian.GetRef())
myPlayer.AddPerk(Security)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Dirk.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Kumar.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_ChiefJiro.GetRef())
TestGoToSpaceQuest.SetStage(20)
MS06.SetStage(1710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
DialogueParadiso_PD_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set PD_VisitationCount to 2 for Viator's Hellos
PD_VisitationCount.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
;Remove credits and add a value to 
Game.GetPlayer().RemoveItem(Credits, PD_EnhanceSpecialPrice.GetValue() as Int)
PD_EnhanceSpecialVouchers.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
DialogueParadiso_PD_Keavy_Intro.Start()

;Sets an objective to speak with Keavy before entering the board room.
If MS06.IsRunning()
	MS06.SetStage(690)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
If MS06.GetStageDone(690) && !MS06.GetStageDone(691)
	MS06.SetStage(691)
EndIf

ObjectReference myDoor = Alias_BoardRoomDoor.GetRef()
myDoor.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
PD_PlayerHasHotelRoomDiscount.SetValue(1)

;Set up the 20% discount
PD_Hotel_RoomCost_Daily.SetValue(PD_Hotel_RoomCost_Daily.GetValue() * 0.8)
PD_Hotel_RoomCost_Weekly.SetValue(PD_Hotel_RoomCost_Weekly.GetValue() * 0.8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
DialogueParadiso_PD_Boardroom_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_00
Function Fragment_Stage_1101_Item_00()
;BEGIN CODE
If !FFParadisoZ01.IsRunning() && !FFParadisoZ01.IsCompleted()
	FFParadisoZ01Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1103_Item_00
Function Fragment_Stage_1103_Item_00()
;BEGIN CODE
Alias_Jacquotte.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
FFParadisoZ01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
If !FFParadisoZ02.IsRunning() && !FFParadisoZ02.IsCompleted()
	FFParadisoZ02Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
FFParadisoZ02Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1301_Item_00
Function Fragment_Stage_1301_Item_00()
;BEGIN CODE
If !FFParadisoZ03.IsRunning() && !FFParadisoZ03.IsCompleted()
	FFParadisoZ03Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
FFParadisoZ03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN CODE
FFParadisoZ03.Start()
FFParadisoZ03.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1402_Item_00
Function Fragment_Stage_1402_Item_00()
;BEGIN CODE
If !FFParadisoZ04.IsRunning() && !FFParadisoZ04.IsCompleted()
	FFParadisoZ04Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1410_Item_00
Function Fragment_Stage_1410_Item_00()
;BEGIN CODE
FFParadisoZ04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2010_Item_00
Function Fragment_Stage_2010_Item_00()
;BEGIN CODE
;Set the stage on DialogueECSConstant in order to move named NPCs over 
;to Paradiso.
DialogueECSConstant.SetStage(1000)

;Disable some Paradiso NPCs and Enable some ECS Constant NPCs 
;to replace them
Alias_NPCsToDisableExt.DisableAll()
Alias_NPCsToEnableExt.EnableAll()
Alias_ECSTransplantSlate.GetRef().Enable()

;Add the named ECS Constant NPCs to the Ref Collection before 
;making changes to their factions
Alias_NPCsToEnableExt.AddRefCollection(Alias_NamedECSNPCs)

;Remove ECS Constant NPCS from their old ECS Constant Factions,
;and add them to PD Factions
Actor myDaisuke = Alias_Daisuke.GetActorRef()
Alias_NPCsToEnableExt.RemoveFromFaction(ECSConstantSecurityFaction)
Alias_NPCsToEnableExt.RemoveFromFaction(CrimeFactionECSConstant)
myDaisuke.RemoveFromFaction(Vendor_ECS_DaisukeFaction)
Alias_NPCsToEnableExt.AddToFaction(CrimeFactionParadiso)
Alias_NPCsToEnableExt.AddToFaction(ParadisoFaction)
myDaisuke.AddToFaction(Vendor_PD_GeneralGoodsFaction)


;Change the NPCs to the Paradiso Crime Faction
Int i = 0 
Int iCount = Alias_NPCsToEnableExt.GetCount()
While i < iCount
	Actor myNPCToEnable = Alias_NPCsToEnableExt.GetAt(i) as Actor
	myNPCToEnable.SetCrimeFaction(CrimeFactionParadiso)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property PD_PlayerHasHotelRoomDiscount Auto Const Mandatory

GlobalVariable Property PD_EnhanceSpecialPrice Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property PD_EnhanceSpecialVouchers Auto Const Mandatory

GlobalVariable Property PD_VisitationCount Auto Const Mandatory

Scene Property DialogueParadiso_PD_IntroScene Auto Const Mandatory

Scene Property DialogueParadiso_PD_Keavy_Intro Auto Const Mandatory

Scene Property DialogueParadiso_PD_Boardroom_Scene Auto Const Mandatory

Quest Property FFParadisoZ01 Auto Const Mandatory

Quest Property FFParadisoZ01Misc Auto Const Mandatory

ReferenceAlias Property Alias_Emilian Auto Const Mandatory

ReferenceAlias Property Alias_Dirk Auto Const Mandatory

Quest Property FFparadisoZ02 Auto Const Mandatory

Quest Property FFParadisoZ02Misc Auto Const Mandatory

ReferenceAlias Property Alias_Kumar Auto Const Mandatory

Quest Property FFParadisoZ03Misc Auto Const Mandatory

Quest Property FFParadisoZ03 Auto Const Mandatory

Quest Property FFParadisoZ04Misc Auto Const Mandatory

Quest Property FFParadisoZ04 Auto Const Mandatory

ReferenceAlias Property Alias_ChiefJiro Auto Const Mandatory

Quest Property MS06 Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Quest Property TestGoToSpaceQuest Auto Const Mandatory

Perk Property Security Auto Const Mandatory

ReferenceAlias Property Alias_BoardRoomDoor Auto Const Mandatory

RefCollectionAlias Property Alias_NPCsToDisableExt Auto Const Mandatory

RefCollectionAlias Property Alias_NPCsToEnableExt Auto Const Mandatory

Faction Property ECSConstantFaction Auto Const Mandatory

Faction Property ECSConstantSecurityFaction Auto Const Mandatory

Faction Property ParadisoFaction Auto Const Mandatory

GlobalVariable Property PD_Hotel_RoomCost_Daily Auto Const Mandatory

GlobalVariable Property PD_Hotel_RoomCost_Weekly Auto Const Mandatory

Faction Property CrimeFactionParadiso Auto Const Mandatory

Faction Property CrimeFactionECSConstant Auto Const Mandatory

RefCollectionAlias Property Alias_NamedECSNPCs Auto Const Mandatory

ReferenceAlias Property Alias_ECSTransplantSlate Auto Const Mandatory

ReferenceAlias Property Alias_Jacquotte Auto Const Mandatory

Quest Property DialogueECSConstant Auto Const Mandatory

ReferenceAlias Property Alias_Daisuke Auto Const Mandatory

Faction Property Vendor_ECS_DaisukeFaction Auto Const Mandatory

Faction Property Vendor_PD_GeneralGoodsFaction Auto Const Mandatory
