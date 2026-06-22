;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI07_0018B718 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
RI_Support.SetStage(3)

; Equip player with various items/tools
Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(Credits, 50000)
PlayerRef.AddItem(Disruptor)
PlayerRef.AddItem(Digipick, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(0)
RI06.SetStage(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
Game.GetPlayer().MoveTo(Alias_RI07_StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
Game.GetPlayer().MoveTo(Alias_RI07_StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)

Alias_Dalton.GetRef().MoveTo(Alias_DaltonWaitMarker.GetRef())
Alias_Alexis.GetRef().MoveTo(Alias_AlexisChair.GetRef())
Alias_Masako.GetRef().MoveTo(Alias_MasakoChair.GetRef())
Alias_Genevieve.GetRef().MoveTo(Alias_GenevieveChair.GetRef())
Alias_Linden.GetRef().MoveTo(Alias_LindenChair.GetRef())

If RI05_UlaruDead.GetValue() == 0
     Alias_Ularu.GetRef().MoveTo(Alias_UlaruChair.GetRef())
EndIf

Game.GetPlayer().MoveTo(Alias_RI07_StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
Game.GetPlayer().MoveTo(Alias_RI07_StartMarker.GetRef())

Alias_Dalton.GetRef().MoveTo(Alias_DaltonWaitMarker.GetRef())
Alias_Alexis.GetRef().MoveTo(Alias_AlexisChair.GetRef())
Alias_Masako.GetRef().MoveTo(Alias_MasakoChair.GetRef())
Alias_Genevieve.GetRef().MoveTo(Alias_GenevieveChair.GetRef())
Alias_Linden.GetRef().MoveTo(Alias_LindenChair.GetRef())

If RI05_UlaruDead.GetValue() == 0
     Alias_Ularu.GetRef().MoveTo(Alias_UlaruChair.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(400)

Game.GetPlayer().MoveTo(Alias_PlayerChairQT.GetRef())
Game.GetPlayer().Activate(Alias_PlayerChairQT.GetRef())

Alias_Dalton.GetRef().MoveTo(Alias_DaltonWaitMarker.GetRef())
Alias_Alexis.GetRef().MoveTo(Alias_AlexisChair.GetRef())
Alias_Masako.GetRef().MoveTo(Alias_MasakoChair.GetRef())
Alias_Genevieve.GetRef().MoveTo(Alias_GenevieveChair.GetRef())
Alias_Linden.GetRef().MoveTo(Alias_LindenChair.GetRef())

If RI05_UlaruDead.GetValue() == 0
     Alias_Ularu.GetRef().MoveTo(Alias_UlaruChair.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
; SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
Game.GetPlayer().MoveTo(Alias_NeuroampDivisionQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
Game.GetPlayer().MoveTo(Alias_NeuroampDivisionQS.GetRef())

Alias_Veena.GetRef().MoveTo(Alias_VeenaSceneMarker01.GetRef())
Alias_DeMarcus.GetRef().MoveTo(Alias_DeMarcusSceneMarker01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
Game.GetPlayer().MoveTo(Alias_NeuroampDivisionQS.GetRef())

Alias_Veena.GetRef().MoveTo(Alias_VeenaSceneMarker01.GetRef())
Alias_DeMarcus.GetRef().MoveTo(Alias_DeMarcusSceneMarker01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
Game.GetPlayer().MoveTo(Alias_NeuroampDivisionQS.GetRef())

Alias_Veena.GetRef().MoveTo(Alias_VeenaSceneMarker01.GetRef())
Alias_DeMarcus.GetRef().MoveTo(Alias_DeMarcusTestRoomMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_ObservationQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)

Alias_DeMarcus.GetRef().MoveTo(Alias_DeMarcusTestRoomMarker.GetRef())
Alias_TestRoomDoorKeycard.GetRef().MoveTo(Alias_TestRoomDoorKeycardMarker.GetRef())
Alias_TestRoomDoor.GetRef().Lock(True)
Alias_TestRoomDoor.GetRef().SetLockLevel(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_ObservationQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)

Alias_Veena.GetRef().MoveTo(Alias_VeenaPostManipulationMarker.GetRef())
Alias_DeMarcus.GetRef().MoveTo(Alias_DeMarcusPostManipulationMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
; To test siding with Ularu, just uncheck
;RI05_Track_PlayerSidedWithMasako.SetValue(0)
;RI05_Track_PlayerSidedWithUlaru.SetValue(1)
SetStage(1100)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_MasakoOfficeQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(1250)

RI05_Track_PlayerSidedWithMasako.SetValue(0)
RI05_Track_PlayerSidedWithUlaru.SetValue(1)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_UlaruOfficeQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)

Alias_Ularu.GetRef().MoveTo(Alias_UlaruPostPlanSceneMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
If RI03_SimonDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 0
     SetStage(1120) 
EndIf
If RI05_ImogeneDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 1
     SetStage(1130) 
EndIf
SetStage(1150)

; Force these values to be safe
RI05_Track_PlayerSidedWithMasako.SetValue(1)
RI05_Track_PlayerSidedWithUlaru.SetValue(0)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_DaltonOfficeQS.GetRef())
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)

Alias_Dalton.GetRef().MoveTo(Alias_DaltonWaitFurniture.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
If RI03_SimonDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 0
     SetStage(1120) 
EndIf
If RI05_ImogeneDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 1
     SetStage(1130) 
EndIf
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)

Actor PlayerRef = Game.GetPlayer()

PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
Debug.ExecuteConsole("COC NACommercialDistrict")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
If RI03_SimonDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 0
     SetStage(1120) 
EndIf
If RI05_ImogeneDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 1
     SetStage(1130) 
EndIf
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
SetStage(1400)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddItem(Alias_SkylerLuminID.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)

;Debug.ExecuteConsole("COC NACommercialDistrictStart")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
SetStage(1400)
SetStage(1420)
SetStage(1425)
SetStage(1430)
SetStage(1431)
SetStage(1435)
SetStage(1440)
SetStage(1441)
SetStage(1445)
SetStage(1499)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_LucasOfficeQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
If RI03_SimonDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 0
     SetStage(1120) 
EndIf
If RI05_ImogeneDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 1
     SetStage(1130) 
EndIf
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
SetStage(1400)
SetStage(1499)
SetStage(1595)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_FayOfficeQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
If RI03_SimonDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 0
     SetStage(1120) 
EndIf
If RI05_ImogeneDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 1
     SetStage(1130) 
EndIf
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
SetStage(1400)
SetStage(1499)
SetStage(1595)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_PrototypeQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
PlayerRef.MoveTo(Alias_PrototypeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(1800)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_SSNNQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(1900)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_MasakoOfficeQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(2000)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_MasakoOfficeQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)

Utility.Wait(5)
RI07_2000_Intercom_ListeningScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(2100)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_MasakoOfficeQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetObjectiveCompleted(700)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
If RI03_SimonDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 0
     SetStage(1120) 
EndIf
If RI05_ImogeneDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 1
     SetStage(1130) 
EndIf
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
SetStage(1400)

Actor PlayerRef = Game.GetPlayer()

PlayerRef.AddPerk(Manipulation)
PlayerRef.MoveTo(Alias_InfinityLobbyQS.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(1300)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddPerk(Manipulation)
PlayerRef.MoveTo(Alias_InfinityRoofAccessQS.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetObjectiveCompleted(700)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
RI05_UlaruDead.SetValue(1)
SetStage(1130) 
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
;SetStage(1350)
;SetStage(1400)
LC051.SetStage(540)

Actor PlayerRef = Game.GetPlayer()

PlayerRef.AddPerk(Manipulation)
Alias_Imogene.GetRef().MoveTo(Alias_ImogeneFurniture.GetRef())
PlayerRef.MoveTo(Alias_ViewportQS.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0028_Item_00
Function Fragment_Stage_0028_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
SetStage(1120) 
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
SetStage(1400)
SetStage(1415)
SetStage(1499)
LC051.SetStage(540)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(Alias_SkylerLuminID.GetRef())
PlayerRef.MoveTo(Alias_UtilityAccessQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddItem(RI07_MaintenancePasscode)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0029_Item_00
Function Fragment_Stage_0029_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(850)

Actor PlayerRef = Game.GetPlayer()

PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)

Alias_DeMarcus.GetRef().MoveTo(Alias_DeMarcusTestRoomMarker.GetRef())
Alias_TestRoomDoorKeycard.GetRef().MoveTo(Alias_TestRoomDoorKeycardMarker.GetRef())
Alias_TestRoomDoor.GetRef().Lock(True)
Alias_TestRoomDoor.GetRef().SetLockLevel(255)

PlayerRef.MoveTo(Alias_NeuroampDivisionQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetObjectiveCompleted(700)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
RI05_UlaruDead.SetValue(1)
SetStage(1130) 
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
SetStage(1350)
SetStage(1400)
SetStage(1360)
SetStage(1370)
SetStage(1415)
SetStage(1499)
LC051.SetStage(540)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_LockerQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddItem(RI07_LockerKeyCard)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(205)
SetStage(300)
SetStage(350)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(700)
SetObjectiveCompleted(700)
SetStage(850)
SetStage(900)
SetStage(999)
SetStage(1000)
SetStage(1100)
SetStage(1110)
If RI03_SimonDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 0
     SetStage(1120) 
EndIf
If RI05_ImogeneDead.GetValue() == 0 && RI05_UlaruDead.GetValue() == 1
     SetStage(1130) 
EndIf
SetStage(1150)
SetStage(1155)
SetStage(1180)
SetStage(1185)
SetStage(1300)
SetStage(1400)
SetStage(1420)
SetStage(1425)
SetStage(1430)
LC051.SetStage(540)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_AelysQS.GetRef())
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
Alias_ConferenceRoomChairsEnableMarker.GetRef().Disable()
Alias_ExecutiveGenericNPCs.GetRef().Disable()
Alias_Alexis.GetRef().MoveTo(Alias_AlexisChair.GetRef())
Alias_Alexis.GetActorRef().EvaluatePackage()
Alias_Genevieve.GetRef().MoveTo(Alias_GenevieveChair.GetRef())
Alias_Genevieve.GetActorRef().EvaluatePackage()
Alias_Linden.GetRef().MoveTo(Alias_LindenChair.GetRef())
Alias_Linden.GetActorRef().EvaluatePackage()

If RI05_UlaruDead.GetValue() == 0
     Alias_UlaruChairPlayer.GetRef().Disable()
     Alias_UlaruChair.GetRef().Enable()     
     Alias_Ularu.GetRef().MoveTo(Alias_UlaruChair.GetRef())

     ; Swap Ularu's base furniture so she's using a chair instead of
     ; her computer.
     Alias_UlaruChairSwapMarker.GetRef().Disable()

EndIf

SetObjectiveDisplayed(100)

If RI05_Track_PlayerSidedWithMasako.GetValue() == 0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0
     RI05_Track_PlayerSidedWithMasako.SetValue(1)
EndIf

RIR06.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
RI07_0100_Dalton_CommentLineScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_ConferenceRoomChairsEnableMarker.GetRef().Disable()
Alias_ExecutiveGenericNPCs.GetRef().Disable()
Alias_Alexis.GetRef().MoveTo(Alias_AlexisChair.GetRef())
Alias_Alexis.GetActorRef().EvaluatePackage()
Alias_Genevieve.GetRef().MoveTo(Alias_GenevieveChair.GetRef())
Alias_Genevieve.GetActorRef().EvaluatePackage()
Alias_Linden.GetRef().MoveTo(Alias_LindenChair.GetRef())
Alias_Linden.GetActorRef().EvaluatePackage()

If RI05_UlaruDead.GetValue() == 0
     Alias_UlaruChairPlayer.GetRef().Disable()
     Alias_UlaruChair.GetRef().Enable()     
     Alias_Ularu.GetRef().MoveTo(Alias_UlaruChair.GetRef())

     ; Swap Ularu's base furniture so she's using a chair instead of
     ; her computer.
     Alias_UlaruChairSwapMarker.GetRef().Disable()

EndIf

If RI05_Track_PlayerSidedWithMasako.GetValue() == 0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0
     RI05_Track_PlayerSidedWithMasako.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Set quest active and global again in case quest is started via RIR06
SetActive()
If RI05_Track_PlayerSidedWithMasako.GetValue() == 0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0
     RI05_Track_PlayerSidedWithMasako.SetValue(1)
EndIf

RIR06.Stop()
RI_Support.SetStage(5010)
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

Alias_Dalton.GetActorRef().EvaluatePackage()

; Move Masako to her chair in the conference room
Alias_Masako.GetRef().MoveTo(Alias_MasakoChair.GetRef())
Alias_Masako.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Alias_Dalton.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(RI07_Foreknowledge_ImogeneInnocentAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

Alias_Dalton.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

If !GetStageDone(360)
     SetObjectiveDisplayed(350)
Else
     SetStage(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
If GetStageDone(350)
     SetStage(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN AUTOCAST TYPE ri07_questscript
Quest __temp = self as Quest
ri07_questscript kmyQuest = __temp as ri07_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FreezeControlsMeeting()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400)

If (RI05_Track_PlayerSidedWithMasako.GetValue() == 1 && RI05_UlaruDead.GetValue() == 0) || RI05_Track_PlayerSidedWithUlaru.GetValue() == 1 
     RI07_0400_Dalton_ConferenceRoomScene.Start()
EndIf

If RI05_Track_PlayerSidedWithMasako.GetValue() == 1 && RI05_UlaruDead.GetValue() == 1
     RI07_0400_Dalton_ConferenceRoomBScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE ri07_questscript
Quest __temp = self as Quest
ri07_questscript kmyQuest = __temp as ri07_questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

Alias_InternalNeuroampCase.GetRef().Enable()
Alias_Veena.GetRef().MoveTo(Alias_VeenaSceneMarker01.GetRef())
Alias_DeMarcus.GetRef().MoveTo(Alias_DeMarcusSceneMarker01.GetRef())
kmyQuest.UnfreezeControlsMeeting()
(Game.GetPlayer().GetFurnitureUsing()).Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
RI07_0500_Veena_CommentLineScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

Alias_DeMarcus.GetActorRef().EvaluatePackage()
Alias_Alexis.GetActorRef().EvaluatePackage()
Alias_Dalton.GetActorRef().EvaluatePackage()
Alias_Genevieve.GetActorRef().EvaluatePackage()
Alias_Linden.GetActorRef().EvaluatePackage()
Alias_Masako.GetActorRef().EvaluatePackage()
Alias_Ularu.GetActorRef().EvaluatePackage()
Utility.Wait(5)
Alias_ConferenceRoomChairsEnableMarker.GetRef().Enable()
Alias_ExecutiveGenericNPCs.GetRef().Enable()

If RI05_UlaruDead.GetValue() == 0
     Alias_UlaruChairPlayer.GetRef().Enable()
     Alias_UlaruChair.GetRef().Disable()     
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
Alias_Veena.GetActorRef().EvaluatePackage()
Alias_NeuroampOperatingTable.GetRef().BlockActivation(False, False)
RI07_0700_Companion_NeurosurgeryCommentScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN AUTOCAST TYPE ri07_questscript
Quest __temp = self as Quest
ri07_questscript kmyQuest = __temp as ri07_questscript
;END AUTOCAST
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.StopCombatAlarm()
kmyQuest.FreezeControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
RI07_0700_Veena_OperationScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
Game.PassTime(3)
Actor PlayerRef = Game.GetPlayer()
PlayerRef.UnequipItemSlot(35)
PlayerRef.UnequipItemSlot(36)
PlayerRef.UnequipItemSlot(4)

Alias_InternalNeuroampCase.GetRef().RemoveItem(Neuroamp_Ryujin01, 1)

; If player managed to commit a crime and get a bounty before sitting,
; stop the Arrest scene because it will freeze the neuroamp scene.
If DialogueCrimeGuardsForcegreetingScene.IsPlaying()
     DialogueCrimeGuardsForcegreetingScene.Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE ri07_questscript
Quest __temp = self as Quest
ri07_questscript kmyQuest = __temp as ri07_questscript
;END AUTOCAST
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)

Alias_DeMarcus.GetRef().MoveTo(Alias_DeMarcusTestRoomMarker.GetRef())
Alias_TestRoomDoorKeycard.GetRef().MoveTo(Alias_TestRoomDoorKeycardMarker.GetRef())
Alias_TestRoomDoor.GetRef().Lock(True)
Alias_TestRoomDoor.GetRef().SetLockLevel(255)

kmyQuest.UnfreezeControls()
Alias_NeuroampOperatingTable.GetRef().Activate(PlayerRef)
RI07_PlayerHasInternalNeuroamp.SetValue(1)

SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
Alias_NeuroampOperatingTable.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(850)

Alias_Veena.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(850)
SetObjectiveDisplayed(900)

If !GetStageDone(0) ; Prevent pop up if player is using debug stages
     Tutorial_Manipulation.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE ri07_questscript
Quest __temp = self as Quest
ri07_questscript kmyQuest = __temp as ri07_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartDeMarcusTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(800)
     SetObjectiveDisplayed(800, False, False)
EndIf
If IsObjectiveDisplayed(850)
     SetObjectiveDisplayed(850, False, False)
EndIf
SetObjectiveCompleted(900)
SetObjectiveDisplayed(999)

Alias_DeMarcus.GetActorRef().RemoveSpell(Scanner_SocialSkill_Manipulation)
Alias_DeMarcus.GetActorRef().EvaluatePackage()
Alias_Veena.GetActorRef().EvaluatePackage()

RI07_1000_Companion_NeuroampCommentScene.Start()
RI07_1000_DeMarcus_ManipulationScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
If GetStageDone(2150)
     Game.GetPlayer().AddItem(Credits, RI07_Masako_Credits.GetValueInt())
EndIf

SetObjectiveCompleted(2100)
If RI05_Track_PlayerSidedWithUlaru.GetValue() == 1
     RI08.SetStage(100)
Else
     RI08.SetStage(200)
EndIf
Game.GetPlayer().RemoveItem(RI07_Prototype, 99)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(999)
SetObjectiveDisplayed(1000)

Alias_DeMarcus.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)

Alias_ExecutiveGenericNPCs.GetRef().Enable()

Alias_Masako.GetRef().MoveTo(Alias_MasakoPlanSceneMarker.GetRef())

If RI05_UlaruDead.GetValue() == 0
     Alias_Ularu.GetRef().MoveTo(Alias_UlaruDaltonPlanSceneMarker.GetRef())
Else
     Alias_Dalton.GetRef().MoveTo(Alias_UlaruDaltonPlanSceneMarker.GetRef())
EndIf

Alias_Veena.GetActorRef().EvaluatePackage()

Alias_DisplayScreen.GetRef().PlayAnimation("SequenceA02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
RI07_1100_Masako_CommentLineScene.Start()
Alias_DisplayScreen.GetRef().PlayAnimation("SequenceA02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1115_Item_00
Function Fragment_Stage_1115_Item_00()
;BEGIN CODE
Alias_DisplayScreen.GetRef().PlayAnimation("SequenceA03")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1150)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(Alias_Program.GetRef())
PlayerRef.AddItem(RI07_PlayerStealthSuit)
PlayerRef.AddItem(RI07_PlayerStealthSuitHelmet)
PlayerRef.AddItem(Alias_SkylerLuminID.GetRef())

If GetStageDone(1120)
     PlayerRef.AddItem(RI07_MaintenancePasscode)
EndIf

Alias_Dalton.GetRef().MoveTo(Alias_DaltonWaitFurniture.GetRef())
LC051.SetStage(540)
Alias_Masako.GetActorRef().EvaluatePackage()
Alias_Ularu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1155_Item_00
Function Fragment_Stage_1155_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1150)
SetObjectiveDisplayed(1155)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1160_Item_00
Function Fragment_Stage_1160_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Program.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1170_Item_00
Function Fragment_Stage_1170_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_UpdatedProgram.GetRef())
SetStage(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1180_Item_00
Function Fragment_Stage_1180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1155)
SetObjectiveDisplayed(1180)

Alias_Dalton.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1185_Item_00
Function Fragment_Stage_1185_Item_00()
;BEGIN CODE
Alias_Dalton.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)

Actor UlaruRef = Alias_Ularu.GetActorRef()
UlaruRef.AddItem(Alias_Program.GetRef())
UlaruRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveCompleted(1180)
SetObjectiveCompleted(1200)
SetObjectiveCompleted(1250)
SetObjectiveDisplayed(1300)

If !GetStageDone(1150)
     Actor PlayerRef = Game.GetPlayer()
     PlayerRef.AddItem(Alias_Program.GetRef())
     PlayerRef.AddItem(RI07_PlayerStealthSuit)
     PlayerRef.AddItem(RI07_PlayerStealthSuitHelmet)
     PlayerRef.AddItem(Alias_SkylerLuminID.GetRef())

     If GetStageDone(1120)
          PlayerRef.AddItem(RI07_MaintenancePasscode)
     EndIf

EndIf

LC051.SetStage(540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1305_Item_00
Function Fragment_Stage_1305_Item_00()
;BEGIN CODE
RI07_1305_Companion_PostPlanCommentScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
SetStage(1400)
If GetStageDone(1130)
     SetStage(1350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
SetObjectiveDisplayed(1350)

Actor ImogeneRef = Alias_Imogene.GetActorRef()
ImogeneRef.MoveTo(Alias_ImogeneFurniture.GetRef())
ImogeneRef.Enable()
ImogeneRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1360_Item_00
Function Fragment_Stage_1360_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1350)
SetObjectiveDisplayed(1360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1370_Item_00
Function Fragment_Stage_1370_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1360)

Game.GetPlayer().AddItem(Alias_AmirLockerKeycard.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)

SetObjectiveDisplayedAtTop(1400)
SetStage(1410)
SetStage(1420)

If RI02_NinaHartDead.GetValue() == 1
     Alias_Nina.GetRef().Disable()
     Alias_Harper.GetRef().Enable()
EndIf

; Move Nina, Angelo, and Stanley in case they aren't in Infinity LTD.
Actor Nina = Alias_Nina.GetActorRef()
Actor Angelo = Alias_Angelo.GetActorRef()
Actor Stanley = Alias_Stanley.GetActorRef()
ObjectReference InfinityMarker = Alias_AelysQS.GetRef()
Location InfinityLocation = Alias_Location_InfinityLTD.GetLocation()

If !Nina.IsInLocation(InfinityLocation) && !Nina.IsDead()
   Nina.MoveTo(InfinityMarker)
   Nina.EvaluatePackage()
EndIf
If !Angelo.IsInLocation(InfinityLocation) && !Angelo.IsDead()
   Angelo.MoveTo(InfinityMarker)
   Angelo.EvaluatePackage()
EndIf
If !Stanley.IsInLocation(InfinityLocation) && !Stanley.IsDead()
   Stanley.MoveTo(InfinityMarker)
   Stanley.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1410_Item_00
Function Fragment_Stage_1410_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1415_Item_00
Function Fragment_Stage_1415_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
SetObjectiveCompleted(1400)

SetStage(1499)
LC051.SetStage(540)

SetObjectiveCompleted(1410)
SetObjectiveDisplayed(1420, False, False)

Alias_Imogene.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1420_Item_00
Function Fragment_Stage_1420_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1425_Item_00
Function Fragment_Stage_1425_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1420)
SetStage(1430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1430_Item_00
Function Fragment_Stage_1430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1420)
SetObjectiveDisplayed(1430)
LC051.SetStage(620)
LC051.SetStage(540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1431_Item_00
Function Fragment_Stage_1431_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
SetObjectiveCompleted(1400)

SetObjectiveCompleted(1420)
SetObjectiveDisplayed(1410, False, False)

RI07_1430_Aelys_GreetingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1432_Item_00
Function Fragment_Stage_1432_Item_00()
;BEGIN CODE
RI07_1430_Aelys_GreetingScene.Stop()
RI07_1430_Aelys_LeavingScene.Stop()
RI07_1432_Aelys_PlayerLeftScene.Start()
SetObjectiveDisplayed(1435, False, False)
SetObjectiveDisplayed(1440, False, False)
SetStage(1499)
Alias_Aelys.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1435_Item_00
Function Fragment_Stage_1435_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1430)
SetObjectiveDisplayed(1435)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1440_Item_00
Function Fragment_Stage_1440_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1435)
SetObjectiveDisplayed(1440)

Alias_Aelys.GetActorRef().EvaluatePackage()
RI07_1430_Aelys_LeavingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1441_Item_00
Function Fragment_Stage_1441_Item_00()
;BEGIN CODE
Alias_Aelys.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1445_Item_00
Function Fragment_Stage_1445_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1440)

SetStage(1499)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1446_Item_00
Function Fragment_Stage_1446_Item_00()
;BEGIN CODE
If Alias_Aelys.GetRef().GetDistance(Game.GetPlayer()) < 5
     RI07_1446_AelysNinaHarper_AppointmentScene.Start()
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1447_Item_00
Function Fragment_Stage_1447_Item_00()
;BEGIN CODE
RI07_1446_AelysNinaHarper_AppointmentScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1448_Item_00
Function Fragment_Stage_1448_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1435, False, False)
SetObjectiveDisplayed(1440, False, False)
SetStage(1499)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1450_Item_00
Function Fragment_Stage_1450_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1460_Item_00
Function Fragment_Stage_1460_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1450)
LC051.SetStage(20)
RI07_1460_Announcer_EvacuateScene.Start()
Alias_DeziEnableMarker.GetRef().Disable()
Alias_Angelo.GetRef().Disable()
Alias_Stanley.GetRef().Disable()
Alias_FayeTerminal.GetRef().Lock(False)
Alias_LucasDoor.GetRef().Lock(True)
Alias_LucasDoor.GetRef().SetLockLevel(25)
Alias_LucasDoorKey.GetRef().Enable()
RI_Support.SetStage(6010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1470_Item_00
Function Fragment_Stage_1470_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1470)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1471_Item_00
Function Fragment_Stage_1471_Item_00()
;BEGIN CODE
If GetStageDone(1472)
     SetStage(1475)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1472_Item_00
Function Fragment_Stage_1472_Item_00()
;BEGIN CODE
If GetStageDone(1471)
    SetStage(1475)
EndIf

RI07_RDAccessMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1475_Item_00
Function Fragment_Stage_1475_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1470)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1480_Item_00
Function Fragment_Stage_1480_Item_00()
;BEGIN CODE
PlayerFaction
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1490_Item_00
Function Fragment_Stage_1490_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1490)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1492_Item_00
Function Fragment_Stage_1492_Item_00()
;BEGIN CODE
SetStage(1495)
SetStage(1494)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1493_Item_00
Function Fragment_Stage_1493_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1490)
     SetObjectiveDisplayed(1490, False, False)
EndIf
SetStage(1494)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1495_Item_00
Function Fragment_Stage_1495_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1490)
     SetObjectiveCompleted(1490)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1499_Item_00
Function Fragment_Stage_1499_Item_00()
;BEGIN CODE
SetStage(1500)
SetStage(1560)

If GetStageDone(1370)
     SetStage(1470)
EndIf

If GetStageDone(1120)
     SetStage(1450)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
If RI07_LucasDead.GetValue() == 0
     SetObjectiveDisplayed(1510)
EndIf
LC051.SetStage(630)
LC051.SetStage(530)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1530_Item_00
Function Fragment_Stage_1530_Item_00()
;BEGIN CODE
Alias_LucasTerminal.GetRef().SetFactionOwner(PlayerFaction)
Alias_LucasTerminal.GetRef().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1540_Item_00
Function Fragment_Stage_1540_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1550_Item_00
Function Fragment_Stage_1550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)
SetObjectiveDisplayed(1510, False, False)

If GetStageDone(1699) && GetStageDone(1799)
     SetStage(1800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1555_Item_00
Function Fragment_Stage_1555_Item_00()
;BEGIN CODE
RI07_LucasDead.SetValue(1)
If IsObjectiveDisplayed(1510)
     SetObjectiveFailed(1510)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1560_Item_00
Function Fragment_Stage_1560_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(1560)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1595_Item_00
Function Fragment_Stage_1595_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1560)
SetStage(1600)
SetStage(1700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1620_Item_00
Function Fragment_Stage_1620_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.RemoveItem(Alias_IDCardKey.GetRef(), abSilent = True)
PlayerRef.AddItem(RI07_RDKeycard, abSilent = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1650_Item_00
Function Fragment_Stage_1650_Item_00()
;BEGIN CODE
RI07_FayeDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1699_Item_00
Function Fragment_Stage_1699_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1600)

If GetStageDone(1550) && GetStageDone(1799)
     SetStage(1800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(1700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1750_Item_00
Function Fragment_Stage_1750_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1755_Item_00
Function Fragment_Stage_1755_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1750)
     SetObjectiveCompleted(1750)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1799_Item_00
Function Fragment_Stage_1799_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1700)

If GetStageDone(1550) && GetStageDone(1699)
     SetStage(1800)
EndIf
If IsObjectiveDisplayed(1750)
     SetObjectiveDisplayed(1750, False, False)
EndIf

Actor PlayerRef = Game.GetPlayer()
PlayerRef.RemoveItem(RI07_Prototype, 99, abSilent = True)
PlayerRef.AddAliasedItem(RI07_Prototype, Alias_Prototype, 1, abSilent = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1800)
If IsObjectiveDisplayed(1350)
     SetObjectiveDisplayed(1350, False, False)
EndIf
If IsObjectiveDisplayed(1360)
     SetObjectiveDisplayed(1360, False, False)
EndIf
If IsObjectiveDisplayed(1430)
     SetObjectiveDisplayed(1430, False, False)
EndIf
If IsObjectiveDisplayed(1435)
     SetObjectiveDisplayed(1435, False, False)
EndIf
If IsObjectiveDisplayed(1440)
     SetObjectiveDisplayed(1440, False, False)
EndIf
If IsObjectiveDisplayed(1450)
     SetObjectiveDisplayed(1450, False, False)
EndIf
If IsObjectiveDisplayed(1470)
     SetObjectiveDisplayed(1470, False, False)
EndIf
If IsObjectiveDisplayed(1490)
     SetObjectiveDisplayed(1490, False, False)
EndIf
If IsObjectiveDisplayed(1510)
     SetObjectiveDisplayed(1510, False, False)
EndIf
Alias_Imogene.GetRef().Disable()
SetStage(1494)

Actor David = Alias_David.GetActorRef()
David.EvaluatePackage()
David.MoveToFurniture(Alias_DavidFurniture.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1850_Item_00
Function Fragment_Stage_1850_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI07_OverseerProgram)
Game.GetPlayer().RemoveItem(RI07_UpdatedOverseerProgram)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1800)
SetObjectiveDisplayed(1900)

Alias_ExecutiveGenericNPCs.GetRef().Disable()
Game.GetPlayer().RemoveItem(RI07_OverseerProgram)
Game.GetPlayer().RemoveItem(RI07_UpdatedOverseerProgram)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1900)
SetObjectiveDisplayed(2000)

; Disable RI06 NPCs at the Clinic and make door non-interactable. 
RI_Support.SetStage(2000)

; Disable Lucas and Faye since they'd be under investigation.
Alias_Lucas.GetRef().Disable()
Alias_Faye.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2000)
SetObjectiveDisplayed(2100)

Alias_DisplayScreen.GetRef().PlayAnimation("SequenceA01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE ri_crimetrackingquestscript
Quest __temp = self as Quest
ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property LC044 Auto Const Mandatory

Quest Property RI06 Auto Const Mandatory

Faction Property RyujinIndustriesFaction Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

ReferenceAlias Property Alias_Alexis Auto Const Mandatory

ReferenceAlias Property Alias_Dalton Auto Const Mandatory

ReferenceAlias Property Alias_Genevieve Auto Const Mandatory

ReferenceAlias Property Alias_Linden Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_RI07_StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_MasakoChair Auto Const Mandatory

ReferenceAlias Property Alias_UlaruChair Auto Const Mandatory

ReferenceAlias Property Alias_GenevieveChair Auto Const Mandatory

ReferenceAlias Property Alias_AlexisChair Auto Const Mandatory

ReferenceAlias Property Alias_LindenChair Auto Const Mandatory

ReferenceAlias Property Alias_DaltonMeetingMarker Auto Const Mandatory

ReferenceAlias Property Alias_DaltonWaitMarker Auto Const Mandatory

ReferenceAlias Property Alias_ConferenceRoomDoor Auto Const Mandatory

Scene Property RI07_0100_Dalton_CommentLineScene Auto Const Mandatory

GlobalVariable Property RI05_UlaruDead Auto Const Mandatory

ReferenceAlias Property Alias_DeMarcus Auto Const Mandatory

ReferenceAlias Property Alias_Veena Auto Const Mandatory

ReferenceAlias Property Alias_DeMarcusSceneMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_VeenaSceneMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_NeuroampDivisionQS Auto Const Mandatory

Scene Property RI07_0500_Veena_CommentLineScene Auto Const Mandatory

Scene Property RI07_0700_Veena_OperationScene Auto Const Mandatory

Perk Property Manipulation Auto Const Mandatory

Scene Property RI07_0400_Dalton_ConferenceRoomScene Auto Const Mandatory

ReferenceAlias Property Alias_ObservationQS Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Weapon Property Disruptor Auto Const Mandatory

ReferenceAlias Property Alias_PlayerChairQT Auto Const Mandatory

ReferenceAlias Property Alias_DeMarcusTestRoomMarker Auto Const Mandatory

ReferenceAlias Property Alias_TestRoomDoorKeycard Auto Const Mandatory

ReferenceAlias Property Alias_TestRoomDoorKeycardMarker Auto Const Mandatory

ReferenceAlias Property Alias_TestRoomDoor Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory

ReferenceAlias Property Alias_LucasOfficeQS Auto Const Mandatory

ReferenceAlias Property Alias_FayOfficeQS Auto Const Mandatory

ReferenceAlias Property Alias_PrototypeQS Auto Const Mandatory

ReferenceAlias Property Alias_SSNNQS Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeQS Auto Const Mandatory

Scene Property RI07_2000_Intercom_ListeningScene Auto Const Mandatory

ReferenceAlias Property Alias_Program Auto Const Mandatory

Armor Property RI07_PlayerStealthSuit Auto Const Mandatory

Scene Property RI07_0700_Companion_NeurosurgeryCommentScene Auto Const Mandatory

Scene Property RI07_1000_Companion_NeuroampCommentScene Auto Const Mandatory

ReferenceAlias Property Alias_DaltonOfficeQS Auto Const Mandatory

ReferenceAlias Property Alias_DaltonWaitFurniture Auto Const Mandatory

Quest Property RI08 Auto Const Mandatory

Message Property Tutorial_Manipulation Auto Const Mandatory

ReferenceAlias Property Alias_MasakoPlanSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_UlaruDaltonPlanSceneMarker Auto Const Mandatory

Key Property RI07_MaintenancePasscode Auto Const Mandatory

Key Property RI07_SkylerLuminID Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Scene Property RI07_1000_DeMarcus_ManipulationScene Auto Const Mandatory

Scene Property RI07_1100_Masako_CommentLineScene Auto Const Mandatory

GlobalVariable Property RI05_ImogeneDead Auto Const Mandatory

GlobalVariable Property RI03_SimonDead Auto Const Mandatory

ReferenceAlias Property Alias_AmirLockerKeycard Auto Const Mandatory

Scene Property RI07_1430_Aelys_GreetingScene Auto Const Mandatory

Scene Property RI07_1430_Aelys_LeavingScene Auto Const Mandatory

ReferenceAlias Property Alias_DaltonComputer Auto Const Mandatory

ReferenceAlias Property Alias_Aelys Auto Const Mandatory

ReferenceAlias Property Alias_InfinityLobbyQS Auto Const Mandatory

ReferenceAlias Property Alias_InfinityRoofAccessQS Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneFurniture Auto Const Mandatory

ReferenceAlias Property Alias_ViewportQS Auto Const Mandatory

Scene Property RI07_0400_Dalton_ConferenceRoomBScene Auto Const Mandatory

ReferenceAlias Property Alias_VeenaSceneMarker02 Auto Const Mandatory

GlobalVariable Property RI07_Masako_Credits Auto Const Mandatory

ReferenceAlias Property Alias_VeenaPostManipulationMarker Auto Const Mandatory

ReferenceAlias Property Alias_DeMarcusPostManipulationMarker Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeQS Auto Const Mandatory

ReferenceAlias Property Alias_UlaruPostPlanSceneMarker Auto Const Mandatory

Key Property RI07_LockerKeyCard Auto Const Mandatory

ReferenceAlias Property Alias_LockerQS Auto Const Mandatory

ReferenceAlias Property Alias_UtilityAccessQS Auto Const Mandatory

Quest Property LC051 Auto Const

Scene Property RI07_1460_Announcer_EvacuateScene Auto Const Mandatory

Message Property RI07_RDAccessMessage Auto Const Mandatory

Scene Property RI07_1305_Companion_PostPlanCommentScene Auto Const Mandatory

Quest Property RIR06 Auto Const Mandatory

ReferenceAlias Property Alias_Lucas Auto Const Mandatory

ReferenceAlias Property Alias_AelysQS Auto Const Mandatory

GlobalVariable Property RI02_NinaHartDead Auto Const Mandatory

ReferenceAlias Property Alias_Nina Auto Const Mandatory

ReferenceAlias Property Alias_Harper Auto Const Mandatory

Scene Property RI07_1446_AelysNinaHarper_AppointmentScene Auto Const Mandatory

Scene Property RI07_1432_Aelys_PlayerLeftScene Auto Const Mandatory

ReferenceAlias Property Alias_LucasTerminal Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_SkylerLuminID Auto Const Mandatory

ActorValue Property RI07_Foreknowledge_ImogeneInnocentAV Auto Const Mandatory

ReferenceAlias Property Alias_Yuko Auto Const Mandatory

ReferenceAlias Property Alias_NeuroampOperatingTable Auto Const Mandatory

ReferenceAlias Property Alias_TestRoomTerminal Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const Mandatory

Perk Property Skill_Manipulation_InternalNeuroampBonus Auto Const Mandatory

GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const Mandatory

Armor Property RI07_PlayerStealthSuitHelmet Auto Const Mandatory

Spell Property Scanner_SocialSkill_Manipulation Auto Const Mandatory

GlobalVariable Property RI07_LucasDead Auto Const Mandatory

GlobalVariable Property RI07_FayeDead Auto Const Mandatory

ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const Mandatory

ReferenceAlias Property Alias_Dezi Auto Const Mandatory

ReferenceAlias Property Alias_DisplayScreen Auto Const Mandatory

ReferenceAlias Property Alias_DeziEnableMarker Auto Const Mandatory

MiscObject Property RI07_Prototype Auto Const Mandatory

ReferenceAlias Property Alias_Prototype Auto Const Mandatory

ReferenceAlias Property Alias_Angelo Auto Const Mandatory

ReferenceAlias Property Alias_Stanley Auto Const Mandatory

MiscObject Property RI07_OverseerProgram Auto Const Mandatory

ReferenceAlias Property Alias_FayeTerminal Auto Const Mandatory

ReferenceAlias Property Alias_MasakoIntercom Auto Const Mandatory

ReferenceAlias Property Alias_LucasDoor Auto Const Mandatory

ReferenceAlias Property Alias_LucasDoorKey Auto Const Mandatory

ReferenceAlias Property Alias_InternalNeuroampCase Auto Const Mandatory

MiscObject Property Neuroamp_Ryujin01 Auto Const Mandatory

ReferenceAlias Property Alias_ConferenceRoomChairsEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_UlaruChairPlayer Auto Const Mandatory

ReferenceAlias Property Alias_UpdatedProgram Auto Const Mandatory

MiscObject Property RI07_UpdatedOverseerProgram Auto Const Mandatory

Scene Property DialogueCrimeGuardsForcegreetingScene Auto Const Mandatory

ReferenceAlias Property Alias_Faye Auto Const Mandatory

Key Property RI07_RDKeycard Auto Const Mandatory

ReferenceAlias Property Alias_IDCardKey Auto Const Mandatory

ReferenceAlias Property Alias_David Auto Const Mandatory

ReferenceAlias Property Alias_DavidFurniture Auto Const Mandatory

LocationAlias Property Alias_Location_InfinityLTD Auto Const Mandatory
