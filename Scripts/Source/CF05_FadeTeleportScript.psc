Scriptname CF05_FadeTeleportScript extends TopicInfo

ReferenceAlias Property Alias_PlayerTeleportGuard Auto Const Mandatory

float Property SecondsBeforeFade = 0.0 Auto Const

float Property FadeDuration = 0.5 Auto Const

float Property WaitTime = 0.5 Auto Const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	Game.FadeOutGame(true, true, SecondsBeforeFade, FadeDuration, true)
	InputEnableLayer myLayer = InputEnableLayer.Create()
	myLayer.DisablePlayerControls(abMovement = true, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = false, abActivate = false, abJournalTabs = false, abVATS = false, abFavorites = false, abRunning = false)
	Utility.Wait(WaitTime)
	Game.GetPlayer().MoveTo(Alias_PlayerTeleportGuard.GetRef())
	Utility.Wait(WaitTime)
	myLayer.Delete()
	Game.FadeOutGame(false, true, SecondsBeforeFade, FadeDuration)
endEvent

