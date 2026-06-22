Scriptname MissionHackQuestScript extends MissionQuestScript

group HackMissionData
	ReferenceAlias property HoldingContainer auto const Mandatory
	{ alias where data disk ref will be created }

	ReferenceAlias property DataDisk auto const Mandatory
	{ data disk }

    float property CooldownDays = 2.0 auto Const
    { how long before the same target location can be picked again? }

    ActorValue property CooldownAV auto const mandatory
    { AV to use for cooldown timestamp }
EndGroup

; OVERRIDE parent function
Function MissionAccepted(bool bAccepted)
	if bAccepted
        ; move device to player's inventory
        Game.GetPlayer().AddItem(DataDisk.GetRef())
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
    Game.GetPlayer().RemoveItem(DataDisk.GetRef())

    ; cooldown timestamp on location
    Location targetLoc = TargetLocation.GetLocation()
    targetLoc.SetValue(CooldownAV, Utility.GetCurrentGameTime() + CooldownDays)
endFunction

