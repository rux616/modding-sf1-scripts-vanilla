Scriptname DebugLocationMarkupMainSwitchScript extends ObjectReference

Formlist Property FormlistOfQuestsToStart Mandatory Const Auto
String ThisButtonsName = "Start All Quests"

Event OnActivate(ObjectReference akActionRef)
    int numQuestsFailedToStart = 0
    int formlistCount = 0
    int formlistSize = FormlistOfQuestsToStart.GetSize()
    While (formlistCount < formlistSize)
        Quest currentQuest = (FormlistOfQuestsToStart.GetAt(formlistCount) as Quest)
        if !(FormlistOfQuestsToStart.GetAt(formlistCount) as Quest).Start()
            numQuestsFailedToStart += 1
        endif
        formlistCount += 1
    EndWhile

    If (numQuestsFailedToStart < 1)
        debug.Notification("All " + formlistSize + " quests started successfully.")
        debug.Trace("All " + formlistSize + " quests started successfully.")
    Else
        debug.Notification("Check WarningsQuest.txt for more information...")
        debug.Notification(numQuestsFailedToStart + " of " + formlistSize + " quests failed to start." )
        debug.Trace(numQuestsFailedToStart + " of " + formlistSize + " quests failed to start." )
        debug.Trace("Check WarningsQuest.txt for more information...")
    EndIf
EndEvent