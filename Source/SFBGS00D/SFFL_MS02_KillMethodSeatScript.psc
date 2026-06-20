Scriptname SFBGS00D:SFFL_MS02_KillMethodSeatScript extends ReferenceAlias

Event OnEnterFurniture(Actor AkActionRef)

If (AkActionRef == Game.GetPlayer())

int result = LeaveMessage.Show()
if (result == 0)
   SFFL_MS02.SetStage(975)
else ;result == 1
   ;No
endif

EndIf

EndEvent








Message Property LeaveMessage Auto

Quest Property SFFL_MS02 Auto