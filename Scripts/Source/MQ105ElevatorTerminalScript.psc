Scriptname MQ105ElevatorTerminalScript extends TerminalMenu

Key property MQ105SlaytonElevatorID auto Const

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  if(auiMenuItemID == 1)
        Game.GetPlayer().AddItem(MQ105SlaytonElevatorID, 1, false)
  endIf
endEvent