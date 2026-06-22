Scriptname DefaultAddItemOnLoad extends ObjectReference Default
{Placed on an Object Reference (preferably an actor or container) that will add the selected item OnLoad()}

Form Property ItemToAdd Auto Const
{Base object to add to this reference.}

Int Property Count = 1 Auto Const
{Default = 1: Number of this item to add.}

auto STATE Waiting
	Event OnLoad()
		GoToState("DoneWaiting")
		self.Additem(ItemToAdd, Count)
	EndEvent
EndSTATE

STATE DoneWaiting
	; Do Nothing
EndSTATE