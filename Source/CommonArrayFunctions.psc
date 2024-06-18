Scriptname CommonArrayFunctions
{Holds common functions for dealing with arrays of various types}

;REMINDERS
;A Zero Length array is treated as NONE


;jduvall
bool Function CheckObjectReferenceAgainstArray(ObjectReference ObjectToCheck, ObjectReference[] ArrayToCheck, bool returnValueIfArrayIsEmpty = false) global

;	Debug.Trace("CommonArrayFunctions.CheckObjectReferenceAgainstArray() ObjectToCheck: " + ObjectToCheck + " ArrayToCheck: " + ArrayToCheck)
	;!!! IMPORTANT ASSUMPTIONS
	;if ObjectToCheck is NONE, will return FALSE
	;if ArrayToCheck = NONE, will return returnValueIfArrayIsEmpty (defaults to false, though you MIGHT want it to return true in such cases)

	;Rationale:
	;If you are checking on behalf of an object that is NONE, we assume you should fail to find what you are looking for.

	;A zero length array is treated as NONE - depending on circumstance, you may want that to be true or false
	;We assume this in error and so return false, but for cases where such an array might be an optional property, you might want this to return true
	
	
	if ObjectToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectReferenceAgainstArray(): ObjectToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN false
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectReferenceAgainstArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN returnValueIfArrayIsEmpty
	endif

	int findVal = ArrayToCheck.find(ObjectToCheck)
	bool returnVal = false

	if findVal >= 0
		returnVal = true
	endif

;	Debug.Trace("CommonArrayFunctions.CheckObjectReferenceAgainstArray() returning: " + returnVal)


	RETURN returnVal

EndFunction

;kmk
int Function FindInReferenceAliasArray(ObjectReference ObjectToCheck, ReferenceAlias[] ArrayToCheck) global
	;if ObjectToCheck is NONE, will return -1
	;if ArrayToCheck = NONE, will return -1

	if ObjectToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectReferenceAgainstReferenceAliasArray(): ObjectToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN -1
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectReferenceAgainstReferenceAliasArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN -1
	endif

	int returnVal = -1
	if ObjectToCheck
		int i = 0
		while (returnVal == -1 && i < ArrayToCheck.length)
			if ArrayToCheck[i].GetReference() == ObjectToCheck
				returnVal = i
			endif
			i += 1
		endwhile
	endif


	;Debug.Trace("CommonArrayFunctions.FindInReferenceAliasArray() returning: " + returnVal)

	RETURN returnVal

EndFunction

;jduvall
bool Function CheckObjectReferenceAgainstReferenceAliasArray(ObjectReference ObjectToCheck, ReferenceAlias[] ArrayToCheck, bool returnValueIfArrayIsEmpty = false) global

	;!!! IMPORTANT ASSUMPTIONS
	;if ObjectToCheck is NONE, will return FALSE
	;if ArrayToCheck = NONE, will return returnValueIfArrayIsEmpty (defaults to false, though you MIGHT want it to return true in such cases)

	;Rationale:
	;If you are checking on behalf of an object that is NONE, we assume you should fail to find what you are looking for.

	;A zero length array is treated as NONE - depending on circumstance, you may want that to be true or false
	;We assume this in error and so return false, but for cases where such an array might be an optional property, you might want this to return true
	
	
	if ObjectToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectReferenceAgainstReferenceAliasArray(): ObjectToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN false
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectReferenceAgainstReferenceAliasArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN returnValueIfArrayIsEmpty
	endif

	bool returnVal = FindInReferenceAliasArray(ObjectToCheck, ArrayToCheck) > -1

;	Debug.Trace("CommonArrayFunctions.CheckObjectReferenceAgainstReferenceAliasArray() returning: " + returnVal)

	RETURN returnVal

EndFunction



;jduvall
bool Function CheckActorAgainstFactionArray(Actor ObjectToCheck, Faction[] ArrayToCheck, bool returnValueIfArrayIsEmpty = false) global

	;!!! IMPORTANT ASSUMPTIONS
	;if ObjectToCheck is NONE, will return FALSE
	;if ArrayToCheck = NONE, will return returnValueIfArrayIsEmpty (defaults to false, though you MIGHT want it to return true in such cases)

	;Rationale:
	;If you are checking on behalf of an object that is NONE, we assume you should fail to find what you are looking for.

	;A zero length array is treated as NONE - depending on circumstance, you may want that to be true or false
	;We assume this in error and so return false, but for cases where such an array might be an optional property, you might want this to return true
	
	
	if ObjectToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckActorAgainstFactionArray(): ObjectToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN false
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckActorAgainstFactionArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN returnValueIfArrayIsEmpty
	endif

	bool returnVal = false
	if ObjectToCheck
		int i = 0
		while (returnVal == false && i < ArrayToCheck.length)
			returnVal = ObjectToCheck.IsInFaction(ArrayToCheck[i])
			i += 1
		endwhile
	endif


;	Debug.Trace("CommonArrayFunctions.CheckActorAgainstFactionArray() returning: " + returnVal)

	RETURN returnVal

EndFunction


;jduvall
bool Function CheckObjectAgainstKeywordArray(ObjectReference ObjectToCheck, Keyword[] ArrayToCheck, bool returnValueIfArrayIsEmpty = false) global

	;!!! IMPORTANT ASSUMPTIONS
	;if ObjectToCheck is NONE, will return FALSE
	;if ArrayToCheck = NONE, will return returnValueIfArrayIsEmpty (defaults to false, though you MIGHT want it to return true in such cases)

	;Rationale:
	;If you are checking on behalf of an object that is NONE,  we assume you should fail to find what you are looking for.
	
	;A zero length array is treated as NONE - depending on circumstance, you may want that to be true or false
	;We assume this in error and so return false, but for cases where such an array might be an optional property, you might want this to return true

	if ObjectToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectAgainstKeywordArray(): ObjectToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN false
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectAgainstKeywordArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN returnValueIfArrayIsEmpty
	endif

	bool returnVal = false
	if ObjectToCheck
		int i = 0
		while (returnVal == false && i < ArrayToCheck.length)
			returnVal = ObjectToCheck.HasKeyword(ArrayToCheck[i])
			i += 1
		endwhile
	endif


;	Debug.Trace("CommonArrayFunctions.CheckObjectAgainstKeywordArray() returning: " + returnVal)

	RETURN returnVal

EndFunction

;jduvall
bool Function CheckFormAgainstKeywordArray(Form ObjectToCheck, Keyword[] ArrayToCheck, bool returnValueIfArrayIsEmpty = false) global

	;!!! IMPORTANT ASSUMPTIONS
	;if ObjectToCheck is NONE, will return FALSE
	;if ArrayToCheck = NONE, will return returnValueIfArrayIsEmpty (defaults to false, though you MIGHT want it to return true in such cases)

	;Rationale:
	;If you are checking on behalf of an object that is NONE,  we assume you should fail to find what you are looking for.
	
	;A zero length array is treated as NONE - depending on circumstance, you may want that to be true or false
	;We assume this in error and so return false, but for cases where such an array might be an optional property, you might want this to return true

	if ObjectToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectAgainstKeywordArray(): ObjectToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN false
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckObjectAgainstKeywordArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN returnValueIfArrayIsEmpty
	endif

	bool returnVal = false
	if ObjectToCheck
		int i = 0
		while (returnVal == false && i < ArrayToCheck.length)
			returnVal = ObjectToCheck.HasKeyword(ArrayToCheck[i])
			i += 1
		endwhile
	endif


;	Debug.Trace("CommonArrayFunctions.CheckObjectAgainstKeywordArray() returning: " + returnVal)

	RETURN returnVal

EndFunction


;dbrigner
bool Function CheckFormAgainstArray(Form FormToCheck, Form[] ArrayToCheck, bool returnValueIfArrayIsEmpty = false) global

	;!!! IMPORTANT ASSUMPTIONS
	;if FormToCheck is NONE, will return FALSE
	;if ArrayToCheck = NONE, will return returnValueIfArrayIsEmpty (defaults to false, though you MIGHT want it to return true in such cases)

	;Rationale:
	;If you are checking on behalf of an object that is NONE, we assume you should fail to find what you are looking for.

	;A zero length array is treated as NONE - depending on circumstance, you may want that to be true or false
	;We assume this in error and so return false, but for cases where such an array might be an optional property, you might want this to return true
	
	
	if FormToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckFormAgainstArray(): FormToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN false
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckFormAgainstArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN returnValueIfArrayIsEmpty
	endif

	int findVal = ArrayToCheck.find(FormToCheck)
	bool returnVal = false

	if findVal >= 0
		returnVal = true
	endif


;	Debug.Trace("CommonArrayFunctions.CheckFormAgainstArray() returning: " + returnVal)

	RETURN returnVal

EndFunction

;kmk
bool Function CheckLocationAgainstArray(Location ObjectToCheck, Location[] ArrayToCheck, Location LocationToCheckIsDifferent = NONE, bool returnValueIfArrayIsEmpty = false, bool matchIfChildLocation = false) global

;	Debug.Trace("CommonArrayFunctions.CheckLocationAgainstArray() ObjectToCheck: " + ObjectToCheck + " ArrayToCheck: " + ArrayToCheck)
	;!!! IMPORTANT ASSUMPTIONS
	;if ObjectToCheck is NONE, will return FALSE
	;if ArrayToCheck = NONE, will return returnValueIfArrayIsEmpty (defaults to false, though you MIGHT want it to return true in such cases)

	;Rationale:
	;If you are checking on behalf of an object that is NONE, we assume you should fail to find what you are looking for.

	;A zero length array is treated as NONE - depending on circumstance, you may want that to be true or false
	;We assume this in error and so return false, but for cases where such an array might be an optional property, you might want this to return true
	
	; matchIfChildLocation: if true, will also consider a match if ObjectToCheck is a child of anything in ArrayToCheck
	
	if ObjectToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckLocationAgainstArray(): ObjectToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN false
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckLocationAgainstArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN returnValueIfArrayIsEmpty
	endif


	int findVal = ArrayToCheck.find(ObjectToCheck)
	bool returnVal = false

	; if we found a matching location, AND LocationToCheckIsDifferent isn't matching, return true
	; if included, LocationToCheckIsDifferent is for location checks where you only want to trigger when a new location is entered/exited,
	;   not when moving between the same location or (much more likely) between children of the same location
	if findVal >= 0 && LocationToCheckIsDifferent != ArrayToCheck[findVal]
		returnVal = true
	elseif matchIfChildLocation
		; we need to check if ObjectToCheck is a child of anything in ArrayToCheck
		int i = 0
		while (returnVal == false && i < ArrayToCheck.length)
			if ArrayToCheck[i].IsChild(ObjectToCheck) && (LocationToCheckIsDifferent == NONE || ArrayToCheck[i].IsChild(LocationToCheckIsDifferent) == false)
			;	debug.trace("CommonArrayFunctions.CheckLocationAgainstArray() found that " + ObjectToCheck + " is child of " + ArrayToCheck[i])
				returnVal = true
			endif
			i = i + 1
		endWhile
	endif

;	Debug.Trace("CommonArrayFunctions.CheckLocationAgainstArray() returning: " + returnVal)


	RETURN returnVal

EndFunction

;kmk
bool Function CheckLocationAgainstLocationAliasArray(Location ObjectToCheck, LocationAlias[] ArrayToCheck, Location LocationToCheckIsDifferent = NONE, bool returnValueIfArrayIsEmpty = false, bool matchIfChildLocation = false) global

	;!!! IMPORTANT ASSUMPTIONS
	;if ObjectToCheck is NONE, will return FALSE
	;if ArrayToCheck = NONE, will return returnValueIfArrayIsEmpty (defaults to false, though you MIGHT want it to return true in such cases)

	;Rationale:
	;If you are checking on behalf of an object that is NONE, we assume you should fail to find what you are looking for.

	;A zero length array is treated as NONE - depending on circumstance, you may want that to be true or false
	;We assume this in error and so return false, but for cases where such an array might be an optional property, you might want this to return true
	
	; matchIfChildLocation: if true, will also consider a match if ObjectToCheck is a child of anything in ArrayToCheck
	
	if ObjectToCheck == NONE
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckLocationAgainstLocationAliasArray(): ObjectToCheck is NONE -- RETURNING: FALSE", 1)
		RETURN false
	elseif ArrayToCheck.length == 0
		;Debug.TraceStack("CAUTION! CommonArrayFunctions.CheckLocationAgainstLocationAliasArray(): ArrayToCheck is NONE -- RETURNING: " + returnValueIfArrayIsEmpty, 1)
		RETURN returnValueIfArrayIsEmpty
	endif

	bool returnVal = false
	if ObjectToCheck
		int i = 0
		while (returnVal == false && i < ArrayToCheck.length)
			; if we found a matching location, AND LocationToCheckIsDifferent isn't matching, return true
			; if included, LocationToCheckIsDifferent is for location checks where you only want to trigger when a new location is entered/exited,
			;   not when moving between the same location or (much more likely) between children of the same location

			returnVal = ( ArrayToCheck[i].GetLocation() == ObjectToCheck && LocationToCheckIsDifferent != ArrayToCheck[i].GetLocation() )
			if !returnVal && matchIfChildLocation
				; check if ObjectToCheck is a child, if so return true
				returnVal = ArrayToCheck[i].GetLocation().IsChild(ObjectToCheck) && (LocationToCheckIsDifferent == NONE || ArrayToCheck[i].GetLocation().IsChild(LocationToCheckIsDifferent) == false)
				if returnVal
				;	debug.trace("CommonArrayFunctions.CheckLocationAgainstLocationAliasArray() found that " + ObjectToCheck + " is child of " + ArrayToCheck[i].GetLocation())
				endif
			endif
			i += 1
		endwhile
	endif


;	Debug.Trace("CommonArrayFunctions.CheckLocationAgainstLocationAliasArray() returning: " + returnVal)

	RETURN returnVal

EndFunction

;jduvall
keyword Function GetFirstFoundKeywordInArrayForLocation(Location LocationToCheck, Keyword[] ArrayToCheck) Global
	
Debug.Trace("CommonArrayFunctions.GetFirstFoundKeywordInArrayForLocation() LocationToCheck: " + LocationToCheck + " ArrayToCheck: " + ArrayToCheck)

	keyword returnVal

	int i = 0
	while (i < ArrayToCheck.length && returnVal == None)
		
		if LocationToCheck.HasKeyword(ArrayToCheck[i])
			returnVal = ArrayToCheck[i]
		endif

		i += 1
	endwhile

;	Debug.Trace("CommonArrayFunctions.GetFirstFoundKeywordInArrayForLocation() returning: " + returnVal)

	RETURN ReturnVal

EndFunction

;jduvall
Faction Function GetFirstFoundFactionInArrayForActor(Actor ActorToCheck, Faction[] ArrayToCheck) Global
	
Debug.Trace("CommonArrayFunctions.GetFirstFoundFactionInArrayForActor() ActorToCheck: " + ActorToCheck + " ArrayToCheck: " + ArrayToCheck)

	Faction returnVal

	int i = 0
	while (i < ArrayToCheck.length && returnVal == None)
		
		if ActorToCheck.IsInFaction(ArrayToCheck[i])
			returnVal = ArrayToCheck[i]
		endif

		i += 1
	endwhile

;	Debug.Trace("CommonArrayFunctions.GetFirstFoundFactionInArrayForActor() returning: " + returnVal)

	RETURN ReturnVal

EndFunction


;jduvall
bool Function IsActorInArrayHostileToActor (Actor ActorToCheck, ObjectReference[] ArrayToCheck) Global
	
Debug.Trace("CommonArrayFunctions.IsActorInArrayHostileToActor () ActorToCheck: " + ActorToCheck + " ArrayToCheck: " + ArrayToCheck)

	bool returnVal = false

	int i = 0
	while (i < ArrayToCheck.length && returnVal == false)

		if ((ArrayToCheck[i] as Actor).IsHostileToActor(ActorToCheck))
			returnVal = true
		endif

		i += 1
	endwhile

;	Debug.Trace("CommonArrayFunctions.IsActorInArrayHostileToActor () returning: " + returnVal)

	RETURN ReturnVal

EndFunction


;jduvall
Actor[] Function GetActorArrayFromAliasArray(ReferenceAlias[] AliasArrayToGetActorsFrom) Global
	Actor[] newArray = new Actor[0]

	int i = 0
	While (i < AliasArrayToGetActorsFrom.length)
		Actor actorRef = AliasArrayToGetActorsFrom[i].GetActorReference()

		if actorRef
			newArray.Add(actorRef)
		endif
		
		i += 1
	EndWhile
EndFunction

;jduvall
ObjectReference[] Function GetReferenceArrayFromAliasArray(ReferenceAlias[] AliasArrayToGetActorsFrom) Global
	ObjectReference[] newArray = new ObjectReference[0]

	int i = 0
	While (i < AliasArrayToGetActorsFrom.length)
		ObjectReference ref = AliasArrayToGetActorsFrom[i].GetActorReference()

		if ref
			newArray.Add(ref)
		endif
		
		i += 1
	EndWhile
EndFunction


;jduvall
;gets count of actors in array
;CheckAlive: true = only count alive actors;  false = only count dead actors
int Function GetCountAliveStateFromArray(Actor[] ArrayToCheck, bool CheckAlive = true) Global
	int count = 0

	int i = 0
	While (i < ArrayToCheck.length)
		if ArrayToCheck[i].IsDead() != CheckAlive
			count += 1
		endif
		i += 1
	EndWhile

	return count
EndFunction

;jduvall
;gets count of references in array
;Check3DLoaded: true = only count if Is3DLoaded() is true;  false = only count if Is3DLoaded() is false
int Function GetCountLoadedStateFromArray(ObjectReference[] ArrayToCheck, bool Check3DLoaded = true) Global
	int count = 0

	int i = 0
	While (i < ArrayToCheck.length)
		if ArrayToCheck[i].Is3DLoaded() == Check3DLoaded
			count += 1
		endif
		i += 1
	EndWhile

	return count
EndFunction

;jduvall
;gets count of actors in array
;CheckAlive: true = only count alive actors;  false = only count dead actors
;Check3DLoaded: true = only count if Is3DLoaded() is true;  false = only count if Is3DLoaded() is false
int Function GetCountLoadedAndAliveStateFromArray(Actor[] ArrayToCheck, bool Check3DLoaded = true, bool CheckAlive = true) Global
	int count = 0

	int i = 0
	While (i < ArrayToCheck.length)
		if ArrayToCheck[i].Is3DLoaded() == Check3DLoaded && ArrayToCheck[i].IsDead() != CheckAlive
			count += 1
		endif
		i += 1
	EndWhile

	return count
EndFunction


;jduvall
;gets count of actors in array
;CheckAlive: true = only count alive actors;  false = only count dead actors
int Function GetCountAliveStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, bool CheckAlive = true) Global
	Actor[] arrayToCheck = GetActorArrayFromAliasArray(AliasArrayToCheck)
	return GetCountAliveStateFromArray(arrayToCheck, CheckAlive)
EndFunction


;jduvall
;gets count of references in array
;Check3DLoaded: true = only count if Is3DLoaded() is true;  false = only count if Is3DLoaded() is false
int Function GetCountLoadedStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, bool Check3DLoaded = true) Global
	ObjectReference[] arrayToCheck = GetReferenceArrayFromAliasArray(AliasArrayToCheck)
	return GetCountLoadedStateFromArray(arrayToCheck, Check3DLoaded)
EndFunction

;jduvall
;gets count of actors in array
;CheckAlive: true = only count alive actors;  false = only count dead actors
;Check3DLoaded: true = only count if Is3DLoaded() is true;  false = only count if Is3DLoaded() is false
int Function GetCountLoadedAndAliveStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, bool Check3DLoaded = true, bool CheckAlive = true) Global
	Actor[] arrayToCheck = GetActorArrayFromAliasArray(AliasArrayToCheck)
	return GetCountLoadedAndAliveStateFromArray(arrayToCheck, Check3DLoaded, CheckAlive)
EndFunction


;jduvall
;returns an array of all the ReferenceAliases from an array of Aliases
ReferenceAlias[] Function GetReferenceAliasesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) global
	ReferenceAlias[] returnArray = new ReferenceAlias[0]

	int i = 0
	While (i < ArrayOfVariousTypesOfAliases.length)
		ReferenceAlias currentReferenceAlias = ArrayOfVariousTypesOfAliases[i] as ReferenceAlias
		
		if currentReferenceAlias
			returnArray.add(currentReferenceAlias)
		endif

		i += 1
	EndWhile

	return returnArray
EndFunction

;jduvall
;returns an array of all the ReferenceCollectionAliases from an array of Aliases
RefCollectionAlias[] Function GetRefCollectionAliasesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) global
	RefCollectionAlias[] returnArray = new RefCollectionAlias[0]

	int i = 0
	While (i < ArrayOfVariousTypesOfAliases.length)
		RefCollectionAlias currentRefCollectionAlias = ArrayOfVariousTypesOfAliases[i] as RefCollectionAlias
		
		if currentRefCollectionAlias
			returnArray.add(currentRefCollectionAlias)
		endif

		i += 1
	EndWhile

	return returnArray
EndFunction


;jduvall
;returns an array of all references from aliases in the array.
ObjectReference[] Function GetReferencesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) global
	ObjectReference[] refs = new ObjectReference[0]

	int i = 0
	While (i < ArrayOfVariousTypesOfAliases.length)
		ReferenceAlias currentRefAllias = ArrayOfVariousTypesOfAliases[i] as ReferenceAlias
		RefCollectionAlias currentRefCollectionAlias = ArrayOfVariousTypesOfAliases[i] as RefCollectionAlias
		
		ObjectReference currentRef = None

		if currentRefAllias
			currentRef = currentRefAllias.GetRef()
			if currentRef
				refs.add(currentRef)
			endif
		elseif currentRefCollectionAlias
			ObjectReference[] refColRefs = currentRefCollectionAlias.GetArray()
			int r = 0
			While (r < refColRefs.length)
				currentRef = refColRefs[r]
				
				if currentRef
					refs.add(currentRef)
				endif

				r += 1
			EndWhile
		endif

		i += 1
	EndWhile

	return refs
EndFunction

;jduvall
ObjectReference[] Function GetReferencesWithMatchingKeyword(ObjectReference[] ArrayOfRefsToCheck, Keyword KeywordToMatch) Global
	
	ObjectReference[] returnArray = New ObjectReference[0]
	
	int i = 0
	While (i < ArrayOfRefsToCheck.length)
		if ArrayOfRefsToCheck[i].HasKeyword(KeywordToMatch)
			returnArray.Add(ArrayOfRefsToCheck[i])
		endif
		i += 1
	EndWhile

	return returnArray
EndFunction

;jduvall
int Function GetRandomIndex(int ArrayLength) Global
	return Utility.RandomInt(0, arrayLength - 1)
EndFunction

;jduvall
;Note: while indices is the more common plural form of index, for searchability I'm using the lesser used American style pluralization Indexes
int[] Function GetRandomizedIndexes(int ArrayLength) Global
	
	int[] randomizedIndexes = new int[ArrayLength]

	;init
	int i = 0
	While (i < ArrayLength)
		randomizedIndexes[i] = i
		i += 1
	EndWhile

	;shuffle
	i = ArrayLength - 1
	While (i > 0)
		;pick random index from 0 to i
		int r = Utility.RandomInt(0, i)
		int temp = randomizedIndexes[i]
		randomizedIndexes[i] = randomizedIndexes[r]
		randomizedIndexes[r] = temp
		i -= 1
	EndWhile

	return randomizedIndexes
EndFunction 

;scornett
;Given an ObjectReference array, return a copy of it.
ObjectReference[] Function CopyObjArray(ObjectReference[] input) Global
    ObjectReference[] output = new ObjectReference[input.Length]
    int i = 0
    While (i < input.Length)
        output[i] = input[i]
        i = i + 1
    EndWhile
    return output
EndFunction

;scornett
;Given an ObjectReference array, return a copy of it with its contents randomized.
ObjectReference[] Function CopyAndRandomizeObjArray(ObjectReference[] input) Global
    ObjectReference[] output = CopyObjArray(input)
    float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0, 1)
    int i = output.Length - 1
    While (i >= 0)
        int currentRandomIndex = (random[i] * i) as int
        ObjectReference temp = output[i]
        output[i] = output[currentRandomIndex]
        output[currentRandomIndex] = temp
        i = i - 1
    EndWhile
    return output
EndFunction

;scornett
;Given an Actor array, return a copy of it.
Actor[] Function CopyActorArray(Actor[] input) Global
    Actor[] output = new Actor[input.Length]
    int i = 0
    While (i < input.Length)
        output[i] = input[i]
        i = i + 1
    EndWhile
    return output
EndFunction

;scornett
;Given an Actor array, return a copy of it with its contents randomized.
Actor[] Function CopyAndRandomizeActorArray(Actor[] input) Global
    Actor[] output = CopyActorArray(input)
    float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0, 1)
    int i = output.Length - 1
    While (i >= 0)
        int currentRandomIndex = (random[i] * i) as int
        Actor temp = output[i]
        output[i] = output[currentRandomIndex]
        output[currentRandomIndex] = temp
        i = i - 1
    EndWhile
    return output
EndFunction






;scornett
;Get all of the refs in all of the provided triggers.
;Note that those refs must qualify for the trigger's collision type and interact conditions in order to be found.
ObjectReference[] Function GetAllRefsInTriggers(ObjectReference[] triggers) global
    ObjectReference[] returnVal = new ObjectReference[0]
    int i = 0
    While (i < triggers.Length)
        ObjectReference[] allRefsInCurrentTrigger = triggers[i].GetAllRefsInTrigger()
        int j = 0
        While (j < allRefsInCurrentTrigger.Length)
            if (returnVal.Find(allRefsInCurrentTrigger[j]) < 0)
                returnVal.Add(allRefsInCurrentTrigger[j])
            EndIf
            j = j + 1
        EndWhile
        i = i + 1
    EndWhile
    return returnVal
EndFunction

;scornett
;Given an array of objects and an actor value, returns a new array with the objects sorted by the value of that actor value.
ObjectReference[] Function SortRefsByValue(ObjectReference[] input, ActorValue sortAV) global
	ObjectReference[] sortedInput = new ObjectReference[0]
	int i = 0
	While (i < input.Length)
		ObjectReference current = input[i]
		if (current != None)
			float currentValue = current.GetValue(sortAV)
			int j = 0
			While (j < sortedInput.Length)
				if (sortedInput[j].GetValue(sortAV) >= currentValue)
					sortedInput.Insert(current, j)
					j = sortedInput.Length + 1
				EndIf
				j = j + 1
			EndWhile
			if (j == sortedInput.Length)
				sortedInput.Add(current)
			EndIf
		EndIf
		i = i + 1
	EndWhile
	return sortedInput
EndFunction