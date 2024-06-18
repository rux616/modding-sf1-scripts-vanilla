Scriptname TestKurtRemoveArmorScript extends Actor Const
{test removing armor when armor is looted}

FormList property TestKurtArmorKeywords auto const

Event OnLoad()
    AddInventoryEventFilter(TestKurtArmorKeywords)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
    debug.trace(self + " OnItemRemoved " + akBaseItem)
    Keyword keywordToRemove = GetArmorKeyword(akBaseItem)
    debug.trace(self + "   keywordToRemove=" + keywordToRemove)
    if keywordToRemove
        RemoveItem(keywordToRemove)
    endif
EndEvent

Keyword function GetArmorKeyword(Form akBaseItem)
    if akBaseItem.HasKeywordInFormList(TestKurtArmorKeywords)
        int i = 0
        while i < TestKurtArmorKeywords.GetSize()
            Keyword theKeyword = TestKurtArmorKeywords.GetAt(i) as Keyword
            if theKeyword
                if akBaseItem.HasKeyword(theKeyword)
                    return theKeyword
                endif
            endif
            i += 1
        EndWhile
    endif
    return NONE
EndFunction