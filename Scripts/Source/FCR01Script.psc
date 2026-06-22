Scriptname FCR01Script extends Quest

MissionParentScript Property MissionParent Auto Const Mandatory
{ mission parent quest }

Int Property AcceptStage = 50 Auto Const
{The stage to set when mission is accepted}

Event OnMissionAccepted()
	debug.trace(self + " OnMissionAccepted")
	HandleOnMissionAccepted()
EndEvent

function HandleOnMissionAccepted()
	debug.trace(self + " HandleOnMissionAccepted")
	if MissionParent.MissionBoardAcceptMessage.Show() == 0
		MissionAccepted(true)
	else
		MissionAccepted(false)
	endif
endFunction

Function MissionAccepted(bool bAccepted)
	debug.trace(self + " MissionAccepted " + bAccepted)
	if bAccepted
		; Play a sound for accepting the mission
		WwiseEvent.PlayMenuSound("UITerminalMissionBoardMissionAcceptYes")
        setstage(AcceptStage)
	Else
		; Play a sound for not accepting the mission
		WwiseEvent.PlayMenuSound("UITerminalMissionBoardMissionAcceptNo")
	endif
EndFunction
