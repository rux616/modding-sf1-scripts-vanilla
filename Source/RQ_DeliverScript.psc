Scriptname RQ_DeliverScript extends RQScript

Group Scan_Deliver

    ;we are creating the item in script at run time because the alias we would need to create it at/in is may also be created at run time using DefaultGroupSpawnQuestScript

    ReferenceAlias Property ItemSpawnAt Mandatory Const Auto
    {the alias that will the item will be spawned at/in}

    bool Property SpawnIn = true Const Auto
    {if true (Default) ItemToCreate will be spawned IN the inventory of ItemSpawnAt. If false, will be spawned AT it.}

     ReferenceAlias Property Item Mandatory Const Auto
    {the alias that will hold the item to deliver (Reference of ItemToCreate will be forced into this.) It will be initially disabled}

     form Property ItemToCreate Mandatory Const Auto
    {the item to deliver, will be created at StageToCreateItem}

    int Property EnableItemStage = -1 Const Auto 
    {When this stage is set, the item will be enabled}

    int Property SpawnStage = 10 const auto
    { stage to set to trigger spawning - use a stage so we have a chance to register for spawn event }

    int property TurnOffQuestStage = -1 const auto
    { stage to set TurnOffQuestGlobal }

    GlobalVariable property TurnOffQuestGlobal auto Const
    { OPTIONAL - if included, this will be set to 1 when the player picks up the item (so it can be used as a condition to not run the quest again) }
EndGroup

bool Created

Function QuestStartedSpecific()
	;register for spawn event
	DefaultGroupSpawnQuestScript DefaultGroupSpawnQuestScriptIns = (self as quest) as DefaultGroupSpawnQuestScript
	RegisterForCustomEvent(DefaultGroupSpawnQuestScriptIns, "SpawnGroupDoneEvent")

    ; trigger spawning from DefaultGroupSpawnQuestScript
    Trace(self, " QuestStartedSpecific: trigger spawning")
    SetStage(SpawnStage)
EndFunction

Event OnStageSet(int auiStageID, int auiItemID)
    if auiStageID == EnableItemStage
        EnableItemIfAppropriate()
    elseif auiStageID == TurnOffQuestStage
        if TurnOffQuestGlobal
            TurnOffQuestGlobal.SetValueInt(1)
        endif
    endif
EndEvent

Event DefaultGroupSpawnQuestScript.SpawnGroupDoneEvent(DefaultGroupSpawnQuestScript akSender, var[] akArgs)
	Trace(self, "SpawnGroupDoneEvent() args: " + akArgs as DefaultGroupSpawnQuestScript:SpawnEventArgs[])
    ; spawning is finished - now we have corpse to create item in
    CreateItem()
EndEvent

Guard modifyItemGuard ProtectsFunctionLogic

Function CreateItem()
    Trace(self, "CreateItem() START")
    LockGuard modifyItemGuard
        ObjectReference spawnAtRef = ItemSpawnAt.GetReference()

        if Created == false && spawnAtRef
            UnregisterForRemoteEvent(ItemSpawnAt, "OnAliasChanged")

            Created = true

            ObjectReference itemRef = ItemSpawnAt.GetReference().PlaceAtMe(ItemToCreate, abInitiallyDisabled = true, akAliasToFill = Item)
            
            Trace(self, "CreateItem() created itemRef: " + itemRef)

            if SpawnIn
                spawnAtRef.AddItem(itemRef)
            else
                ; can't enable things created in containers
                EnableItemIfAppropriate()
            endif
        endif
    EndLockGuard
EndFunction

Function EnableItemIfAppropriate()
    if SpawnIn == false && (EnableItemStage == -1 || GetStageDone(EnableItemStage))
        Trace(self, "EnableItemIfAppropriate() enabling item")
        Item.TryToEnable()
    endif
EndFunction

function CleanUpItem()
    LockGuard modifyItemGuard
        if Created
            if SpawnIn
                ObjectReference spawnAtRef = ItemSpawnAt.GetReference()
                spawnAtRef.RemoveItem(ItemToCreate)
            else
                Item.TryToDisable()
            endif

        endif
    EndLockGuard
endFunction