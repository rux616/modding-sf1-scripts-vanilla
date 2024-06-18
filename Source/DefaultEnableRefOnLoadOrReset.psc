ScriptName DefaultEnableRefOnLoadOrReset Extends ObjectReference
{Enables this ref on load or reset}

Group Actions

bool property EnableOnLoad = false auto
{If this is true, this will be enabled every time it recieves OnLoad}

bool property EnableOnReset = false auto
{If this is true, this will be enabled every time it recieves OnReset}

Bool property ShouldFadeIn = false Auto
{Set if you want this to fade in on load}
EndGroup


Event OnLoad()
	if EnableOnLoad
		self.Enable(ShouldFadeIn)
	Endif
EndEvent


Event OnReset()
	if EnableOnReset
		self.Enable(ShouldFadeIn)
	Endif
EndEvent