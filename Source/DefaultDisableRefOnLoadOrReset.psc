ScriptName DefaultDisableRefOnLoadOrReset Extends ObjectReference
{Disables this ref on load or reset}

Group Actions
	bool property DisableOnLoad = false auto
	{If this is true, this will be disabled every time it recieves OnLoad}

	bool property DisableOnReset = false auto
	{If this is true, this will be disabled every time it recieves OnReset}

	Bool property ShouldFadeOut = false Auto
	{Set if you want this to fade out}
EndGroup


Event OnLoad()
	if DisableOnLoad
		self.Disable(ShouldFadeOut)
	Endif
EndEvent


Event OnReset()
	if DisableOnReset
		self.Disable(ShouldFadeOut)
	Endif
EndEvent