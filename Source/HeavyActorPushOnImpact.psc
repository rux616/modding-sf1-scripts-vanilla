Scriptname HeavyActorPushOnImpact extends ObjectReference
{Script based solution for pushing things in game with heavy actors}

Keyword Property heavyKnocker Auto
{Keyword pointer for heavy actors}
Armor Property ArmorPoweredFrame Auto
{Pointer to power armor for testing against}
bool Property isHavokable Auto
{Set to true to get bollard like behavior}
explosion Property myExplosion Auto
{Explosion to play if non havokable}
int Property damageAmountIfHavok = 10 Auto
{damage to move bollard to havokable state}

actor myActor

bool property useDestruction = false Auto
{on heavy knocker enter use destruction or not}
Event OnTriggerEnter(ObjectReference akActionRef)

	debug.trace(akActionRef)
	myActor = akActionRef as Actor
    if myActor
    	Debug.Trace("actor is in")
     	if ((akActionRef as actor).IsEquipped(ArmorPoweredFrame))
    		if isHavokable == true
	 			Debug.Trace("DC is in")
				float eulerAngleZ = akActionRef.getAngleZ()+Utility.RandomFloat(-25.0, 25.0)

				debug.trace("my z angles are " + eulerAngleZ)


				float cosZ = math.cos(eulerAngleZ)
				float sinZ = math.sin(eulerAngleZ)

				DamageObject(damageAmountIfHavok)

				debug.trace("my launch vector is " +sinz +","  +cosz + " 0" )
				 
				self.ApplyHavokImpulse(sinz, cosz, 0, 10000)
			else
				placeatme(myExplosion)
				utility.wait(0.10)
				disable()
			endif
    	endIf


    	if (akActionRef.HasKeyword(heavyKnocker))
    		if isHavokable == true
	 			Debug.Trace("DC is in")
				float eulerAngleZ = akActionRef.getAngleZ()+Utility.RandomFloat(-25.0, 25.0)

				debug.trace("my z angles are " + eulerAngleZ)


				float cosZ = math.cos(eulerAngleZ)
				float sinZ = math.sin(eulerAngleZ)

				DamageObject(10.0)

				debug.trace("my launch vector is " +sinz +","  +cosz + " 0" )
				 
				self.ApplyHavokImpulse(sinz, cosz, 0, 10000)
			else
				if useDestruction == false
					placeatme(myExplosion)
					utility.wait(0.10)
					disable()
				else
					debug.trace("I damaged object" )
					DamageObject(10000.0)
				endif
			endif
		endIf
	endif
EndEvent