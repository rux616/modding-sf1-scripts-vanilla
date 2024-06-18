Scriptname DefaultClearInventoryOnUnload extends ObjectReference Const Default
{ Removes all items from this reference's inventory when unloaded. }

Event OnUnload()
    RemoveAllItems()
endEvent