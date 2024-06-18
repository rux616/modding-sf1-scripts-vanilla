Scriptname MissionSurveyQuestScript_OLD extends MissionQuestScript Conditional


group MissionTypeData
	SQ_ParentScript property SQ_Parent auto const Mandatory

	int property LocatedSiteStage = 20 auto const
	{ stage to set when valid site is location (or player starts with one) }
EndGroup

;/
Event OnQuestStarted()
	; register for survey events
	RegisterForCustomEvent(SQ_Parent, "SQ_SurveySiteDiscovered")
	Parent.OnQuestStarted()
endEvent

; OVERRIDE parent function
Function MissionAccepted(bool bAccepted)
	Parent.MissionAccepted(bAccepted)
	if bAccepted
		; increment site type global (for PCM conditions)
		UpdateSurveyMissionConditionData()

		; check for current valid sites
		int i = 0
		bool foundValidMarker = false
		debug.trace(self + " surveySites=" + SQ_Parent.SurveySites)
		while i < SQ_Parent.SurveySites.Length && foundValidMarker == false
			SurveySiteDiscoverMarkerScript siteMarker = SQ_Parent.SurveySites[i].siteMarker as SurveySiteDiscoverMarkerScript
			foundValidMarker = IsValidSiteMarker(siteMarker)
			debug.trace(self + " site " + siteMarker + ": " + foundValidMarker)
			; for each survey site
			i += 1
		endWhile
		if foundValidMarker
			SetStage(LocatedSiteStage)
		endif
	endif
endFunction

Function MissionShutdown()
	if PlayerAcceptedQuest
		UpdateSurveyMissionConditionData(false)
	endif
	Parent.MissionShutdown()
endFunction

bool function IsValidSiteMarker(SurveySiteDiscoverMarkerScript markerRef)
	ObjectReference targetRef = PrimaryRef.GetRef()
	Location targetSystem = TargetSystemLocation.GetLocation()
	Location siteMarkerLocation = markerRef.GetCurrentLocation()
	; site type is index of targetRef in SiteTypes array
	int siteType = SQ_Parent.surveySiteTypes.FindStruct("siteTypeMarker", targetRef.GetBaseObject() as Activator)
	bool isValid = ( markerRef.SiteType == siteType && siteMarkerLocation.IsSameLocation(targetSystem, MissionParent.LocTypeStarSystem) )

	debug.trace(self + " IsValidSiteMarker: markerRef=" + markerRef + " quest siteType=" + siteType + ": " + isValid)
	return isValid
endFunction

function CompleteMissionIfValid(SurveySiteDiscoverMarkerScript markerRef)
	if IsValidSiteMarker(markerRef)
		SQ_Parent.RemoveSurveySite(markerRef)
		MissionComplete()
	endif
endFunction

Event SQ_ParentScript.SQ_SurveySiteDiscovered(SQ_ParentScript akSender, Var[] akArgs)
	SurveySiteDiscoverMarkerScript siteMarker = akArgs[0] as SurveySiteDiscoverMarkerScript
	debug.trace(self + " SQ_SurveySiteDiscovered event received for " + siteMarker)

	; if valid site, complete "located" stage
	if siteMarker && IsValidSiteMarker(siteMarker)
		SetStage(LocatedSiteStage)
	endif
EndEvent

Function UpdateSurveyMissionConditionData(bool increment = true)
	ObjectReference targetRef = PrimaryRef.GetRef()
	int siteType = SQ_Parent.surveySiteTypes.FindStruct("siteTypeMarker", targetRef.GetBaseObject() as Activator)
	GlobalVariable siteTypeGlobal = SQ_Parent.surveySiteTypes[siteType].siteTypeCount
	if increment
		siteTypeGlobal.Mod(1.0)
		; update mission board list
		MissionParent.MissionBoardSurveySystemLocations.AddForm(TargetSystemLocation.GetLocation())
	else
		siteTypeGlobal.Mod(-1.0)
		; update mission board list
		MissionParent.MissionBoardSurveySystemLocations.RemoveAddedForm(TargetSystemLocation.GetLocation())
	endif
	; failsafe
	if siteTypeGlobal.GetValue() < 0.0
		siteTypeGlobal.SetValue(0.0)
	endif
endFunction

/;

