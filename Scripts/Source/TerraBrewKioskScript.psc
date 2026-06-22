Scriptname TerraBrewKioskScript extends ObjectReference Const
Actor Property Vendor1 Auto Const

Event OnActivate(ObjectReference akActionRef)
  if akActionRef == Game.GetPlayer()
	;Debug.Notification("I am being activated")
	Vendor1.ShowBarterMenu()
  endif
EndEvent

