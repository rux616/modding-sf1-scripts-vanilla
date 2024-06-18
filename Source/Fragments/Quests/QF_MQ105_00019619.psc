;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ105_00019619 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(2000)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQ105_001_LodgeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
TestMQ105MSG03.Show()
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
MQ105_003_IssaEklundIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
TestMQ105MSG05.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
TestMQ105MSG06.Show()
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
MQ105_004_OutsideStroudEklundScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
TestMQ105MSG07.Show()
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
MQ105_005_EnteringBarScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
TestMQ105MSG08.Show()
MQ105_006_GreetingMusgroveScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
TestMQ105MSG09.Show()
MQ105_007_NegotiationScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
TestMQ105MSG10.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
TestMQ105MSG12.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0932_Item_00
Function Fragment_Stage_0932_Item_00()
;BEGIN CODE
TestMQ105MSG12b.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0934_Item_00
Function Fragment_Stage_0934_Item_00()
;BEGIN CODE
TestMQ105MSG12c.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0940_Item_00
Function Fragment_Stage_0940_Item_00()
;BEGIN CODE
TestMQ105MSG13.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
Alias_MusgroveEncounter.AddtoFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
TestMQ105MSG14.Show()

Alias_Musgrove.GetActorRef().Kill()

;combat with bodyguards starts
SetStage(960)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
MQ105_008a_PeacefulResolutionScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
MQ105_009a_ViolentResolutionScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
TestMQ105MSG21.Show()
Setstage(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;TEMP advance forward
TestMQ105MSG15.Show()
SetStage(1210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
MQ105_009b_ViolentResolutionScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
TestMQ105MSG16.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN CODE
TestMQ105MSG17.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1240_Item_00
Function Fragment_Stage_1240_Item_00()
;BEGIN CODE
TestMQ105MSG18.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
TestMQ105MSG19.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1260_Item_00
Function Fragment_Stage_1260_Item_00()
;BEGIN CODE
TestMQ105MSG20.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
MQ105_010_PeacefulEntryScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
TestMQ105MSG22.Show()
Game.GetPlayer().Moveto(TestMQ105ReceptionistMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN CODE
TestMQ105MSG24.Show()
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1330_Item_00
Function Fragment_Stage_1330_Item_00()
;BEGIN CODE
TestMQ105MSG25.Show()
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1340_Item_00
Function Fragment_Stage_1340_Item_00()
;BEGIN CODE
TestMQ105MSG26.Show()
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
TestMQ105MSG23.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1360_Item_00
Function Fragment_Stage_1360_Item_00()
;BEGIN CODE
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
TestMQ105MSG27.Show()
SetStage(1410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1410_Item_00
Function Fragment_Stage_1410_Item_00()
;BEGIN CODE
MQ105_011b_BreakInEntryScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1420_Item_00
Function Fragment_Stage_1420_Item_00()
;BEGIN CODE
TestMQ105MSG28.Show()
SetStage(1450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1450_Item_00
Function Fragment_Stage_1450_Item_00()
;BEGIN CODE
MQ105_011b_AccessPointScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1460_Item_00
Function Fragment_Stage_1460_Item_00()
;BEGIN CODE
TestMQ105MSG29.Show()
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
MQ105_012_AlexSlaytonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
TestMQ105MSG30.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1520_Item_00
Function Fragment_Stage_1520_Item_00()
;BEGIN CODE
TestMQ105MSG31.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1550_Item_00
Function Fragment_Stage_1550_Item_00()
;BEGIN CODE
TestMQ105MSG33.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
;Starborn ambush scene trigger
MQ106.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property TestMQ105MSG01 Auto Const Mandatory

Message Property TestMQ105MSG02 Auto Const Mandatory

Scene Property MQ105_001_LodgeScene Auto Const Mandatory

Scene Property MQ105_002_NeonArrivalScene Auto Const Mandatory

Message Property TestMQ105MSG03 Auto Const Mandatory

Scene Property MQ105_003_IssaEklundIntroScene Auto Const Mandatory

Message Property TestMQ105MSG04 Auto Const Mandatory

Message Property TestMQ105MSG05 Auto Const Mandatory

Message Property TestMQ105MSG06 Auto Const Mandatory

Scene Property MQ105_004_OutsideStroudEklundScene Auto Const Mandatory

Message Property TestMQ105MSG07 Auto Const Mandatory

Message Property TestMQ105MSG08 Auto Const Mandatory

Message Property TestMQ105MSG09 Auto Const Mandatory

Scene Property MQ105_007_NegotiationScene Auto Const Mandatory

Message Property TestMQ105MSG10 Auto Const Mandatory

Message Property TestMQ105MSG11 Auto Const Mandatory

Message Property TestMQ105MSG12 Auto Const Mandatory

Message Property TestMQ105MSG13 Auto Const Mandatory

Message Property TestMQ105MSG14 Auto Const Mandatory

Scene Property MQ105_008a_PeacefulResolutionScene Auto Const Mandatory

Scene Property MQ105_009a_ViolentResolutionScene Auto Const Mandatory

Message Property TestMQ105MSG15 Auto Const Mandatory

Message Property TestMQ105MSG16 Auto Const Mandatory

Message Property TestMQ105MSG17 Auto Const Mandatory

Message Property TestMQ105MSG18 Auto Const Mandatory

Message Property TestMQ105MSG19 Auto Const Mandatory

Message Property TestMQ105MSG20 Auto Const Mandatory

Message Property TestMQ105MSG21 Auto Const Mandatory

Scene Property MQ105_010_PeacefulEntryScene Auto Const Mandatory

Message Property TestMQ105MSG22 Auto Const Mandatory

Message Property TestMQ105MSG23 Auto Const Mandatory

ObjectReference Property TestMQ105ReceptionistMarker Auto Const Mandatory

Message Property TestMQ105MSG24 Auto Const Mandatory

Message Property TestMQ105MSG25 Auto Const Mandatory

Message Property TestMQ105MSG26 Auto Const Mandatory

Message Property TestMQ105MSG27 Auto Const Mandatory

Scene Property MQ105_011b_BreakInEntryScene Auto Const Mandatory

Message Property TestMQ105MSG28 Auto Const Mandatory

Scene Property MQ105_011b_AccessPointScene Auto Const Mandatory

Message Property TestMQ105MSG29 Auto Const Mandatory

Message Property TestMQ105MSG30 Auto Const Mandatory

Message Property TestMQ105MSG31 Auto Const Mandatory

Message Property TestMQ105MSG33 Auto Const Mandatory

Scene Property MQ105_006_GreetingMusgroveScene Auto Const Mandatory

RefCollectionAlias Property Alias_MusgroveEncounter Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Musgrove Auto Const Mandatory

Scene Property MQ105_005_EnteringBarScene Auto Const Mandatory

Scene Property MQ105_012_AlexSlaytonScene Auto Const Mandatory

Message Property TestMQ105MSG12b Auto Const Mandatory

Message Property TestMQ105MSG12c Auto Const Mandatory

Scene Property MQ105_009b_ViolentResolutionScene Auto Const Mandatory

Quest Property MQ106 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory
