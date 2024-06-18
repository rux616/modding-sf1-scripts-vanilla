Scriptname SQ_ShipTechLanding_PlayerScript extends ReferenceAlias

RefCollectionAlias Property ShipTechnicians Auto Const

Scene Property SQ_ShipTechniciansLandingScene Auto Const


Event OnHomeShipSet(SpaceshipReference akShip, SpaceshipReference akPrevious)

;update stage of quest
SQ_ShipTechniciansLanding.SetStage(200)

;Run a loop to grab each actor in ref collection and move him back to editor location
int i = 0
int iLength = ShipTechnicians.GetCount()

while i < iLength
    Actor CurrentShipTech = ShipTechnicians.GetAt(i) as Actor
	if CurrentShipTech.IsDead() == 0 && CurrentShipTech.IsDisabled() == 0

	       CurrentShipTech.MoveToMyEditorLocation()
		CurrentShipTech.Reset() 
		CurrentShipTech.EvaluatePackage()
	endif
    i += 1
endwhile

;shut down the scene, which should end the quest (and prevent this from running multiple times)
SQ_ShipTechniciansLandingScene.Stop()
SQ_ShipTechniciansLanding.Stop()

EndEvent

Quest Property SQ_ShipTechniciansLanding Auto Const Mandatory
