Scriptname BQ01_BarrettScript extends Quest

LocationAlias Property Location_Temple Mandatory Const Auto
Keyword Property BQ01_Keyword_TempleLocation Mandatory Const Auto

Event OnQuestStarted()
    ;when this quest fully initializes, add special keyword to the Temple so we know its Barrett's
    Location_Temple.GetLocation().AddKeyword(BQ01_Keyword_TempleLocation)
EndEvent