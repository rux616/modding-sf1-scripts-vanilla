;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DebugGoToSpaceQuest_0029C659 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Frontier_ModularREF.moveto(NewGameShipMarkerREF)
Frontier_ModularREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

;make sure the player can't move
InputEnableLayer MyEnableLayer = InputEnableLayer.Create()
MyEnableLayer.DisablePlayerControls(abCamSwitch=True)

;move the ship to the right place
Frontier_ModularREF.moveto(NewGameShipMarkerREF)
Frontier_ModularREF.Enable()

Utility.Wait(0.1)

;move the player
PlayerREF.moveto(Frontier_ModularREF)
SQ_PlayerShip.ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
SQ_PlayerShip.HandleShipTakeOff()

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
Utility.Wait(0.1)

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

;snap the player into furniture, this is done in a helper quest that grabs the ship and pilot seat
TestMQ101HelperQuest.SetStage(10)

;player can now move
MyEnableLayer.EnablePlayerControls()
MyEnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
setstage(5)
SQ_PlayerShip.debugInitializeHomeShip(Frontier_ModularREF as SpaceshipReference)

;NOTE: you can't assign crew if the ship isn't on a planet.
;you can instead call from console:
;bat "crew/homeship"
;which will set up ship and move to New Atlantis so you assign crew from test cells, etc.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
debug.trace(self + "Calling stage 10")
setStage(10)

debug.trace(self + "Stage 10 done. Waiting...")
utility.wait(20)

;debug.trace(self + "Waiting done. Moving to Jemison space.")
;Frontier_ModularRef.Moveto(JemisonArrivalMarker)
;debug.trace(self + "MoveTo done. Waiting...")
;utility.wait(20)

debug.trace(self + "Waiting done. Creating linked ref to NA landing marker.")
Frontier_ModularREF.SetLinkedRef(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)

;create link ref that should mean to not play landing anim - this link is cleaned up by code after landing
Frontier_ModularREF.SetLinkedRef(NewAtlantisShipLandingMarker, CurrentInteractionLinkedRefKeyword)

debug.trace(self + "Moving ship to NA landing marker.")

;move the ship to the landing marker
Frontier_ModularRef.Moveto(NewAtlantisShipLandingMarker)

debug.trace(self + "MoveTo done.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

InputEnableLayer MyEnableLayer = InputEnableLayer.Create()
MyEnableLayer.DisablePlayerControls(abCamSwitch=True)

SpaceshipReference maxShip = NewGameShipMarkerRef.PlaceShipAtMe(TestMaxLandable01)
PlayerREF.moveto(maxShip)
SQ_PlayerShip.ResetHomeShip(maxShip as SpaceshipReference)
SQ_PlayerShip.HandleShipTakeOff()
Utility.Wait(0.1)
Game.FadeOutGame(False, True, 0.0, 5.0)

TestMQ101HelperQuest.SetStage(10)

MyEnableLayer.EnablePlayerControls()
MyEnableLayer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewGameShipMarkerREF Auto Const Mandatory

Quest Property TestMQ101HelperQuest Auto Const Mandatory

SQ_PlayerShipScript Property SQ_PlayerShip Auto Const Mandatory

Keyword Property CurrentInteractionLinkedRefKeyword Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

ObjectReference Property JemisonArrivalMarker Auto Const Mandatory

SpaceshipBase Property TestMaxLandable01 Auto Const
