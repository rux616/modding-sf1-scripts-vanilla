Scriptname RI01_QuestScript extends Quest

ReferenceAlias Property NeonTerraBrewEmployee Auto Const Mandatory
ReferenceAlias Property NeonTerraBrewEmployeeFurniture Auto Const Mandatory
ReferenceAlias Property TerraBrewCoffeeOrder Auto Const Mandatory

MiscObject Property RI01_TerraBrewOrder Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

ActorBase Property FC_Neon_TerraBrewEmployee Auto Const Mandatory

; For testing purposes
GlobalVariable Property TrueGlobal Auto Const Mandatory

Int Property iPickUpCoffeeStage = 500 Auto Const
Int Property iStartInterviewStage = 400 Auto Const
Int Property iTimer = 1 Auto Const

Event OnStageSet(int auiStageID, int auiItemID)

    If TrueGlobal.GetValue() == 0
    ; For testing GEN-311525
    
        If auiStageID == iPickUpCoffeeStage

            Actor EmployeeRef = NeonTerraBrewEmployee.GetActorRef()

            If EmployeeRef.IsDead()
                EmployeeRef.Resurrect()
                EmployeeRef.MoveTo(NeonTerraBrewEmployeeFurniture.GetRef())
            EndIf

        EndIf

    Else
    ; For current implementation. Will need to be revisted once 
    ; GEN-306663 is fixed.
        If auiStageID == iPickUpCoffeeStage

            Actor EmployeeRef = NeonTerraBrewEmployee.GetActorRef()

            If EmployeeRef.IsDead()
                EmployeeRef.Disable()
                NeonTerraBrewEmployee.Clear()
                NeonTerraBrewEmployeeFurniture.GetRef().PlaceAtMe(FC_Neon_TerraBrewEmployee, akAliasToFill = NeonTerraBrewEmployee)
                NeonTerraBrewEmployee.GetRef().SetLinkedRef(NeonTerraBrewEmployeeFurniture.GetRef())
            EndIf

        EndIf

    EndIf

EndEvent

InputEnableLayer InterviewLayer

Function FreezeControls()

    Game.GetPlayer().StopCombatAlarm()
    InterviewLayer = InputEnableLayer.Create()
    InterviewLayer.DisablePlayerControls(abMovement = True)

    ; Start a timer if for any reason the player has activated the chair and managed to NOT sit down in it. 
    ; Timer will be used to see if the interview stage needs to be set.
    StartTimer(5, iTimer)

EndFunction

Function UnfreezeControls()

    InterviewLayer = None

EndFunction

Event OnTimer(int aiTimerID)

    If aiTimerID == iTimer
    ; On timer expired, check to see if Stage 400 has been set to start the interview. 
    ; If it hasn't, set stage 400 to start it.
        If !GetStageDone(iStartInterviewStage)
            SetStage(iStartInterviewStage)
        EndIf
    EndIf

EndEvent
