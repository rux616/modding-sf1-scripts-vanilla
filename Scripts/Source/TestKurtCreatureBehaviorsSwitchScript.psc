Scriptname TestKurtCreatureBehaviorsSwitchScript extends ObjectReference

Message property TestKurtCreatureBehaviorMessage auto const mandatory
{ message box for player choices }

Keyword Property TestKurtCreatureBehaviorKeyword auto const

TestKurtCreatureBehaviorScript myQuest

int property CreatureRigIndex = 7 auto
{ what rig to create from this button? }

int property ResetMessageIndex = 9 auto Const

Event OnActivate(ObjectReference akActionRef)
    int messageIndex = TestKurtCreatureBehaviorMessage.Show()
    StartQuest()
    if messageIndex == ResetMessageIndex
        myQuest.ResetCreatures()
    elseif messageIndex > -1
        myQuest.CreateCreature(messageIndex)
    endif
endEvent

function ChangeRig(int newRigIndex)
    myQuest.ResetCreatures()
    myQuest.Stop()
    myQuest = None
    CreatureRigIndex = newRigIndex
    StartQuest()
endFunction

function StartQuest()
    if myQuest == NONE
        myQuest = TestKurtCreatureBehaviorKeyword.SendStoryEventAndWait(akRef1 = self, akRef2 = GetLinkedRef(), aiValue1=CreatureRigIndex)[0] as TestKurtCreatureBehaviorScript
    endif
endFunction

Event OnUnload()
    ; stop the quest so we can use it elsewhere
    if myQuest
        myQuest.Stop()
        myQuest = NONE
    endif
EndEvent
