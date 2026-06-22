Scriptname DefaultAliasDamageSpaceshipOnInit extends ReferenceAlias
{Damages a spaceship on load. Damage can be done to the ship's crew, parts, or other actor values.}

Struct ActorValueDatum
	ActorValue ActorValueToDamage
	{An actor value to damage.}
	float DamagePercent = 1.0
	{The percent to damage the value by, 0-1, with 1 being 100% damage.}
EndStruct

Group DamageProperties
	bool property ShouldBeDestroyed = False Auto Const
	{DEFAULT=False. If True, the ship will be killed and break apart on load. All other settings will be ignored.}

	bool property ShouldBeDerelict = True Auto Const
	{DEFAULT=True. If True, the ship's SpaceshipCrew actor value will be reduced to 0, and the BEDerelict keyword will be added to the ship.}

	bool property ShouldApplyDerelictName = True Auto Const
	{DEFAULT=True. If True, prepend 'Derelict' to the ship's name.}

	bool property ShouldDamageRandomSystems = True Auto Const
	{DEFAULT=True. If True, ship systems will be damaged semi-randomly. If False, nothing will be done to the ship automatically.}

	bool property ShouldDisableExteriorLights = True Auto Const
	{DEFAULT=True. If True, the ship's exterior lights, if any, will be disabled.}

	bool property ShouldBlockRepairOfDestroyedParts = True Auto Const
	{DEFAULT=True. If True, EnablePartRepair will be used to block repair of the destroyed parts.}

	SQ_ParentScript:ActorValueDatum[] property AdditionalActorValuesToDamage Auto Const
	{OPTIONAL. A list of additional actor values to damage.}
EndGroup

Group AutofillProperties
	SQ_ParentScript property SQ_Parent Auto Const Mandatory
EndGroup

Auto State Waiting
	Event OnAliasInit()
		GoToState("Done")
		SpaceshipReference myShip = GetRef() as SpaceshipReference
		if (myShip == None)
			Game.Error("ERROR: DefaultAliasDamageSpaceshipOnInit cannot damage " + GetRef() + " because it is empty or is not a ship.")
		Else
			SQ_Parent.SetupDamagedShip(myShip, ShouldBeDestroyed, ShouldBeDerelict, ShouldApplyDerelictName, ShouldDamageRandomSystems, ShouldDisableExteriorLights, ShouldBlockRepairOfDestroyedParts, AdditionalActorValuesToDamage)
		EndIf
	EndEvent
EndState

State Done
	;Do nothing.
EndState