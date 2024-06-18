Scriptname TestBountyBoardScript extends ObjectReference Const

Quest[] Property Missions Auto Const

;every time the terminal loads, try to start the mission board quests if they are not running.
Event OnLoad()
	int currentElement = 0
	while (currentElement < Missions.Length)
		If Missions[currentElement].IsRunning() == False
			Missions[currentElement].Start()
		EndIf
		currentElement += 1
	EndWhile
EndEvent