Scriptname DefaultAddItemToLeveledList extends Quest default
{Adds an Item to a Leveled List.}

Struct LeveledItemDatum
    Form ItemToAdd
    int ItemLevel = 1
    int ItemAmount = 1
EndStruct
bool Property AddOnQuestStart = true Const Auto
{Bool to see if items should be added to the leveled list when a quest starts or not}

LeveledItem[] Property LeveledList Mandatory Const Auto
{An array of Leveled Lists that the item will be added to}

LeveledItemDatum[] Property LeveledItemData Mandatory Const Auto
{An array of structs that contain the form to add, the level the items will drop at, and the amount of items that will drop}

Event OnQuestInit()
    If (AddOnQuestStart == true)
        AddItemsToLeveledList()
    EndIf
    ;When quest initializes checks to see if designer wants to fire the function on quest start, if true function is fired
EndEvent

Function AddItemsToLeveledList()
    int i = 0

    if LeveledList != None && LeveledItemData != None
        while i < LeveledList.Length
            int k = 0
            while k < LeveledItemData.length
                LeveledList[i].AddForm(LeveledItemData[k].ItemToAdd, LeveledItemData[k].ItemLevel, LeveledItemData[k].ItemAmount)
                k += 1
            EndWhile
            i += 1
        endWhile
    EndIf
EndFunction