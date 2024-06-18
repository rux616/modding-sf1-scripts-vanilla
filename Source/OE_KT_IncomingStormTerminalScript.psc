Scriptname OE_KT_IncomingStormTerminalScript extends Quest


GlobalVariable Property OE_KT_IncomingStormGenA_Global Auto Const Mandatory

GlobalVariable Property OE_KT_IncomingStormGenB_Global Auto Const Mandatory

GlobalVariable Property OE_KT_IncomingStormGenC_Global Auto Const Mandatory

GlobalVariable Property OE_KT_IncomingStormTotalMoves_Global Auto Const Mandatory

Function PuzzleStart()

;Update the puzzle numbers at quest start since they are now different each time for variety
    UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenA_Global)
    UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenB_Global)
    UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenC_Global)
    UpdateCurrentInstanceGlobal(OE_KT_IncomingStormTotalMoves_Global)

endFunction

Function CheckPuzzle()

    OE_KT_IncomingStormTotalMoves_Global.Mod(-1)

    UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenA_Global)
    UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenB_Global)
    UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenC_Global)
    UpdateCurrentInstanceGlobal(OE_KT_IncomingStormTotalMoves_Global)

; Check if player has routed too much power to any 1 generator
    if OE_KT_IncomingStormGenA_Global.GetValueInt() > 100 || OE_KT_IncomingStormGenB_Global.GetValueInt() > 100 || OE_KT_IncomingStormGenC_Global.GetValueInt() > 100
        SetStage(300)
    elseif OE_KT_IncomingStormTotalMoves_Global.GetValueInt() == 0 

; Check if player has solved the puzzle in the requisite number of moves, if not, blow up the generator
        if OE_KT_IncomingStormGenA_Global.GetValueInt() == 60 && OE_KT_IncomingStormGenB_Global.GetValueInt() == 60 && OE_KT_IncomingStormGenC_Global.GetValueInt() == 60
            SetStage(200)
        else
            SetStage(300)
        endif
    endif

endFunction