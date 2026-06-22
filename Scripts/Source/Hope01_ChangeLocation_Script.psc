Scriptname Hope01_ChangeLocation_Script extends Quest Const

Location Property AkilaCityLocation Auto Const Mandatory
Keyword Property Contraband Auto Const Mandatory

group FailQuest
    SQ_ParentScript property SQ_Parent auto const mandatory

    int property Hope01_StageRequired = 100 auto const
    int Property Hope01_StageToSet = 8900 auto const
EndGroup

Event OnQuestInit()
	; Register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    debug.trace("Hope01: " + self + " OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	; Did the player go to Akila City? Do they have the quest?
    Actor aPlayer = Game.GetPlayer()
	if akSender == aPlayer && akNewLoc == AkilaCityLocation && GetStageDone(100)
        ; TODO: Need to check to see if they have the Sensor Jammer installed
        if (Game.GetPlayer().GetItemCount(Contraband) > 0 ) || PlayerShip.GetReference().GetItemCount(Contraband) > 0
            ; If the player has gotten to Akila City with contraband, including on their ship. success!
            SetStage(300)
        EndIf
	endif
EndEvent

Event OnStageSet(int auiStageID, int auiItemID)
    if auiStageID == Hope01_StageRequired
		RegisterForCustomEvent(SQ_Parent, "SQ_ContrabandConfiscated")
    elseif auiStageID == Hope01_StageToSet
		UnregisterForCustomEvent(SQ_Parent, "SQ_ContrabandConfiscated")
    endif
EndEvent

Event SQ_ParentScript.SQ_ContrabandConfiscated(SQ_ParentScript akSource, Var[] akArgs)
    debug.trace(self + " SQ_ContrabandConfiscated")
	; If you are losing your contraband, then Hope01 fails
	if GetStageDone(Hope01_StageRequired) && GetStageDone(Hope01_StageToSet) == false
		SetStage(Hope01_StageToSet)
	endif 
EndEvent

ReferenceAlias Property PlayerShip Auto Const
