Scriptname DebugStopAllScenesQuestScript extends Quest Const Default
{Stops all current scenes for specified aliases}

ReferenceAlias[] Property Aliases Mandatory Const Auto

Function StopAllScenes()
	int i = 0
	While (i < Aliases.length)
		ObjectReference refToStopSceneFor = Aliases[i].GetReference()
		if refToStopSceneFor
			Scene sceneToStop = refToStopSceneFor.GetCurrentScene()
			if sceneToStop
				DefaultScriptFunctions.Trace(self, "StopAllScenes() stopping sceneToStop: " + sceneToStop, ShowNormalTrace = true)
				sceneToStop.Stop()
			endif
		endif
		i += 1
	EndWhile
EndFunction