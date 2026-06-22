Scriptname CF07_QuestScript extends Quest

int Property TalkToCompanion = 450 Const Auto
ReferenceAlias Property Companion Mandatory Const Auto
GlobalVariable Property CF_SysDefShutdown Mandatory Const Auto

Event OnQuestInit()

    RegisterForRemoteEvent(Companion, "OnAliasChanged")

EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
    
	If GetStageDone(500) == 1
		If CF_SysDefShutdown.GetValue() == 0
			If akSender == Companion && IsObjectiveCompleted(TalkToCompanion) == false
				If Companion.GetReference() == None
					SetObjectiveDisplayed(TalkToCompanion,false)
        			Else
            				SetObjectiveDisplayed(TalktoCompanion,true)
        			EndIf
    			EndIf
		EndIf
	EndIf

EndEvent