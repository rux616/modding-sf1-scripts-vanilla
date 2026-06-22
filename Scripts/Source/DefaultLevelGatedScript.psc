Scriptname DefaultLevelGatedScript extends ObjectReference

Group Mandatory_Properties
	GlobalVariable Property LevelGatedSentryGlobal Auto Const Mandatory
	Race Property SentryBotRace Auto Const Mandatory

	GlobalVariable Property LevelGatedDeathclawGlobal Auto Const Mandatory
	Race Property DeathclawRace Auto Const Mandatory

	GlobalVariable Property LevelGatedBehemothGlobal Auto Const Mandatory
	Race Property SupermutantBehemothRace Auto Const Mandatory

	GlobalVariable Property LevelGatedMirelurkQueenGlobal Auto Const Mandatory
	Race Property MirelurkQueenRace Auto Const Mandatory

	GlobalVariable Property LevelGatedGenericGlobal Auto Const Mandatory
EndGroup

Group Optional_Properties
	Int Property LevelGateOverride = -1 Auto Const
	{If set then everything else is ignored, and if the player's level is equal to
	or greater than this Override Onload() this refrence will enable.}
EndGroup

auto STATE WaitingForGate
	Event OnLoad()

		if LevelGateOverride == -1
			Actor selfActor = (self as ObjectReference) as Actor

			if selfActor
				debug.Trace(self + "OnLoad()| I am an ACTOR!")
				if selfActor.GetRace() == SentryBotRace && Game.GetPlayer().GetLevel() >= LevelGatedSentryGlobal.GetValue()
					debug.Trace(self + "OnLoad()| I am a Sentry!")
					GoToState("Done")
					self.Enable()
				elseif selfActor.GetRace() == DeathclawRace && Game.GetPlayer().GetLevel() >= LevelGatedDeathclawGlobal.GetValue()
					debug.Trace(self + "OnLoad()| I am a Deathclaw!")
					GoToState("Done")
					self.Enable()
				elseif selfActor.GetRace() == SupermutantBehemothRace && Game.GetPlayer().GetLevel() >= LevelGatedBehemothGlobal.GetValue()
					debug.Trace(self + "OnLoad()| I am a Behemoth!")
					GoToState("Done")
					self.Enable()
				elseif selfActor.GetRace() == MirelurkQueenRace && Game.GetPlayer().GetLevel() >= LevelGatedMirelurkQueenGlobal.GetValue()
					debug.Trace(self + "OnLoad()| I am a Mirelurk Queen!")
					GoToState("Done")
					self.Enable()
				elseif selfActor.GetRace() != SentryBotRace && selfActor.GetRace() != DeathclawRace && selfActor.GetRace() != SupermutantBehemothRace && selfActor.GetRace() != MirelurkQueenRace && Game.GetPlayer().GetLevel() >= LevelGatedGenericGlobal.GetValue()
					debug.Trace(self + "OnLoad()| I am a Different Actor!")
					GoToState("Done")
					self.Enable()
				endif
			else
				debug.Trace(self + "OnLoad()| I am NOT an actor")
				if Game.GetPlayer().GetLevel() >= LevelGatedGenericGlobal.GetValue()
					debug.Trace(self + "OnLoad()| I am a generic reference!")
					GoToState("Done")
					self.Enable()
				endif
			endif
		else
			debug.Trace(self + "OnLoad()| We've got an Override!")
			if Game.GetPlayer().GetLevel() >= LevelGateOverride
				debug.Trace(self + "OnLoad()| Override reached, enable me!")
				GoToState("Done")
				self.Enable()
			endif
		endif


	EndEvent
EndSTATE


STATE Done
	;DONE!
EndSTATE