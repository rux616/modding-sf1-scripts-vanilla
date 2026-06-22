Scriptname SQ_ActorRolesScript extends Quest
{Parent script for SQ_CompanionsScript, SQ_CrewScript, and SQ_FollowersScript}

Group Log_Names
String Property MainLogName Mandatory Const Auto
String Property SubLogName Mandatory Const Auto
EndGroup

Group Related_Quests_Autofill
SQ_CompanionsScript Property SQ_Companions Mandatory Const Auto
SQ_FollowersScript Property SQ_Followers Mandatory Const Auto
SQ_CrewScript Property SQ_Crew Mandatory Const Auto
SQ_PreventRecalcScript Property SQ_PreventRecalc Mandatory Const Auto
SQ_PlayerShipScript Property SQ_PlayerShip Mandatory Const Auto
EndGroup

Group Role_Available
Alias Property Alias_Available Mandatory Const Auto
{can be a ReferenceAlias or a RefCollectionAlias, will hold actor(s) who are available to fill this role (ie could be made active through dialogue, etc.)}

ActorValue Property AV_Available Mandatory Const Auto
{the actorvalue that will signify that the actor is available to fill this role (ie could be made active through dialogue, etc.)}

Message Property AvailableMessage Mandatory Const Auto
{message to show when the actor is made available to fill this role (ie has been made available through dialogue, etc.) }

Message Property NotAvailableMessage Mandatory Const Auto
{message to show when the actor is made no longer available to fill this role (ie has been made not available through dialogue, etc.) }
EndGroup


Group Role_Active
Alias Property Alias_Active Mandatory Const Auto
{can be a ReferenceAlias or a RefCollectionAlias, will hold actor(s) who are actively filling this role (ie has been made active through dialogue, etc.) }

ActorValue Property AV_Active Mandatory Const Auto
{the actorvalue that will signify that the actor is actively filling this role (ie has been made active through dialogue, etc.) }

Message Property ActiveMessage Mandatory Const Auto
{message to show when the actor fills this role (ie has been made active through dialogue, etc.) }

Message Property NotActiveMessage Mandatory Const Auto
{message to show when the actor no longer fills this role (ie has been made inactive through dialogue, etc.) }
EndGroup

Group TextReplacementAlias
ReferenceAlias Property Alias_MessageTextReplaceActor Mandatory Const Auto
{alias to be temporarily forced into for using text replacement in messages}

ReferenceAlias Property Alias_MessageTextReplaceRef Mandatory Const Auto
{alias to be temporarily forced into for using text replacement in messages}

Keyword Property SQ_ActorRoles_SuppressMessages Mandatory Const Auto
{autofill; if keyword is on actor, it will suppress any messages about them in ShowTextReplacedMessage()}

EndGroup

Function SetRoleAvailable(Actor ActorToUpdate, bool DisplayMessageIfChanged = true)
    Trace(self, "SetRoleAvailable() ActorToUpdate: " + ActorToUpdate + ", DisplayMessageIfChanged: " + DisplayMessageIfChanged)
    
    bool changed = _UpdateAlias(ActorToUpdate, Alias_Available, PutIntoAlias = True)
    _UpdateActorValue(ActorToUpdate, AV_Available, TurnOn = True)

	if DisplayMessageIfChanged && changed
        ShowTextReplacedMessage(ActorToUpdate, AvailableMessage)
    endif

	_CustomSetRoleAvaliable(ActorToUpdate)

	ActorToUpdate.EvaluatePackage()
EndFunction

;to override in children scripts
function _CustomSetRoleAvaliable(Actor ActorToUpdate)
endFunction

Function SetRoleUnavailable(Actor ActorToUpdate, bool DisplayMessageIfChanged = true)
    Trace(self, "SetRoleUnavailable() ActorToUpdate: " + ActorToUpdate + ", DisplayMessageIfChanged: " + DisplayMessageIfChanged)
    
    bool changed = _UpdateAlias(ActorToUpdate, Alias_Available, PutIntoAlias = False)
    _UpdateActorValue(ActorToUpdate, AV_Available, TurnOn = False)

	if DisplayMessageIfChanged && changed
        ShowTextReplacedMessage(ActorToUpdate, NotAvailableMessage)
    endif

	_CustomSetRoleUnavaliable(ActorToUpdate)

	SQ_PreventRecalc.RemoveRef(ActorToUpdate)

	ActorToUpdate.EvaluatePackage()
EndFunction

;to override in children scripts
function _CustomSetRoleUnavaliable(Actor ActorToUpdate)
endFunction

Function SetRoleActive(Actor ActorToUpdate, bool DisplayMessageIfChanged = true, bool AlsoSetAvailable = true, float MessageFloat1 = 0.0, float MessageFloat2 = 0.0)
    Trace(self, "SetRoleActive() ActorToUpdate: " + ActorToUpdate + ", DisplayMessageIfChanged: " + DisplayMessageIfChanged + ", AlsoSetAvailable: " + AlsoSetAvailable)
        
	Actor priorActor = None
	if Alias_Active is ReferenceAlias
		priorActor = GetActiveActor()
	endif

    bool changed = _UpdateAlias(ActorToUpdate, Alias_Active, PutIntoAlias = True)
    _UpdateActorValue(ActorToUpdate, AV_Active, TurnOn = True)

	if DisplayMessageIfChanged && changed
        ShowTextReplacedMessage(ActorToUpdate, ActiveMessage, false, none, MessageFloat1, MessageFloat2)
    endif

    if AlsoSetAvailable
        SetRoleAvailable(ActorToUpdate, DisplayMessageIfChanged = false) ;DisplayMessageIfChanged = false because player will likely assuming they are available, don't spam with additional message
    endif

	_CustomSetRoleActive(ActorToUpdate, priorActor)

	ActorToUpdate.EvaluatePackage()
EndFunction

;to override in children scripts
;If ActiveAlias is a ReferenceAlias, PriorActiveActor is the actor in ActiveAlias before SetRoleActive was called (could be none, or ActorToUpdate if already in there). If ActiveAlias is a RefCollectionAlias, PriorActiveActor will be it will be None.
function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
endFunction

Function SetRoleInactive(Actor ActorToUpdate, bool DisplayMessageIfChanged = true, bool AlsoSetUnavailable = false, bool AlsoDisplayUnavailableMessage = true)
    Trace(self, "SetRoleInactive() ActorToUpdate: " + ActorToUpdate + ", DisplayMessageIfChanged: " + DisplayMessageIfChanged + ", AlsoSetUnavailable: " + AlsoSetUnavailable + ", AlsoDisplayUnavailableMessage: " + AlsoDisplayUnavailableMessage)
        
    bool changed =_UpdateAlias(ActorToUpdate, Alias_Active, PutIntoAlias = false)
    _UpdateActorValue(ActorToUpdate, AV_Active, TurnOn = false)

	if DisplayMessageIfChanged && changed
        ShowTextReplacedMessage(ActorToUpdate, NotActiveMessage)
    endif

    if AlsoSetUnavailable
        SetRoleUnavailable(ActorToUpdate, DisplayMessageIfChanged = AlsoDisplayUnavailableMessage) 
    endif

	_CustomSetRoleInactive(ActorToUpdate)

	ActorToUpdate.EvaluatePackage()
EndFunction

;to override in children scripts
function _CustomSetRoleInactive(Actor ActorToUpdate)
endFunction


;get the only or first of the actors in the active alias
Actor Function GetActiveActor()
	return _GetRoleActor(Alias_Active)
EndFunction

;get all the actors in the active alias
Actor[] Function GetActiveActors()
	return _GetRoleActors(Alias_Active)
EndFunction

;ended up not needing this, but leaving this here in case it's useful in the future
;get all the actors in the active alias
Actor[] Function GetActiveActorsWithKeyword(Keyword KeywordToFind)
	Actor[] actorsToReturn = new Actor[0]
	Actor[] activeActors = GetActiveActors()
	
	int i = 0
	While (i < activeActors.length)
		if activeActors[i].HasKeyword(KeywordToFind)
			actorsToReturn.add(activeActors[i])
		endif
		i += 1
	EndWhile

	return actorsToReturn
EndFunction

;get the only or first of the actors in the available alias
Actor Function GetAvailableActor()
	return _GetRoleActor(Alias_Available)
EndFunction

;get all the actors in the available alias
Actor[] Function GetAvailableActors()
	return _GetRoleActors(Alias_Available)
EndFunction


;returns the actor in the role ReferenceAlias, or first actor if in a RefCollectionAlias
Actor Function _GetRoleActor(Alias RoleAlias)
	return _GetRoleActors(RoleAlias)[0]
EndFunction

;get all the actors in the specified role
Actor[] Function _GetRoleActors(Alias RoleAlias)
	Actor[] roleActors = new Actor[0]

	ReferenceAlias refAlias = RoleAlias as ReferenceAlias
	if refAlias
		roleActors.Add(refAlias.GetActorReference())
	else 
		roleActors = (RoleAlias as RefCollectionAlias).GetActorArray()
	endif

	return roleActors

EndFunction

bool Function IsRole(Actor ActorToCheck, bool IncludeAvailable = true)
	return IsRoleActive(ActorToCheck) || (IncludeAvailable && IsRoleAvailable(ActorToCheck))
EndFunction

bool Function IsRoleActive(Actor ActorToCheck)
	return _CheckRole(ActorToCheck, Alias_Active)
EndFunction

bool Function IsRoleAvailable(Actor ActorToCheck)
	return _CheckRole(ActorToCheck, Alias_Available)
EndFunction

bool Function _CheckRole(Actor ActorToCheck, Alias AliasToCheck)
	ReferenceAlias RefAlias = AliasToCheck as ReferenceAlias
	
	if RefAlias && RefAlias.GetReference() == ActorToCheck
		return true
	else
		RefCollectionAlias RefCollection = AliasToCheck as RefCollectionAlias
		if RefCollection && (AliasToCheck as RefCollectionAlias).Find(ActorToCheck) >= 0
			return true
		endif
	endif
	return false
EndFunction


;If AliasToUpdate is a ReferenceAlias force it, if AliasToUpdate is a RefCollectionAlias add/remove from it. If PutIntoAlias == False, it will force to none / remove)
;returns true if a changed occured, or false if no change (ie the ActorToUpdate was in when it tried to add it, or was not in when it tried to remove it)
bool Function _UpdateAlias(Actor ActorToUpdate, Alias AliasToUpdate, bool PutIntoAlias = true)
    Trace(self, "_UpdateAlias() ActorToUpdate: " + ActorToUpdate + ", AliasToUpdate: " + AliasToUpdate + ", PutIntoAlias: " + PutIntoAlias)
    
    Trace(self, "_UpdateAlias()  AliasToUpdate is ReferenceAlias: " +  AliasToUpdate is ReferenceAlias) ;THIS IS TRUE IF AliasToUpdate is a RefCollectionAlias as well!!!! this seems like maybe it's a bug
    Trace(self, "_UpdateAlias()  AliasToUpdate is RefCollectionAlias: " +  AliasToUpdate is RefCollectionAlias)
    
	bool changed = false
       
    RefCollectionAlias refCol = AliasToUpdate as RefCollectionAlias
    if refCol
         Trace(self, "_UpdateAlias() refCol: " + refCol)
        if PutIntoAlias
            ;TO DO after GEN-319888:
			;changed = refCol.AddRef(ActorToUpdate)
			changed = AddRefWithReturn(RefCol, ActorToUpdate)
        else
            ;TO DO after GEN-319888:
			;changed = refCol.RemoveRef(ActorToUpdate)
			changed = RemoveREfWithReturn(RefCol, ActorToUpdate)
        endif
    else
        ReferenceAlias refAlias = AliasToUpdate as ReferenceAlias
        Trace(self, "_UpdateAlias() refAlias: " + refAlias)
        if PutIntoAlias
            ;TO DO after GEN-319888:
			;changed = refAlias.ForceRefTo(ActorToUpdate)
            changed = ForceRefWithReturn(refAlias, ActorToUpdate)
        elseif refAlias.GetReference() == ActorToUpdate
            changed = true
			refAlias.Clear()
        endif
    endif

	return changed
        
EndFunction

;if TurnOn =- true (default), sets ActorToUpdate's ActorvalueToUpdate to 1, if TurnOn == false sets it to 0
Function _UpdateActorValue(Actor ActorToUpdate, ActorValue ActorValueToUpdate, bool TurnOn = true)
    ;ensure if the actor is offscreen and never before seen, we need to prevent them from recalcing (resetting their AVs) when player first sees them
	SQ_PreventRecalc.AddRef(ActorToUpdate)
	
	int value = 0
    if TurnOn
        value = 1
    endif

	Trace(self, "_UpdateActorValue() ActorToUpdate: " + ActorToUpdate + ", ActorValueToUpdate: " + ActorValueToUpdate + ", TurnOn: " + TurnOn + ", value: " + value + ", ")
    ActorToUpdate.SetValue(ActorValueToUpdate, value)

	Trace(self, "_UpdateActorValue() ActorToUpdate.GetValue(ActorValueToUpdate): " + ActorToUpdate.GetValue(ActorValueToUpdate))
EndFunction

Function ShowTextReplacedMessage(Actor MessageTextReplaceActor, Message MessageToShow, bool ShowAsHelpMessage = false, ObjectReference MessageTextReplaceRef = None, float afArg1 = 0.0, float afArg2 = 0.0)
	Trace(self, "ShowTextReplacedMessage() MessageTextReplaceActor: " + MessageTextReplaceActor + ", MessageToShow: " + MessageToShow)

	if MessageTextReplaceActor != None
		if MessageTextReplaceActor.HasKeyword(SQ_ActorRoles_SuppressMessages)
			Trace(self, "ShowTextReplacedMessage() MessageTextReplaceActor.HasKeyword(SQ_ActorRoles_SuppressMessages) == true. NOT showing message.")	
		else
	   		Alias_MessageTextReplaceActor.ForceRefTo(MessageTextReplaceActor)
	   		Alias_MessageTextReplaceRef.ForceRefTo(MessageTextReplaceRef)

			if ShowAsHelpMessage
				float HelpMessageDuration = 3.0
				float HelpMessageInterval = 3.0
				int HelpMessageMaxTimes = 1
				string HelpMessageContext = ""
				int HelpMessagePriority = 0
				MessageToShow.ShowAsHelpMessage(none, HelpMessageDuration, HelpMessageInterval, HelpMessageMaxTimes, HelpMessageContext, HelpMessagePriority)
			else 
				MessageToShow.Show(afArg1, afArg2)
			endif
			Alias_MessageTextReplaceActor.Clear()
		endif
	else
		Trace(self, "ShowTextReplacedMessage() MessageTextReplaceActor == None. NOT showing message.")
	endif

EndFunction



;************************************************************************************
;****************************       TEMP FUNCTIONS      *****************************
;************************************************************************************
;TO DO - REPLACE AFTER Papyrus: alias management functions should return a bool
;GEN-319888

bool Function AddRefWithReturn(RefCollectionAlias RefCol, ObjectReference RefToAddIfNotAlreadyPresent)
	bool found = (RefCol.Find(RefToAddIfNotAlreadyPresent) >= 0)
	if !found
		RefCol.AddRef(RefToAddIfNotAlreadyPresent)
	EndIf
	return !found
EndFunction

bool Function RemoveREfWithReturn(RefCollectionAlias RefCol, ObjectReference RefToRemoveIfPossible)
	bool found = (RefCol.Find(RefToRemoveIfPossible) >= 0) 

	if found
		RefCol.RemoveRef(RefToRemoveIfPossible)
	endif

	return found
EndFunction

bool Function ForceRefWithReturn(ReferenceAlias RefAlias, ObjectReference RefToForceIfNotAlreadyPresent)
	bool success = RefAlias.GetReference() != RefToForceIfNotAlreadyPresent

	if success
		RefAlias.ForceRefTo(RefToForceIfNotAlreadyPresent)
	endif

	return success
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    bool returnVal = debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)

    ;ALSO OUTPUT TO THE ActorRoles log
    returnVal = returnVal && debug.TraceLog(CallingObject, asTextToPrint, "ActorRoles", SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
    
    return returnVal
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    bool returnVal = debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)

    ;ALSO OUTPUT TO THE ActorRoles log
    returnVal = returnVal && debug.TraceLog(CallingObject, asTextToPrint, "ActorRoles", SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)

    return returnVal
EndFunction