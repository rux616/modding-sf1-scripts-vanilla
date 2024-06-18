Scriptname RefCollectionAliasManager extends Quest
{Looks through a ReferenceCollection and finds the best one and shoves it into sing Reference Alias.}

;used by Attraction Object Quests, please talk to jduvall before making changes. Thanks :)


Struct FactionWeightData
	faction WhichFaction
	float Weight

EndStruct


Struct ItemKeywordWeightData
	keyword ItemKeyword
	float Weight

EndStruct

Struct MessageData
Message MessageToDisplay
GlobalVariable ConditionalGlobal
Float ConditionalGlobalValue

EndStruct


Group Properties
{Every ref is given a total weight value, this data configures the weights}


RefCollectionAlias Property RefCollectionToManage const auto 

ReferenceAlias Property ReferenceAliasToFill const auto
{What "single" Reference Alias are we going to fill after managing the collection?}

float Property DistanceWeight = -1.0 const auto
{Default = -1.  NOTE: Negative value means prefer closest.

How much to we multiply the GetDistance() check to add to a references preference weight?

Check is for distance to player. If you prefer to find closest to something else, see advanced properties.}

float Property ValueWeight = 1.0 const auto
{Default = 1.

How much to we multiply the GetGoldValue() check to add to a references preference weight?

Reminder: things without Value GetGoldValue() will return -1}

FactionWeightData[] Property FactionWeights const auto
{An actor having one or more of these factions will cause the specified amount added to a references preference weight 
(more than one faction listed means more than one weight being added)}


ItemKeywordWeightData[] Property ItemKeywordWeights const auto
{Generates weight based on keywords that item has. If container, GetItemCount() will look for these keywords, each keyword is given a weight, the count of items with each keyword is multiplied by the weight.
Items with multiple keywords get weights based on all the keywords.
}

bool Property IgnoreCreatedRefs = true const auto
{Default: true; if true, any non-persiting references not existing in the masterfile will be ignored (player dropped, created by script etc.)
Primarily this is used to get dogmeat to ignore things the player dropped.}


bool Property IgnoreEmptyContainers = true const auto
{Default: true; if true, empty Containers will not be considered at all for the best reference. In otherwords, they will never fill ReferenceAliasToFill.}


bool Property IgnoreThingsBehindPlayer = true const auto
{Ignores anything behind the player's current facing.

See Advanced properties to defining heading angle.}

bool Property IgnoreThingsWithoutLOS = false const auto
{ignores anything that doesn't pass a LOS check to the Player OR to ClosestToThisAlias}

keyword Property OverrideIgnoreBehindKeyword const auto
{If this quest started by this keyword, ignore the rule about ignoring things behind player.
This is to get this to work better when the player commands dogmeat to find things through dialogue.
}

bool Property IgnoreIfWouldBeStealing = true const auto
{If true, ignore anything owned}

ReferenceAlias Property AliasToTestForStealing const auto
{When doing WouldBeStealing check, check for Actor in this alias}

Float Property MaxZPositionDifference = 300.0 const auto
{Default: 300; if Z position between object and ClosetToThisAlias is greater than this, ignore the item}

int  Property MinContainerValue = 50 const auto
{Default: 50; ignore any container with a value less than this}

MessageData[] Property MessagesToDisplayWhenBestItemFound const auto

EndGroup


Group Advanced

ReferenceAlias Property ClosestToThisAlias const auto
{Default: None; if None = Player, if not none, use the reference in this alias for distance calculation}

ReferenceAlias Property LOSCheckToThisAlias const auto
{Default: None; if None = Player, if not none, use the reference in this alias for LOS calculation}

float Property MaxDegreesForInfront = 90.0 const auto
{Default: 90; what is the arc in degrees that means in front of the player}


EndGroup

ObjectReference DistanceToRef
Actor LOSToActor

bool BestWeightHasBeenSet  ;since BestWeightSoFar starts at zero, and weighted values can be negative, we need to be sure we set it the first time.
Float BestWeightSoFar
ObjectReference BestReferenceSoFar


keyword StartingKeyword ;what keyword started this quest

Event OnInit()
	if ClosestToThisAlias
		DistanceToRef = ClosestToThisAlias.GetReference()
	else
		DistanceToRef = Game.Getplayer()
	endIf

	if LOSCheckToThisAlias
		LOSToActor = LOSCheckToThisAlias.GetActorRef()
	else
		LOSToActor = game.GetPlayer()

	endif

EndEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
	debug.trace(self + "OnStoryScript() StartingKeyword = " + akKeyword)
	StartingKeyword = akKeyword
EndEvent


Function ProcessCollection()

	Actor TestStealingRef = AliasToTestForStealing.GetActorRef()

	int CountOfRefCollection = RefCollectionToManage.GetCount()

	ObjectReference ClosestToThisRef = ClosestToThisAlias.GetReference()

	int i = 0
	while (i < CountOfRefCollection)	;loop through the ref collection
		ObjectReference CurrentRef = RefCollectionToManage.GetAt(i)
		
		float CurrentDistance = CurrentRef.GetDistance(DistanceToRef)
		float CurrentWeightedDistance = CurrentDistance * DistanceWeight

		float CurrentZPositionDifference = GetZPositionDifference(CurrentRef)

		float CurrentValue
		if CurrentRef.GetBaseObject() is Container
			CurrentValue = CurrentRef.GetInventoryValue()
		else
			CurrentValue = CurrentRef.GetGoldValue()
		endif
		float CurrentWeightedValue = CurrentValue * ValueWeight

		debug.trace(self + "ProcessCollection() CurrentRef:" + CurrentRef)
		debug.trace(self + "ProcessCollection() DistanceToRef:" + DistanceToRef)
		debug.trace(self + "ProcessCollection() DistanceToRef:" + CurrentZPositionDifference)
		debug.trace(self + "ProcessCollection() CurrentDistance[Weighted]" + CurrentDistance + "[" + CurrentWeightedDistance + "]")
		debug.trace(self + "ProcessCollection() CurrentValue[Weighted]" + CurrentValue + "[" + CurrentWeightedValue + "]")
		

		float CurrentFactionsWeight = GetFactionsWeight(CurrentRef)
		debug.trace(self + "ProcessCollection() CurrentFactionsWeight: " + CurrentFactionsWeight)

		float CurrentItemKeywordsWeight = GetItemKeywordsWeight(CurrentRef)
		debug.trace(self + "ProcessCollection() CurrentItemKeywordsWeight: " + CurrentItemKeywordsWeight)


		float CurrentWeightedTotal = CurrentWeightedDistance + CurrentWeightedValue + CurrentFactionsWeight + CurrentItemKeywordsWeight

		debug.trace(self + "ProcessCollection() CurrentWeightedTotal:" + CurrentWeightedTotal)
		debug.trace(self + "ProcessCollection() BestWeightSoFar:" + BestWeightSoFar)


		if CurrentRef.GetBaseObject() is Container
			debug.trace(self + "CURRENTREF.GETBASEOBJECT() IS CONTAINER? True" )
			debug.trace(self + "CURRENTREF.GETITEMCOUNT()  " + CurrentRef.GetItemCount())

		else
			debug.trace(self + "CURRENTREF.GETBASEOBJECT() IS CONTAINER? False" )
		endif



		bool ignoreMe

		debug.trace(self + "ProcessCollection() TestStealingRef: " + TestStealingRef)
		debug.trace(self + "ProcessCollection() TestStealingRef.WouldBeStealing(CurrentRef): " + TestStealingRef.WouldBeStealing(CurrentRef))
		

		Actor PlayerRef = Game.GetPlayer()

		if TestStealingRef.WouldBeStealing(CurrentRef) && IgnoreIfWouldBeStealing
			debug.trace(self + "ProcessCollection() WouldBeStealing(CurrentRef) && IgnoreIfWouldBeStealing, will ignore this reference completely.")
			ignoreMe = True

		elseif  IgnoreThingsWithoutLOS && LOSToActor.HasDirectLOS(currentRef) == false && PlayerRef.HasDirectLOS(currentRef) == false && PlayerRef.HasDetectionLOS(currentRef) == false 
			debug.trace(self + "ProcessCollection() Player and LOSToActor don't have LOS to CurrentRef, will ignore this reference completely.")
			ignoreMe = True			

		elseif CurrentRef.IsCreated() && IgnoreCreatedRefs
			debug.trace(self + "ProcessCollection() CurrentRef.IsCreated() && IgnoreCreatedRefs, will ignore this reference completely.")
			ignoreMe = True			

		elseif	CurrentZPositionDifference > MaxZPositionDifference
			debug.trace(self + "ProcessCollection() CurrentZPositionDifference > MaxZPositionDifference (" + CurrentZPositionDifference + " > " + MaxZPositionDifference + "), will ignore this reference completely.")
			ignoreMe = True

		elseif CurrentRef.GetBaseObject() is Container
			if CurrentRef.GetItemCount() == 0 && IgnoreEmptyContainers ;an empty container
				debug.trace(self + "ProcessCollection() CurrentRef is an Empty container and IgnoreEmptyContaiers is true, will ignore this reference completely")
				ignoreMe = True

			elseif CurrentRef.GetInventoryValue() < MinContainerValue
				debug.trace(self + "ProcessCollection() CurrentRefGetInventoryValue() is less than MinContainerValue. Ignoring container. (" + CurrentRef.GetInventoryValue() + " < " + MinContainerValue)
				ignoreMe = True

			endif

		elseif IgnoreThingsBehindPlayer && IsBehindPlayer(CurrentRef) && StartingKeyword != OverrideIgnoreBehindKeyword
			debug.trace(self + "ProcessCollection() CurrentRef IsBehindPlayer() and IgnoreThingsBehindPlayer is true, will ignore this reference completely")				
			ignoreMe = True

		endIf

		if ignoreMe == False && (CurrentWeightedTotal > BestWeightSoFar || BestWeightHasBeenSet == false)
			debug.trace(self + "ProcessCollection() CurrentWeightedTotal > BestWeightSoFar! (or this is the first time we are setting it)")
			BestWeightHasBeenSet = true
			BestWeightSoFar = CurrentWeightedTotal
			BestReferenceSoFar = CurrentRef

		endIf

		debug.trace(self + "ProcessCollection() BestReferenceSoFar:" + BestReferenceSoFar)

		i += 1

	endwhile

	if BestReferenceSoFar == none
		debug.trace(self + "ProcessCollection() Couldn't find a valid reference, calling stop on the quest.", 1)
		stop()

	else

		debug.trace(self + "ProcessCollection() Filling:" + ReferenceAliasToFill + " with " + BestReferenceSoFar)
		ReferenceAliasToFill.ForceRefTo(BestReferenceSoFar)

		;Display FOUND SOMETHING Message
		message MessageToDisplayWhenBestItemFound = GetMessageToDisplay()
		if MessageToDisplayWhenBestItemFound
			MessageToDisplayWhenBestItemFound.Show()
		endif

	endif
EndFunction

message Function GetMessageToDisplay()
	int i = 0
	while (i < MessagesToDisplayWhenBestItemFound.length)
		
		MessageData currentMessageData = MessagesToDisplayWhenBestItemFound[i]

		if currentMessageData.ConditionalGlobal.GetValue() == currentMessageData.ConditionalGlobalValue
			return currentMessageData.MessageToDisplay
		endif

		i += 1
	endwhile

EndFunction

float Function GetFactionsWeight(ObjectReference ReferenceToCheck)
	debug.trace(self + "GetFactionsWeight() ReferenceToCheck:" + ReferenceToCheck)

	float returnVal

	Actor ActorToCheck = ReferenceToCheck as Actor

	float TotalFactionWeights

	if ActorToCheck
		int i = 0
		while (i < FactionWeights.length)
			
			if ActorToCheck.IsInFaction(FactionWeights[i].WhichFaction)
				debug.trace(self + "GetFactionWeight() ReferenceToCheck is in Faction[weight]: " + FactionWeights[i].WhichFaction + "[" + FactionWeights[i].Weight + "]")

				TotalFactionWeights += FactionWeights[i].Weight
				debug.trace(self + "GetFactionWeight() TotalFactionWeights: " + TotalFactionWeights)

			endif

			i += 1
		endwhile

		returnVal = TotalFactionWeights

	else
		debug.trace(self + "GetFactionsWeight() ReferenceToCheck is not an actor.")
		returnVal = 0
	endIf

	debug.trace(self + "GetFactionsWeight() Returning:" + returnVal)

	RETURN returnVal

EndFunction

float Function GetItemKeywordsWeight(ObjectReference ReferenceToCheck)
	debug.trace(self + "GetItemKeywordsWeight() ReferenceToCheck:" + ReferenceToCheck)

	float returnVal

	float TotalItemKeywordsWeights


	if ReferenceToCheck
		int i = 0
		while (i < ItemKeywordWeights.length)
			

			if ReferenceToCheck.GetBaseObject() is Container

				int itemCount = ReferenceToCheck.GetItemCount(ItemKeywordWeights[i].ItemKeyword)

				if  itemCount > 0
					debug.trace(self + "GetItemKeywordsWeight() found Keyword[Count]" + ItemKeywordWeights[i].ItemKeyword + "[" + itemCount + "]")

					TotalItemKeywordsWeights += itemCount * ItemKeywordWeights[i].Weight 
					debug.trace(self + "GetItemKeywordsWeight() TotalItemKeywordsWeights: " + TotalItemKeywordsWeights)

				endif

			else ;not a contaniner
				TotalItemKeywordsWeights += ItemKeywordWeights[i].Weight

			endif

			i += 1

		endwhile

		returnVal = TotalItemKeywordsWeights

	endIf




	debug.trace(self + "GetItemKeywordsWeight() Returning:" + returnVal)

	RETURN returnVal

EndFunction


bool Function IsBehindPlayer(ObjectReference ObjectToCheck)
	
	debug.trace(self + "IsBehindPlayer() ")

	float heading = Game.GetPlayer().GetHeadingAngle(ObjectToCheck)

	debug.trace(self + "Player heading angle to ObjectToCheck[Angle]" + ObjectToCheck + "[" + heading + "]")	

	bool returnVal = math.abs(Heading) > MaxDegreesForInfront / 2 ; absolute value of heading, and dividing the max degrees by 2 because 0 = straight forward and 180/-180 directly behind

	debug.trace(self + "IsBehindPlayer() returning: " + returnVal)

	RETURN returnVal

EndFunction


float Function GetZPositionDifference(ObjectReference ObjectToCheck)
	
	float ActorZ = ClosestToThisAlias.GetReference().GetPositionZ()
	float ObjectZ = ObjectToCheck.GetPositionZ()

	RETURN math.abs(ActorZ - ObjectZ)

EndFunction