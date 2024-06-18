Scriptname DialogueUCHyperloopQuestScript extends Quest Conditional

Int Property DepartureLocation Auto Conditional

Int Property ArrivalLocation Auto Conditional

ReferenceAlias Property Speaker_Spaceport Auto Const


Function UpdateDeparture()
	if Game.GetPlayer().GetDistance(Speaker_Spaceport.GetRef())<10
		DepartureLocation=1
	endif
EndFunction