Scriptname NewAtlantisActorDialogueScript extends Actor Conditional

Float Property HoursPassed_LastInteraction Auto Conditional

GlobalVariable Property HoursPassed Auto Conditional Const


ActorValue Property DialogueVersion Auto Conditional Const

Event OnActivate(objectreference AkActionRef)

	int CurrentVersion = Self.GetValue(DialogueVersion) as int

	if (HoursPassed_LastInteraction + 1) < HoursPassed.GetValue( ) as float
		Self.SetValue(DialogueVersion, CurrentVersion + 1)
		HoursPassed_LastInteraction = HoursPassed.GetValue()
	endif



EndEvent



