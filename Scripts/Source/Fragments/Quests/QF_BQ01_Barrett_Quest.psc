;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BQ01_Barrett_Quest Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Scene_EnteredApartment.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Alias_Furniture_LawOffice_BarrettChair.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(11)
SetStage(200)
Alias_Door_EllieApt.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
; Setup Helgi in Holding Cell
Alias_Actor_Helgi.GetRef().MoveTo(Alias_Marker_HoldingCell.GetRef())
Alias_Actor_Helgi.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
; Debug
If !GetStageDone(1)
   SetStage(1)
   Alias_Barrett.GetActorRef().MoveTo(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Trigger_Gagarin_LandingPad.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Marker_Mine_Exterior_Player.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Marker_GoTo_Foundry.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference PlayerMarker = Alias_goto_LawOffice.GetRef()
ObjectReference BarrettMarker = Alias_goto_LawOffice_Barrett.GetRef()

player.MoveTo(PlayerMarker)
Barrett.MoveTo(BarrettMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Marker_Clinic.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Marker_Store_Clint.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0028_Item_00
Function Fragment_Stage_0028_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Actor_Security.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0029_Item_00
Function Fragment_Stage_0029_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Marker_ErvinApartment_Exterior.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Marker_ErvinApartment_Interior.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor Barrett = Alias_Barrett.GetActorRef()
ObjectReference Marker = Alias_Marker_TownHall.GetRef()

player.MoveTo(Marker)
Barrett.MoveTo(Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
SetStage(116)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetStage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
SetStage(2501) ; Got coordinates
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0133_Item_00
Function Fragment_Stage_0133_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2140)

Actor player = Game.GetPlayer()
Location Apartment = Alias_Location_ErvinApartment.GetLocation()

If Game.GetPlayer().GetItemCount(Key_Employee) < 1
   Game.GetPlayer().AddItem(Key_Employee, 1)
EndIf

If player.GetCurrentLocation() == Apartment
   SetStage(2065) ; Not Stolen
ElseIf Game.GetPlayer().IsSneaking()
   SetStage(2055) ; Stolen   
Else
   SetStage(2060) ; Not Stolen (Murder?)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0134_Item_00
Function Fragment_Stage_0134_Item_00()
;BEGIN CODE
If Game.GetPlayer().GetItemCount(Key_ErvinFoundry) < 1
   Game.GetPlayer().AddItem(Key_ErvinFoundry, 1)
EndIf

SetStage(2450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
If !GetStageDone(401)
   SetStage(400)
Else
   SetStage(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0177_Item_00
Function Fragment_Stage_0177_Item_00()
;BEGIN CODE
;BQ01_Scene_Vignette_1601_Barrett_Mine_Leave.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetStage(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0181_Item_00
Function Fragment_Stage_0181_Item_00()
;BEGIN CODE
SetStage(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0182_Item_00
Function Fragment_Stage_0182_Item_00()
;BEGIN CODE
SetStage(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0184_Item_00
Function Fragment_Stage_0184_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(7100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
SetObjectiveCompleted(7100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0186_Item_00
Function Fragment_Stage_0186_Item_00()
;BEGIN CODE
SetStage(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0188_Item_00
Function Fragment_Stage_0188_Item_00()
;BEGIN CODE
BQ01_Global_DetectivePoints.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;"lock in" companion to prevent player dismissing them:
Actor BarrettRef = Alias_Barrett.GetActorRef()
SQ_Companions.LockInCompanion(BarrettRef as CompanionActorScript, TextReplaceActivator = COM_PQ_TxtReplace_QuestName_Barret)
COM_BQ01_WaitToggle.SetValue(1)
SQ_Followers.CommandFollow(BarrettRef)

; Player hasn't landed on Gagarin.
If !GetStageDone(201)
   If Game.GetPlayer().GetCurrentLocation() == Alias_Location_GagarinSettlement.GetLocation()
      SetStage(201) ; Player is on Gagarin right now.
   Else
      SetStage(210)
   EndIf
EndIf

BarrettQuest.SetStage(50)
SpeechChallengeQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
Alias_Trigger_Gagarin_LandingPad.GetRef().DisableNoWait()
Alias_Marker_GagarinLandingPad.Clear()
SetStage(231)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
If !GetStageDone(231)
   SetObjectiveDisplayed(230) ; Talk to Barrett
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0231_Item_00
Function Fragment_Stage_0231_Item_00()
;BEGIN CODE
SetObjectiveCompleted(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
SetStage(210)
SetStage(231)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetStage(231)
SetStage(8000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0251_Item_00
Function Fragment_Stage_0251_Item_00()
;BEGIN CODE
DialogueGagarin_UC_GG.SetStage(200)
SetStage(6502)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetStage(231)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

;Direct player to Ervin's apartment
Alias_Trigger_ErvinApartment_Exterior.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
If !GetStageDone(1)
   SetStage(1)
   SetStage(235)
   SetStage(22)
EndIf

;"lock in" companion to prevent player dismissing them:
SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as CompanionActorScript, TextReplaceActivator = COM_PQ_TxtReplace_QuestName_Barret)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
SetStage(301)
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetStage(301)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

If GetStageDone(436) 
   SetStage(2701)
   SetStage(2801)
   SetStage(5000)
ElseIf GetStageDone(434) ; Go to Ervin Apartment
   SetStage(1000)
Else ; All Others
   SetStage(2000) 
EndIf

if GetStageDone(1107)
    SetStage(177)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0404_Item_00
Function Fragment_Stage_0404_Item_00()
;BEGIN CODE
If !GetStageDone(409)
   Scene_NearLawOffice.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
SetStage(404)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0407_Item_00
Function Fragment_Stage_0407_Item_00()
;BEGIN CODE
; Debug
If Alias_Barrett.GetRef().GetCurrentLocation() != Alias_Marker_Gagarin_LawOfficeInterior.GetRef().GetCurrentLocation()
   Alias_Barrett.GetRef().MoveTo(Alias_Marker_Gagarin_LawOfficeInterior.GetRef() )
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0409_Item_00
Function Fragment_Stage_0409_Item_00()
;BEGIN CODE
; Debug
Alias_Barrett.GetRef().MoveTo(Alias_Marker_Gagarin_LawOfficeInterior.GetRef() )

; Backfill previous stages, just in case.
SetStage(301)
SetStage(215)

SetStage(407) ; Run Barrett's scene
SetStage(400) ; Talk to Ellie
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0434_Item_00
Function Fragment_Stage_0434_Item_00()
;BEGIN CODE
SetStage(455)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0436_Item_00
Function Fragment_Stage_0436_Item_00()
;BEGIN CODE
SetObjectiveSkipped(2000)
SetObjectiveSkipped(2100)
SetObjectiveSkipped(2120)
SetObjectiveSkipped(2130)
SetObjectiveSkipped(2140)
SetObjectiveSkipped(2155)
SetObjectiveSkipped(2160)
SetObjectiveSkipped(2300)
SetObjectiveSkipped(2400)
SetObjectiveSkipped(2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetStage(401)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
Scene_GoToErvinApartment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10001_Item_00
Function Fragment_Stage_10001_Item_00()
;BEGIN CODE
; If the door isn't unlocked yet, Barrett will unlock it. 
If !GetStageDone(1116)
   (Alias_Barrett.GetRef() as Actor).EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; If the player didn't find the apartment first, play reg scene
If !GetStageDone(1025) && !GetStageDone(1001)
   SetObjectiveDisplayed(1000)
EndIf

Alias_Trigger_ErvinApartment_Exterior.GetRef().EnableNoWait()
Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1001_Item_00
Function Fragment_Stage_1001_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetStage(1000)
SetStage(1015)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1005_Item_00
Function Fragment_Stage_1005_Item_00()
;BEGIN CODE
If !GetStageDone(1)
   SetStage(1)
   SetStage(305)
   SetStage(405) 
   SetStage(1000)
   SetStage(29)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddAliasedItem(BQ01_Key_ErvinsApartment, Alias_Door_ErvinApartment_Key)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1015_Item_00
Function Fragment_Stage_1015_Item_00()
;BEGIN CODE
If GetStageDone(1000)
   SetStage(1020)
Else                 
   SetStage(1025)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1016_Item_00
Function Fragment_Stage_1016_Item_00()
;BEGIN CODE
;ObjectReference ApartmentDoor = Alias_Door_ErvinApartment_Exterior.GetRef()

;Cutting as Barrett opening the door will just block the player
;The walkway is too narrow for him to open it and move, it's a Lydia situation

;ApartmentDoor.Unlock()
;ApartmentDoor.SetOpen(True)

SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
Actor Barrett = Alias_Barrett.GetActorRef()

Scene_BarrettUsesKey.Start()
Barrett.EvaluatePackage()

Utility.Wait(3)
SetStage(1016)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1025_Item_00
Function Fragment_Stage_1025_Item_00()
;BEGIN CODE
Actor Barrett = Alias_Barrett.GetActorRef()

Scene_BarrettUsesKey.Start()
Barrett.EvaluatePackage()

Utility.Wait(3)
SetStage(1016)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1030_Item_00
Function Fragment_Stage_1030_Item_00()
;BEGIN CODE
If !GetStageDone(401) 
   SetStage(400)
Else
   SetStage(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1000)
SetObjectiveSkipped(1100)

; Remove Barrett's Key
If Game.GetPlayer().GetItemCount(Key_ErvinsApartment) > 0
   Game.GetPlayer().RemoveItem(Key_ErvinsApartment)
EndIf

; Remove Barrett's Key
If Alias_Barrett.GetRef().GetItemCount(Key_ErvinsApartment) > 0
   Alias_Barrett.GetRef().RemoveItem(Key_ErvinsApartment)
EndIf

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1055_Item_00
Function Fragment_Stage_1055_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1000)
SetObjectiveSkipped(1100)

; Remove Barrett's Key
If Game.GetPlayer().GetItemCount(Key_ErvinsApartment) > 0
   Game.GetPlayer().RemoveItem(Key_ErvinsApartment)
EndIf

; Remove Barrett's Key
If Alias_Barrett.GetRef().GetItemCount(Key_ErvinsApartment) > 0
   Alias_Barrett.GetRef().RemoveItem(Key_ErvinsApartment)
EndIf

SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1100)
SetStage(1016) ; Unlock door again, just in case.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_00
Function Fragment_Stage_1101_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveCompleted(1100)
SetStage(1200)

; If player has Passcode from SG03/
If GetStageDone(136) && !GetStageDone(1060)
  SetStage(1106)
Else 
  SetStage(1105)
EndIf

; If player had convo earlier in companion convos
If GetStageDone(115)
   SetStage(1102)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_01
Function Fragment_Stage_1101_Item_01()
;BEGIN CODE
Actor BarrettRef = Alias_Barrett.GetActorRef()

BarrettRef.MoveTo(Game.GetPlayer())
BarrettRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1102_Item_00
Function Fragment_Stage_1102_Item_00()
;BEGIN CODE
ObjectReference PasscodeCrate = Alias_Container_ErvinApartment_FoundryKey.GetRef()

PasscodeCrate.Enable() ; Should be enabled but just in case
PasscodeCrate.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1105_Item_00
Function Fragment_Stage_1105_Item_00()
;BEGIN CODE
Scene_EnteredApartment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1107_Item_00
Function Fragment_Stage_1107_Item_00()
;BEGIN CODE
BQ01_Scene_BARK_1107_ErvinApt_InteriorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1108_Item_00
Function Fragment_Stage_1108_Item_00()
;BEGIN CODE
ObjectReference CactusRef = Alias_Container_ErvinApartment_Cactus.GetRef()

Game.GetPlayer().RemoveItem(CactusRef, abSilent = true)
CactusRef.DisableNoWait()
SetStage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1109_Item_00
Function Fragment_Stage_1109_Item_00()
;BEGIN CODE
BQ01_Scene_GREET_1107_ErvinApt_InteriorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1200)

;SetStage(301)   ; End Barrett's intro convo
;SetStage(401)   ; End Ellie Convo
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1201_Item_00
Function Fragment_Stage_1201_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)

SetStage(1300)     ; Talk to Barrett
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1205_Item_00
Function Fragment_Stage_1205_Item_00()
;BEGIN CODE
SetStage(1)
SetStage(1005)
SetStage(1200)           ; Search Ervin's Apartment
SetStage(30)             ; Move everyone to Apt Interior
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
SetStage(1221)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1221_Item_00
Function Fragment_Stage_1221_Item_00()
;BEGIN CODE
Scene_NearSafe.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1225_Item_00
Function Fragment_Stage_1225_Item_00()
;BEGIN CODE
ObjectReference Safe = Alias_Safe_ErvinApartment.GetRef()

Safe.Unlock()
Safe.SetOpen(True)

SetStage(1226)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1226_Item_00
Function Fragment_Stage_1226_Item_00()
;BEGIN CODE
Scene_OpenSafe.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1228_Item_00
Function Fragment_Stage_1228_Item_00()
;BEGIN CODE
SetStage(130)         ; Track Item
SetStage(1229)        ; Play Scene

If GetStageDone(131)  ; Found all evidence
   SetStage(1201)      
EndIf

BQ01_Global_DetectivePoints.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1229_Item_00
Function Fragment_Stage_1229_Item_00()
;BEGIN CODE
Scene_PlayerFoundContract.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN CODE
SetStage(1231)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1231_Item_00
Function Fragment_Stage_1231_Item_00()
;BEGIN CODE
Scene_NearTerminal.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1235_Item_00
Function Fragment_Stage_1235_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Digipick, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1238_Item_00
Function Fragment_Stage_1238_Item_00()
;BEGIN CODE
SetStage(131)   ; Track item
SetStage(159)
SetStage(1239)  ; Play Scene
SetStage(1500)
; If we found all the items, we're done here.
If GetStageDone(130)
   SetStage(1201)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1239_Item_00
Function Fragment_Stage_1239_Item_00()
;BEGIN CODE
Scene_FoundLicense.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1240_Item_00
Function Fragment_Stage_1240_Item_00()
;BEGIN CODE
Scene_NearPasscodeCrate.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1241_Item_00
Function Fragment_Stage_1241_Item_00()
;BEGIN CODE
SetStage(1241)
SetStage(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
SetStage(1300)

if GetStageDone(1107)
    SetStage(1108)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1300)
Alias_Trigger_ErvinApartment_Plant_Exterior.GetRef().EnableNoWait()
Alias_Barrett.GetActorRef().EvaluatePackage()
Alias_Container_ErvinApartment_EnableMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1301_Item_00
Function Fragment_Stage_1301_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
Alias_Trigger_ErvinApartment_Plant_Exterior.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1305_Item_00
Function Fragment_Stage_1305_Item_00()
;BEGIN CODE
SetStage(1228)
SetStage(1238)
SetStage(1205)
SetStage(31)
SetStage(1300)
SetStage(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1501_Item_00
Function Fragment_Stage_1501_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)

SetStage(1301)
SetStage(1502)
SetStage(1510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1502_Item_00
Function Fragment_Stage_1502_Item_00()
;BEGIN CODE
Scene_TownHallArrival.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1505_Item_00
Function Fragment_Stage_1505_Item_00()
;BEGIN CODE
SetStage(1305)
SetStage(1301)
SetStage(1500)
SetStage(31)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
SetStage(150)
SetStage(1501)
SetObjectiveDisplayed(1510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1515_Item_00
Function Fragment_Stage_1515_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1510)
SetStage(159)
SetStage(1520)
SetStage(1600)

BQ01_Global_DetectivePoints.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1520_Item_00
Function Fragment_Stage_1520_Item_00()
;BEGIN CODE
Scene_TownHall_FoundLicense.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1601_Item_00
Function Fragment_Stage_1601_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1600)
SetStage(2000)

if GetStageDone(1107)
    SetStage(177)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1605_Item_00
Function Fragment_Stage_1605_Item_00()
;BEGIN CODE
SetStage(1505)
SetStage(1515)
SetStage(1600)
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_20000_Item_00
Function Fragment_Stage_20000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2000)
endif

SetStage(2002)

Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2001_Item_00
Function Fragment_Stage_2001_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2000)
SetStage(401)   ; Finish Convo with Ellie
SetStage(2100)  ; Access the Foundry Computer
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2002_Item_00
Function Fragment_Stage_2002_Item_00()
;BEGIN CODE
Scene_GoToFoundry.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2005_Item_00
Function Fragment_Stage_2005_Item_00()
;BEGIN CODE
SetStage(10)   ; Start Quest
SetStage(182)  ; Talked to Barrett
SetStage(351)  ; Talk to Lawyer
SetStage(301)  ; Talked to Barrett
SetStage(401)  ; Talked to Ellie

If !GetStageDone(2805)
   SetStage(2000) ; Go to Foundry
   SetStage(24)   ; Move Player and Barrett
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2055_Item_00
Function Fragment_Stage_2055_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2140)
SetStage(2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2060_Item_00
Function Fragment_Stage_2060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2140)
SetStage(2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2065_Item_00
Function Fragment_Stage_2065_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2140)
SetStage(2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2155)
endif

; If the player already has a passcode, bail out
If Game.GetPlayer().GetItemCount(Key_ErvinFoundry) > 0
   SetStage(2120)
ElseIf Game.GetPlayer().GetItemCount(Key_Employee) > 0
   SetStage(2130)
Else
   If GetStageDone(433)                ; Cyber Runner Track
      SetStage(2160)
   ElseIf GetStageDone(431)            ; Theft Track
      SetStage(2140)
   ElseIf GetStageDone(432)            ; Geology Track
      SetStage(2150)
   Else                                ; Normal Track
      SetStage(2110)
   EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2101_Item_00
Function Fragment_Stage_2101_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2155)
SetObjectiveSkipped(2110)   ; Skip Normal/Geology Track
SetObjectiveSkipped(2120)   ; Skip Ervin's Passcode Track
SetObjectiveSkipped(2130)   ; Skip Employee Passcode Track
SetObjectiveSkipped(2140)   ; Skip Theft Track
SetObjectiveSkipped(2160)   ; Skip Cyber Runner Track

SetStage(2302)              ; Skip Talk to Employees
SetObjectiveSkipped(2400)   ; Talk to Barrett
SetStage(2501)              ; (Optional) Speak with Barrett

SetStage(2800)              ; Talk to Barrett
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2110_Item_00
Function Fragment_Stage_2110_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2100)
endif
SetStage(2115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2111_Item_00
Function Fragment_Stage_2111_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2100)
SetStage(2300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2112_Item_00
Function Fragment_Stage_2112_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, PlayerPaycheck.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2115_Item_00
Function Fragment_Stage_2115_Item_00()
;BEGIN CODE
Scene_FoundryNormalTrack.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2120_Item_00
Function Fragment_Stage_2120_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2120)
endif

SetStage(2125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2121_Item_00
Function Fragment_Stage_2121_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2120)
SetStage(2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2125_Item_00
Function Fragment_Stage_2125_Item_00()
;BEGIN CODE
Scene_FoundryErvinTrack.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2130_Item_00
Function Fragment_Stage_2130_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2130)
endif
SetStage(2135)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2131_Item_00
Function Fragment_Stage_2131_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2130)
SetStage(2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2132_Item_00
Function Fragment_Stage_2132_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, PlayerPaycheck.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2135_Item_00
Function Fragment_Stage_2135_Item_00()
;BEGIN CODE
Scene_FoundryEmployeeTrack.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2140_Item_00
Function Fragment_Stage_2140_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2140)
endif
SetStage(2145)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2141_Item_00
Function Fragment_Stage_2141_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2140) 
SetStage(2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2145_Item_00
Function Fragment_Stage_2145_Item_00()
;BEGIN CODE
Scene_FoundryTheftTrack.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2150_Item_00
Function Fragment_Stage_2150_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2110)
endif
SetStage(2155)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2155_Item_00
Function Fragment_Stage_2155_Item_00()
;BEGIN CODE
Scene_FoundryGeologyTrack.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2160_Item_00
Function Fragment_Stage_2160_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2160)
endif
SetStage(2165)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2161_Item_00
Function Fragment_Stage_2161_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2160)
SetStage(2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2165_Item_00
Function Fragment_Stage_2165_Item_00()
;BEGIN CODE
Scene_FoundryTrackCyberRunner.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2300_Item_00
Function Fragment_Stage_2300_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2301_Item_00
Function Fragment_Stage_2301_Item_00()
;BEGIN CODE
If !GetStageDone(2302)
   SetObjectiveCompleted(2300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2302_Item_00
Function Fragment_Stage_2302_Item_00()
;BEGIN CODE
If !GetStageDone(2301)
   SetObjectiveSkipped(2300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2310_Item_00
Function Fragment_Stage_2310_Item_00()
;BEGIN CODE
SetStage(2301)
SetStage(2350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2330_Item_00
Function Fragment_Stage_2330_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, MediumCredits.GetValue() as Int)

SetStage(2301)
SetStage(2350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2340_Item_00
Function Fragment_Stage_2340_Item_00()
;BEGIN CODE
SetStage(2301)
SetStage(2350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2350_Item_00
Function Fragment_Stage_2350_Item_00()
;BEGIN CODE
SetStage(2600)

SetStage(133)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2400_Item_00
Function Fragment_Stage_2400_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2401_Item_00
Function Fragment_Stage_2401_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2420_Item_00
Function Fragment_Stage_2420_Item_00()
;BEGIN CODE
int BribeAmount = MediumCredits.GetValue() as Int
int MinimumAmount = SmallCredits.GetValue() as Int
int PlayerHas = Game.GetPlayer().GetItemCount(Credits) as Int
int DonationAmount = BribeAmount - PlayerHas

If DonationAmount > BribeAmount
   DonationAmount = BribeAmount
ElseIf DonationAmount > 0
   Game.GetPlayer().AddItem(Credits, DonationAmount)
Else 
   Game.GetPlayer().AddItem(Credits, MinimumAmount)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN CODE
if !GetStageDone(436)
    SetObjectiveDisplayed(2500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2501_Item_00
Function Fragment_Stage_2501_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2500) ; Find Coordinates to Ervin's Mine
SetStage(160)
SetStage(2101)

SetStage(2800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2800_Item_00
Function Fragment_Stage_2800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2500)
SetObjectiveDisplayed(2800)

SetStage(2101)
SetStage(2401)
SetStage(2501)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2801_Item_00
Function Fragment_Stage_2801_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2800)

SetStage(5000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2805_Item_00
Function Fragment_Stage_2805_Item_00()
;BEGIN CODE
SetStage(2005)
SetStage(2101)
SetStage(2801)

If !GetStageDone(5005) && !GetStageDone(6005)
   SetStage(5000)
   SetStage(23)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(5000)

Alias_Door_Mine_LockEntry.GetRef().Lock(false)
Alias_Door_Mine_LockEntry01.GetRef().Lock(false)
ObjectReference MapRef = Alias_Marker_Mine_MapMarker.GetRef()

MapRef.EnableNoWait()
MapRef.AddToMapScanned()
SetStage(2801)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5001_Item_00
Function Fragment_Stage_5001_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5000)
SetObjectiveDisplayed(5100)
SetStage(2101)
SetStage(2801)
SetStage(5011)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5005_Item_00
Function Fragment_Stage_5005_Item_00()
;BEGIN CODE
SetStage(2805)

If !GetStageDone(6005)
   SetStage(5000)
   SetStage(23)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5011_Item_00
Function Fragment_Stage_5011_Item_00()
;BEGIN CODE
Scene_Mine_Comment01_LandingPad.Start()
SetStage(5010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5012_Item_00
Function Fragment_Stage_5012_Item_00()
;BEGIN CODE
Scene_Mine_Comment02_Exterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5013_Item_00
Function Fragment_Stage_5013_Item_00()
;BEGIN CODE
Scene_Mine_Comment03_Interior.Start()

SetStage(5200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5014_Item_00
Function Fragment_Stage_5014_Item_00()
;BEGIN CODE
Scene_Mine_Comment04_Office.Start()
SetStage(5200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5031_Item_00
Function Fragment_Stage_5031_Item_00()
;BEGIN CODE
Scene_Cave_Comment01_NearElevator.Start()
SetStage(530)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5032_Item_00
Function Fragment_Stage_5032_Item_00()
;BEGIN CODE
Scene_Cave_Comment02_Entrance.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5033_Item_00
Function Fragment_Stage_5033_Item_00()
;BEGIN CODE
Scene_Cave_Comment03_Eggs.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5034_Item_00
Function Fragment_Stage_5034_Item_00()
;BEGIN CODE
Scene_Cave_Comment04_Tunnels.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5035_Item_00
Function Fragment_Stage_5035_Item_00()
;BEGIN CODE
Scene_Cave_Comment05_HelgiLab.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5036_Item_00
Function Fragment_Stage_5036_Item_00()
;BEGIN CODE
Scene_Cave_Comment06_Nest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5200_Item_00
Function Fragment_Stage_5200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5000)
SetObjectiveDisplayed(5100)
SetStage(5010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5201_Item_00
Function Fragment_Stage_5201_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5100)
SetStage(6000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5210_Item_00
Function Fragment_Stage_5210_Item_00()
;BEGIN CODE
Scene_FoundEvidence_Admin.Start()

If GetStageDone(5220) && GetStageDone(5230)
   SetStage(5201)
EndIf

ObjectReference BarrettRef = Alias_Barrett.GetRef()
ObjectReference MarkerRef = Alias_Marker_Mine_TerminalMain.GetRef()

if BarrettRef.GetDistance(MarkerRef) > 6
    BarrettRef.MoveTo(MarkerRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5220_Item_00
Function Fragment_Stage_5220_Item_00()
;BEGIN CODE
Scene_FoundEvidence_Helgi.Start()
SetStage(121)

If GetStageDone(5210) && GetStageDone(5230)
   SetStage(5201)
EndIf

ObjectReference BarrettRef = Alias_Barrett.GetRef()
ObjectReference MarkerRef = Alias_Marker_Mine_TerminalHelgi.GetRef()

if BarrettRef.GetDistance(MarkerRef) > 6
    BarrettRef.MoveTo(MarkerRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5225_Item_00
Function Fragment_Stage_5225_Item_00()
;BEGIN CODE
ObjectReference Computer = Alias_Terminal_Mine_Cave_HelgiStation.GetRef()

Computer.Unlock()
Computer.SetOpen(True)
SetStage(5211)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5230_Item_00
Function Fragment_Stage_5230_Item_00()
;BEGIN CODE
Scene_FoundEvidence_Ervin.Start()

If GetStageDone(5220) && GetStageDone(5210)
   SetStage(5201)
EndIf

ObjectReference BarrettRef = Alias_Barrett.GetRef()
ObjectReference MarkerRef = Alias_Marker_Mine_TerminalErvin.GetRef()

if BarrettRef.GetDistance(MarkerRef) > 6
    BarrettRef.MoveTo(MarkerRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5235_Item_00
Function Fragment_Stage_5235_Item_00()
;BEGIN CODE
ObjectReference Computer = Alias_Terminal_Mine_Lab_ErvinStation.GetRef()

Computer.Unlock()
Computer.SetOpen(True)
SetStage(5212)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6000_Item_00
Function Fragment_Stage_6000_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1600)
SetObjectiveDisplayed(6000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6001_Item_00
Function Fragment_Stage_6001_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6000)
SetStage(6300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6005_Item_00
Function Fragment_Stage_6005_Item_00()
;BEGIN CODE
SetStage(5005)
SetStage(5201)
SetStage(5210)
SetStage(5220)
SetStage(5230)

If !GetStageDone(6305)
   SetStage(25)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6010_Item_00
Function Fragment_Stage_6010_Item_00()
;BEGIN CODE
SetStage(6015)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6015_Item_00
Function Fragment_Stage_6015_Item_00()
;BEGIN CODE
Scene_Vignette_ReturnedFromMine.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6112_Item_00
Function Fragment_Stage_6112_Item_00()
;BEGIN CODE
SetStage(6001)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6300_Item_00
Function Fragment_Stage_6300_Item_00()
;BEGIN CODE
SetStage(121)
SetStage(6315)

If GetStageDone(6110)      ; Bartender
   SetStage(6500)
ElseIf GetStageDone(6111)  ; Dr. Keala
   SetStage(6400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6301_Item_00
Function Fragment_Stage_6301_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6300)
SetObjectiveCompleted(6500)

SetStage(7000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6305_Item_00
Function Fragment_Stage_6305_Item_00()
;BEGIN CODE
SetStage(6005)
SetStage(6001)
SetStage(6111)
SetStage(6300)

If GetStageDone(6405)
   SetStage(27)
ElseIf GetStageDone(6705)
   SetStage(28)
ElseIf GetStageDone(6605)
   SetStage(29)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6315_Item_00
Function Fragment_Stage_6315_Item_00()
;BEGIN CODE
Alias_Actor_Helgi.GetRef().MoveTo(Alias_Marker_Spawn_Helgi.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6400_Item_00
Function Fragment_Stage_6400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(6400)

Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6401_Item_00
Function Fragment_Stage_6401_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6400)

If GetStageDone(6425) ; Talk to Bartender
   SetStage(6500)
Else 
   SetStage(6700)     ; Talk to Clint
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6405_Item_00
Function Fragment_Stage_6405_Item_00()
;BEGIN CODE
SetStage(6305)
SetStage(6400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6415_Item_00
Function Fragment_Stage_6415_Item_00()
;BEGIN CODE
SetStage(6430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6422_Item_00
Function Fragment_Stage_6422_Item_00()
;BEGIN CODE
int PlayerAmount = Game.GetPlayer().GetItemCount(Addichrone)

If PlayerAmount >= 3
   Game.GetPlayer().RemoveItem(Addichrone,3)
Else 
   Game.GetPlayer().RemoveItem(Addichrone, PlayerAmount) 
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6425_Item_00
Function Fragment_Stage_6425_Item_00()
;BEGIN CODE
SetStage(6430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6430_Item_00
Function Fragment_Stage_6430_Item_00()
;BEGIN CODE
SetStage(6401)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6500_Item_00
Function Fragment_Stage_6500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(6500)

Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6501_Item_00
Function Fragment_Stage_6501_Item_00()
;BEGIN CODE
If !GetStageDone(6520) && !GetStageDone(6521)
   SetObjectiveCompleted(6500)
Else
   SetObjectiveSkipped(6500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6522_Item_00
Function Fragment_Stage_6522_Item_00()
;BEGIN CODE
SetStage(6301)
SetStage(6501)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6601_Item_00
Function Fragment_Stage_6601_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6720)


Scene_DalitsoEndConvo.Start()
SetStage(6650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6605_Item_00
Function Fragment_Stage_6605_Item_00()
;BEGIN CODE
SetStage(6305)
SetStage(6600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6650_Item_00
Function Fragment_Stage_6650_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(6650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6651_Item_00
Function Fragment_Stage_6651_Item_00()
;BEGIN CODE
If GetStageDone(6650) 
   SetObjectiveCompleted(6650)
   SetStage(6670)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6652_Item_00
Function Fragment_Stage_6652_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6650)
SetObjectiveDisplayed(6652)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6653_Item_00
Function Fragment_Stage_6653_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6650)
if GetStageDone(6652)
    SetObjectiveFailed(6652)   
endif

if !GetStageDone(6656) && !GetStageDone(7000)
    SetObjectiveDisplayed(6653)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6656_Item_00
Function Fragment_Stage_6656_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6652)
SetObjectiveCompleted(6656)
SetStage(6657)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6657_Item_00
Function Fragment_Stage_6657_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(6657)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6658_Item_00
Function Fragment_Stage_6658_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6657)
SetStage(7000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6659_Item_00
Function Fragment_Stage_6659_Item_00()
;BEGIN CODE
SetObjectiveSkipped(6400)
SetObjectiveSkipped(6500)
SetObjectiveSkipped(6700)
SetObjectiveCompleted(6653)
SetStage(6657)

if GetStageDone(6653)
    BQ01_Scene_Vignette_6659_Barrett_Dalitso_Distraction.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6670_Item_00
Function Fragment_Stage_6670_Item_00()
;BEGIN CODE
if !GetStageDone(6656) && !GetStageDone(7000)
    SetObjectiveDisplayed(6653)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6671_Item_00
Function Fragment_Stage_6671_Item_00()
;BEGIN CODE
If GetStageDone(6670)
   SetObjectiveCompleted(6653)
EndIf 

SetStage(165)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6700_Item_00
Function Fragment_Stage_6700_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(6700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6701_Item_00
Function Fragment_Stage_6701_Item_00()
;BEGIN CODE
SetObjectiveCompleted(6700)

If GetStageDone(6715)
   SetStage(6500) ; Talk to Bartender
Else
   SetStage(6600) ; Talk to Dalitso
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6705_Item_00
Function Fragment_Stage_6705_Item_00()
;BEGIN CODE
SetStage(6305)
SetStage(6700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6715_Item_00
Function Fragment_Stage_6715_Item_00()
;BEGIN CODE
SetStage(6500)
SetStage(6750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6720_Item_00
Function Fragment_Stage_6720_Item_00()
;BEGIN CODE
SetStage(6750)
SetStage(6600)
SetObjectiveDisplayed(6720)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6725_Item_00
Function Fragment_Stage_6725_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits,LargeCredits.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6726_Item_00
Function Fragment_Stage_6726_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits,LargeCredits.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6750_Item_00
Function Fragment_Stage_6750_Item_00()
;BEGIN CODE
SetStage(6701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7000_Item_00
Function Fragment_Stage_7000_Item_00()
;BEGIN CODE
SetObjectiveSkipped(6400)
SetObjectiveSkipped(6500)
SetObjectiveSkipped(6700)
SetObjectiveSkipped(6652)
SetObjectiveSkipped(6653)
SetObjectiveSkipped(6657)

SetObjectiveDisplayed(7000)
ObjectReference HelgiRef = Alias_Actor_Helgi.GetRef()
ObjectReference BeanBagRef = Alias_Furniture_Chair_Helgi.GetRef()

HelgiRef.EnableNoWait()

if HelgiRef.GetDistance(BeanBagRef) > 10
    HelgiRef.MoveTo(BeanBagRef)
endif

SetStage(165)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7005_Item_00
Function Fragment_Stage_7005_Item_00()
;BEGIN CODE
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7009_Item_00
Function Fragment_Stage_7009_Item_00()
;BEGIN CODE
BQ01_Global_DetectivePoints.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7010_Item_00
Function Fragment_Stage_7010_Item_00()
;BEGIN CODE
SetObjectiveFailed(7000)
SetObjectiveFailed(7100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7101_Item_00
Function Fragment_Stage_7101_Item_00()
;BEGIN CODE
if GetStageDone(7009)
    SetObjectiveCompleted(7000)
else
    SetObjectiveFailed(7000)
endif

SetStage(7300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7300_Item_00
Function Fragment_Stage_7300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(7300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7301_Item_00
Function Fragment_Stage_7301_Item_00()
;BEGIN CODE
SetObjectiveSkipped(7100)
SetObjectiveCompleted(7300)
SetStage(7400)

int DetectivePoints = BQ01_Global_DetectivePoints.GetValueInt()
if  DetectivePoints >= 4
    BarrettQuest.SetStage(8)
endif

if DetectivePoints >= 2
    BarrettQuest.SetStage(7)
endif

BarrettQuest.SetStage(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7400_Item_00
Function Fragment_Stage_7400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(7400)

BQ01_Scene_BARK_7400_Barrett_BackToShip.Start()

Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7401_Item_00
Function Fragment_Stage_7401_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;"release the lock" companion to allow player dismissing them:
if !Com_Quest_Barrett_Q02.IsRunning()
    SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as CompanionActorScript, LockedIn = false)
    COM_BQ01_WaitToggle.SetValue(0)
endif

;tell the Companion quest that the personal quest is finished
COM_Companion_Barrett.FinishedPersonalQuest()

Game.GetPlayer().SetValue(COM_Quest_Barrett_Q01_Complete_AV, 1)
Game.GetPlayer().RemoveItem(BQ01_Key_ErvinsApartment, abSilent = true)
Alias_Door_ErvinApartment_Exterior.GetRef().Lock(true)

COM_Quest_Barrett_Q01_SpeechChallenge.Stop()
Alias_Furniture_LawOffice_BarrettChair.GetRef().BlockActivation(false, false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7402_Item_00
Function Fragment_Stage_7402_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(BQ01_ErvinPlant_Slate)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8200_Item_00
Function Fragment_Stage_8200_Item_00()
;BEGIN CODE
SetStage(8300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8930_Item_00
Function Fragment_Stage_8930_Item_00()
;BEGIN CODE
If GetStageDone(275) && !GetStageDone(280)
   SetStage(280)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
If GetStageDone(275)
   SetStage(9100)
Else
   SetStage(9200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9100_Item_00
Function Fragment_Stage_9100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9200_Item_00
Function Fragment_Stage_9200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; Companion
sq_companionsscript Property SQ_Companions Auto Const Mandatory
sq_followersscript Property SQ_Followers Auto Const Mandatory
ReferenceAlias Property Alias_Barrett Auto Const Mandatory

; Player
Perk Property StarbornPerk Auto Const Mandatory

; Money
GlobalVariable Property SmallCredits Auto Const Mandatory
GlobalVariable Property MediumCredits Auto Const Mandatory
GlobalVariable Property LargeCredits Auto Const Mandatory

; Gagarin
LocationAlias Property Alias_Location_GagarinSettlement Auto Const Mandatory
ReferenceAlias Property Alias_Trigger_Gagarin_LandingPad Auto Const Mandatory
ReferenceAlias Property Alias_Marker_Mine_Exterior_Player Auto Const Mandatory

; Ervin's Apartment
ReferenceAlias Property Alias_Door_ErvinApartment_Exterior Auto Const Mandatory
ReferenceAlias Property Alias_Marker_ErvinApartment_Interior Auto Const Mandatory
ReferenceAlias Property Alias_Safe_ErvinApartment Auto Const Mandatory
Scene Property Scene_GoToErvinApartment Auto Const Mandatory
Scene Property Scene_ApartmentExterior Auto Const Mandatory
Scene Property Scene_EnteredApartment Auto Const Mandatory
Scene Property Scene_NearSafe Auto Const Mandatory
Scene Property Scene_NearTerminal Auto Const Mandatory
Scene Property Scene_OpenSafe Auto Const Mandatory
Scene Property Scene_PlayerFoundContract Auto Const Mandatory
Scene Property Scene_FoundLicense Auto Const Mandatory
Scene Property Scene_MyKey Auto Const Mandatory
Scene Property Scene_BarrettUsesKey Auto Const Mandatory
Scene Property Scene_ErvinApartmentEntrance Auto Const Mandatory
Key Property Key_ErvinsApartment Auto Const Mandatory
MiscObject Property Digipick Auto Const Mandatory

; Town Hall
Scene Property Scene_TownHallArrival Auto Const Mandatory
Scene Property Scene_TownHall_FoundLicense Auto Const Mandatory
ReferenceAlias Property Alias_Terminal_TownHall Auto Const Mandatory

; Law Office
ReferenceAlias Property Alias_Marker_Gagarin_LawOfficeInterior Auto Const Mandatory
ReferenceAlias Property Alias_goto_LawOffice_Barrett Auto Const Mandatory
ReferenceAlias Property Alias_goto_LawOffice Auto Const Mandatory
Scene Property Scene_NearLawOffice Auto Const Mandatory
Scene Property Scene_Vignette_HelloEllie Auto Const Mandatory
Scene Property Scene_Vignette_ReturnedFromMine Auto Const Mandatory

; Foundry
Key Property Key_Employee Auto Const Mandatory
Key Property Key_ErvinFoundry Auto Const Mandatory
Scene Property Scene_GoToFoundry Auto Const Mandatory
Scene Property Scene_TryYourAccount Auto Const Mandatory
Scene Property Scene_FoundryCyberRunner Auto Const Mandatory
Scene Property Scene_FoundryTheftTrack Auto Const Mandatory
Scene Property Scene_FoundryGeologyTrack Auto Const Mandatory
Scene Property Scene_AccessedPlayerAccount Auto Const Mandatory
Scene Property Scene_AccessedErvinAccount Auto Const Mandatory
Scene Property Scene_TheftTrack Auto Const Mandatory
Scene Property Scene_AccessPlayerAccount Auto Const Mandatory
Scene Property Scene_FoundryErvinTrack Auto Const Mandatory
Scene Property Scene_FoundryNormalTrack Auto Const Mandatory
Scene Property Scene_FoundryEmployeeTrack Auto Const Mandatory
Scene Property Scene_FoundryTrackCyberRunner Auto Const Mandatory
ReferenceAlias Property Alias_Container_ErvinApartment_FoundryKey Auto Const Mandatory
ReferenceAlias Property Alias_Marker_GoTo_Foundry Auto Const Mandatory

; Mine Facility - Exterior
ReferenceAlias Property Alias_Terminal_Mine_Lab_ErvinStation Auto Const Mandatory
ReferenceAlias Property Alias_Terminal_Mine_Cave_HelgiStation Auto Const Mandatory
Scene Property Scene_Mine_Comment01_LandingPad Auto Const Mandatory
Scene Property Scene_Mine_Comment02_Exterior Auto Const Mandatory
Scene Property Scene_Mine_Comment03_Interior Auto Const Mandatory
Scene Property Scene_Mine_Comment04_Office Auto Const Mandatory

; Mine Cave - Interior
Scene Property Scene_Cave_Comment01_NearElevator Auto Const Mandatory
Scene Property Scene_Cave_Comment02_Entrance Auto Const Mandatory
Scene Property Scene_Cave_Comment03_Eggs Auto Const Mandatory
Scene Property Scene_Cave_Comment04_Tunnels Auto Const Mandatory
Scene Property Scene_Cave_Comment05_HelgiLab Auto Const Mandatory
Scene Property Scene_Cave_Comment06_Nest Auto Const Mandatory

; Mine - Found Evidence
Scene Property Scene_FoundEvidence_Helgi Auto Const Mandatory
Scene Property Scene_FoundEvidence_Ervin Auto Const Mandatory
Scene Property Scene_FoundEvidence_Admin Auto Const Mandatory

; Dalitso
Scene Property Scene_DalitsoEndConvo Auto Const Mandatory

; Helgi
ReferenceAlias Property Alias_Actor_Helgi Auto Const Mandatory
ReferenceAlias Property Alias_Marker_HoldingCell Auto Const Mandatory
ReferenceAlias Property Alias_Marker_Spawn_Helgi Auto Const Mandatory

; Unsorted
Scene Property Scene_ErvinDoorUnlocked Auto Const Mandatory
GlobalVariable Property PlayerPaycheck Auto Const Mandatory
MiscObject Property Credits Auto Const Mandatory
Potion Property Addichrone Auto Const Mandatory


ReferenceAlias Property Alias_Marker_Clinic Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Store_Clint Auto Const Mandatory

ReferenceAlias Property Alias_Actor_Security Auto Const Mandatory

Scene Property Scene_WentToApartmentFirst Auto Const Mandatory

ReferenceAlias Property Alias_Marker_ErvinApartment_Exterior Auto Const Mandatory

Scene Property Scene_NearPasscodeCrate Auto Const Mandatory

LocationAlias Property Alias_Location_ErvinApartment Auto Const Mandatory

ReferenceAlias Property Alias_Marker_TownHall Auto Const Mandatory

Key Property BQ01_Key_ErvinsApartment Auto Const Mandatory

ReferenceAlias Property Alias_Container_ErvinApartment_Cactus Auto Const Mandatory

Scene Property BQ01_Scene_GREET_1107_ErvinApt_InteriorScene Auto Const Mandatory

ReferenceAlias Property Alias_Trigger_ErvinApartment_Exterior Auto Const Mandatory

ReferenceAlias Property Alias_Trigger_ErvinApartment_Plant_Exterior Auto Const Mandatory

Quest Property SpeechChallengeQuest Auto Const Mandatory

Scene Property BQ01_Scene_Vignette_1601_Barrett_Mine_Leave Auto Const Mandatory

GlobalVariable Property BQ01_Global_DetectivePoints Auto Const Mandatory

Quest Property BarrettQuest Auto Const Mandatory

Scene Property BQ01_Scene_BARK_7400_Barrett_BackToShip Auto Const Mandatory

Book Property BQ01_ErvinPlant_Slate Auto Const Mandatory

Scene Property BQ01_Scene_Vignette_6659_Barrett_Dalitso_Distraction Auto Const Mandatory

ReferenceAlias Property Alias_Door_ErvinApartment_Key Auto Const Mandatory

ActorValue Property COM_Quest_Barrett_Q01_Complete_AV Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q02 Auto Const Mandatory

ReferenceAlias Property Alias_Furniture_Chair_Helgi Auto Const Mandatory

ReferenceAlias Property Alias_Marker_GagarinLandingPad Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Mine_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_Door_Mine_LockEntry Auto Const Mandatory

Quest Property DialogueGagarin_UC_GG Auto Const Mandatory

ReferenceAlias Property Alias_Door_Mine_LockEntry01 Auto Const Mandatory

Com_CompanionQuestScript Property Com_Companion_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Mine_TerminalErvin Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Mine_TerminalHelgi Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Mine_TerminalMain Auto Const Mandatory

ReferenceAlias Property Alias_Door_EllieApt Auto Const Mandatory

ReferenceAlias Property Alias_Container_ErvinApartment_EnableMarker Auto Const Mandatory

Scene Property BQ01_Scene_BARK_1107_ErvinApt_InteriorScene Auto Const Mandatory

Activator Property COM_PQ_TxtReplace_QuestName_Barret Auto Const Mandatory

GlobalVariable Property COM_BQ01_WaitToggle Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q01_SpeechChallenge Auto Const Mandatory

ReferenceAlias Property Alias_Furniture_LawOffice_BarrettChair Auto Const Mandatory
