Scriptname MQ102Script extends Quest

InputEnableLayer MQ102EnableLayer

Function BlockSpaceTravel()
    Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=False)
    MQ102EnableLayer = InputEnableLayer.Create()
    MQ102EnableLayer.DisablePlayerControls()
    MQ102EnableLayer.EnableFastTravel(False)
    MQ102EnableLayer.EnableFarTravel(False)
EndFunction

Function UnblockSpaceTravel()
    MQ102EnableLayer = None
    Game.SetInChargen(abDisableSaving=False, abDisableWaiting=False, abShowControlsDisabledMessage=False)
EndFunction