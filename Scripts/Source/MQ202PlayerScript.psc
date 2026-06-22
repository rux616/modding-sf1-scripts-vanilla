Scriptname MQ202PlayerScript extends ReferenceAlias

Faction Property MQ202PetrovFaction Mandatory Const Auto
Faction Property MQ202PetrovGuardsFaction Auto Const Mandatory
Faction Property MQ202PetrovTerminalsFaction Auto Const Mandatory
Faction Property MQ202PetrovBoardingFaction Auto Const Mandatory
Faction Property MQ202PetrovGuardsFriendsFaction Auto Const Mandatory
Faction Property PlayerFaction Auto Const Mandatory

Int Property PlayerKillPrereqStage=410 Const Auto
Int Property PlayerKillSetStage=420 Const Auto

ReferenceAlias Property ArmoryTerminal Auto Const Mandatory
ReferenceAlias Property ZooTerminal Auto Const Mandatory
ReferenceAlias Property ZooAreaGuard01 Auto Const Mandatory
ReferenceAlias Property ZooAreaGuard02 Auto Const Mandatory
ReferenceAlias Property ZooAreaGuard03 Auto Const Mandatory
ReferenceAlias Property CaptainPetrov Auto Const Mandatory

Event OnKill(ObjectReference akVictim)
    Quest MyQuest = GetOwningQuest()

    ;if the player kills someone after being given free reign of the ship, set stage to start combat again
    If (akVictim as Actor).IsInFaction(MQ202PetrovFaction)
        If MyQuest.GetStageDone(PlayerKillPrereqStage)
            MyQuest.SetStage(PlayerKillSetStage)
        EndIf
    EndIf
EndEvent

Event OnPickLock(ObjectReference akLockedRef, bool abCrime, bool abSucceeded, TerminalMenu akLockedTerminalMenu, int aiTerminalMenuItem)
Debug.Trace(Self + "MQ202 OnPickLock event fired")
    If (akLockedRef == ZooTerminal.GetRef() || akLockedRef == ArmoryTerminal.GetRef()) && abCrime == 1 
    Debug.Trace(Self + "MQ202 ZooTerminal confirmed")
        Actor PlayerRef = Game.GetPlayer()
        If ZooAreaGuard01.GetActorRef().HasDetectionLOS(PlayerRef) || ZooAreaGuard02.GetActorRef().HasDetectionLOS(PlayerRef) || ZooAreaGuard03.GetActorRef().HasDetectionLOS(PlayerRef) || CaptainPetrov.GetActorRef().HasDetectionLOS(PlayerRef)
        Debug.Trace(Self + "MQ202 Passed LOS Checks: Guard 1:" + ZooAreaGuard01.GetActorRef().HasDetectionLOS(PlayerRef) + " Guard 2: " + ZooAreaGuard02.GetActorRef().HasDetectionLOS(PlayerRef) + " Guard 3: " + ZooAreaGuard03.GetActorRef().HasDetectionLOS(PlayerRef) + " Petrov: " + CaptainPetrov.GetActorRef().HasDetectionLOS(PlayerRef))    
            PlayerRef.RemoveFromFaction(MQ202PetrovFaction)
            PlayerRef.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
            PlayerRef.RemoveFromFaction(MQ202PetrovBoardingFaction)
            MQ202PetrovTerminalsFaction.SetEnemy(PlayerFaction)
            MQ202PetrovGuardsFaction.SetEnemy(PlayerFaction)
            MQ202PetrovFaction.SetEnemy(PlayerFaction)
        EndIf
    EndIf
EndEvent

