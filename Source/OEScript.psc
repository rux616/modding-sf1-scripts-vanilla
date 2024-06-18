Scriptname OEScript extends REScript
{Main Manager for the Overlay Encounter System}

;--------------------------------------------------------------------------------------------------
; GROUPS AND STRUCTS
;--------------------------------------------------------------------------------------------------
; STRUCTS 
    Struct CreatureCorpseDatum
        ReferenceAlias CreatureAlias
        {Creature corpse to spawn. This kills the reference in the alias and moves it to the specified marker. 
        Use DefaultGroupSpawnQuestScript to spawn NPC corpses.}
        ReferenceAlias MoveTo
        {Marker to move the corpse to.}
    EndStruct 

    Struct VendorDatum 
        ReferenceAlias NPCAlias 
        {The Vendor that uses the particular container.}
        ReferenceAlias VendorContainer 
        {This is the alias that will hold the Vendor's container. Normally this would hold items by default, 
        but because the contents may change with Keywords added by this script, the container will be cleared and the LL for VendorInventory will be added to the container.}
        LeveledItem VendorInventory
        {The items loaded into the Vendor's container.}
        Faction VendorFaction 
        {Filter for: Vendor_OE_*}
        String Comment 
        {Used for traces.}
    EndStruct 

    Struct ActorValueDatum
        ActorValue ActorValueToSet
        float value
    endStruct

; GROUPS: SETTINGS AND TRACES---------------------------> 
    group RangeCheck
        ;These properties perform a standardized range check (distance between the player and the trigger). This is used
        float Property RangeCheckDistance Auto const
        {Optional - When player's distance to trigger is less than this, stage RangeCheckStage will be set.}
        int Property RangeCheckStage Auto const
        {Optional - When player's distance to trigger is less than RangeCheckDistance, set this stage.}
    endGroup

    Group Overlay_Settings 
        ActorValueDatum[] property LocationActorValues auto const
        { actor values added to the Location }

        Location property OE_Location auto hidden
        { set on startup with the current Location }
    EndGroup 

    Group Creature_Settings 
        CreatureCorpseDatum[] property CreatureCorpseData auto const   
    EndGroup 

    Group Object_Settings 
        VendorDatum[] property VendorData Auto const

        Faction property OwningFaction auto
        {If set to None, nothing created by the OEScript is owned
         If NONE, will be set by DefaultGroupSpawnQuestScript to first owner faction it sets}

        int property RewardContainerLockLevel = 0 Auto const
        {If a Reward Container is available, this sets its lock level.
        0=Unlocked, 25=Novice, 50=Advanced, 75=Expert, 100=Master
        251=Barred, 252=Chained, 253=Terminal Only, 254=Inaccessible, 255=Requires Key.
        If set to 255, it will try to generate a key and place it in the Key_Reward alias.}

        ReferenceAlias property Marker_Key = None Auto const
        {Location where the Key will be spawned if the RewardContainerLockLevel is set to 255. If blank, the key won't be spawned. By default, key is enabled.}

        LeveledItem property LL_OE_Default_Reward Auto const
        {Used to populate the Reward Container. }
    EndGroup 

    Group Stage_Settings
        int property QuestSetupCompleteStage = -1 auto Const
        { stage is set when quest is fully setup (bFinishedOnStoryEvent=true) }
    endGroup

;   GROUPS: SETTINGS AND TRACES---------------------------> 

    Group AutofillProperties 
        ReferenceAlias property Trigger auto mandatory  const
        ReferenceAlias property Container_Reward Auto const
        ReferenceAlias property Key_Reward Auto const
        {The Reference to the Reward Container's key, if applicable. }
        ReferenceAlias property Marker_Center auto mandatory const
    EndGroup 


;--------------------------------------------------------------------------------------------------
; SCRIPT VARIABLES
;--------------------------------------------------------------------------------------------------
;   SCRIPT VARIABLES--------------------------------------> 
    ;-- ADDON SCRIPTS
	    DefaultGroupSpawnQuestScript DefaultGroupSpawnQuest 	= None
        bool gGroupSpawnsFinished                               = False 

    ;-- Tracking Objects for Ownership
        ObjectReference[] OwnedObjects

;--------------------------------------------------------------------------------------------------
; STARTUP AND INITIALIZATION
;--------------------------------------------------------------------------------------------------
; Initializes the OEScript addons, if present. Also pushes keywords to Location. 
Event OnQuestStarted()
    Parent.OnQuestStarted()
    
    DefaultGroupSpawnQuest          = (Self as Quest) as DefaultGroupSpawnQuestScript
    OwnedObjects                    = New ObjectReference[0]

	Parent.DefineCustomLogs() ;this must happen before Trace() calls, because the setup in this function is required for trace function to work

    Trace(Self, "*** OnQuestStarted " + LocalScriptName + " *** ")      ; Uses the LocalScriptName from REScript

    ; Check to see if DefaultGroupSpawnQuestScript is being used to handle NPC spawns. 
    If DefaultGroupSpawnQuest
        Trace(Self, "DefaultGroupSpawnQuestScript is attached. NPCs will be incorporated from that script.")
        DefaultGroupSpawnQuest.InitialGroupSpawn(LocalScriptName)
        gGroupSpawnsFinished = DefaultGroupSpawnQuest.GroupSetupCompleted
    Else 
        Trace(Self, "NPCs are not managed by the OEScript system - Missing DefaultGroupSpawnQuest.")
    EndIf 

    ; Push actor values onto the Location so we can use that as conditions on our Object LLs
    _PushLocationAVs()

	; failsafe counter
	int failsafeCounter = 20
	while gGroupSpawnsFinished == false && failsafeCounter > 0 && DefaultGroupSpawnQuest
		Trace(self, "Waiting on DefaultGroupSpawnQuestScript to finish populating NPCs... " + failsafeCounter )
        gGroupSpawnsFinished = DefaultGroupSpawnQuest.GroupSetupCompleted
		utility.wait(1)
		failsafeCounter -= 1
	endWhile

    _SetupRewardContainer()

    ; Set up any Creature Corpses
    _SetupCreatureCorpses()

    ; register for range check to center marker
    If (RangeCheckDistance > 0)
        ObjectReference centerMarkerRef = Marker_Center.GetRef()
        Trace(self, "Start range check for " + RangeCheckDistance + " units to Marker_Center=" + centerMarkerRef)
        RegisterForDistanceLessThanEvent(Game.GetPlayer(), centerMarkerRef, RangeCheckDistance)
    EndIf 

    bFinishedOnStoryEvent = True
    Trace(self, "bFinishedOnStoryEvent = True")

    if QuestSetupCompleteStage > -1
        SetStage(QuestSetupCompleteStage)
    EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	; NOTE: need to add more checks if we add additional distance checks
	; for now, we know what this is
	Trace(Self, "Player in range. " + afdistance + " setting stage " + RangeCheckStage)
	SetStage(RangeCheckStage)
	_SetupVendors()
endEvent

; Push data (AVs) onto Location, if needed. Called by OnQuestInit()
Function _PushLocationAVs() 
    int index = 0

    If OE_Location == None 
        If Marker_Center.GetRef() 
            OE_Location = Marker_Center.GetRef().GetCurrentLocation()
            Trace(Self, "OE_Location set: " + OE_Location)
        Else 
            Trace(Self, "Cannot set OE_Location. Marker_Center may not be filled.")
        EndIf 
    EndIf 

    If OE_Location
        index = 0
        while index < LocationActorValues.Length
            OE_Location.SetValue(LocationActorValues[index].ActorValueToSet, LocationActorValues[index].value)
            index += 1
        endWhile

    Else 
        Trace(Self, "OE_Location is invalid.")
    EndIf 
EndFunction 

; Called by DefaultGroupSpawnQuestScript OnDistanceLessThan(). The vendor containers are unique containers in the Holding Cell set up to an OE faction. If two or more OEs are in a loaded area, when the player approaches the OE 
; via the Range in the REScript, this will clear any existing items in the vendor containers and then fill them with the desired vendor items. Currently supports Standard and Smuggler factions.
Function _SetupVendors()
    int index = 0

    ; Check all Containers, make sure the NPCs exist then set up the containers
    While index < VendorData.Length

        If VendorData[index].VendorContainer && VendorData[index].NPCAlias && VendorData[index].VendorFaction && VendorData[index].VendorInventory
            _SetupVendor(index)
        Else 
            Warning(Self, "Could not set up container! " + VendorData[index].Comment + " (" + VendorData[index].VendorContainer + ") with LL: (" + VendorData[index].VendorInventory + ") for NPC: (" + VendorData[index].NPCAlias + ") with Faction: (" + VendorData[index].VendorFaction + ")")
        EndIf 

        index += 1
    EndWhile

EndFunction 

; Called by _SetupVendors() which ensures that the Vendor data is valid. 
Function _SetupVendor(int aiVendorIndex)
    ObjectReference VendorContainer = VendorData[aiVendorIndex].VendorContainer.GetRef()
    Faction VendorFaction = VendorData[aiVendorIndex].VendorFaction
    LeveledItem VendorInventory = VendorData[aiVendorIndex].VendorInventory
    ReferenceAlias VendorNPC = VendorData[aiVendorIndex].NPCAlias
    String VendorName = VendorData[aiVendorIndex].Comment
    
    ; Remove any existing items in the Vendor Chest, just in case the previous Vendor Chest is still in the loaded area. Ref was ensured to exist in _SetupVendors()
    VendorContainer.RemoveAllItems()

    If VendorNPC
        VendorContainer.AddItem(VendorInventory)
        (VendorNPC.GetRef() as Actor).AddToFaction(VendorFaction)
    EndIf 

    VendorContainer.Lock(254) ; Set to inaccessible, just in case. 
    Trace(Self, "Setting up Vendor... " + VendorName )
EndFunction 

; The Reward Container is on the overlay and may be locked and may have a key.
Function _SetupRewardContainer()
    if Container_Reward
        ObjectReference ContainerREF = Container_Reward.GetRef()

        If ContainerREF 
            ; Add the Default Reward LL to the Container if possible. 
            If LL_OE_Default_Reward
                ContainerREF.AddItem(LL_OE_Default_Reward)        
                Trace(Self, "Added LL to Reward Container.")
            Else 
                Trace(Self, "Could not add LL to Reward Container.")
                Trace(Self, "LL_OE_Default_Reward:" + LL_OE_Default_Reward)
                Trace(Self, "ContainerREF:" + ContainerREF)
            EndIf 
            
            ; Set to Owned, if needed. 
            Trace(Self, "Container_Reward LockLevel: " + RewardContainerLockLevel)
            ContainerREF.SetLockLevel(RewardContainerLockLevel)
            
            If RewardContainerLockLevel > 0
                ContainerREF.Lock()
            EndIf 

            If RewardContainerLockLevel == 255
                _SetupContainerKey(ContainerREF)
                Trace(Self, "Container_Reward Locked: " + ContainerREF )
            EndIf 

            _SetupOwners(ContainerREF)
            Trace(Self, "Container_Reward: set ownership done")
        EndIf 
    endif
EndFunction 

; Set Ownership of Objects. Called by _SetupRewardContainer()
Function _SetupOwners(ObjectReference akRefToOwn)
    ; Not clearing means we are setting up. Sets the Faction Owner to the passed ref.
    If akRefToOwn && OwningFaction
        akRefToOwn.SetFactionOwner(OwningFaction)
        OwnedObjects.Add(akRefToOwn)
        Trace(Self, "Owning Faction (" + OwningFaction + ") applied to: " + akRefToOwn)
    EndIf 
EndFunction 

; Clears Ownership from Objects. Called by public function ClearAllObjectOwnership().
Function _ClearOwners(bool bClearRewardContainer=False, bool bClearObjects=False)
    ObjectReference ContainerREF = Container_Reward.GetRef()
    int index = 0

    If bClearObjects 
        ; The OE is revoking ownership from objects that have been claimed by a faction already. Usually due to a reward condition.
        While index < OwnedObjects.Length 
            Trace(Self, "Owning Faction (" + OwnedObjects[index].GetFactionOwner() + ") cleared from: " + OwnedObjects[index] )
            OwnedObjects[index].SetFactionOwner(None)
            index += 1
        EndWhile 
    EndIf 

    If bClearRewardContainer && ContainerREF
        Trace(Self, "Owning Faction (" + ContainerREF.GetFactionOwner() + ") cleared from: " + ContainerREF )
        ContainerREF.SetFactionOwner(None)
    EndIf 
EndFunction 

; Creates a key for the matching locked container and fills KeyObject. Called by SetupRewardContainer()
Function _SetupContainerKey(ObjectReference akLockedObjectRef)
    ObjectReference KeyMarkerREF = Marker_Key.GetRef()
    ObjectReference KeyObjectREF = None
    Key KeyToPlace = none 

    If KeyMarkerRef == None
        KeyMarkerREF = Marker_Center.GetRef()
    EndIf     

    If KeyMarkerRef && akLockedObjectRef
        KeyObjectREF = KeyMarkerREF.PlaceLockedRefKeyAtMe(akLockedObjectRef)
        If KeyObjectREF
            Key_Reward.ForceRefTo(KeyObjectREF)
        Else 
            KeyToPlace = akLockedObjectRef.GetKey()
            If KeyToPlace 
                KeyObjectREF = KeyMarkerREF.PlaceAtMe(KeyToPlace, akAliasToFill = Key_Reward)
            EndIf 
        EndIf 

        Trace(Self, "KeyObjectRef: " + KeyObjectRef)
        Trace(Self, "   Marker_Key: " + Marker_Key + " " + Marker_Key.GetRef() )
        Trace(Self, "   akLockedObjectRef: " + akLockedObjectRef  )
    EndIf 
EndFunction 

; Spawns Creature Corpses 
Function _SetupCreatureCorpses() 
    int CorpseIndex = 0 

    While CorpseIndex < CreatureCorpseData.Length
        CreatureCorpseDatum theCorpseData = CreatureCorpseData[CorpseIndex]
        if theCorpseData.CreatureAlias
            ObjectReference Corpse = theCorpseData.CreatureAlias.GetRef()
            if Corpse
                Corpse.TryToKill(None)
                if theCorpseData.MoveTo
                    ObjectReference Marker = theCorpseData.MoveTo.GetRef()
                    If Corpse && Marker
                        Trace(Self, "Creature " + Corpse + " is dead. Placed at: " + marker)
                        Corpse.MoveTo(Marker)
                    EndIf
                endif
            endif
        endif
        CorpseIndex += 1
    EndWhile 
EndFunction 

;-----------------------------------------------
; Public Functions
;-----------------------------------------------
 
; Clears ownership from the Reward Container and all Objects spawned by the OE. 
;   Can specify just the reward container or just other objects: ClearAllObjectOwnership(bRewardContainer, bClearAllObjects)
;   e.g. ClearAllObjectOwnership(True, False) for just the reward container.
Function ClearAllObjectOwnership(bool bRewardContainer=True, bool bClearAllObjects=True)
    _ClearOwners(bRewardContainer, bClearAllObjects)
EndFunction 