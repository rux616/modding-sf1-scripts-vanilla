Scriptname SFBGS00D:SFBGS00DRandomEnableOnLoadScript extends ObjectReference
{Enables a random LinkedRef OnLoad}

Int Property LowerBound = 1 auto const
{Minimum number of states that will enable - enables one state by default}
Int Property UpperBound = 1 auto const
{Maximum number of states that will enable - enables one state by default}

Int numberofstates

Auto State Default

    Event OnCellLoad()
        RollState()
    EndEvent

EndState

Function RollState()
    ObjectReference[] MarkerArray = GetLinkedRefChain()
    numberofstates = Utility.RandomInt(LowerBound, UpperBound)
    debug.Trace("NumberOfStates: " + numberofstates)
    if(numberofstates > MarkerArray.length)
        debug.Trace("Your bounds exceed the number of states in the KeywordArray. Multiple states will not be enabled")
    else
        int i = 0
        while(i < numberofstates)
            int randomIndex = Utility.RandomInt(0, MarkerArray.Length - 1)
            MarkerArray[randomIndex].Enable()
            MarkerArray.Remove(randomIndex)
            i+=1
        endwhile
    endif
    GotoState("Complete")    
EndFunction

State Complete
EndState

;=======================================================
;Debug commands
;=======================================================


Function DisableAllStates()
    ObjectReference[] MarkerArray = GetLinkedRefChain()
    int i = 0
    while(i < MarkerArray.length)        
        MarkerArray[i].Disable()
        i+=1
    endwhile
EndFunction

;debug use only - disables enabled states and enables a new state(s) as if it has freshly loaded
Function DebugRandom()
    DisableAllStates()
    RollState()
EndFunction

;debug use only - disables all states and does NOT enable any new ones
Function DebugDisableAll()
    DisableAllStates()
EndFunction

;debug use only - enables the state that matches the passed int in the chain, does not disable any states
Function DebugSetState(int iState)
    ObjectReference[] MarkerArray = GetLinkedRefChain()
    if(MarkerArray[iState-1].Enable())
        debug.Notification("Enabled state: " + (iState) + "/" + MarkerArray.Length)
    else
        debug.Notification("State " + (iState) + " already enabled, is not in the chain, or does not exist.")
    endif
EndFunction

;debug use only - displays status of all states in the chain
Function DebugGetStates()
    ObjectReference[] MarkerArray = GetLinkedRefChain()
    int i = 0
    while(i < MarkerArray.length)        
        debug.Notification("Enable state: " + (i+1) + "/" + MarkerArray.Length + "\n" + MarkerArray[i] + "\n Is enabled = " + MarkerArray[i].IsEnabled())
        i+=1
    endwhile
EndFunction
