Scriptname TestKurtFormationsSwitchScript extends ObjectReference Const

ActorValue Property Variable01 Auto Const Mandatory

Message Property TestKurtFormationMessageBox auto const

Keyword Property TestKurtButtonKeyword auto const

Event OnActivate(ObjectReference akActionRef)
    int messageIndex = TestKurtFormationMessageBox.Show()
    UpdateLinkedRefs(messageIndex)
endEvent

function UpdateLinkedRefs(int messageIndex)
    ObjectReference[] myLinkedRefs = GetRefsLinkedToMe(TestKurtButtonKeyword)
    int i = 0
    while i < myLinkedRefs.Length
    	Actor myLinkedActor = myLinkedRefs[i] as Actor
    	if myLinkedActor
    		myLinkedActor.SetValue(Variable01, messageIndex)
    		myLinkedActor.EvaluatePackage()
    	endif
    	i += 1
    EndWhile
    ; if I have a linked ref, call update on that as well
    TestKurtFormationsSwitchScript myLinkedButton = GetLinkedRef() as TestKurtFormationsSwitchScript
    if myLinkedButton
        myLinkedButton.UpdateLinkedRefs(messageIndex)
    endif
EndFunction

