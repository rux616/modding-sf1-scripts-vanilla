Scriptname TestJeffBExplosivoScript extends ObjectReference  

import debug

Explosion Property myExplosion Auto Const

int numExplosionMarkers = 0
ObjectReference[] myArray
ObjectReference[] myTempArray

;************************************************************

Event OnLoad()
    numExplosionMarkers = CountLinkedRefChain()
    myArray = new ObjectReference[numExplosionMarkers]
    myTempArray = new ObjectReference[numExplosionMarkers]

    int i = 0
	While(i < numExplosionMarkers)
		myArray[i] = getNthLinkedRef(i + 1)
		i = i + 1
	EndWhile
EndEvent

;************************************************************

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
	    If(akActionRef == game.getPlayer())
	    	GotoState("DoNothing")
	    	RandomExplosions()
	    	int i = 0
	    	while(i < numExplosionMarkers)
	    		myArray[i].placeatme(myExplosion)
	    		float rand = Utility.RandomFloat(0.5, 3)
	    		Utility.Wait(rand)
	    		i = i + 1
	    	EndWhile
	    	GotoState("Waiting")
	    EndIf
	EndEvent

EndState

;************************************************************

State DoNothing
	Event OnActivate(ObjectReference akActionRef)
	    ;do nothing
	EndEvent

EndState

;************************************************************

Function RandomExplosions()
	int i = 0

	While(i < numExplosionMarkers)
		int rand = Utility.randomint(0, myArray.Length - 1)
		myTempArray[i] = myArray[rand]
		myArray.Remove(rand)
		i = i + 1
	EndWhile

	i = 0

	While (i < numExplosionMarkers)
		myArray.add(myTempArray[i])
		i = i + 1
	EndWhile

EndFunction