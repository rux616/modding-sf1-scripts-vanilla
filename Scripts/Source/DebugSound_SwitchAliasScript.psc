Scriptname DebugSound_SwitchAliasScript extends ReferenceAlias

int Property ButtonIndex Mandatory Const Auto
{Which button functionality this object should trigger}

Event OnActivate(ObjectReference akActionRef)
    (GetOwningQuest() as DebugSoundScriptingQuest).TriggerButtonBehavior(ButtonIndex)
EndEvent