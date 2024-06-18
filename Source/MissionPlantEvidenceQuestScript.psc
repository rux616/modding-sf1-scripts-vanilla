Scriptname MissionPlantEvidenceQuestScript extends MissionQuestScript

group PlantEvidenceMissionData
	ReferenceAlias property HoldingContainer auto const Mandatory
	{ alias where data disk ref will be created }

	ReferenceAlias property Evidence auto const Mandatory
	{ evidence to plant }

    float property CooldownDays = 2.0 auto Const
    { how long before the same target location can be picked again? }

    ActorValue property CooldownAV auto const mandatory
    { AV to use for cooldown timestamp }
EndGroup

; OVERRIDE parent function
Function MissionAccepted(bool bAccepted)
	if bAccepted
        ; move device to player's inventory
        Game.GetPlayer().AddItem(Evidence.GetRef())
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

function CleanupMission()
    ; remove device from target container
    PrimaryRef.GetRef().RemoveItem(Evidence.GetRef())

    ; cooldown timestamp on location
    Location targetLoc = TargetLocation.GetLocation()
    targetLoc.SetValue(CooldownAV, Utility.GetCurrentGameTime() + CooldownDays)
endFunction