Scriptname TestJeffBPuzzleScript extends ObjectReference  

ObjectReference Property button01 Auto Const
ObjectReference Property button02 Auto Const
ObjectReference Property button03 Auto Const
ObjectReference Property MasterButton Auto Const
Int Property NumberOfButtons Auto Const
WwiseEvent Property SoundSuccessEvent Auto Const
WwiseEvent Property SoundFailEvent Auto Const
Message Property myMessage Auto Const
Float Property myTimer = 10.0 Auto

int counter = 0
ObjectReference player
ObjectReference myDoor
bool timerStarted = FALSE
int myTimerID = 0

;************************************************

Event OnLoad()
    player = game.GetPlayer()
    myDoor = getLinkedRef()
    RegisterForRemoteEvent(button01, "OnActivate")
    RegisterForRemoteEvent(button02, "OnActivate")
    RegisterForRemoteEvent(button03, "OnActivate")
    RegisterForRemoteEvent(MasterButton, "OnActivate")
EndEvent

;************************************************

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    if(akActionRef == player)
        if(timerStarted == FALSE)
            timerStarted = TRUE
            StartTimer(myTimer, myTimerID)
        endIf

        if(akSender == button01)
            counter = 1
        elseIf(akSender == button02)
            if(counter == 1)
                ;correct order
                counter = counter + 1
            else
                ;wrong order
                ResetPuzzle()
            endIf
        elseIf(akSender == button03)
            if(counter == 2)
                ;correct order
                counter = counter + 1
            else
                ;wrong order
                ResetPuzzle()
            endIf
        elseIf(akSender == MasterButton)
            ;check to see if counter is correct
            if(counter == NumberOfButtons)
                ;correct!
                UnRegisterForRemoteEvent(button01, "OnActivate")
                UnRegisterForRemoteEvent(button02, "OnActivate")
                UnRegisterForRemoteEvent(button03, "OnActivate")
                UnRegisterForRemoteEvent(MasterButton, "OnActivate")
                int SoundSuccessID = SoundSuccessEvent.play(myDoor)
                myDoor.setOpen(TRUE)
            else
                int SoundFailID = SoundFailEvent.play(myDoor)
                ResetPuzzle()
            endIf
        endIf
    endIf
EndEvent

;************************************************

Event OnTimer(int aiTimerID)
    if(aiTimerID == myTimerID)
        myMessage.show()
    endIf
EndEvent

;************************************************

Function ResetPuzzle()
    counter = 0
    RegisterForRemoteEvent(button01, "OnActivate")
    RegisterForRemoteEvent(button02, "OnActivate")
    RegisterForRemoteEvent(button03, "OnActivate")
EndFunction

;************************************************