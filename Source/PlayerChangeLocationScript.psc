Scriptname PlayerChangeLocationScript extends Actor Const
{ Send events when the player changes locations
  For now specifically to get the PlayerShipQuest to run - possibly temp solution?
  }

Keyword Property PlayerShipQuestKeyword auto const

Event OnEnterShipInterior(ObjectReference akShip)
	debug.trace(self + " OnEnterShipInterior akShip= " + akShip)
    	PlayerShipQuestKeyword.SendStoryEvent(akRef1 = akShip)
EndEvent