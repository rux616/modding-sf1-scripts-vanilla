Scriptname DefaultAliasChangeAVOnInit extends ReferenceAlias
{Sets, mods, or damages one or more actor values on load, once only.}

Struct ActorValueDatum
	ActorValue ActorValueToChange
	{An actor value to change.}
	float NewValue
	{The amount to set this actor value to, mod the value by, or damage the value by.}
	int TypeOfChange
	{DEFAULT=0. 0=Set, 1=Mod, 2=Damage, 3=Restore}
EndStruct

ActorValueDatum[] property ActorValueData Auto Const Mandatory
{Struct of actor values to be changed.}

;TypeOfChange Consts
int CONST_TypeOfChange_Set = 0 Const
int CONST_TypeOfChange_Mod = 1 Const
int CONST_TypeOfChange_Damage = 2 Const
int CONST_TypeOfChange_Restore = 3 Const

Auto State Waiting
	Event OnAliasInit()
		GoToState("Done")
		ObjectReference myRef = GetRef()
		if (myRef == None)
			Game.Error("ERROR: DefaultAliasChangeAVOnInit cannot change values on " + myRef + " because it is empty.")
		Else
			int i = 0
			While (i < ActorValueData.Length)
				ActorValueDatum current = ActorValueData[i]
				if (current.TypeOfChange == CONST_TypeOfChange_Set)
					myRef.SetValue(current.ActorValueToChange, current.NewValue)
				ElseIf (current.TypeOfChange == CONST_TypeOfChange_Mod)
					myRef.ModValue(current.ActorValueToChange, current.NewValue)
				ElseIf (current.TypeOfChange == CONST_TypeOfChange_Damage)
					myRef.DamageValue(current.ActorValueToChange, current.NewValue)
				ElseIf (current.TypeOfChange == CONST_TypeOfChange_Restore)
					myRef.RestoreValue(current.ActorValueToChange, current.NewValue)
				EndIf
				i = i + 1
			EndWhile
		EndIf
	EndEvent
EndState

State Done
	;Do nothing.
EndState