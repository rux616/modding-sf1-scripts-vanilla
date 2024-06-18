Scriptname FCNeon_KosmosOrgResourcesScript extends Quest

Struct ResourceGlobalMap
    Resource theResource
    { The resource. }

    GlobalVariable theResourceCountGlobal
    { The Global Variable that tracks the count of this resource. }

    int maxToSell
    { The maximum number of this Resource to sell at any given time. }

    GlobalVariable resourceSellPriceGlobal
    { The Global Variable that stores the amount to sell this Resource for (per unit). }
endStruct

Group required
    ResourceGlobalMap[] property ResourcesAndGlobals auto const mandatory
    { An array of Resources and their mapped Global Variables that track the count of each of the Resources that Kosmos will buy. }

    GlobalVariable property FCNeon_Kosmos_NextTurnInGameTime auto const mandatory
    { A variable that tracks the next allowed turn-in time for this quest. }

    float property TurnInDuration = 0.70 auto const
    { The duration (in UT game days) between allowed turn-ins of this quest. }
endGroup

int property RESOURCETYPE_BIOSUPPRESSANT = 0 autoReadOnly
int property RESOURCETYPE_HYPERCATALYST = 1 autoReadOnly
int property RESOURCETYPE_LUBRICANT = 2 autoReadOnly
int property RESOURCETYPE_STIMULANT = 3 autoReadOnly
int property RESOURCETYPE_POLYMER = 4 autoReadOnly
int property RESOURCETYPE_SOLVENT = 5 autoReadOnly
int property RESOURCETYPE_GASTRONOMIC = 6 autoReadOnly


function UpdatePlayerResourceCounts()
    ; Update all of the Global Variables in ResourcesAndGlobals with the current count of its related Resource in the Player's inventory.
    ; For player prompt text replacement purposes.
    Actor playerRef = Game.GetPlayer()

    int i = 0
    while i < ResourcesAndGlobals.Length
        ResourceGlobalMap rgMap = ResourcesAndGlobals[i]
        rgMap.theResourceCountGlobal.SetValueInt(playerRef.GetComponentCount(rgMap.theResource))
        UpdateCurrentInstanceGlobal(rgMap.theResourceCountGlobal)
        i += 1
    endWhile
endFunction

function SellResource(int aiResourceIndex = -1)
    ; Sell the Player's current count of the specified resource, up to the maximum.
    if aiResourceIndex < 0
        debug.trace("FCNeon_KosmosOrgResourcesScript: SellResource: aiResourceIndex was not specified!")
        return
    endif

    Actor playerRef = Game.GetPlayer()
    ResourceGlobalMap rgMap = ResourcesAndGlobals[aiResourceIndex] 

    ; Get the latest resource count. (Should be up to date from UpdatePlayerResourceCounts(), but this keeps this function independent of it
    ; having been called.)
    int resourceCount = playerRef.GetComponentCount(rgMap.theResource)
    if resourceCount <= 0
        debug.trace("FCNeon_KosmosOrgResourcesScript: SellResource: Player had 0 of specified resource " + rgMap.theResource + ", aborting sale!")
        return
    endif

    ; Calculate how many to sell. Don't sell more than the maximum.
    int countToSell
    if resourceCount > rgMap.maxToSell
        countToSell = rgMap.maxToSell
    else
        countToSell = resourceCount
    endif

    ; Complete the sale.
    playerRef.RemoveItemByComponent(rgMap.theResource, countToSell)
    playerRef.AddItem(Game.GetCredits(), rgMap.resourceSellPriceGlobal.GetValueInt() * countToSell)

    ; Set the next time that this quest can be turned in (1 Neon day from now).
    FCNeon_Kosmos_NextTurnInGameTime.SetValue(Utility.GetCurrentGameTime() + TurnInDuration)
endFunction