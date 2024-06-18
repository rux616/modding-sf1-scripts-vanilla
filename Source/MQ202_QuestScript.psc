Scriptname MQ202_QuestScript extends Quest
; [CT 1/10/2023] Script created to prevent race issue between setting stage 250 and 400
; if Petrov goes into combat and enters bleedout too quickly. 
; See GEN-472580 for details.

Int Property iStageBleedout Auto Const

ReferenceAlias Property CaptainPetrov Auto Const Mandatory
ReferenceAlias Property BountyHunter_Bull Auto Const Mandatory
ReferenceAlias Property BountyHunter_ErinSeptember Auto Const Mandatory
ReferenceAlias Property BountyHunter_Raptor Auto Const Mandatory
ReferenceAlias Property AlarmSoundMarker Auto Const Mandatory

Faction Property MQ202PetrovGuardsFriendsFaction Auto Const Mandatory
Faction Property MQ202PetrovBoardingFaction Auto Const Mandatory
Faction Property MQ202PetrovEnemyFaction Auto Const Mandatory
Faction Property MQ202PetrovFaction Auto Const Mandatory

Scene Property MQ202_008_Petrov_BleedoutScene Auto Const Mandatory

Guard PetrovLogicGuard ProtectsFunctionLogic

Function CheckPetrov()
Debug.Trace(Self + " MQ202: Function CheckPetrov was called")
    LockGuard(PetrovLogicGuard)
        If !GetStageDone(iStageBleedout)
        Debug.Trace(Self + " MQ202: Stage 250 and 400 are NOT done")

            Actor PetrovREF = CaptainPetrov.GetActorRef()
            Actor PlayerREF = Game.GetPlayer()

            PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
            PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction)
            PlayerREF.AddtoFaction(MQ202PetrovEnemyFaction)
            PetrovREF.StartCombat(PlayerREF)
        EndIf

        If GetStageDone(iStageBleedout)
        Debug.Trace(Self + " MQ202: Stage 400 set")
            ;temporarily make player an Ally and stop combat
            Actor PlayerREF = Game.GetPlayer()
            Actor BullREF = BountyHunter_Bull.GetActorRef()
            Actor ErinSeptemberREF = BountyHunter_ErinSeptember.GetActorRef()
            Actor RaptorREF = BountyHunter_Raptor.GetActorRef()
            Actor PetrovREF = CaptainPetrov.GetActorRef()

            PlayerREF.RemoveFromFaction(MQ202PetrovEnemyFaction)
            PlayerREF.AddToFaction(MQ202PetrovFaction)
            PlayerREF.StopCombatAlarm()

            BullREF.StopCombatAlarm()
            ErinSeptemberREF.StopCombatAlarm()
            RaptorREF.StopCombatAlarm()

            PetrovRef.AllowBleedoutDialogue(True)
            PetrovRef.SetNoBleedoutRecovery(True)
            PetrovRef.StopCombat()

            MQ202_008_Petrov_BleedoutScene.Start()

            AlarmSoundMarker.GetRef().Disable()

            SetObjectiveCompleted(56)
        EndIf
    EndLockGuard
EndFunction

