Scriptname SFBGS00D:SFFL_AnchorpointZ04QuestScript extends Quest
{Randomly generates spacer ships at the location of the shipment}

GlobalVariable Property MissionBoardPiracy_EscortChance Auto Const Mandatory

RefCollectionAlias Property Escorts Auto Const

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