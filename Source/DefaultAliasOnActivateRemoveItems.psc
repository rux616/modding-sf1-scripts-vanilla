Scriptname DefaultAliasOnActivateRemoveItems extends DefaultAliasOnActivate Default
{Removes item(s) to <RefToCheck> when THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating THIS Alias's reference.
<LocationToCheck> is the current location of THIS Alias's reference.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	Form property ItemToRemove Auto Const Mandatory
	{Remove this item from RefToCheck}

	int Property AmountToRemove = 1 Const Auto
	{The amount to give}

	bool Property RemoveSilently = false  Const Auto
	{(Default false) If true, give the item silently. If true, show message when giving item.}

	Message property InsufficientItemsMessage Auto Const
	{Message to display if RefToCheck doesn't have AmountToRemove or more ItemToRemove in their inventory}
EndGroup

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck
	
	if RefToCheck.GetItemCount(ItemToRemove) >= AmountToRemove
		DefaultScriptFunctions.Trace(self, "DoSpecificThing() removing ItemToRemove: " + ItemToRemove + ", from ParentScriptFunctionParams.RefToCheck: " + RefToCheck + ", ", ShowTraces)
		ParentScriptFunctionParams.RefToCheck.RemoveItem(ItemToRemove, AmountToRemove, abSilent = RemoveSilently)
		parent.DoSpecificThing(ParentScriptFunctionParams = ParentScriptFunctionParams, RefToDoThingWith = RefToDoThingWith, LastRefToDoThingWith = LastRefToDoThingWith)
	elseif InsufficientItemsMessage
		DefaultScriptFunctions.Trace(self, "DoSpecificThing() RefToCheck.GetItemCount(ItemToRemove) < AmountToRemove. NOT removing ItemToRemove: " + ItemToRemove + ", from ParentScriptFunctionParams.RefToCheck: " + RefToCheck + ", ", ShowTraces)
		InsufficientItemsMessage.Show()
	endif

EndFunction