Scriptname CF_Main_QuestScript extends Quest

Faction Property CrimeFactionUC Auto Const Mandatory
Quest Property CF02 Auto Const Mandatory
Quest Property CF03 Auto Const Mandatory
Quest Property CF04 Auto Const Mandatory
Quest Property CF05 Auto Const Mandatory
Quest Property CF06 Auto Const Mandatory
Quest Property CF07 Auto Const Mandatory
GlobalVariable Property CF04_UCArrested Auto Const Mandatory
GlobalVariable Property CF05_UCArrested Auto Const Mandatory

Function SendPlayerToJail()
    CrimeFactionUC.SendPlayerToJail()
EndFunction

Function RegisterForLoadScreenEvent()
	RegisterForMenuOpenCloseEvent("LoadingMenu")
EndFunction

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	If (!abOpening)
		If CF04_UCArrested.GetValue() == 1
			Utility.Wait(3)
			CF04.SetStage(1000)
			UnregisterForMenuOpenCloseEvent("LoadingMenu")
		ElseIf CF05_UCArrested.GetValue() == 1
			Utility.Wait(3)
			CF05.SetStage(10000)
			UnregisterForMenuOpenCloseEvent("LoadingMenu")
		EndIf
	EndIf
EndEvent

Function SysDefShutdown()

	If CF02.IsRunning() == 1
		CF02.SetStage(18)
	EndIf

	If CF03.IsRunning() == 1
		CF03.SetStage(18)
	EndIf

	If CF04.IsRunning() == 1
		CF04.SetStage(18)
	EndIf

	If CF05.IsRunning() == 1
		CF05.SetStage(38)
	EndIf

	If CF07.IsRunning() == 1
		CF07.SetStage(18)
	EndIf

EndFunction