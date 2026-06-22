Scriptname SFBGS00D:SFFLDR021_MissileControlTerminalMenu extends TerminalMenu

Keyword Property SiloMissileManager Auto Const Mandatory

Event OnTerminalMenuEnter(TerminalMenu AffectedTerminalMenu, ObjectReference currentTerminal)
    ; Get the value of battery count in the Silomananager script and update the battery counter on the terminal menu
    SFBGS00D:SFFLDR021_SiloManagerScript siloManager = currentTerminal.GetLinkedRef(SiloMissileManager) as SFBGS00D:SFFLDR021_SiloManagerScript
    Int BatteryCount = siloManager.GetBatteryCount()
    currentTerminal.AddTextReplacementValue("SFFLDR021BatteryCount", BatteryCount)

EndEvent