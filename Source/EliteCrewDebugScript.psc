Scriptname EliteCrewDebugScript extends Actor

SQ_CrewScript SQ_Crew
Quest Property CrewQuest Auto Const

Event OnInit()
	SQ_Crew = Game.GetFormFromFile(0x02A567D, "Starfield.esm") as SQ_CrewScript
EndEvent

Function DebugMakeAvailableCrew()
	SQ_Crew.SetRoleAvailable(self)
EndFunction

Function DebugHire()
	SQ_Crew.SetRoleActive(self)
	MoveTo(Game.GetPlayer())
EndFunction

Function DebugMakeActiveEliteCrew()
	DebugHire()
	CrewQuest.SetStage(0)
	SQ_Crew.SetEliteCrewActive(self)
	MoveTo(Game.GetPlayer())
EndFunction
