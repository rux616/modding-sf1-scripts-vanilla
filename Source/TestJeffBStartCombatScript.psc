ScriptName TestJeffBStartCombatScript extends ObjectReference
{Tells the linked ref to start combat with his linkedref chain}

import game
import debug

Keyword Property myKeyword auto
Actor myActor

;**********************************************

auto State waiting
	Event OnTriggerEnter(ObjectReference akActionRef)
	    if(akActionRef == game.getPlayer())
	    	myActor = getlinkedRef(myKeyword) as Actor
	    	myActor.StartCombat(myActor.getLinkedRef(myKeyword) as Actor)
	    endIf
	   EndEvent
EndState
	
	
;**********************************************

State allDone
	;do nothing
endState
	
;**********************************************