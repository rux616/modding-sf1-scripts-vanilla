Scriptname COM_Quest_SamCoe_Q01_LocationScript extends ReferenceAlias
{Script to ensure quest does not break if player leaves in the middle of Sam's scene with Lillian}

LocationAlias Property VictorLocation Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

Scene Property COM_SamCoeQ01_0750_LillianAlert Auto Const Mandatory

Keyword Property LinkCustom04 Auto Const Mandatory

int Property PrereqStage = 750 Auto Const 

int Property DoneStage = 775 Auto Const 

int Property DistanceCheck = 10 Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Location myLandingArea = VictorLocation.GetLocation()
	Quest myQuest = GetOwningQuest()
	;Initial check to confirm we are at the point in the quest this scene should play
	if myQuest.GetStageDone(PrereqStage) && !myQuest.GetStageDone(DoneStage)
		if akOldLoc == myLandingArea && COM_SamCoeQ01_0750_LillianAlert.IsPlaying()
			;Stop scene if player leaves location after starting the scene at PrereqStage. This will fix the blocker 
			COM_SamCoeQ01_0750_LillianAlert.Stop()
		elseif akNewLoc == myLandingArea
			;If the player has left the area and taken Sam with them, move Sam back to his furniture
			ObjectReference SamCoeRef = Alias_SamCoe.GetRef()
			ObjectReference SamCoeFurnitureRef = SamCoeRef.GetLinkedRef(LinkCustom04)
			ObjectReference CoraCoeRef = Alias_CoraCoe.GetRef()
			ObjectReference CoraCoeFurnitureRef = CoraCoeRef.GetLinkedRef(LinkCustom04)

			;Don't move Sam and Cora if they're already in position or near it
			if SamCoeRef.GetDistance(SamCoeFurnitureRef) > DistanceCheck
					SamCoeRef.MoveTo(SamCoeFurnitureRef)
			endif
			if CoraCoeRef.GetDistance(CoraCoeFurnitureRef) > DistanceCheck
				CoraCoeRef.MoveTo(CoraCoeFurnitureRef)
			endif
			;Restart scene that we stopped previously
			if !COM_SamCoeQ01_0750_LillianAlert.IsPlaying()
				COM_SamCoeQ01_0750_LillianAlert.Start()
			endif
		endif
	endif
EndEvent