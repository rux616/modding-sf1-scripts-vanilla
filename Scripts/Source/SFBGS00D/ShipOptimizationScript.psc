Scriptname SFBGS00D:ShipOptimizationScript extends TerminalMenu
{Script that handles adding ship optimizations in exchange for X-Tech.}

;Properties
Perk Property ShipOptimizationPerk Const Auto
{The perk to add to the player when selected via the Ship Upgrade Terminal}

MiscObject Property XTech Mandatory Const Auto
{Autofill property for X-Tech item}

int Property XTechCost = 1 Const Auto
{How much X-Tech the optimization costs}

GlobalVariable Property SFBGS00D_ShipUpgrade_PlayerXTechDisplay Mandatory Const Auto
{Global representing how much X-Tech the player has and displays in terminal}

GlobalVariable Property SFBGS00D_ShipUpgrade_XTechCostDisplay Mandatory Const Auto
{Global representing the cost of the optimization in the terminal}

Message Property OptimizeMessage Mandatory Const Auto
{Message that shows when the perk is applied}

Message Property OptimizeFailedMessage Mandatory Const Auto

int Property MenuItemID = 1 Const Auto
{What menu item you want the script to fire on}

ReferenceAlias Property PlayerShip Mandatory Const Auto
{Player Ship reference alias from SQ_Playership}

;Non-Property Variables
int XTechAmount
SpaceshipReference ActiveShip

Auto State OptimizeAttempt
    Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
        UpdateTerminalTextReplacement()

        ;Sets up text replacement to display X-Tech values in the terminal menu
        akTerminalRef.AddTextReplacementData("XTechCost", SFBGS00D_ShipUpgrade_XTechCostDisplay)
        akTerminalRef.AddTextReplacementData("PlayerXTech", SFBGS00D_ShipUpgrade_PlayerXTechDisplay)

        If (XTechAmount >= XTechCost)
            GotoState("OptimizeSucceed")
        EndIf
    EndEvent

    Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
        If (auiMenuItemID == MenuItemID)
            OptimizeFailedMessage.Show()
        EndIf
    EndEvent
EndState

State OptimizeSucceed
    Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
        UpdateTerminalTextReplacement()

        ;Sets up text replacement to display X-Tech values in the terminal menu
        akTerminalRef.AddTextReplacementData("XTechCost", SFBGS00D_ShipUpgrade_XTechCostDisplay)
        akTerminalRef.AddTextReplacementData("PlayerXTech", SFBGS00D_ShipUpgrade_PlayerXTechDisplay)

        If (XTechAmount < XTechCost)
            GotoState("OptimizeAttempt")
        EndIf
    EndEvent

    Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
        int i = XTechCost

        If (auiMenuItemID == MenuItemID)
            While (i > 0)
                If (ActiveShip.GetItemCount(XTech) > 0)
                    ActiveShip.RemoveItem(XTech)
                Else
                    Game.GetPlayer().RemoveItem(XTech)
                EndIf
                i -= 1
            EndWhile
            Game.GetPlayer().AddPerk(ShipOptimizationPerk)
            OptimizeMessage.Show()
        EndIf
    EndEvent
EndState

Function UpdateTerminalTextReplacement()
    ;Assigns values to Globals and fills variables
    ActiveShip = PlayerShip.GetShipRef()
    XTechAmount = (Game.GetPlayer().GetItemCount(XTech) + ActiveShip.GetItemCount(XTech))
    SFBGS00D_ShipUpgrade_XTechCostDisplay.SetValue(XTechCost)
    SFBGS00D_ShipUpgrade_PlayerXTechDisplay.SetValue(XTechAmount)
EndFunction