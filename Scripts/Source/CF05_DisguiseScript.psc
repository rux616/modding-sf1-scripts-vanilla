Scriptname CF05_DisguiseScript extends Quest 

Faction[] Property MyFaction Auto Const Mandatory
Keyword Property CF05_EnsignArmorKeyword_Disguise Auto Const Mandatory
Float Property TimeDelay Auto Const Mandatory

int CF05TimerID = 10 Const

Function AddPlayerToFaction()
	int i = 0
	while i < MyFaction.Length
		Game.GetPlayer().AddtoFaction(MyFaction[i])
		i += 1
	endwhile
endFunction

Function RemovePlayerFromFaction()
	int i = 0
	while i < MyFaction.Length
		Game.GetPlayer().RemoveFromFaction(MyFaction[i])
		i += 1
	endwhile
endFunction

Function RunTimer()
	CancelTimer(CF05TimerID)
	StartTimer(TimeDelay, CF05TimerID)
endFunction

Event OnTimer(int timerID)
	if (timerID == CF05TimerID)
		Actor PlayerRef = Game.GetPlayer()
		
		if PlayerRef.WornHasKeyword(CF05_EnsignArmorKeyword_Disguise)
			AddPlayerToFaction()
		else
			RemovePlayerFromFaction()
		endIf
	endIf
EndEvent