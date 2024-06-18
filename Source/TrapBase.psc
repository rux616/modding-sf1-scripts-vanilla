Scriptname TrapBase extends ObjectReference conditional
{base script for all trap scripts}

group TrapBaseData
    Keyword Property TrapStartInactiveKeyword Mandatory Const Auto
    {keyword to indicate if the trap should start in the inactive state }

    bool property bActive = true auto hidden conditional        ; Whether trap is on or off
    bool property bDisarmed = false auto hidden conditional     ; set to true when trap is disarmed (won't turn on at all)
EndGroup

Event OnCellLoad()
    ; fill my ref target array, and go to correct state
    HandleOnLoad()
    if bDisarmed
        GotoState("Unloaded")
    else
        If HasKeyword(TrapStartInactiveKeyword)
            GotoState("Inactive")
        Else
            GotoState("Active")
        EndIf
    endif
EndEvent

Event OnUnload()
    HandleOnUnload()
    GotoState("Unloaded")
EndEvent

auto State unloaded
    function SetActive(bool bSetActive=true)
        debug.trace(self + " SetActive " + bSetActive + " - called on Unloaded state - do nothing")
    endFunction
EndState

State Active
	event OnBeginState(string asOldState)
        bActive = true
        BecomeActive()
	endEvent

    Event OnActivate(ObjectReference akActionRef)
        SetActive(false)
    EndEvent

    function SetActive(bool bSetActive=true)
        debug.trace(self + " SetActive " + bSetActive + " - called on Active state")
        if bSetActive == false
            ;If system is powered, shut it down
            Debug.Trace(self + "Becoming inactive")
            GotoState("Inactive")
        endif
    endFunction
EndState

State Inactive
	event OnBeginState(string asOldState)
		bActive = false
        BecomeInactive()
	endEvent

    Event OnActivate(ObjectReference akActionRef)
        SetActive(true)
    EndEvent

    function SetActive(bool bSetActive=true)
        debug.trace(self + " SetActive " + bSetActive + " - called on Inactive state")
        if bSetActive
            ;If system is unpowered, turn it on
            Debug.Trace(self + "Becoming active")
            GotoState("Active")
        endif
    endFunction
EndState

; override on child scripts
function HandleOnLoad()
EndFunction

; override on child scripts
function HandleOnUnload()
endFunction

; override on child scripts
function BecomeActive()
endFunction

; override on child scripts
function BecomeInactive()
endFunction

function Disarm()
    bDisarmed = true
    GotoState("Unloaded")
endFunction

function SetActive(bool bSetActive=true)
    debug.trace(self + " SetActive called on empty state - do nothing")
    ; do nothing in empty state
endFunction
