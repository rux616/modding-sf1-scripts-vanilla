Scriptname LC082_BrigTriggerRefScript extends ObjectReference
{Script for the LC082 Brig Trigger. Periodically EVP's the actors in the Brig to get them into position for dialogue.}

Group AutofillProperties
	LC082_BrigQuestScript property LC082 Auto Const Mandatory
EndGroup

int CONST_BrigTriggerDelay = 5 Const


Event OnTriggerEnter(ObjectReference akActionRef)
	StartTimer(0)    
EndEvent

Event OnTimer(int timerID)
	if (IsInTrigger(Game.GetPlayer()))
		LC082.EVPPrisoners()
		StartTimer(CONST_BrigTriggerDelay)
	EndIf
EndEvent