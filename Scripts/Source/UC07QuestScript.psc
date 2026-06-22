Scriptname UC07QuestScript extends Quest

Struct BatteryRecipeComponent
    MiscObject ComponentObject
    int AmountRequired
EndStruct

BatteryRecipeComponent[] Property RecipePieces Mandatory Const Auto
{The various pieces required for the battery and how many we need}

ReferenceAlias Property EclipticSceneTarget Mandatory Const Auto
{Alias to fill if we find a living member of Ecliptic}

RefCollectionAlias Property BatteryContainers Mandatory Const Auto
{Collection containing the list of battery component containers}

RefCollectionAlias Property QuestBatteryMaterials Mandatory Const Auto
{Holding collection for the quest battery materials}

ObjectReference Property UC07_BatteryComponentsSpawn Mandatory Const Auto
{Spawn point for the battery components}

Keyword Property UC07_BatteryComponent Mandatory Const Auto
{Keyword used to designate the a component is one of our quest objects}

int Property BatteryComponentsDistributedStage = 105 Auto Const
{Stage to set once all the battery components have been distributed}

bool Function CheckForLivingSceneTarget(RefCollectionAlias akTargetColl)
    int i = 0
    int iCount = akTargetColl.GetCount()
    bool bFoundNPC

    while i < iCount && !bFoundNPC
        Actor currRef = akTargetColl.GetAt(i) as Actor

        if !currRef.IsDead()
            bFoundNPC = true
            EclipticSceneTarget.ForceRefTo(currRef)

        endif

        i += 1
    endwhile

    return bFoundNPC
EndFunction

Function DistributeBatteryComponents()
    int i = 0
    int iLength  = RecipePieces.Length
    trace(self, "Starting the distribution of the battery components.")

    while i < iLength
        BatteryRecipeComponent myDatum = RecipePieces[i]
        int iAmountRequired = myDatum.AmountRequired
        MiscObject currObj = myDatum.ComponentObject
        ObjectReference ObjREF = UC07_BatteryComponentsSpawn.PlaceAtMe(currObj)

        ;Add the item to the quest object collection (and give it its keyword)
        QuestBatteryMaterials.AddRef(ObjREF)

        if iAmountRequired > 1
            int j = 0
            
            while j < iAmountRequired
                FindBatteryContainer(ObjREF)

                j += 1
            endwhile
        elseif iAmountRequired == 1
            FindBatteryContainer(ObjREF)
        endif

        i += 1
    endwhile

    ;/ Turning this off in 3rd pass. Force the player to explore a little bit more.
    ;Remove any battery containers from the list that don't have quest items in them
    int k = 0
    int kCount = BatteryContainers.GetCount()

    while k < kCount
        ObjectReference currContainer = BatteryContainers.GetAt(k)

        if currContainer.GetItemCount(UC07_BatteryComponent) <= 0
            trace(self, "Removed quest item-less container: " + currContainer)
            BatteryContainers.RemoveRef(currContainer)
        endif

        k += 1
    endwhile
    /;

    ;Sequence complete. Set the stage to turn on the container events in UC07_BatteryMaterialsCollScript
    SetStage(BatteryComponentsDistributedStage)
EndFunction

Function FindBatteryContainer(ObjectReference akTargetObject)
    int iCount = BatteryContainers.GetCount()
    int iIndexMax = iCount - 1

    if iIndexMax < 0
        iIndexMax = 0
    endif

    int iRand = Utility.RandomInt(0, iIndexMax)

    ObjectReference currContainer = BatteryContainers.GetAt(iRand)
    currContainer.AddItem(akTargetObject)
    trace(self, "Item: " + akTargetObject + " to container: " + currContainer + ". Count of quest items: " + currContainer.GetItemCount(UC07_BatteryComponent)) 
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC07", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction