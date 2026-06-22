Scriptname TestDynamicTerminalScript extends TerminalMenu

TerminalMenu property TestDynamicTerminalMenu auto const

TerminalMenu property TestDynamicTerminalMenu02 auto const

TerminalMenu property TestKurtDynamicTerminalItem auto const

TerminalMenu property TestKurtDynamicTerminalItem02 auto const

TerminalMenu property TestDeskop auto const

GlobalVariable[] property TextReplacementGlobals auto const

Form property TextReplacementForm auto Const

int minIndex = 1 ; starting index of dynamic entries on TestDynamicTerminal
int maxIndex = 4 ; ending index of dynamic entries

int startingItemID = 0

ObjectReference myTerminalRef

int minEntries = 2
int maxEntriesCurrent01 = 6
int maxEntriesCurrent02 = 6
int maxEntriesInit = 6

;/
Event OnLoad()
    InitEntries()
endEvent
/;
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + "OnTerminalMenuEnter akTerminalBase=" + akTerminalBase + " akTerminalRef=" + akTerminalRef)
    ; init text replacement
    akTerminalRef.AddTextReplacementData("MiscItem01", TextReplacementForm)   
    int itemValue = TextReplacementForm.GetGoldValue() 
    akTerminalRef.AddTextReplacementValue("MiscItem01Value", itemValue)   

EndEvent

Function InitEntries(TerminalMenu terminalToInit, bool decrementEntries = false)
    terminalToInit.ClearDynamicMenuItems(myTerminalRef)

    int maxEntriesCurrent = maxEntriesInit

    if decrementEntries
        if TestDynamicTerminalMenu
            maxEntriesCurrent01 += -1
            maxEntriesCurrent = maxEntriesCurrent01
        Else
            maxEntriesCurrent02 += -1
            maxEntriesCurrent = maxEntriesCurrent02
        endif
    Else
        maxEntriesCurrent = utility.RandomInt(minEntries, maxEntriesInit)
        if TestDynamicTerminalMenu
            maxEntriesCurrent01 = maxEntriesCurrent
        Else
            maxEntriesCurrent02 = maxEntriesCurrent
        endif
    EndIf

    maxEntriesCurrent = Math.Max(minEntries, maxEntriesCurrent) as int

    ; initialize dynamic entries
    debug.trace(self + "entryCount=" + maxEntriesCurrent)
    int i = 0
    while i < maxEntriesCurrent
    	; pick dynamic entry to add
    	int index = utility.RandomInt(minIndex, maxIndex)
        int itemID = i + startingItemID
	    debug.trace(self + "  aiItemID " + itemID + ": use template index " + index)
        TextReplacementGlobals[0].SetValue(itemID)
	    terminalToInit.AddDynamicMenuItem(myTerminalRef, index, itemID, TextReplacementGlobals as Form[])
    	i += 1
    endWhile
EndFunction

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + "OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalMenuBase=" + akTerminalBase)
    myTerminalRef = akTerminalRef
    ; test this
    akTerminalRef.AddTextReplacementData("TerminalMenu", TestDynamicTerminalMenu02)
    if akTerminalBase == TestDeskop && auiMenuItemID == 0
        InitEntries(TestDynamicTerminalMenu)
    elseif akTerminalBase == TestDeskop && auiMenuItemID == 3
        InitEntries(TestDynamicTerminalMenu02)
    elseif akTerminalBase == TestKurtDynamicTerminalItem && auiMenuItemID == 1
        InitEntries(TestDynamicTerminalMenu, true)
    elseif akTerminalBase == TestKurtDynamicTerminalItem02 && auiMenuItemID == 1
        InitEntries(TestDynamicTerminalMenu02, true)
    endif
EndEvent
