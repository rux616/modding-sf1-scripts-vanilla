Scriptname RAD06Script extends Quest

struct ResourcesInfo
	int ResourceID
	{This is the ID number of the resource.}

	MiscObject ResourceObject
	{This is the misc item tied to the actual resource.}

	int PricePerUnit
	{This is how much you are paid for delivering the resources}

	ReferenceAlias NameReference
	{This is the Reference Alias that has the name of the Resource}
endStruct

ResourcesInfo[] property ResourceInfo auto Const
{ Array of all the Resource info for RAD06 }

Function InitResource()
{ Pick a resource and quantity }

	Actor aPlayer = Game.GetPlayer()

	; Pick a resource now
	Int nResourceID
	nResourceID = Utility.RandomInt(1, RAD06_EndValue.GetValue() as Int)

	; Save what was rolled on the Quest Giver
	QuestGiver.GetRef().SetValue(RAD06_ResourceCheckAV, nResourceID as Float)
	
	; Then update the name alias
	ResourceName.ForceRefTo(ResourceInfo[(nResourceID)- 1].NameReference.GetRef())

	; Pick a quantity
	Int nRandomQuantity = Utility.RandomInt(1, 3)
	float fActualQuantity
	if ( nRandomQuantity == 1 )
		fActualQuantity = RAD06_Quantity_01_Low.GetValue()
	ElseIf ( nRandomQuantity == 2 )
		fActualQuantity = RAD06_Quantity_02_Medium.GetValue()
	Else
		fActualQuantity = RAD06_Quantity_03_High.GetValue()
	EndIf

	; Store how much you have left to collect on an AV on the QuestGiver
	RAD06_CurrentQuantity.SetValue(fActualQuantity)
	QuestGiver.GetRef().SetValue(RAD06_CurrentQuantityAV, fActualQuantity)
	
	; Bake in the reward
	float fResourceReward = ResourceInfo[(nResourceID)- 1].PricePerUnit
	Float fCreditReward = RAD06_CurrentQuantity.GetValue() * fResourceReward
	RAD06_CurrentReward.SetValue(fCreditReward)

	; Set the MiscObject that we're looking for in the cargo hold
	(PlayerShipInventory as RAD06PlayerAliasScript).ResourceToLookFor = ResourceInfo[(nResourceID)- 1].ResourceObject
	(PlayerShipInventory as RAD06PlayerAliasScript).QuantityToLookFor = RAD06_CurrentQuantity.GetValue() as Int
	(PlayerShipInventory as RAD06PlayerAliasScript).RefreshFilter()

	; Update the quest's values for the globals (some are referenced in notes and objectives)
    UpdateCurrentInstanceGlobal(RAD06_CurrentQuantity)
    UpdateCurrentInstanceGlobal(RAD06_CurrentReward)

EndFunction

Bool Function CargoHoldResourceCheck()
{ Check to see if the player has the right mats in her cargo hold right now }

	; Check for mats
	Actor aQuestGiver = QuestGiver.GetActorRef()
	int nResourceID = aQuestGiver.GetValue(RAD06_ResourceCheckAV) as int
	int nFullQuantity = aQuestGiver.GetValue(RAD06_CurrentQuantityAV) as int
	int nCurrentQuantity = PlayerShipInventory.GetRef().GetItemCount(ResourceInfo[(nResourceID)- 1].ResourceObject)

	Debug.Trace("Cargo Check for " + aQuestGiver + ": " + nResourceID + ", " + nFullQuantity + ", " + nCurrentQuantity)

	; Do you have the full delivery (or more)?
	if ( nCurrentQuantity >= nFullQuantity )	; Does the player have more mats than they need?
		nCurrentQuantity = nFullQuantity		; Then only collect what you need
		SetStage(200)							; Flag that the quest is ready to complete
	endif

	; Update how much is being taken from the cargo hold
	aQuestGiver.SetValue(RAD06_DeliveryAmountAV, nCurrentQuantity as Float)

	; Let's remove the resources
	if ( nCurrentQuantity > 0 )	; Check to see the player has at least some it in their storage
		Debug.Trace("Made it into the loop: " + nCurrentQuantity)
		PlayerShipInventory.GetRef().RemoveItem(ResourceInfo[(nResourceID)- 1].ResourceObject, nCurrentQuantity)

		int nCreditsToReward = nCurrentQuantity * ResourceInfo[(nResourceID)- 1].PricePerUnit
		Game.GetPlayer().AddItem(Credits, nCreditsToReward)

		int nNewFullQuantity = nFullQuantity - nCurrentQuantity
		aQuestGiver.SetValue(RAD06_CurrentQuantityAV, nNewFullQuantity )

		; Update the objective
		RAD06_CurrentQuantity.SetValue(nNewFullQuantity as Float)	; The global is going to be overwritten all the time
		if ( !GetStageDone(200) )		; If the quest isn't done
			UpdateCurrentInstanceGlobal(RAD06_CurrentQuantity)
		endif
	endif

EndFunction

GlobalVariable Property RAD06_CurrentQuantity Auto Const Mandatory
GlobalVariable Property RAD06_CurrentReward Auto Const Mandatory
GlobalVariable Property RAD06_Quantity_01_Low Auto Const Mandatory
GlobalVariable Property RAD06_Quantity_02_Medium Auto Const Mandatory
GlobalVariable Property RAD06_Quantity_03_High Auto Const Mandatory
GlobalVariable Property RAD06_EndValue Auto Const Mandatory

Perk Property Scanning Auto Const Mandatory

ActorValue Property RAD06_ResourceCheckAV Auto Const Mandatory
ActorValue Property RAD06_CurrentQuantityAV Auto Const Mandatory
ActorValue Property RAD06_DeliveryAmountAV Auto Const Mandatory

ReferenceAlias Property PlayerShipInventory Auto Const
ReferenceAlias Property QuestGiver Auto Const
ReferenceAlias Property ResourceName Auto Const

MiscObject Property Credits Auto Const Mandatory
