ScriptName TestChangeGravityScript extends ObjectReference
{test script to change gravity on a cell}

import debug

Group RequiredProperties
	Float Property myGravity Auto Const
	{the gravity you want to set on the cell}
EndGroup

Group OptionalProperties
	Cell property myCell Auto Const
	{set if you want to change gravity on a cell that the player is not currently in}
EndGroup

Cell currentCell

;**********************************************

auto State waiting
	Event OnLoad()
	    currentCell = getParentCell()
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
	    if (akActionRef == game.getPlayer())
	    	if(myCell)
	    		myCell.setGravityScale(myGravity)
	    	else
	    		currentCell.setGravityScale(myGravity)
	    	endIf
	    endIf
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
	    if(akActionRef == game.getPlayer())
	    	currentCell.setGravityScale(0.0)
	    endIf
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
	    	currentCell.setGravityScale(myGravity)
	EndEvent
EndState
	
	
;**********************************************

State allDone
	;do nothing
endState
	
;**********************************************
