Scriptname TestGym_AddExplosionLoop extends ObjectReference Const
{Test gym script to add explosion repeatedly}

Explosion Property P_TestGym_PhysicparticleExplosion Auto Const Mandatory

ObjectReference Property P_testGyn_PE_Ref Auto Const Mandatory

Int Property P_loopTime = 6 Auto Const 

Event OnLoad()

    while 1 > 0
  	Debug.Trace("My loop for explosion debug")
	P_testGyn_PE_Ref.PlaceAtNode("BasePoint2m", P_TestGym_PhysicparticleExplosion)
	Utility.Wait(P_loopTime) 
   endwhile
endEvent

