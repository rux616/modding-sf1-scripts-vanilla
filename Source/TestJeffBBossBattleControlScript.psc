Scriptname TestJeffBBossBattleControlScript extends ObjectReference  

TestJeffBBossBattleScript Property myBoss Auto Const
Float Property myTimer = 5.0 Auto Const
Explosion property myExplosion Auto Const
Explosion property myTeleportFX Auto Const
WwiseEvent Property mySoundEvent Auto Const
Float Property myScale = 2.0 Auto Const

;******************************************************

ObjectReference[] myLocations
Int myTimerID = 0
Int myPreviousLocation = 0
int rand
bool foundLocation = FALSE
bool StopTeleporting = FALSE

;******************************************************

Event OnLoad()
    myLocations = GetLinkedRefChain()
    RegisterForCustomEvent(myBoss, "ScaleBoss")
    RegisterForCustomEvent(myBoss, "StartTeleporting")
    RegisterForCustomEvent(myBoss, "StopTeleporting")
EndEvent

;******************************************************

Event TestJeffBBossBattleScript.ScaleBoss(TestJeffBBossBattleScript akSender, Var[] akArgs)
    UnregisterForCustomEvent(myBoss, "ScaleBoss")
    myBoss.setScale(myScale)
EndEvent

;******************************************************

Event TestJeffBBossBattleScript.StartTeleporting(TestJeffBBossBattleScript akSender, Var[] akArgs)
    UnregisterForCustomEvent(myBoss, "StartTeleporting")
    MoveBoss()
EndEvent

;******************************************************

Event TestJeffBBossBattleScript.StopTeleporting(TestJeffBBossBattleScript akSender, Var[] akArgs)
    UnregisterForCustomEvent(myBoss, "StopTeleporting")
    StopTeleporting = TRUE
    CancelTimer(myTimerID)
    myBoss.moveto(myBoss.GetLinkedRef())
    mySoundEvent.PlayAndWait(myBoss)
    ;Utility.wait(1.0)
    myBoss.PlaceAtMe(myExplosion)
    myBoss.DisableNoWait()
EndEvent

;******************************************************

Event OnTimer(int aiTimerID)
    if(aiTimerID == myTimerID) && (StopTeleporting == FALSE)
        foundLocation = FALSE
        MoveBoss()
    EndIf
EndEvent

;******************************************************

Function MoveBoss()
    ;move boss to a random location, but not the same one twice
    While(foundLocation == FALSE)
        rand = Utility.RandomInt(1, myLocations.Length)
        if(rand != myPreviousLocation)
            foundLocation = TRUE
            if(StopTeleporting == FALSE)
                myBoss.PlaceAtMe(myTeleportFX)
                myBoss.moveto(myLocations[rand])
                myBoss.PlaceAtMe(myTeleportFX)
                StartTimer(mytimer, myTimerID)
            EndIf
            myPreviousLocation = rand
        else
            Utility.wait(0.01)
        EndIf
    EndWhile
EndFunction

;******************************************************