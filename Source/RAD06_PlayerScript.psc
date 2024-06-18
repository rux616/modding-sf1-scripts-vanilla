Scriptname RAD06_PlayerScript extends ReferenceAlias

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    Debug.Trace("RAD06 - entered location " + akNewLoc + ", looking for " + QuestGiverLoc.GetLocation() )

    ;check when the player enters the proper Staryard
    Quest MyQuest = GetOwningQuest()
	If ( akNewLoc == QuestGiverLoc.GetLocation() )
        (GetOwningQuest() as RAD06Script).CargoHoldResourceCheck()
    EndIf
EndEvent

LocationAlias Property QuestGiverLoc Auto Const
