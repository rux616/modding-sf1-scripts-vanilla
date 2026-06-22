Scriptname RAD06PlayerAliasScript extends ReferenceAlias

MiscObject Property ResourceToLookFor Auto 
Int Property QuantityToLookFor Auto

Function RefreshFilter()
  AddInventoryEventFilter(ResourceToLookFor)
EndFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
  Debug.Trace("Rad06: Item added to player's ship cargo hold.")
  if ( akBaseItem == ResourceToLookFor )
      if ( GetRef().GetItemCount(ResourceToLookFor) >= QuantityToLookFor )
        GetOwningQuest().SetStage(200)
    EndIf
  endIf
EndEvent
