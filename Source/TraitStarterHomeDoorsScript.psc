Scriptname TraitStarterHomeDoorsScript extends RefCollectionAlias
{handle player access to the Starter Home}

Message Property TraitStarterHome_DoorMortgageMessage Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

int property MortgageObjectiveStage = 200 auto Const

int property PaidOffMortgageStage = 400 auto Const

int property EndQuestStage = 9000 auto Const

int property ForeclosedStage = 500 auto Const

int property MortgageDueDays = 7 auto Const
{ how often (in days) is the mortgage due? }

GlobalVariable property Trait_StarterHome_Interest auto Const
{ how much does the mortage cost }

Bool bDoorOpen = TRUE
Float fPaymentTimestamp = -7.0    ; This is the timestamp of the last mortgage payment

Event OnActivate(ObjectReference akSource, ObjectReference akActionRef)

    if ( !bDoorOpen )  ; As long as you haven't forelosed or paid off the mortgage 
        int messageIndex = TraitStarterHome_DoorMortgageMessage.Show()
        if messageIndex > -1
            if messageIndex == 0        ; PAY THE WEEKLY MORTGAGE
                Game.GetPlayer().RemoveItem(Credits, Trait_StarterHome_Interest.GetValueInt())
                fPaymentTimestamp = Utility.GetCurrentGameTime() + MortgageDueDays  ; Flag when the player needs to pay the mortgage again
                bDoorOpen = true
                ; unlock all doors
                Lock(FALSE)
                BlockActivation(false, false)
            elseif messageIndex == 1    ; DEAL WITH MORTGAGE DIRECTLY
                GetOwningQuest().SetStage(MortgageObjectiveStage)
            endif
        endif
    endif
endEvent

Event OnLoad(ObjectReference akSource)
    ; only need to do this once per load
    if akSource == GetAt(0)
        Debug.Trace(self + " The door to your starter home has loaded.")

        ; If the property is foreclosed, lock the door (forever)
        if ( GetOwningQuest().GetStageDone(ForeclosedStage) )
            Lock()
            BlockActivation(false, false) 
        else
            ; If you haven't paid off the mortgage, then lock the door if the payment is past due
            if ( !GetOwningQuest().GetStageDone(PaidOffMortgageStage) )
                float currentGameTime = Utility.GetCurrentGameTime()
                if (currentGameTime >= fPaymentTimestamp)
                    bDoorOpen = false    ; This flag being FALSE means the door is locked and has a message box
                    Lock()
                    BlockActivation(true, false) 
                endif
            Else
                ; If you've bought off the house - unlock the door
                bDoorOpen = TRUE
                Lock(FALSE)
                BlockActivation(false, false)
                GetOwningQuest().SetStage(EndQuestStage)     ; Close off the quest - you own the place now
            endif
        endif
    endif
EndEvent