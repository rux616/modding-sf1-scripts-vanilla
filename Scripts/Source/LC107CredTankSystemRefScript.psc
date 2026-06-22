Scriptname LC107CredTankSystemRefScript extends ObjectReference
{Script for refs in the LC107 CredTank System.
 - This script is used for the refs that manage groups of shelves (the Vault, Group, and Cluter managers).
 - This is also the parent script of LC107CredTankShelfRefScript, wich manages the shelves themselves.}

Group CredTankSystemBaseProperties CollapsedOnRef
	int property CredTankSystemRefType Auto Const
	{The type of ref this script is on, from the list of CONST_RefTypes below. Where this script is in the hierarchy of objects in the Vault.}

	Keyword property ChildObjectKeyword Auto Const
	{Keyword for the linkedref connecting this ref to its child objects.}
EndGroup

Group AutofillProperties
	LC107QuestScript property LC107 Auto Const Mandatory
EndGroup


;Local Variables
LC107CredTankSystemRefScript property parentRef Auto Hidden
int property myOperation Auto Hidden
int myChildPattern
int myShutdownCount
LC107CredTankSystemRefScript[] myShutdownChildObjects

;Local Consts
int CONST_RefType_VaultManager = 3 Const
int CONST_RefType_GroupManager = 2 Const
int CONST_RefType_ClusterManager = 1 Const
int CONST_RefType_ShelfManager = 0 Const

int CONST_ChildPattern_Simultaneous = -1 Const
int CONST_ChildPattern_Linked = -2 Const
int CONST_ChildPattern_Reversed = -3 Const

int CONST_ShutdownTanksPerThread = 50 Const

int property CONST_Operation_Initialize = 1 Auto Hidden Const
int property CONST_Operation_Waiting = 2 Auto Hidden Const
int property CONST_Operation_Responsive = 3 Auto Hidden Const
int property CONST_Operation_Boot = 4 Auto Hidden Const
int property CONST_Operation_Drain = 5 Auto Hidden Const
int property CONST_Operation_Shutdown = 6 Auto Hidden Const


;Custom Events
CustomEvent SimultaneousUpdateEvent

;Guards
Guard UpdateGuard ProtectsFunctionLogic



;---------------------------

Function PerformInitialRegistration(LC107CredTankSystemRefScript myParentObject)
	parentRef = myParentObject
	if (parentRef != None)
		RegisterForCustomEvent(parentRef, "SimultaneousUpdateEvent")
	EndIf
	if (CredTankSystemRefType != CONST_RefType_ShelfManager)
		LC107CredTankSystemRefScript[] childObjects = GetLinkedRefChain(ChildObjectKeyword) as LC107CredTankSystemRefScript[]
		if (childObjects != None)
			int i = 0
			While (i < childObjects.Length)
				childObjects[i].PerformInitialRegistration(Self)
				i = i + 1
			EndWhile
		EndIf
	EndIf
EndFunction


Function PerformOperation(int myNewOperation)
	LockGuard(UpdateGuard)

		myOperation = myNewOperation
		LC107CredTankSystemRefScript[] childObjects = GetLinkedRefChain(ChildObjectKeyword) as LC107CredTankSystemRefScript[]

		if (childObjects != None)
			if (myOperation == CONST_Operation_Initialize)
				if (CredTankSystemRefType == CONST_RefType_VaultManager)
					myChildPattern = CONST_ChildPattern_Simultaneous
				ElseIf (CredTankSystemRefType == CONST_RefType_GroupManager)
					myChildPattern = CONST_ChildPattern_Simultaneous
				ElseIf (CredTankSystemRefType == CONST_RefType_ClusterManager)
					myChildPattern = CONST_ChildPattern_Linked
				EndIf
			ElseIf (myOperation == CONST_Operation_Boot)
				if (CredTankSystemRefType == CONST_RefType_VaultManager)
					myChildPattern = CONST_ChildPattern_Linked
				ElseIf (CredTankSystemRefType == CONST_RefType_GroupManager)
					myChildPattern = CONST_ChildPattern_Simultaneous
				ElseIf (CredTankSystemRefType == CONST_RefType_ClusterManager)
					myChildPattern = CONST_ChildPattern_Linked
				EndIf
			ElseIf (myOperation == CONST_Operation_Drain)
				if (CredTankSystemRefType == CONST_RefType_VaultManager)
					myChildPattern = CONST_ChildPattern_Linked
				ElseIf (CredTankSystemRefType == CONST_RefType_GroupManager)
					myChildPattern = CONST_ChildPattern_Simultaneous
				ElseIf (CredTankSystemRefType == CONST_RefType_ClusterManager)
					myChildPattern = CONST_ChildPattern_Reversed
				EndIf
			ElseIf (myOperation == CONST_Operation_Shutdown)
				if (CredTankSystemRefType == CONST_RefType_VaultManager)
					myChildPattern = CONST_ChildPattern_Simultaneous
				ElseIf (CredTankSystemRefType == CONST_RefType_GroupManager)
					myChildPattern = CONST_ChildPattern_Linked
				ElseIf (CredTankSystemRefType == CONST_RefType_ClusterManager)
					myChildPattern = CONST_ChildPattern_Linked
				EndIf
			EndIf

			if ((myChildPattern == CONST_ChildPattern_Linked) && (myOperation == CONST_Operation_Shutdown) && (childObjects.Length > CONST_ShutdownTanksPerThread))
				myShutdownChildObjects = childObjects
				myShutdownCount = (myShutdownChildObjects.Length / CONST_ShutdownTanksPerThread) + 1
				int i = 0
				While (i < myShutdownCount)
					Var[] akArgs = new Var[1]
					akArgs[0] = i
					CallFunctionNoWait("PerformShutdownOperationThreaded", akArgs)
					i = i + 1
				EndWhile
			ElseIf (myChildPattern == CONST_ChildPattern_Linked)
				int i = 0
				While (i < childObjects.Length)
					LC107CredTankSystemRefScript currentRef = childObjects[i]
					currentRef.PerformOperation(myOperation)
					if ((myOperation == CONST_Operation_Boot) && (CredTankSystemRefType == CONST_RefType_VaultManager))
						Utility.Wait(1.5)
					ElseIf ((myOperation == CONST_Operation_Drain) && (CredTankSystemRefType == CONST_RefType_VaultManager))
						Utility.Wait(1.5)
					ElseIf ((myOperation == CONST_Operation_Drain) && (CredTankSystemRefType == CONST_RefType_ClusterManager))
						Utility.Wait(0.4)
					EndIf
					i = i + 1
				EndWhile
			ElseIf (myChildPattern == CONST_ChildPattern_Reversed)
				int i = childObjects.Length-1
				While (i >= 0)
					LC107CredTankSystemRefScript currentRef = childObjects[i]
					currentRef.PerformOperation(myOperation)
					if ((myOperation == CONST_Operation_Boot) && (CredTankSystemRefType == CONST_RefType_ClusterManager))
						Utility.Wait(0.1)
					ElseIf ((myOperation == CONST_Operation_Drain) && (CredTankSystemRefType == CONST_RefType_ClusterManager))
						Utility.Wait(0.3)
					EndIf
					i = i - 1
				EndWhile
			ElseIf (myChildPattern == CONST_ChildPattern_Simultaneous)
				Var[] akArgs = new Var[1]
				akArgs[0] = myOperation
				SendCustomEvent("SimultaneousUpdateEvent", akArgs)
			EndIf
		EndIf
	EndLockGuard
	;if ((myChildPattern == CONST_ChildPattern_Linked) && (myOperation == CONST_Operation_Shutdown))
	;	While (myShutdownCount > 0)
	;		Utility.Wait(0.5)
	;	EndWhile
	;EndIf
EndFunction

Function PerformShutdownOperationThreaded(int threadNum)
	int i = threadNum * CONST_ShutdownTanksPerThread
	int endIndex = Math.Min(i + CONST_ShutdownTanksPerThread, myShutdownChildObjects.Length) as int
	While (i < endIndex)
		 myShutdownChildObjects[i].PerformOperation(myOperation)
		 i = i + 1
	EndWhile
	LockGuard(UpdateGuard)
		myShutdownCount = myShutdownCount - 1
	EndLockGuard
EndFunction


;When a CredTankSystemRef wants to update all of its children simultaneously, it fires a SimultaneousUpdateEvent.
;Each child can then update itself accordingly.
Event LC107CredTankSystemRefScript.SimultaneousUpdateEvent(LC107CredTankSystemRefScript source, Var[] akArgs)
	PerformOperation(akArgs[0] as int)
EndEvent