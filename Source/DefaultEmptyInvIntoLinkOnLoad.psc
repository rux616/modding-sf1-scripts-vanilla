Scriptname DefaultEmptyInvIntoLinkOnLoad extends ObjectReference default
{Removes items from self and puts them into Linked Ref OnLoad()}

auto STATE WaitForLoad
	Event OnLoad()
		GoToState("Done")
    	self.RemoveAllItems(GetLinkedRef())
	EndEvent
EndSTATE

STATE Done
	;Do Nothing
EndSTATE
