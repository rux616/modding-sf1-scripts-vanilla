Scriptname MissionSabotageQuestScript extends MissionQuestScript

group SabotageMissionData
	ReferenceAlias property HoldingContainer auto const Mandatory
	{ alias where sabotage ref will be created }

	ReferenceAlias property Device auto const Mandatory
	{ sabotage ref }

	ReferenceAlias property DevicePlacementTrigger auto const Mandatory
	{ sabotage ref }

    ReferenceAlias Property PlacedDevice Auto Const Mandatory
    { static version of the ARC device that is actually placed }

    MiscObject Property RIR04_Device Auto Const Mandatory
    { base object to create planted device }

    float property CooldownDays = 2.0 auto Const
    { how long before the same target location can be picked again? }

    ActorValue property CooldownAV auto const mandatory
    { AV to use for cooldown timestamp }
EndGroup

; OVERRIDE parent function
Function MissionAccepted(bool bAccepted)
	if bAccepted
        ; move device to player's inventory
        Game.GetPlayer().AddItem(Device.GetRef())
        ; enable placement trigger
        DevicePlacementTrigger.TryToEnable()
	EndIf
	Parent.MissionAccepted(bAccepted)
endFunction

; OVERRIDE parent function
Function HandleOnQuestRejected()
    CleanupMission()
	MissionFailed()
endFunction

Function MissionComplete()
    CleanupMission()
	Parent.MissionComplete()
endFunction

Function CleanupMission()

    ; remove device from player
    Game.GetPlayer().RemoveItem(Device.GetRef())
    PlacedDevice.GetRef().MoveTo(PrimaryRef.GetRef(), abMatchRotation = True)
    ; disable placement trigger
    DevicePlacementTrigger.TryToDisable()

    ; cooldown timestamp on location
    Location targetLoc = TargetLocation.GetLocation()
    targetLoc.SetValue(CooldownAV, Utility.GetCurrentGameTime() + CooldownDays)
EndFunction