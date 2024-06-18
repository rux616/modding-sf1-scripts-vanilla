ScriptName VendorEnhanceScript extends TopicInfo const

GlobalVariable Property EnhancePrice Mandatory Const Auto
GlobalVariable Property PD_EnhanceSpecialVouchers Mandatory Const Auto
Quest Property DialogueParadiso Mandatory Const Auto
MiscObject Property Credits Mandatory Const Auto

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	debug.trace(self + "showing salon menu " + akSpeakerRef)

    ;remove money from player
    ;If the player has the vouchers they bought in Paradiso and they are redeeming them in Paradiso, then do not charge any credits.
    If PD_EnhanceSpecialVouchers.GetValue() < 1 || GetOwningQuest() != DialogueParadiso
        Game.GetPlayer().RemoveItem(Credits, EnhancePrice.GetValueInt())
    Else 
        ;The Paradiso vouchers are removed here if the player is credited with any.
        If PD_EnhanceSpecialVouchers.GetValue() >= 2
            PD_EnhanceSpecialVouchers.SetValue(1)
        ElseIf PD_EnhanceSpecialVouchers.GetValue() == 1
            PD_EnhanceSpecialVouchers.SetValue(0)
        EndIf
    EndIf
;only remove credits if I have 0 vouchers or if I'm not in Paradiso
;Don't remove credits if I have more than 1 voucher and I'm in Paradiso.

	;wait a second to allow the audio to finish
	Utility.Wait(0.2)
	Game.ShowRaceMenu(uiMode=2)    
    RegisterForMenuOpenCloseEvent("ChargenMenu")
endEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    if (asMenuName== "ChargenMenu")
        if (abOpening == False)
            UnRegisterForMenuOpenCloseEvent("ChargenMenu")
            Game.FadeOutGame(False, True, 0.0, 0.1) ;fade in        
        endif
    endif
endEvent
