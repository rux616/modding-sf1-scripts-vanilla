Scriptname SE_DB05Script extends Quest Conditional

FormList Property ManufacturedItems_All Mandatory Const Auto

ReferenceAlias Property Alias_HailingShip Mandatory Const Auto

ReferenceAlias Property Alias_ItemNeeded Mandatory Const Auto

float Property hasManufacturedItem = 0.0 Auto Conditional Hidden
; Needs to be a float for the GetVMQuestVariable condition check

GlobalVariable Property SE_Player_DB05_ItemValueGlobal Mandatory Auto

Form Property Credits Mandatory Const Auto

Event OnQuestInit()
    PopulateNeededItem()
EndEvent

Form Function CheckInventory()
; Find a manufactured item in the player's inventory that they have the least of.

    Debug.Trace(self + "Checking Player Inventory")
    Form[] PlayersManufacturedItems = new Form[0]
    int i = 0
    int formListSize = ManufacturedItems_All.GetSize()

    ;Create array of items the player has from the manufactured item list.
    while (i < formListSize)
        if (Game.GetPlayer().GetItemCount(ManufacturedItems_All.GetAt(i)) > 0)
            PlayersManufacturedItems.Add(ManufacturedItems_All.GetAt(i))
        EndIf
        i = i + 1
    endwhile
    ;Go through the list of items and see which the player has the fewest of.
    int currentAmount = Game.GetPlayer().GetItemCount(PlayersManufacturedItems[0])
    Debug.Trace("Current Amount: " + currentAmount)
    Form currentItem = (PlayersManufacturedItems[0])
    Debug.Trace("Current Item: " + currentItem)
    int j = 1
    while (j < PlayersManufacturedItems.length)
        Debug.Trace("Player has: " + (Game.GetPlayer().GetItemCount(PlayersManufacturedItems[j]) + " " + PlayersManufacturedItems[j]))
        if (Game.GetPlayer().GetItemCount(PlayersManufacturedItems[j]) < currentAmount)
            currentAmount = Game.GetPlayer().GetItemCount(PlayersManufacturedItems[j])
            currentItem = PlayersManufacturedItems[j]
        EndIf
        j = j + 1
    EndWhile

    Debug.Trace("Players Item with the lowest count is: " + currentItem + " with " + currentAmount + " items.")
    return currentItem

EndFunction

Function PopulateNeededItem()
    Form manufacturedItem = CheckInventory()
    Debug.Trace("Manufactured Item is: " + manufacturedItem)
    if(manufacturedItem)
        hasManufacturedItem = 1.0
    Else
        ;Should only happen if the player has no items from the list.
        manufacturedItem = ManufacturedItems_All.GetAt(Utility.RandomInt(0, ManufacturedItems_All.GetSize()-1)) as ObjectReference
    EndIf
    ;Set the needed item to the Alias_ItemNeeded
    ;This needs to be turned into a ref to be added to an alias, in order to work for text replacement.
    Alias_HailingShip.GetShipRef().AddAliasedItem(manufacturedItem, Alias_ItemNeeded)

    SE_Player_DB05_ItemValueGlobal.SetValueInt(manufacturedItem.GetGoldValue() * 2)
    Debug.Trace("Value of Item " + SE_Player_DB05_ItemValueGlobal.GetValueInt())
    ;Make sure the ship has the money to pay the player.
    Alias_HailingShip.GetShipRef().AddItem(Credits, (SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2))
EndFunction

Function GiveItem()
    ;Check that the player has the item, and the ship has the money
    if(Game.GetPlayer().GetItemCount(Alias_ItemNeeded.GetRef()) > 0) && (Alias_HailingShip.GetShipRef().GetItemCount(Credits) >= (SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2))
        ;Exchange Item
        Game.GetPlayer().RemoveItem(Alias_ItemNeeded.GetRef())
        Alias_HailingShip.GetShipRef().AddItem(Alias_ItemNeeded.GetRef())
        ;Exchange Money
        Game.GetPlayer().AddItem(Credits, (SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2))
        Alias_HailingShip.GetShipRef().RemoveItem(Credits, (SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2))
    endif
EndFunction

; HEy! I think I need to spawn the manufactured item somewhere in order to be able to
; add it to the alias to be able to
; Reference it for text replacement.

;OLD
    ;Alias_ItemNeeded.ForceRefTo(manufacturedItem as ObjectReference)


;for each item in manufactured items
; check if the player has that item.
; then check how many the player has.
; If the player has  fewer of that item than the current amount of the current item...
;then update the current item and amount,
; return current item and amount.

