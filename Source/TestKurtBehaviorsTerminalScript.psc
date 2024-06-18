Scriptname TestKurtBehaviorsTerminalScript extends TerminalMenu

TerminalMenu property TestKurtCreatureBehavior_BehaviorList auto const mandatory
{ terminal for behaviors }

TerminalMenu property TestKurtCreatureBehavior_RigList auto const mandatory
{ terminal for rigs }

Keyword Property TestKurtCreatureBehaviorKeyword auto const

TestKurtCreatureBehaviorScript myQuest

int property CreatureRigIndex = 7 auto
{ what rig to create from this button? }

int property Behavior_ResetID = 12 auto Const

ObjectReference myTerminal

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    if myTerminal == NONE
        myTerminal = akTerminalRef
        RegisterForRemoteEvent(akTerminalRef, "OnUnload")
        StartQuest()
    endif
EndEvent

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    if akTerminalBase == TestKurtCreatureBehavior_BehaviorList
        if auiMenuItemID == Behavior_ResetID
            debug.trace(self + " Resetting creatures")
            myQuest.ResetCreatures()
        else
            int creatureIndex = auiMenuItemID-1
            debug.trace(self + " CreateCreature " + creatureIndex)
            myQuest.CreateCreature(creatureIndex)
        endif
    ElseIf akTerminalBase == TestKurtCreatureBehavior_RigList
        ChangeRig(auiMenuItemID-1)
    endif
EndEvent


function ChangeRig(int newRigIndex)
    debug.trace(self + " ChangeRig newRigIndex=" + newRigIndex)
    myQuest.ResetCreatures()
    myQuest.Stop()
    myQuest = None
    CreatureRigIndex = newRigIndex
    StartQuest()
endFunction

function StartQuest()
    debug.trace(self + " StartQuest myQuest=" + myQuest)
    if myQuest == NONE
        Quest[] questArray = TestKurtCreatureBehaviorKeyword.SendStoryEventAndWait(akRef1 = myTerminal, akRef2 = myTerminal.GetLinkedRef(), aiValue1=CreatureRigIndex)
        debug.trace(self + " questArray=" + questArray)
        if questArray.Length > 0
            myQuest = questArray[0] as TestKurtCreatureBehaviorScript
            debug.trace(self + " started quest: myQuest=" + myQuest)
        endif
    endif
endFunction

Event ObjectReference.OnUnload(ObjectReference akSource)
    ; stop the quest so we can use it elsewhere
    if myQuest
        myQuest.Stop()
        myQuest = NONE
    endif
    myTerminal = NONE
EndEvent
