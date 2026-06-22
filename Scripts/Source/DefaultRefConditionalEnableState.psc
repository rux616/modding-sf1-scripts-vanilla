Scriptname DefaultRefConditionalEnableState extends ObjectReference Const
{Enable/Disable on load if matching conditions.}


Group Properties
	ConditionForm Property EnableConditions Mandatory Const Auto
	{Condition form that must be true to enable. THIS reference is the Subject in the conditions.}
	
	bool Property DisableIfFalse = true Const Auto
	{if true (default), disable if condition form is false.}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnLoad()
	if EnableConditions.IsTrue(self)
		DefaultScriptFunctions.Trace(self, "Enabling", ShowTraces)
		Enable()
	elseif DisableIfFalse
		DefaultScriptFunctions.Trace(self, "Disabling", ShowTraces)
		Disable()
	endif
EndEvent