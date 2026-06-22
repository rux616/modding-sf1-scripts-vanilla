Scriptname SFBGS00D:SFFL_AnchrpointZ02QuestScript extends Quest Conditional

GlobalVariable property MissionBoardPiracy_EscortChance auto const mandatory
{ percent chance that escorts appear on this mission }

RefCollectionAlias property Escorts auto const
{ optional - holds escorts to randomly enable }

Function GenerateEscorts()
 ; enable escorts randomly, if any
	if Game.GetDieRollSuccess(MissionBoardPiracy_EscortChance.GetValueInt())
		if Escorts && Escorts.GetCount() > 0
			debug.trace(self + " rolling for number of escorts: 1 to " + Escorts.GetCount())
			int numToEnable = Utility.RandomInt(1, Escorts.GetCount())
			debug.trace(self + " enabling " + numToEnable + " escorts")
			if numToEnable > 0
				int i = 0
				while i < numToEnable
					SpaceshipReference escortRef = Escorts.GetShipAt(i)
					if escortRef
						escortRef.Enable()
					endif
					i += 1
				EndWhile
			EndIf
		endif
	endif
endFunction
