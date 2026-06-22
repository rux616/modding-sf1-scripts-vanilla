Scriptname HerdControlScript extends ObjectReference
{Handles an array of actors to act like a herd and flee to the same spot}

;Goals for script:
;	- For a group of actors to flee to the same area
;	- Option to have one actor act as fallback, staying to fight while group flees
;	- move the linked reference to each flee location, acts as flee target as well as sandboxing target

import debug
import utility

Group Required_Properties
	Keyword property HerdKeyword auto Mandatory
	{default: DMP_TypeHerd - will find all references with this keyword}

	Static property HerdMarker auto Mandatory
	{default: xMarkerHerd - used to fill array of markers the fleeToMasterMarker can be moved to}
EndGroup
	
Group Optional_Properties
	bool property HaveFallback = FALSE auto
	{default:FALSE - set to true if you want an actor to stay behind and fight when rest flee}
	Float property FindRadius = 100.0 auto
	{default:100m - used as radius for finding all references to fill herdRefs array and fleeToMarkers array}
EndGroup

Group Autofill_Properties
	keyword property DMP_FleeTo auto
	{Keyword to link to the marker the group flees to}

	ActorValue property DMP_Herd auto
	{used in actor's combat interrupt package}

	ActorValue property Aggression auto
	ActorValue property Suspicious auto
	ActorValue property Confidence auto
EndGroup

;********************************************************

ObjectReference[] herdRefs	;all the actors in the herd
ObjectReference[] fleeToMarkers	;all the markers the fleeToMasterMarker can be moved to
ObjectReference fleeToMasterMarker	;the marker the herd flees to, used in their fleeTo package
ObjectReference currentFallback	;the current actor acting as fallback if HaveFallback is TRUE
ObjectReference currentFleeToMarker ;the current marker fleeToMasterMarker has been moved to
ObjectReference tempFleeToMarker
Float fAggression = 2.0 ;Unaggressive=0, Aggressive=1, VeryAggressive=2, Frenzied=3
Float fConfidence = 4.0 ;Cowardly=0, Cautious=1, Average=2, Brave=3, Foolhardy=4
Float timer = 20.0	;the amount of time to wait before resetting busy
Int timerID = 0
bool busy = FALSE
bool needNewFallback = FALSE

;Vars currently not needed yet, but may want later:
;Int herdCount = 0	;number of actors in herd
;Int herdCountAlive = 0	;number of actors in herd that are alive



;********************************************************

Event OnLoad()
	herdRefs = FindAllReferencesWithKeyword(HerdKeyword, FindRadius) ;array of all the actors with the HerdKeyword
	fleeToMarkers = FindAllReferencesofType(HerdMarker, FindRadius) ;array of all the markers that fleeToMasterMarker can move to
	;herdCount = herdRefs.length	;number of actors in the herd

	if(fleeToMarkers.length > 0)
		currentFleeToMarker = herdRefs[0] ;tag the first marker in the array as the currentFleeToMarker
	else
		trace("fleeToMarkers array is empty - couldn't find any references of HerdMarker type")
	endIf

	if(herdRefs.length > 0)
		fleeToMasterMarker = GetLinkedRef(DMP_FleeTo)	;the marker the herd flees to, this marker gets moved to different markers		
		;go through all the actors in the herd and assign one as fallback if needed and also register for onCombatStateChange (all if alive)
		;herdCountAlive = 0
		int i = 0
		While (i < herdRefs.length)
			if((herdRefs[i] as Actor).isDead() == FALSE)
				if(HaveFallback == TRUE && currentFallback == none)
					currentFallback = herdRefs[i]
				endIf
				;herdCountAlive = herdCountAlive + 1 
				RegisterForRemoteEvent((herdRefs[i] as Actor), "OnCombatStateChanged")
				i = i + 1
			endIf
		EndWhile
	else
		trace("herdRefs array is empty - couldn't find any references with the HerdKeyword")
	endIf
endEvent

;********************************************************

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, int aeCombatState)
	;aeCombatState: 0=Not in combat, 1=In Combat, 2=Searching

	;one of the actors has changed combat state
	;if in combat or searching (aeCombatState=1 or 2), take care of the fallback (if one) and grab the herd and evaluate package

	if(aeCombatState != 0 && busy == FALSE)
		busy = TRUE
		
		;unregister for remote events
		int i = 0
		While (i < herdRefs.length)
			UnregisterForRemoteEvent(herdRefs[i] as Actor, "OnCombatStateChanged")
			i = i + 1
		EndWhile
		
		;find the farthest flee marker from akTarget (that isn't the currentFleeToMarker) and move the fleeToMasterMarker to it
		i = 0
		tempFleeToMarker = none
		While (i < fleeToMarkers.length)
			if(fleeToMarkers[i] != currentFleeToMarker)
				if(tempFleeToMarker == none)
					tempFleeToMarker = fleeToMarkers[i]
				else
					if(fleeToMarkers[i].getDistance(akTarget) > tempFleeToMarker.getDistance(akTarget))
						tempFleeToMarker = fleeToMarkers[i]
					endIf
				endIf
			endIf
			i = i + 1
		EndWhile

		currentFleeToMarker = tempFleeToMarker
		fleeToMasterMarker.moveto(currentFleeToMarker)

		;if there is a fallback, set its aggression and confidence
		if(HaveFallback == TRUE)
			if((currentFallback as Actor).isDead() == TRUE)
				needNewFallback = TRUE
			else	
				(currentFallback as Actor).SetValue(Aggression, fAggression)
				(currentFallback as Actor).SetValue(Confidence, fConfidence)
				(currentFallback as Actor).startCombat(akTarget as actor)
			endIf
		endIf

		;if a new fallback is needed, assign one
		;start combat on akTarget and evaluate package on herd (if alive)
		;also might as well re-check the herdCountAlive
		;herdCountAlive = 0
		i = 0
		While (i < herdRefs.length)
			if((herdRefs[i] as Actor).isDead() == FALSE)
				;herdCountAlive = herdCountAlive + 1
				(herdRefs[i] as Actor).setValue(Suspicious, 2)

				if(needNewFallback == TRUE)
					needNewFallback = FALSE
					currentFallback = herdRefs[i]
					(currentFallback as Actor).setValue(Aggression, fAggression)
					(currentFallback as Actor).setValue(Confidence, fConfidence)
					(currentFallback as Actor).startCombat(akTarget as actor)
				endIf

				;flip the DMP_Herd actor value and evaluate package
				if((herdRefs[i] as Actor).getValue(DMP_Herd) == 0 || (herdRefs[i] as actor).getValue(DMP_Herd) == 2)
					(herdRefs[i] as Actor).setValue(DMP_Herd, 1)
				else
					(herdRefs[i] as Actor).setValue(DMP_Herd, 2)
				endIf

				(herdRefs[i] as Actor).EvaluatePackage()
			endIf
			i = i + 1
		EndWhile
		
		;start a timer
		StartTimer(timer, timerID)
	endIf
EndEvent

;********************************************************

Event OnTimer(int aiTimerID)
    if(aiTimerID == timerID)
    	busy = FALSE
    	;Debug.MessageBox("resetting busy to FALSE")
    endIf
    ;register the herd for onCombatStateChanged
    int i = 0
    While (i < herdRefs.length)
		RegisterForRemoteEvent(herdRefs[i] as Actor, "OnCombatStateChanged")
		i = i + 1
	EndWhile
EndEvent

;********************************************************

Event OnReset()
	;not yet implemented
endEvent

;********************************************************