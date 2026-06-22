Scriptname CF01DialogueCrimeGuardsScript extends Quest

InputEnableLayer inputLayer

Function DisablePlayerControlsForCF01Arrest()
    inputLayer = InputEnableLayer.Create()
    inputLayer.DisablePlayerControls()
EndFunction

Function EnablePlayerControlsAfterCF01Arrest()
    inputLayer.EnablePlayerControls()
    inputLayer.Delete()
EndFunction