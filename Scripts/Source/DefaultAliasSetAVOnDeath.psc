Scriptname DefaultAliasSetAVOnDeath extends ReferenceAlias Const Default
{Default script used to set an actor value when the actor in this alias is killed.}

Group Required_Properties
	ActorValue property AVToSet Auto Const Mandatory
	{Actor value to set when the actor in this alias is killed.}
EndGroup

Group Optional_Properties
	bool property SetAVOnKiller = True Auto Const
	{If true, AVToSet will be set on the killer of the actor. If False, it will be set on the dead actor.}

	bool property UseOnDying = False Auto Const
	{If TRUE, use the "OnDying" event instead of "OnDeath".}

	float property AVNewValue = 1.0 Auto Const
	{Value to set AVToSet to when this actor is killed.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup


Event OnDeath(ObjectReference akKiller)
	if !UseOnDying
		ProcessDeathEvent(akKiller)
	EndIf
EndEvent

Event OnDying(ObjectReference akKiller)
	if UseOnDying
		ProcessDeathEvent(akKiller)
	EndIf
EndEvent

Function ProcessDeathEvent(ObjectReference akKiller)
	Actor AVTarget
	if (SetAVOnKiller)
		AVTarget = akKiller as Actor
	Else
		AVTarget = Self.GetActorRef()
	EndIf
	if (AVTarget != None)
		DefaultScriptFunctions.Trace(self, AVTarget + " " + AVToSet + " " + AVNewValue, ShowTraces)
		AVTarget.SetValue(AVToSet, AVNewValue)
		DefaultScriptFunctions.Trace(self, "DefaultActorSetAVOnDeath.ProcessDeathEvent set Value: " + AVToSet + " on Actor: " + AVTarget + " to: " + AVTarget.GetValue(AVToSet), ShowTraces)
	EndIf	
EndFunction