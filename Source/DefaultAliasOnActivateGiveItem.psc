Scriptname DefaultAliasOnActivateGiveItem extends DefaultAliasOnActivate Default
{Adds item(s) to <RefToCheck> when THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating THIS Alias's reference.
<LocationToCheck> is the current location of THIS Alias's reference.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	Form property ItemToGive Auto Const Mandatory
	{Give this item to RefToCheck}

	int Property AmountToGive = 1 Const Auto
	{The amount to give}

	bool Property GiveSilently = false  Const Auto
	{(Default false) If true, give the item silently. If true, show message when giving item.}

	ReferenceAlias property ReferenceAliasToAddTo Auto Const
	{The item (or first item) will be put into this ref alias when it is given.}

	RefCollectionAlias Property ReferenceCollectionAliasToAddTo Auto Const	 	 
	{The item(s) will be put into this ref collection when they are given.}
EndGroup

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	DefaultScriptFunctions.Trace(self, "DoSpecificThing() giving ItemToGive: " + ItemToGive + ", to ParentScriptFunctionParams.RefToCheck: " + ParentScriptFunctionParams.RefToCheck + ", ", ShowTraces)

	int i = 0
	While (i < AmountToGive)
		ObjectReference refToCheck = ParentScriptFunctionParams.RefToCheck

		if (ReferenceAliasToAddTo && (i == 0))
			RefToCheck.AddAliasedItem(ItemToGive, ReferenceAliasToAddTo, 1, abSilent = GiveSilently)
		EndIf
		if (ReferenceCollectionAliasToAddTo)
			RefToCheck.AddAliasedItem(ItemToGive, ReferenceCollectionAliasToAddTo, 1, abSilent = GiveSilently)
		EndIf
	 
		i += 1
	EndWhile

	parent.DoSpecificThing(ParentScriptFunctionParams = ParentScriptFunctionParams, RefToDoThingWith = RefToDoThingWith, LastRefToDoThingWith = LastRefToDoThingWith)
EndFunction