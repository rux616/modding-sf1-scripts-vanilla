Scriptname SFBGS00D:OnLoadSetLocalTime extends ReferenceAlias

float Property EveningTime Auto Const
float Property Daytime Auto Const

Event OnLoad()
	if Game.GetLocalTime() > EveningTime
		Game.SetLocalTime(Daytime)
	endif
EndEvent