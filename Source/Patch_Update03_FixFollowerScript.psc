Scriptname Patch_Update03_FixFollowerScript extends Quest

bool Property CheckForLocationChanges = true Const Auto
{making a property we can turn off if we implement a fix to prevent this from happening in another update}

Struct QuestFollowerFixDatum
    DefaultFollowerToggleQuestScript FollowerToggleQuest
    ReferenceAlias AliasToFix
    Location DisallowedLocation
    ObjectReference FixByMovingToReference
    {Use marker if possible. If not a marker, this will make this reference persist.}
EndStruct

QuestFollowerFixDatum[] Property QuestFollowerFixData Mandatory Const Auto
Faction Property CurrentFollowerFaction Mandatory Const Auto   
{autocomplete}

Event OnQuestInit()
    debug.trace(self + "OnQuestInit()")
    if CheckForLocationChanges
        RegisterForLocationChanges()
    endif
    FixQuestFollowers()
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + "OnLocationChange() akSender: " + akSender + ", akNewLoc: " + akNewLoc)
    FixQuestFollowers(SpecificRefAliasToCheck = akSender)
EndEvent

Function RegisterForLocationChanges()
    int i = 0
    While (i < QuestFollowerFixData.length)
        RegisterForRemoteEvent(QuestFollowerFixData[i].AliasToFix, "OnLocationChange")
        i += 1
    EndWhile
EndFunction

Function FixQuestFollowers(ReferenceAlias SpecificRefAliasToCheck = None)
    debug.trace(self + "FixQuestFollowers() SpecificRefAliasToCheck: " + SpecificRefAliasToCheck)
    int i = 0
    While (i < QuestFollowerFixData.length)
        QuestFollowerFixDatum currentDatum = QuestFollowerFixData[i]
        
        if SpecificRefAliasToCheck == false || SpecificRefAliasToCheck == currentDatum.AliasToFix ;yes this could be more efficient with a find, but these are targeted fixes with expect array sizes of 1 or 2 items only
            FixQuestFollower(currentDatum)
        endif
        i += 1
    EndWhile

EndFunction

Function FixQuestFollower(QuestFollowerFixDatum DatumToFix)
        debug.trace(self + "FixQuestFollower() DatumToFix: " + DatumToFix)
        Actor actorToFix = DatumToFix.AliasToFix.GetActorReference()
        Location disallowedLocation = DatumToFix.DisallowedLocation
        ObjectReference fixByMovingToReference = DatumToFix.FixByMovingToReference
        
        Location currentLocation
        if actorToFix
            currentLocation = actorToFix.GetCurrentLocation()
        endif

        debug.trace(self + "FixQuestFollower() actorToFix: " + actorToFix)
        debug.trace(self + "FixQuestFollower() disallowedLocation: " + disallowedLocation)
        debug.trace(self + "FixQuestFollower() currentLocation: " + currentLocation)


        if actorToFix && currentLocation == disallowedLocation       
            DefaultFollowerToggleQuestScript followerToggleQuest = DatumToFix.FollowerToggleQuest
            debug.trace(self + "FixQuestFollower() actor in disallowed location")

            debug.trace(self + " FixQuestFollower() actorToFix: " + actorToFix + " moving to fixByMovingToReference: " + fixByMovingToReference)
            actorToFix.MoveTo(fixByMovingToReference)

            if CheckForLocationChanges == false
                UnregisterForRemoteEvent(DatumToFix.AliasToFix, "OnLocationChange") ;unregister if we don't want these events anymore, otherwise it'll stay registered
            endif

        endif

EndFunction


