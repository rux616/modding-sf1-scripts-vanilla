Scriptname TestKurtCreatureRigSwitchScript extends ObjectReference Const

Message property TestKurtCreatureRigMessage auto const mandatory
{ message box for player choices }

Event OnActivate(ObjectReference akActionRef)
    int messageIndex = TestKurtCreatureRigMessage.Show()
    if messageIndex > -1
        TestKurtCreatureBehaviorsSwitchScript myBehaviorSwitch = GetLinkedRef() as TestKurtCreatureBehaviorsSwitchScript
        if myBehaviorSwitch
            myBehaviorSwitch.ChangeRig(messageIndex)
        endif
    endif
endEvent
