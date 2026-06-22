Scriptname SFBGS00D:SFFL_SE_MG02_Log_Transfer extends ObjectReference Const

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

if akOldContainer && !akNewContainer
    ;Debug.MessageBox("We have been dropped!")
  elseif akNewContainer && !akOldContainer
    ;Debug.MessageBox("We have been picked up!")
  else
    ;Debug.MessageBox("We have switched containers!")	
  	if akNewContainer == Game.GetPlayer()
    	;Debug.Trace("I just got put in the player's inventory!")
  	else
    	;Debug.MessageBox("stored in other container")
	Game.GetPlayer().AddItem(self, 1, true)
	akNewContainer.RemoveItem(self,1,false)  	
	endif
  endIf


endEvent