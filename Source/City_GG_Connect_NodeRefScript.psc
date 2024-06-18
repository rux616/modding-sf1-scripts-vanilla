Scriptname City_GG_Connect_NodeRefScript extends ObjectReference Const

Keyword Property City_GG_Connect_ActiveScanner_Keyword Mandatory Const Auto

Event OnLoad()
    if !HasKeyword(City_GG_Connect_ActiveScanner_Keyword)
        BlockActivation(true, true)
    endif
EndEvent