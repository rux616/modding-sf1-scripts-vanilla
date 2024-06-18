Scriptname SQ_ClearBountyTerminalScript extends TerminalMenu Conditional

struct CrimeFaction
    Faction theFaction
    GlobalVariable currentBounty
    int currentBountyCost
endStruct

CrimeFaction[] property CrimeFactions auto const
{ factions to calculate current bounty for }

ActorValue property KioskTerminalNoSaleFlag auto hidden
{ set to 1 if the player tries to buy something with not enough credits }

TerminalMenu property SQ_ClearBountyTerminalMenu_Deskop auto const mandatory
{ the main terminal menu }

TerminalMenu property SQ_ClearBountyTerminalMenu_Submenu auto const mandatory
{ the submenu for this terminal }

GlobalVariable property SQ_ClearBountyConvenienceFee auto Const
{ extra cost for clearing bounty via this terminal }

CrimeFaction clearBountyCrimeFaction

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter " + akTerminalRef)
    if akTerminalBase == SQ_ClearBountyTerminalMenu_Deskop   
        UpdateTextReplacement(akTerminalRef)
    endif
    debug.trace(self + " OnTerminalMenuEnter DONE")
EndEvent

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    if akTerminalBase == SQ_ClearBountyTerminalMenu_Deskop && auiMenuItemID < CrimeFactions.Length
        clearBountyCrimeFaction = CrimeFactions[auiMenuItemID]
        if clearBountyCrimeFaction
            debug.Trace(self + "  clearBountyCrimeFaction=" + clearBountyCrimeFaction)
            akTerminalRef.AddTextReplacementData("ClearFaction", clearBountyCrimeFaction.theFaction)
            akTerminalRef.AddTextReplacementValue("ClearBounty", clearBountyCrimeFaction.currentBounty.GetValueInt())
            akTerminalRef.AddTextReplacementValue("ClearBountyCost", clearBountyCrimeFaction.currentBountyCost)

            MiscObject credits = Game.GetCredits()
            Actor player = Game.GetPlayer()
            int playerCredits = player.GetItemCount(credits)
            int cost = clearBountyCrimeFaction.currentBountyCost
            if playerCredits >= cost
                akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0)
            Else
                ; no sale
                akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1)
            endif
        EndIf
    elseif akTerminalBase == SQ_ClearBountyTerminalMenu_Submenu && auiMenuItemID == 0
        MiscObject credits = Game.GetCredits()
        Actor player = Game.GetPlayer()

        int playerCredits = player.GetItemCount(credits)
        int cost = clearBountyCrimeFaction.currentBountyCost
        if playerCredits >= cost
            debug.Trace(self + "  clearing bounty for " + clearBountyCrimeFaction.theFaction)
            akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0)
            ; clear bounty with this faction
            player.RemoveItem(credits, cost)
            clearBountyCrimeFaction.theFaction.SetCrimeGold(0)
            clearBountyCrimeFaction.theFaction.SetCrimeGoldViolent(0)
            clearBountyCrimeFaction.theFaction.SetPlayerEnemy(false)
            debug.Trace(self + "  bounty should be cleared; current bounty=" + clearBountyCrimeFaction.theFaction.GetCrimeGold())
            debug.trace(self + " calling UpdateTextReplacement")
            UpdateTextReplacement(akTerminalRef)
            debug.trace(self + " calling UpdateTextReplacement - DONE")
        Else
            debug.Trace(self + "  player doesn't have enough credits to clear bounty for " + clearBountyCrimeFaction.theFaction + " cost=" + cost)
            ; no sale
            akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1)
        endif
        
    endif
EndEvent

function UpdateTextReplacement(ObjectReference akTerminalRef)
    clearBountyCrimeFaction = NONE  
    ; update text replacement
    int i = 0
    while i < CrimeFactions.Length
        CrimeFaction theCrimeFaction = CrimeFactions[i]
        int currentBounty = theCrimeFaction.theFaction.GetCrimeGold()
        theCrimeFaction.currentBountyCost = math.Round(currentBounty * (1.0 + SQ_ClearBountyConvenienceFee.GetValue()))

        debug.trace(self + " crimeFaction: " + theCrimeFaction.theFaction + " currentBounty=" + currentBounty)
        theCrimeFaction.currentBounty.SetValueInt(currentBounty)

        akTerminalRef.AddTextReplacementData("Faction" + i, theCrimeFaction.theFaction)
        akTerminalRef.AddTextReplacementValue("Faction" + i + "Bounty", currentBounty)
        debug.Trace(self + " adding tag Faction" + i + "=" + theCrimeFaction.theFaction + " with value tag Faction" + i + "Bounty=" + theCrimeFaction.currentBountyCost)
        i += 1
    endWhile
endFunction
