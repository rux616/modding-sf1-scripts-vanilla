Scriptname COM_CoraBookRemovalScript extends ReferenceAlias
{A script to give experience and prevent players from overloading Cora with books}

Group Script_Specific_Properties
	Form Property ItemFilter Auto Const Mandatory
EndGroup

Event OnUnload()
	ObjectReference CoraRef = GetRef()
	int BookTotal = CoraRef.GetItemCount(ItemFilter)
	CoraRef.RemoveItem(ItemFilter, aiCount = BookTotal)
EndEvent