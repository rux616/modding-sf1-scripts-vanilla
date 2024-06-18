Scriptname FABSpaceLocationChangeScript extends ReferenceAlias

Location Property LocationToCheck Auto Const Mandatory
Int Property StageToSet Auto Const
Int Property ConditionalStage Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    ; Check if the player's ship has reached the right location
    Quest MyQuest = GetOwningQuest()

    if ( MyQuest.GetStageDone(ConditionalStage) )       ; Has the player completed the required stage
        if ( akNewLoc == LocationToCheck )              ; Is the player in the right location?
            MyQuest.SetStage(StageToSet)                ; If so, set the proper stage
        endif
    endif
EndEvent