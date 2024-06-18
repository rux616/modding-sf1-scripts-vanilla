Scriptname JobAliasOnUnloadScript extends ReferenceAlias

;if we're filling an alias through a Faction-based Hello, make sure we clear that alias if we unload so we're not persisting forever

Event OnUnload()
	If Self != None
		Self.Clear()
	EndIf
EndEvent