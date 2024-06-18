Scriptname WeapAutoEquip extends ObjectReference

;Weapon property WeaponToEquip auto const

GlobalVariable property WeaponHasAutoEquipped auto const
int Property FavoriteSlot = -1 auto const

Form WeaponToEquip

Event OnInit()
	WeaponToEquip = self.GetBaseObject()
EndEvent


;when the player picks up the weapon, automatically equip the weapon and favorite it
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	;Debug.Trace("**************" + self + "changed container!")
	
	if akNewContainer == Game.GetPlayer()		
		if WeaponHasAutoEquipped.GetValue() == 0
			;set the global so the autoequip only happens the first time
			WeaponHasAutoEquipped.SetValue(1)

			;autoequipping
			Game.GetPlayer().EquipItem(WeaponToEquip)

			;favoriting
			Game.GetPlayer().MarkItemAsFavorite(WeaponToEquip, FavoriteSlot)

			;wait a second to allow the weapon to assemble in the hand before drawing it
			Utility.wait(0.5)
			Game.GetPlayer().DrawWeapon()
		endif
	endif
EndEvent