Scriptname StarterHomeDoorScript extends ReferenceAlias

Bool bDoorOpen = TRUE
Float fPaymentTimestamp = -7.0    ; This is the timestamp of the last mortgage payment

Event OnActivate(ObjectReference akActionRef)

    if ( !bDoorOpen )  ; As long as you haven't forelosed or paid off tje 
        int messageIndex = TraitStarterHome_DoorMortgageMessage.Show()
        if messageIndex > -1
            if messageIndex == 0        ; PAY THE WEEKLY MORTGAGE
                Game.GetPlayer().RemoveItem(Credits, 500)
                fPaymentTimestamp = Utility.GetCurrentGameTime() + 7.0  ; Flag when the player needs to pay the mortgage again (one week)
                bDoorOpen = true
                GetRef().Lock(FALSE)
            elseif messageIndex == 1    ; DEAL WITH MORTGAGE DIRECTLY
                GetOwningQuest().SetStage(200)
            endif
        endif
    endif
endEvent

Event OnLoad()

    Debug.Trace("StarterHomeDoorScript: The door to your starter home has loaded.")

    ; If you haven't paid off the mortgage, then lock the door
    if ( !GetOwningQuest().GetStageDone(400) )
        float currentGameTime = Utility.GetCurrentGameTime()
        if (currentGameTime >= fPaymentTimestamp)
            bDoorOpen = false    ; This flag being FALSE means the door is locked and has a message box
            GetRef().Lock() 
        endif
    Else
        ; If you've bought off the house - unlock the door
        bDoorOpen = TRUE
        GetRef().Lock(FALSE)
        GetOwningQuest().SetStage(9000)     ; Close off the quest - you own the place now
    endif

    ; If you the property is foreclosed, lock the door (forever)
    if ( GetOwningQuest().GetStageDone(500) )
       GetRef().Lock() 
    endif
EndEvent

Message Property TraitStarterHome_DoorMortgageMessage Auto Const Mandatory
MiscObject Property Credits Auto Const Mandatory
