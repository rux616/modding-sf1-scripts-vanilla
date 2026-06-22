Scriptname LC082_BrigQuestScript extends Quest Conditional
{Quest script for LC082. Manages the Brig on the UC Vigilance.}

Struct BrigCellDatum
	bool cellOccupied
	ObjectReference cellDoor
	ObjectReference cellMarker
	ObjectReference cellTrigger
	ObjectReference cellTalkZoneTrigger
	Actor cellPrisoner
EndStruct

Group QuestProperties
	BrigCellDatum[] property BrigData Auto Hidden RequiresGuard(BrigDataGuard)
	{Struct array of data representing the Brig.
	 For convenience, to match the cell numbers on the terminal, BrigData[0] is unused/None.}

	int property CurrentPrisonerCount Auto Hidden Conditional
	{Number of prisoners currently in the Brig.}
EndGroup

Group AutofillProperties
	ReferenceAlias property BrigManager Auto Const Mandatory
	RefCollectionAlias property BrigPrisoners Auto Const Mandatory
	ActorBase property LC082_LvlPrisonersGeneric Auto Const Mandatory
	ActorValue property Assistance Auto Const Mandatory
	Armor property Clothes_Prisoner_Scrubs_SysDef Auto Const Mandatory
	Keyword property LinkCustom01 Auto Const Mandatory
	Keyword property LC082_LinkBrigCellMarker Auto Const Mandatory
	Keyword property LC082_LinkBrigCellTrigger Auto Const Mandatory
	Keyword property LC082_LinkBrigCellTalkZoneTrigger Auto Const Mandatory
EndGroup

;Local Variables
bool initialized

;Local Consts
int CONST_InitializationDelayTimeout = 300 Const
int CONST_Assistance_HelpsAllies = 1 Const

;Guards
Guard BrigDataGuard


;Called by the Brig Manager ref OnCellLoad, to ensure that the manager, all of the other refs,
;and all of their linked ref connections have loaded before we try to access them.
Function InitBrig()
	Start()
	LockGuard BrigDataGuard
		if (!initialized)
			;We're initializing.
			ObjectReference[] brigCellDoors = BrigManager.GetRef().GetLinkedRefChain(LinkCustom01)
			brigData = new BrigCellDatum[brigCellDoors.Length+1]
			int i = 0
			While (i < brigCellDoors.Length)
				BrigCellDatum newDatum = new BrigCellDatum
				newDatum.cellDoor = brigCellDoors[i]
				newDatum.cellMarker = newDatum.cellDoor.GetLinkedRef()
				newDatum.cellTrigger = newDatum.cellMarker.GetLinkedRef()
				newDatum.cellTalkZoneTrigger = newDatum.cellTrigger.GetLinkedRef()
				brigData[i+1] = newDatum
				i = i + 1
			EndWhile
			initialized = True
		Else
			;The cell has reset, and we need to reset all of the prisoners, too.
			int i = 0
			While (i < brigData.Length)
				BrigCellDatum currentData = brigData[i]
				if (currentData != None)
					Actor currentPrisoner = currentData.cellPrisoner
					if (currentPrisoner != None)
						currentPrisoner.SetLinkedRef(currentData.cellMarker, LC082_LinkBrigCellMarker)
						currentPrisoner.SetLinkedRef(currentData.cellTrigger, LC082_LinkBrigCellTrigger)
						currentPrisoner.SetLinkedRef(currentData.cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger)
						currentPrisoner.DisableNoWait()
						currentPrisoner.MoveTo(currentData.cellMarker)
						currentPrisoner.Enable()
						currentPrisoner.RemoveAllItems()
						currentPrisoner.EquipItem(Clothes_Prisoner_Scrubs_SysDef)
						currentPrisoner.EvaluatePackage()
						currentPrisoner.MoveTo(currentData.cellMarker)
					EndIf
				EndIf
				i = i + 1
			EndWhile
		EndIf
	EndLockGuard
EndFunction


;Add a prisoner to the Brig.
;If no arguments are passed, a generic prisoner will be added to a random cell.
Actor Function AddPrisoner(Actor newPrisoner=None, int cellID=-1)
	if (!initialized)
		int i = 0
		While (!initialized && (i < CONST_InitializationDelayTimeout))
			i = i + 1
			Utility.Wait(0.1)
		EndWhile
		if (!initialized)
			Debug.Trace("ERROR: LC082_BrigQuestScript.AddPrisoner was called, but the Brig hasn't initialized. You must load the interior of the Vigilance once before using the Brig.", 2)
			return None
		EndIf
	EndIf

	Actor result
	LockGuard BrigDataGuard	
		if (newPrisoner != None)
			if (newPrisoner.IsDead())
				Debug.Trace("WARN: LC082_BrigQuestScript.AddPrisoner was called, but " + newPrisoner + " is already dead.")
				return None
			EndIf

			int prisonerInCell = BrigData.FindStruct("cellPrisoner", newPrisoner)
			if (prisonerInCell >= 0)
				Debug.Trace("WARN: LC082_BrigQuestScript.AddPrisoner was called, but " + newPrisoner + " is already in cell " + prisonerInCell)
				return None
			EndIf
		EndIf
		if ((cellID <= 0) || (cellID >= brigData.Length) || (brigData[cellID].cellPrisoner != None))
			cellID = Private_FindRandomUnoccupiedCellID()
		EndIf
		if (newPrisoner == None)
			newPrisoner = brigData[cellID].cellMarker.PlaceActorAtMe(LC082_LvlPrisonersGeneric, 2)
		EndIf
		brigData[cellID].cellOccupied = True
		brigData[cellID].cellPrisoner = newPrisoner
		BrigPrisoners.AddRef(newPrisoner)
		newPrisoner.SetLinkedRef(brigData[cellID].cellMarker, LC082_LinkBrigCellMarker)
		newPrisoner.SetLinkedRef(brigData[cellID].cellTrigger, LC082_LinkBrigCellTrigger)
		newPrisoner.SetLinkedRef(brigData[cellID].cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger)
		newPrisoner.DisableNoWait()
		newPrisoner.MoveTo(brigData[cellID].cellMarker)
		newPrisoner.Enable()
		newPrisoner.RemoveAllItems()
		newPrisoner.EquipItem(Clothes_Prisoner_Scrubs_SysDef)
		newPrisoner.EvaluatePackage()
		newPrisoner.MoveTo(brigData[cellID].cellMarker)
		CurrentPrisonerCount = CurrentPrisonerCount + 1
		result = newPrisoner
	EndLockGuard
	return result
EndFunction


;Disable a prisoner in the Brig.
;This is intended for use only by LC088_Vigilance, to disable prisoners during the attack on the Vigilance.
Function DisablePrisoner(Actor prisonerRef)
	LockGuard BrigDataGuard
		int cellID = BrigData.FindStruct("cellPrisoner", prisonerRef)
		if (cellID >= 0)
			prisonerRef.DisableNoWait()
			brigData[cellID].cellOccupied = False
			brigData[cellID].cellPrisoner = None
			CurrentPrisonerCount = CurrentPrisonerCount - 1
			;Debug.Trace("Disabled " + prisonerRef + " in cell " + cellID)
		EndIf
	EndLockGuard
EndFunction


;Reset all of the prisoners in the Brig.
;This is intended for use only by LC088_Vigilance, to reset prisoners as the quest begins.
Function ResetAllPrisoners()
	LockGuard BrigDataGuard
		int i = 0
		While (i < brigData.Length)
			if (brigData[i].cellOccupied)
				Actor current = brigData[i].cellPrisoner
				current.Reset()
				current.SetLinkedRef(brigData[i].cellMarker, LC082_LinkBrigCellMarker)
				current.SetLinkedRef(brigData[i].cellTrigger, LC082_LinkBrigCellTrigger)
				current.SetLinkedRef(brigData[i].cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger)
				current.DisableNoWait()
				current.MoveTo(brigData[i].cellMarker)
				current.Enable()
				current.RemoveAllItems()
				current.EquipItem(Clothes_Prisoner_Scrubs_SysDef)
				current.EvaluatePackage()
				current.MoveTo(brigData[i].cellMarker)
			EndIf
			i = i + 1
		EndWhile
	EndLockGuard
EndFunction


;Release a prisoner from the Brig.
;This is intended for use only by LC088_Vigilance, to release prisoners during the attack on the Vigilance.
Actor Function ReleasePrisoner(int cellID)
	if (!initialized)
		Debug.Trace("ERROR: LC082_BrigQuestScript.AddPrisoner was called, but the Brig hasn't initialized and has no prisoners. Aborting. ", 2)
	EndIf

	Actor releasedPrisoner
	LockGuard BrigDataGuard
		if ((cellID <= 0) || (cellID >= brigData.Length))
			Debug.Trace("ERROR: LC082_BrigQuestScript.RemovePrisoner: Invalid Cell ID " + cellID, 2)
		Else
			brigData[cellID].cellOccupied = False
			brigData[cellID].cellDoor.Unlock()
			brigData[cellID].cellDoor.SetOpen(True)
			releasedPrisoner = brigData[cellID].cellPrisoner
			if (releasedPrisoner != None)
				brigData[cellID].cellPrisoner = None
				BrigPrisoners.RemoveRef(releasedPrisoner)
				CurrentPrisonerCount = CurrentPrisonerCount - 1
				if (releasedPrisoner.GetValue(Assistance) < CONST_Assistance_HelpsAllies)
					releasedPrisoner.SetValue(Assistance, CONST_Assistance_HelpsAllies)
				EndIf
				releasedPrisoner.EvaluatePackage()
			EndIf
		EndIf
	EndLockGuard
	return releasedPrisoner
EndFunction

;EVP all of the prisoners in the Brig.
Function EVPPrisoners()
	LockGuard BrigDataGuard
		int i = 0
		While (i < brigData.Length)
			BrigCellDatum currentData = brigData[i]
			if (currentData != None)
				Actor currentPrisoner = currentData.cellPrisoner
				if (currentPrisoner != None)
					currentPrisoner.EvaluatePackage()
				EndIf
			EndIf
			i = i + 1
		EndWhile
	EndLockGuard
EndFunction


;Return the length of BrigData.
int Function GetBrigDataLength()
	LockGuard BrigDataGuard
		return brigData.Length
	EndLockGuard
EndFunction

;Return the ID of a random unoccupied cell.
int Function Private_FindRandomUnoccupiedCellID() RequiresGuard(BrigDataGuard)
	int randomCell = Utility.RandomInt(1, brigData.Length)
	int i = randomCell
	While (i < brigData.Length)
		if ((brigData[i] != None) && (!brigData[i].cellOccupied))
			return i
		EndIf
		i = i + 1
	EndWhile
	i = 0
	While (i < randomCell)
		if ((brigData[i] != None) && (!brigData[i].cellOccupied))
			return i
		EndIf
		i = i + 1
	EndWhile
	return -1
EndFunction