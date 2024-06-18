Scriptname SQ_PlayerHouseScript extends Quest
{ Handle common functionality when player homes are purchased. }

Group autofill
    LeveledItem property LL_HousePurchase_BuildingSupplies auto const mandatory
    { The building supplies to grant the player when purchasing a home. }

    Message property HousePurchaseBuildingMaterialsMessage auto const mandatory
    { The message to display when depositing building materials into their ship cargo hold. }
endGroup

function PurchaseHouse(GlobalVariable purchaseAmount = None, Key houseKey = None)
    ; Remove the player's credits, if the house has a cost.
    if purchaseAmount
        Game.GetPlayer().RemoveItem(Game.GetCredits(), purchaseAmount.GetValueInt())
    endif
    
    ;Grant them a key, if there is one.
    if houseKey
        Game.GetPlayer().AddItem(houseKey)
    endif

    ; When a house is purchased, grant an allotment of building supplies and let the player know.
    Game.GetPlayerHomeSpaceShip().AddItem(LL_HousePurchase_BuildingSupplies)
    HousePurchaseBuildingMaterialsMessage.Show()
endFunction