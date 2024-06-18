Scriptname DefaultCollectionAliasOnActivateGive extends DefaultCollectionAliasOnActivate default
{Adds item(s) to <RefToCheck> when THIS RefCollection's members are activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection.}

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
	ParentScriptFunctionParams.RefToCheck.AddItem(ItemToGive, AmountToGive, abSilent = GiveSilently)

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
EndFunction