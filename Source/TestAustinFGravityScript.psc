Scriptname TestAustinFGravityScript extends ObjectReference

{test script to change gravity on a cell}

import debug

Group RequiredProperties
	Float Property currentGravity Auto Const
	{the gravity you want to set on the cell}
	Float Property modifiedGravity Auto Const

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
	    		myCell.setGravityScale(currentGravity )
	    	else
	    		currentCell.setGravityScale(currentGravity )
	    	endIf
	    endIf
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
	    if(akActionRef == game.getPlayer())
	    	currentCell.setGravityScale(modifiedGravity)
	    endIf
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
	    	currentCell.setGravityScale(currentGravity )
	EndEvent
EndState
	
	
;**********************************************

State allDone
	;do nothing
endState
	
;**********************************************