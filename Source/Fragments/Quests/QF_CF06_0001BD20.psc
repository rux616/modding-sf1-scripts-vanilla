;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF06_0001BD20 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(10)
Game.GetPlayer().AddItem(Credits,10000)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(10)
SetStage(20)
Game.GetPlayer().AddItem(Credits,10000)
Game.GetPlayer().MoveTo(CF06_MSPMarker)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(40)
Game.GetPlayer().AddItem(Credits,10000)
Game.GetPlayer().MoveTo(CF06_EPHMarker)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(120)
Alias_CF06_Receptionist.GetActorRef().Enable()
Alias_CF06_Receptionist.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddItem(Credits,10000)
Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef())
Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef())
Game.GetPlayer().MoveTo(CF06_GDYMarker)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(120)
SetStage(122)
SetStage(123)
SetStage(124)
SetStage(125)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(175)
SetStage(180)
SetStage(185)
SetStage(190)
Alias_CF06_Receptionist.GetActorRef().Enable()
Alias_CF06_Receptionist.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddItem(Credits,10000)
Game.GetPlayer().MoveTo(CF06_ASLMarker)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(120)
SetStage(122)
SetStage(123)
SetStage(124)
SetStage(125)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(175)
SetStage(180)
SetStage(185)
SetStage(190)
SetStage(205)
SetStage(207)
SetStage(220)
SetStage(230)
Alias_CF06_Receptionist.GetActorRef().Enable()
Alias_CF06_Receptionist.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddItem(Credits,10000)
Game.GetPlayer().MoveTo(CF06_MSPMarker)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(120)
SetStage(122)
SetStage(123)
SetStage(124)
SetStage(125)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(175)
SetStage(180)
SetStage(185)
SetStage(190)
SetStage(205)
SetStage(207)
SetStage(225)
SetStage(230)
Alias_CF06_Receptionist.GetActorRef().Enable()
Alias_CF06_Receptionist.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddItem(Credits,10000)
Game.GetPlayer().MoveTo(CF06_MSPMarker)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetStage(120)
SetStage(122)
SetStage(123)
SetStage(124)
SetStage(125)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(175)
SetStage(180)
SetStage(185)
SetStage(190)
SetStage(205)
SetStage(207)
SetStage(210)
SetStage(230)
SetStage(280)
Alias_CF06_Receptionist.GetActorRef().Enable()
Alias_CF06_Receptionist.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddItem(Credits,10000)
Game.GetPlayer().MoveTo(CF02_TheKeyStartRef)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(120)
SetStage(122)
SetStage(123)
SetStage(124)
SetStage(125)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(175)
SetStage(180)
SetStage(185)
SetStage(190)
SetStage(205)
SetStage(207)
SetStage(220)
SetStage(230)
SetStage(280)
Alias_CF06_Receptionist.GetActorRef().Enable()
Alias_CF06_Receptionist.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddItem(Credits,10000)
Game.GetPlayer().MoveTo(CF02_TheKeyStartRef)

;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)
CFSD01.SetStage(5)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_CF06_Estelle.GetActorRef().Enable()
Alias_CF06_Estelle.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(50)
Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef())

;Enables Bodyguards and Furnishings Swap
CF06_EnablerRef.Enable()

;Setup Ayumi
Alias_CF06_Komiko.GetActorRef().Enable()
Utility.Wait(2)
Alias_CF06_Komiko.GetActorRef().EvaluatePackage()
Alias_CF06Evidence.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
;Unlock safe
Alias_CF06_Safe.GetRef().SetLockLevel(0)
Alias_CF06_Safe.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(45)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
If CF06_MykaRefund.GetValue() == 0
Game.GetPlayer().AddItem(Credits,Neon_Euphorika_LoungeCost.GetValueInt())
CF06_MykaRefund.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Dialogue Marker
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Combat Starts with Komiko and Syndicate Thugs
;Seogka added Pass Three
Alias_CF06_Komiko.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_CF06_Komiko.GetActorRef().Setvalue(Aggression, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
If IsObjectiveDisplayed(40) == 1
SetObjectiveDisplayed(40,0)
EndIf
If IsObjectiveDisplayed(50) == 1
SetObjectiveDisplayed(50,0)
EndIf
If IsObjectiveDisplayed(70) == 1
SetObjectiveDisplayed(70,0)
EndIf
Alias_CF06_Komiko.GetActorRef().AddItem(Alias_CF06GenerdynePass.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
If GetStageDone(110) == 0
SetObjectiveCompleted(50)
SetObjectiveDisplayed(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
If IsObjectiveDisplayed(40) == 1
SetObjectiveDisplayed(40,0)
Endif
If IsObjectiveDisplayed(60) == 1
SetObjectiveDisplayed(60,0)
EndIf
Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0093_Item_00
Function Fragment_Stage_0093_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits,NPCDemandMoney_Small.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits,NPCDemandMoney_Medium.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits,NPCDemandMoney_Large.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(40) == 1
SetObjectiveCompleted(40)
Endif
If IsObjectiveDisplayed(50) == 1
SetObjectiveDisplayed(50,0)
Endif
If IsObjectiveDisplayed(60) == 1
SetObjectiveDisplayed(60,0)
Endif
If IsObjectiveDisplayed(70) == 1
SetObjectiveDisplayed(70,0)
EndIf
Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(45)
SetObjectiveDisplayed(80)
Alias_CF06_Receptionist.GetActorRef().Enable()
Alias_CF06_Receptionist.GetActorRef().EvaluatePackage()

;Kill Evidence Objectives if Player resolved Ayumi a different way
if IsObjectiveDisplayed(50) == 1
SetObjectiveDisplayed(50,0)
endif

if IsObjectiveDisplayed(70) == 1
SetObjectiveDisplayed(70,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(100)

;Start up External LD Quest
LC039.SetStage(200)

;Disable Ayumi Komiko & Guards
Alias_CF06_Komiko.GetActorRef().Disable()
CF06_EnablerRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
Alias_CF06_Receptionist.GetActorRef().AddItem(Alias_CF06_ReceptionistPass.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_CF06_CGSchematicsEncrypted.GetRef())
LC039.SetStage(700)
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)

;Enable Breyson
Alias_CF06_BreysonBayu.GetActorRef().Enable()
Alias_CF06_BreysonBayu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_CF06_Estelle.GetActorRef().Disable()
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
Game.GetPlayer().AddItem(Alias_CF06_Cypher.GetRef())
SetStage(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN CODE
;Third Pass
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(140) == 1
SetObjectiveDisplayed(140,0)
EndIf
SetObjectiveDisplayed(150)
SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CF06_Cypher.GetRef())
Game.GetPlayer().RemoveItem(Alias_CF06_CGSchematicsEncrypted.GetRef())
Game.GetPlayer().AddItem(Alias_CF06_CGSchematicsDecrypted.GetRef())
SetObjectiveCompleted(150)
If GetStageDone(185) == 1
SetStage(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
Game.GetPlayer().RemoveItem(Alias_CF06Microdrive.GetRef())
If GetStageDone(180) == 1
SetStage(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(170)

;Add "Key" to unlock elevator for exiting purposes
Game.GetPlayer().AddItem(PCF06_GenerdyneExecutiveElevatorKey,1,true)

;Setup BenjaminBayu
Alias_CF06_BenjaminBayu.GetActorRef().SetGhost()
Alias_CF06_BenjaminBayu.GetActorRef().MoveTo(CF06_AstralLoungeBayuMarker)
Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
Alias_CF06_BreysonBayu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
SetObjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
CrimsonFleetCaptainState_Estelle.SetValue(2)
SetStage(227)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Alias_CF06_BreysonBayu.GetActorRef().Disable()
SetStage(227)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
SetStage(227)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0227_Item_00
Function Fragment_Stage_0227_Item_00()
;BEGIN CODE
;Player's choice was made - scene blocker
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN AUTOCAST TYPE CF06QuestScript
Quest __temp = self as Quest
CF06QuestScript kmyQuest = __temp as CF06QuestScript
;END AUTOCAST
;BEGIN CODE
;Estelle accused - go directly to leaving Neon
SetObjectiveCompleted(180)
SetStage(280)

;if quest City_NA_Viewport02 has already started, make Bayu eligible
if City_NA_Viewport02.IsRunning() 
City_NA_Viewport02.SetStage(22)
endif

;Prep Naeva
Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker)
Alias_CF06Naeva.GetActorRef().EvaluatePackage()

;Mark Estelle as Dead for CF08
CrimsonFleetCaptainState_Estelle.SetValue(2)

;Get Bayu Moving to his Default Package
Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_01
Function Fragment_Stage_0230_Item_01()
;BEGIN AUTOCAST TYPE CF06QuestScript
Quest __temp = self as Quest
CF06QuestScript kmyQuest = __temp as CF06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(190)

;if quest City_NA_Viewport02 has already started, make Bayu eligible
if City_NA_Viewport02.IsRunning() 
City_NA_Viewport02.SetStage(22)
endif

;Prep Naeva
Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker)
Alias_CF06Naeva.GetActorRef().EvaluatePackage()

;Re-Enable Estelle
Alias_CF06_Estelle.GetActorRef().Enable()

;Get Bayu Moving to his Default Package
Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_02
Function Fragment_Stage_0230_Item_02()
;BEGIN AUTOCAST TYPE CF06QuestScript
Quest __temp = self as Quest
CF06QuestScript kmyQuest = __temp as CF06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(190)

;if quest City_NA_Viewport02 has already started, make Bayu eligible
if City_NA_Viewport02.IsRunning() 
City_NA_Viewport02.SetStage(22)
endif

;Prep Naeva
Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker)
Alias_CF06Naeva.GetActorRef().EvaluatePackage()

;Re-Enable Estelle
Alias_CF06_Estelle.GetActorRef().Enable()

;Start the Crime Timer
SetStage(400)

;Get Bayu Moving to his Default Package
Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_03
Function Fragment_Stage_0230_Item_03()
;BEGIN AUTOCAST TYPE CF06QuestScript
Quest __temp = self as Quest
CF06QuestScript kmyQuest = __temp as CF06QuestScript
;END AUTOCAST
;BEGIN CODE
; Unlock Astral Lounge so player can leave
kmyQuest.ReleasePlayer()
Debug.Trace(Self + "CF06: Custom function called on Quest Stage Entry 4")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
;If Estelle was implicated, don't do anything
If GetStageDone(210) == 0
SetObjectiveCompleted(190)
SetObjectiveDisplayed(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(1)

;RemoveCredits
Game.GetPlayer().RemoveItem(Credits,CF06_EstelleShareLow.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(2)

;RemoveCredits
Game.GetPlayer().RemoveItem(Credits,CF06_EstelleShareMedium.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(3)

;RemoveCredits
Game.GetPlayer().RemoveItem(Credits,CF06_EstelleShareHigh.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
CrimsonFleetCaptainState_Estelle.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_01
Function Fragment_Stage_0280_Item_01()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE CF06QuestScript
Quest __temp = self as Quest
CF06QuestScript kmyQuest = __temp as CF06QuestScript
;END AUTOCAST
;BEGIN CODE
;If player took responsibility, crime will be called
;Timer is currently set for 2 in-game hours in the quest script
kmyquest.StartGetOffPlanetTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE CF06QuestScript
Quest __temp = self as Quest
CF06QuestScript kmyQuest = __temp as CF06QuestScript
;END AUTOCAST
;BEGIN CODE
;Adding Severe Crime for Neon Faction
kmyQuest.CallNeonCrime()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Murder Level Crime Called (in script)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(320)
LC039.SetStage(10000)
Game.GetPlayer().RemoveItem(Alias_CF06_CGSchematicsDecrypted.GetRef(),1,true)
CF07.SetStage(10)

;Make sure Delgado and Jazz is in position for CF07's kickoff scene
Alias_CF06_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef)
Alias_CF06_Delgado.GetActorRef().EvaluatePackage()
Alias_CF06_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef)
Alias_CF06_Jazz.GetActorRef().EvaluatePackage()

;UnGhost Bayu
Alias_CF06_BenjaminBayu.GetActorRef().SetGhost(false)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CF06Microdrive Auto Const Mandatory

ReferenceAlias Property Alias_CF06Evidence Auto Const Mandatory

ReferenceAlias Property Alias_CF06GenerdynePass Auto Const Mandatory

GlobalVariable Property CF06Count Auto Const Mandatory

ReferenceAlias Property Alias_CF06Naeva Auto Const Mandatory

Quest Property City_NA_Viewport02 Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Komiko Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Cypher Auto Const Mandatory

ReferenceAlias Property Alias_CF06_BreysonBayu Auto Const Mandatory

ReferenceAlias Property Alias_CF06_CGSchematicsEncrypted Auto Const Mandatory

ReferenceAlias Property Alias_CF06_CGSchematicsDecrypted Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Estelle Auto Const Mandatory

GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const Mandatory

GlobalVariable Property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const Mandatory

ObjectReference Property CF06_AstralLoungeBayuMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF06_BenjaminBayu Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ObjectReference Property CF06_MSPMarker Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

ObjectReference Property CF06_NaevaWaitsMarker Auto Const Mandatory

Scene Property CF06_Stage170_BenjaminBayu_CalloutScene Auto Const Mandatory

GlobalVariable Property CF06_KomikoBribeLow Auto Const Mandatory

GlobalVariable Property CF06_KomikoBribeHigh Auto Const Mandatory

GlobalVariable Property CF06_KomikoBribeMedium Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Receptionist Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

Quest Property LC082 Auto Const Mandatory

Quest Property CFKey Auto Const Mandatory

ObjectReference Property CF06_GDYMarker Auto Const Mandatory

Quest Property LC039 Auto Const Mandatory

ObjectReference Property CF06_GenerdyneInnerDoorRef01 Auto Const Mandatory

ObjectReference Property CF06_GenerdyneInnerDoorRef02 Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

ObjectReference Property CF06_EPHMarker Auto Const Mandatory

ObjectReference Property CF06_ASLMarker Auto Const Mandatory

ObjectReference Property CF02_TheKeyStartRef Auto Const Mandatory

Quest Property CF07 Auto Const Mandatory

ObjectReference Property CF07_DelgadoSceneMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Delgado Auto Const Mandatory

ObjectReference Property CF07_JazzSceneMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Jazz Auto Const Mandatory

ReferenceAlias Property Alias_CF06_ReceptionistPass Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Safe Auto Const Mandatory

ActorBase Property FC_Neon_BenjaminBayu Auto Const Mandatory

Scene Property CF06_Stage200_BenjaminBayu_CalloutScene Auto Const Mandatory

ObjectReference Property CF06_EnablerRef Auto Const Mandatory

Quest Property CFSD01 Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

GlobalVariable Property Neon_Euphorika_LoungeCost Auto Const Mandatory

GlobalVariable Property CF06_MykaRefund Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Bodyguard01 Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Bodyguard02 Auto Const Mandatory

Key Property PCF06_GenerdyneExecutiveElevatorKey Auto Const Mandatory

GlobalVariable Property CF06_EstelleShareHigh Auto Const Mandatory

GlobalVariable Property CF06_EstelleShareMedium Auto Const Mandatory

GlobalVariable Property CF06_EstelleShareLow Auto Const Mandatory
