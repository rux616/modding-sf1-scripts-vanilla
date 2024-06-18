Scriptname ENV_Hazard_ParentScript extends ObjectReference Const
{Attach this script to the Packin's PrefabPackinPivotDummy reference.
And make sure all the refs in the packin are LinkedRef'd with keyword ENV_Link_PackinMember to the PrefabPackinPivotDummy (that this script is on)}

Group Autofill_Properties
	form Property PrefabPackinPivotDummy Mandatory Const Auto 
	{a default object that is in every instanced packin. 
	It inherits the scripts and linked refs and linked children from the packin ref placed in the render window, or otherwise spawned.}

	keyword Property ENV_Link_PackinMember Mandatory Const Auto 
	{Things inside ENV Hazard packins link to the PrefabPackinPivotDummy using this keyword.
	It's how we identify refs that came from the same packin.}

	Keyword Property ENV_FXType_Ambient Mandatory Const Auto 
	{Things with this keyword are "ambient" fx that are okay to clip through lanscape and other objects.
	We may want to turn these on/off depending on circumstances.}
EndGroup


;returns things that are linked to this using ENV_Link_PackinMember keyword
;this should be all the things in the packin
ObjectReference[] Function GetPackinChildren()
	return GetRefsLinkedToMe(ENV_Link_PackinMember)
EndFunction

;returns refs linked to this that are not linked using ENV_Link_PackinMember keyword
;this should be things linked to from it outside the packin
ObjectReference[] Function GetExternalLinkedChildren()
	return GetRefsLinkedToMe(apExcludeKeyword = ENV_Link_PackinMember)
EndFunction

;proof of concept / used to test packin is setup properly
Function DisableChildren()
	Trace(self, "DisableChildren()")

	ObjectReference[] packinChildren = GetPackinChildren()

	int i = 0
	While (i < packinChildren.length)
		packinChildren[i].DisableNoWait()
		i += 1
	EndWhile
EndFunction

;proof of concept / used to test packin is setup properly
Function EnableChildren()
	Trace(self, "EnableChildren() ")

	ObjectReference[] packinChildren = GetPackinChildren()

	int i = 0
	While (i < packinChildren.length)
		packinChildren[i].EnableNoWait()
		i += 1
	EndWhile
EndFunction


;************************************************************************************
;****************************      GLOBAL FUNCTIONS     *****************************
;************************************************************************************
;Returns the Packin Parent which the reference should be linked to via the ENV_Link_PackinMember keyword
;you need to pass that into the function because this is global
ENV_Hazard_ParentScript Function GetPackinParent(ObjectReference RefToCheck, Keyword ENV_Link_PackinMember) global
	
	;first try to cast RefToCheck as a parent script in case that's it
	ENV_Hazard_ParentScript parentRef = RefToCheck as ENV_Hazard_ParentScript

	if parentRef
		return parentRef
	
	else ;next try to find it - RefToCheck should be linked to it with an identifying keyword
		parentRef = RefToCheck.GetLinkedRef(ENV_Link_PackinMember) as ENV_Hazard_ParentScript

		if parentRef
			return parentRef
		else
			GlobalWarning(none, "GetPackinParent() did not find a linked ref with ENV_Hazard_ParentScript for RefToCheck: " + RefToCheck)
			return None
		endif	
	endif
EndFunction



;************************************************************************************
;****************************      DEBUG FUNCTIONS      *****************************
;************************************************************************************
keyword Function BetaOnly_Get_ENV_Link_PackinMember() Global BetaOnly Protected
	;we don't like using GetFormFromFile() if we don't have to... using them for debugging functions is less worrisome
	return Game.GetFormFromFile(0x00160C31, "Starfield.esm") as keyword
EndFunction


Function LogPackinMembers(ObjectReference PackinMember) Global BetaOnly Protected

	

	;find the parent
	ENV_Hazard_ParentScript parentRef = GetPackinParent(PackinMember, BetaOnly_Get_ENV_Link_PackinMember())

	parentRef.Trace(parentRef, "LogPackinMembers() PackinMember: " + PackinMember)

	if parentRef == None
		parentRef.Warning(none, "LogPackinMembers() could not find a parent for PackinMember: " + PackinMember)
		return
	endif

	parentRef.Trace(parentRef, "LogPackinMembers() parentRef: " + parentRef)

	ObjectReference[] packinChildren = parentRef.GetPackinChildren()

	int i = 0
	While (i < packinChildren.length)
		parentRef.Trace(parentRef, "LogPackinMembers() packinChildren[i]: " + packinChildren[i])

		i += 1
	EndWhile
		
EndFunction

Function LogExternalObjects(ObjectReference PackinMember) Global BetaOnly Protected
	;find the parent
	ENV_Hazard_ParentScript parentRef = GetPackinParent(PackinMember, BetaOnly_Get_ENV_Link_PackinMember())

	parentRef.Trace(parentRef, "LogExternalObjects() PackinMember: " + PackinMember)

	if parentRef == None
		parentRef.Warning(parentRef, "LogExternalObjects() could not find a parent for PackinMember: " + PackinMember)
		return
	endif

	parentRef.Trace(parentRef, "LogExternalObjects() parentRef: " + parentRef)

	ObjectReference[] externalChildren = parentRef.GetExternalLinkedChildren()

	int i = 0
	While (i < externalChildren.length)
		parentRef.Trace(parentRef, "LogExternalObjects() externalChildren[i]: " + externalChildren[i])

		i += 1
	EndWhile
EndFunction

Function LogAllObjects(ObjectReference PackinMember) Global BetaOnly Protected
	LogPackinMembers(PackinMember)
	LogExternalObjects(PackinMember)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_Hazard_ParentScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly Protected
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_Hazard_ParentScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly Protected
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction

bool Function GlobalWarning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_Hazard_ParentScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly Global Protected
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction