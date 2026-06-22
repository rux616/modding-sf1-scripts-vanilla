Scriptname DefaultToggleLinkRefChainOnActivate extends ObjectReference default
{When this reference is activated, all LinkedRefs will toggle between OPEN or CLOSED.}

Group Optional_Properties
	
	Bool Property DoOnce = FALSE Auto Const
	{If you only want this to be activate once set to TRUE.  DEFAULT = FALSE}
	
	Bool Property CloseOrOpenRef = TRUE Auto Const
	{If you also want this to OPEN/CLOSE all linked refs, set to TRUE.  DEFAULT = TRUE}

	Keyword Property LinkedRefKeyword Auto Const
	{The Keyword of the LinkedRef you want to activate when this activated.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

Auto State PreActivation
	Event OnActivate(ObjectReference akActionRef)
		
		if LinkedRefKeyword != None
			ToggleLinkedRefChain(akActionRef, LinkedRefKeyword)
		else
			ToggleLinkedRefChain(akActionRef)
		endif
		if DoOnce
			gotoState("PostActivation")
		endif
	
	EndEvent
EndState

Function ToggleLinkedRefChain(ObjectReference akActionRef, Keyword LinkedRefKeyword = None)
	int count = 0
    int countmax
    if LinkedRefKeyword != None
		countmax = CountLinkedRefChain(LinkedRefKeyword)
	else
		countmax = CountLinkedRefChain()
	endif
	while (count <= countmax)
		if LinkedRefKeyword != None
			count += 1
			CloseOrOpen(count, akActionRef, LinkedRefKeyword)
		else
			count += 1
			CloseOrOpen(count, akActionRef)
		endif
	endwhile
EndFunction

Function CloseOrOpen(int count, ObjectReference akActionRef, Keyword LinkedRefKeyword = None)
	;opening/closing the ref
	if CloseOrOpenRef
		int openstate = (Self.GetNthLinkedRef(count) as ObjectReference).GetOpenState()
		
		if (openstate == 1 || openstate == 2) ;door is open or opening
			DefaultScriptFunctions.Trace(self, akactionRef + " is closing " + Self.GetLinkedRef(LinkedRefKeyword) + " by way of " + self, ShowTraces)
			if LinkedRefKeyword != None
				(Self.GetNthLinkedRef(count, LinkedRefKeyword) as ObjectReference).SetOpen(false) ;close door
			else
				(Self.GetNthLinkedRef(count) as ObjectReference).SetOpen(false)	;close door
			endif
		elseif (openstate == 3 || openstate == 4) ;door is closed or closing
			DefaultScriptFunctions.Trace(self, akactionRef + " is opening " + Self.GetLinkedRef(LinkedRefKeyword) + " by way of " + self, ShowTraces)
			if LinkedRefKeyword != None
				(Self.GetNthLinkedRef(count, LinkedRefKeyword) as ObjectReference).SetOpen(true) ;open door
			else
				(Self.GetNthLinkedRef(count) as ObjectReference).SetOpen(true)	;open door
			endif
		endif
	endif
EndFunction

State PostActivation
	;Do nothing
EndState