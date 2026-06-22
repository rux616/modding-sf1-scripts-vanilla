Scriptname SFBGS00D:SFFL_MS02_GuestDeathScript extends DefaultAliasParent Default


Event OnDeath(ObjectReference AkKiller)
	
			SFFL_MS02_PartyGuestsDead.Mod(1)

;If all guests are now dead, the quest will move foward
	If (SFFL_MS02_PartyGuestsDead.GetValue() == 9)
		SFFL_MS02.Setstage(900)
	EndIf


EndEvent

GlobalVariable Property SFFL_MS02_PartyGuestsDead Auto
Quest Property SFFL_MS02 Auto