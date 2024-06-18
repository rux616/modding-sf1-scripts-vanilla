Scriptname MQ101PlayerShipScript extends ReferenceAlias

ReferenceAlias Property TheLodge Auto Mandatory
Location Property SNarionA_PAnselon_MKreet Auto Mandatory
Location Property KreetWorldSpaceLocation Auto Mandatory
Location Property NewAtlantisLocation Auto Mandatory
Location Property SAlphaCentauri_PJemison_Orbit Auto Mandatory
Location Property SNarionA_PAnselon_MKreet_Orbit Auto Mandatory Const

;ship power system actor values
ActorValue Property SpaceshipBuildableEnginePower Mandatory Const Auto
ActorValue Property SpaceshipBuildableThrusterPower Mandatory Const Auto
ActorValue Property SpaceshipBuildableShieldPower Mandatory Const Auto
ActorValue Property SpaceshipGravJumpPower Mandatory Const Auto
ActorValue Property SpaceshipWeaponGatlingGunPower Mandatory Const Auto
ActorValue Property SpaceshipWeaponGunPower Mandatory Const Auto
ActorValue Property SpaceshipWeaponMissileLauncherPower Mandatory Const Auto

Event OnShipDock(bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	;advance the quest when the player docks with the Lodge
	If (abComplete) && (akParent == TheLodge.GetRef())
		GetOwningQuest().SetStage(1500)
	EndIf
endEvent

Event OnShipLanding(bool abComplete)
	Quest MyQuest = GetOwningQuest()
	ObjectReference MyShip = Self.GetRef()
	Location MyLocation = MyShip.GetCurrentLocation()
	;advance the quest when the player lands on Nexum or Kreet
	If MyShip.IsInLocation(SNarionA_PAnselon_MKreet) || MyShip.IsInLocation(KreetWorldSpaceLocation)
		If abComplete == False
			MyQuest.SetStage(610)
		Else
			MyQuest.SetStage(615)
		EndIf
	ElseIf 	MyShip.IsInLocation(NewAtlantisLocation)
		If abComplete == False
			MyQuest.SetStage(1305)
		Else
			MyQuest.SetStage(1310)
		EndIf
	EndIf
EndEvent

Event OnShipSystemPowerChange(ActorValue akSystem, bool abAddPower, bool abDamageRelated)
	debug.trace(self + " power has changed in" + akSystem + "Was change damage related: " + abDamageRelated)
	Quest MyQuest = GetOwningQuest()

	;check if all systems are powered
	If MYQuest.GetStageDone(419) && MyQuest.GetStageDone(485) == False
		CheckPowerToSystems()
	EndIf
EndEvent

Function CheckPowerToSystems()
	Quest MyQuest = GetOwningQuest()
	ObjectReference myShipRef = Self.GetRef()
	Float EnginePower = myShipRef.GetValue(SpaceshipBuildableEnginePower)
	Float ShieldPower = myShipRef.GetValue(SpaceshipBuildableShieldPower)
	Float GatlingPower = myShipRef.GetValue(SpaceshipWeaponGatlingGunPower)
	Float GunPower = myShipRef.GetValue(SpaceshipWeaponGunPower)
	Float MissilePower = myShipRef.GetValue(SpaceshipWeaponMissileLauncherPower)
	Float GravJumpPower = myShipRef.GetValue(SpaceshipGravJumpPower)

	;make sure the player is piloting the ship
	ObjectReference myPlayerShip = Game.GetPlayer().GetSpaceShip()
	If myPlayerShip
		;check if engines, thrusters, shields, grav-drive, and at least one weapon has power
		If GravJumpPower>0 && EnginePower>0 && ShieldPower>0 && (GatlingPower>0 || GunPower>0 || MissilePower>0)
			;advance the quest unless we've progressed to the Weapons tutorial
			If MyQuest.GetStageDone(420) == true && MyQuest.GetStageDone(424) == false && MyQuest.GetStageDone(485) == false
				MyQuest.SetStage(485)
			EndIf
		EndIf
	EndIf
EndFunction

Event OnShipTakeOff(bool abComplete)
	Quest MyQuest = GetOwningQuest()
	If abComplete == True
		; if we're leaving Vectera, check when the player is in space
		if MyQuest.GetStageDone(340) == True
			myQuest.SetStage(400)
		endif
	EndIf
EndEvent
