Scriptname KioskTerminalVendorScript extends TerminalMenu
{script for terminals that act as vending machines}

Form[] property ItemsForSale auto Const
{ array of items for sale at this vending machine }

ActorValue property KioskTerminalItemCount auto const mandatory
{ set when initialized, for conditioning menu items }

ActorValue property KioskTerminalInitialized auto const mandatory
{ set to 1 when initialized }

ActorValue property KioskTerminalNoSaleFlag auto const mandatory
{ set to 1 if the player tries to buy something with not enough credits }

TerminalMenu property KioskTerminalMenu auto const mandatory
{ the main terminal menu for this kiosk }

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter " + akTerminalRef)
    ; init text replacement
    if akTerminalRef.GetValue(KioskTerminalInitialized) == 0
        akTerminalRef.SetValue(KioskTerminalInitialized, 1)
        int i = 0
        while i < ItemsForSale.Length
            Form theItem = ItemsForSale[i]
            akTerminalRef.AddTextReplacementData("MiscItem" + i, theItem)
            int itemValue = theItem.GetGoldValue()
            akTerminalRef.AddTextReplacementValue("MiscItem" + i + "Value", itemValue)
            debug.Trace(self + " adding tag MiscItem" + i + "=" + theItem + " with value tag MiscItem" + i + "Value=" + itemValue)
            i += 1
        endWhile
        akTerminalRef.SetValue(KioskTerminalItemCount, i)
    endif
EndEvent

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    if akTerminalBase == KioskTerminalMenu
        Form theItem = ItemsForSale[auiMenuItemID]
        if theItem
            akTerminalRef.AddTextReplacementData("SaleItem", theItem)

            MiscObject credits = Game.GetCredits()
            Actor player = Game.GetPlayer()
            int playerCredits = player.GetItemCount(credits)
            int cost = theItem.GetGoldValue()
            if playerCredits >= cost
                akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0)
                ; sell item to player
                player.RemoveItem(credits, cost)
                player.Additem(theItem)
            Else
                ; no sale
                akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1)
            endif
        EndIf
    endif
EndEvent
