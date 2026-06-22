Scriptname SQ_GroupOccupationScript extends Activator

Group Properties

	GlobalVariable Property OccupationID Mandatory Const Auto
	{the ID associated with this occupation (ex: "Scientist" or "Miner"). Will be saved in Dialogue AVs and used in conditions on the right side of conditions.
	NOTE: other Groups will have the same occupation. This defines THIS group's version of that occupation.
	Filter for: SQ_*Occupation*}


	Faction Property OccupationFaction Mandatory Const Auto
	{A faction all the actors of this occupation are in..}

	Message Property LeaderName Const Auto
	{A message for text replacing the name of an actor of this occupation when identifying them as a leader of the group
	Filter for: SQ_Group_OccupationLeaderName_*}

	Message Property VendorName Const Auto
	{A message for text replacing the name of an actor of this occupation when identifying them as a Vendor of the group
	Filter for: SQ_Group_OccupationVendorName_*}

	Faction Property DefaultOccupationVendorFaction Const Auto
	{default Vendor Faction for vendors spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis)}

	LeveledItem Property DefaultVendorList Const Auto
	{default vendor leveled list, will populate the vendor container with this list.}

	ActorBase Property DefaultRobot Mandatory Const Auto
	{default actorbase for robots spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis)}

	ActorBase Property DefaultChild_Female Const Auto
	{default actorbase for female children spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis)}

	ActorBase Property DefaultChild_Male Const Auto
	{default actorbase for female children spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis)}

	ActorBase Property DefaultOlder_Female Const Auto
	{default actorbase for Older Female spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis)}

	ActorBase Property DefaultOlder_Male Const Auto
	{default actorbase for Older Male spawned for this occupation (can be overridden by data in SQ_GroupScript on a per occupation basis)}

EndGroup

bool Function ValidateActor(Actor ActorToValidate)
	bool factionCheck = ActorToValidate.IsInFaction(OccupationFaction)

	Trace(self, "ValidateActor() ActorToValidate: " + ActorToValidate)
	Trace(self, "ValidateActor() factionCheck: " + factionCheck)

	return factionCheck
EndFunction

Function SetOverrideNameLeader(Actor ActorToOverrideName)
	Trace(self, "SetOverrideNameLeader() ActorToOverrideName: " + ActorToOverrideName)
	ActorToOverrideName.SetOverrideName(LeaderName)
EndFunction

Function SetOverrideNameVendor(Actor ActorToOverrideName)
	Trace(self, "SetOverrideNameVendor() ActorToOverrideName: " + ActorToOverrideName)
	ActorToOverrideName.SetOverrideName(VendorName)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Groups",  string SubLogName = "SQ_GroupOccupationScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Groups",  string SubLogName = "SQ_GroupOccupationScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction