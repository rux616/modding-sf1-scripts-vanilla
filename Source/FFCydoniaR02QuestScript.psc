Scriptname FFCydoniaR02QuestScript extends Quest

FormList Property FFCydoniaR02_CrimsonFleetItemList Mandatory Const Auto
FormList Property FFCydoniaR02_EclipticItemList Mandatory Const Auto
FormList Property FFCydoniaR02_HouseVaruunItemList Mandatory Const Auto
FormList Property FFCydoniaR02_SpacersItemList Mandatory Const Auto
FormList Property FFCydoniaR02_SyndicateItemList Mandatory Const Auto
GlobalVariable Property FFCydoniaR02_EquipmentNeededCount Mandatory Const Auto
GlobalVariable Property FFCydoniaR02_ItemsAcquired Mandatory Const Auto
Keyword Property LocEncCrimsonFleet Mandatory Const Auto
Keyword Property LocEncEcliptic Mandatory Const Auto
Keyword Property LocEncHouseVaruun Mandatory Const Auto
Keyword Property LocEncSpacers Mandatory Const Auto
Keyword Property LocEncSyndicate Mandatory Const Auto
LocationAlias Property Base Mandatory Const Auto
ReferenceAlias Property BossContainer Mandatory Const Auto
ReferenceAlias Property Denis Mandatory Const Auto
ReferenceAlias Property Item Mandatory Const Auto

Form myItem


;Check to see if the player has enough of the requested items. If so, set a value for dialogue purposes, and remove the items
Function CheckItems()
    If myItem != None
        Actor myPlayer = Game.GetPlayer()
        Int iCount = FFCydoniaR02_EquipmentNeededCount.GetValue() as Int
        If myPlayer.GetItemCount(myItem) >= iCount
            FFCydoniaR02_ItemsAcquired.SetValue(1)
            myPlayer.RemoveItem(myItem, iCount, False, Denis.GetRef())
        EndIf
    EndIf
EndFunction



;When the quest starts, find which Location is chosen, and add a stack of random items to the BossContianer
Event OnQuestInit()
    Location myLoc = Base.GetLocation()
    FFCydoniaR02_ItemsAcquired.SetValue(0)
    Int iItemsNeeded = FFCydoniaR02_EquipmentNeededCount.GetValue() as Int
    Int i

    If myLoc != None
        If myLoc.HasKeyword(LocEncCrimsonFleet)
            i = Utility.RandomInt(0, FFCydoniaR02_CrimsonFleetItemList.GetSize() - 1)
            myItem = FFCydoniaR02_CrimsonFleetItemList.GetAt(i)

        ElseIf myLoc.HasKeyword(LocEncEcliptic)
            i = Utility.RandomInt(0, FFCydoniaR02_EclipticItemList.GetSize() - 1)
            myItem = FFCydoniaR02_EclipticItemList.GetAt(i)

        ElseIf myLoc.HasKeyword(LocEncHouseVaruun)
            i = Utility.RandomInt(0, FFCydoniaR02_HouseVaruunItemList.GetSize() - 1)
            myItem = FFCydoniaR02_HouseVaruunItemList.GetAt(i)

        ElseIf myLoc.HasKeyword(LocEncSyndicate)
            i = Utility.RandomInt(0, FFCydoniaR02_SyndicateItemList.GetSize() - 1)
            myItem = FFCydoniaR02_SyndicateItemList.GetAt(i)

        ElseIf myLoc.HasKeyword(LocEncSpacers)
            i = Utility.RandomInt(0, FFCydoniaR02_SpacersItemList.GetSize() - 1)
            myItem = FFCydoniaR02_SpacersItemList.GetAt(i)
        EndIf

        ;Adds the number of items needed to the boss container, minus 1. Then adds one more while putting it into an Alias, for text replacement purposes.
        If myItem != None
            ObjectReference myBossContainer = BossContainer.GetRef()
            myBossContainer.AddItem(myItem, (iItemsNeeded - 1))
            myBossContainer.AddAliasedItem(myItem, Item, 1)
        EndIf

    EndIf

    
EndEvent