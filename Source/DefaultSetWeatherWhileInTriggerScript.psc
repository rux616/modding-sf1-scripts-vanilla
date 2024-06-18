Scriptname DefaultSetWeatherWhileInTriggerScript extends ObjectReference Default
{Set the weather that should display while the player is in this trigger.}

Weather Property WeatherToSetActive Auto Mandatory Const
{Defaults to CommonwealthClear}

Event OnTriggerEnter(ObjectReference akActionRef)
    WeatherToSetActive.SetActive(abOverride = TRUE)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    Weather.ReleaseOverride()
EndEvent