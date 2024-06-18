Scriptname OE_DeadManWalking_Script extends Quest

Group General
    Int Property InfectionStage = 300 auto const
EndGroup 

Group Autofill 
    SQ_ENV_AfflictionsScript Property ENV_AfflictionsScript Mandatory Const Auto
    ENV_AfflictionScript Property ENV_AFFL_Infection_LungInfection Mandatory Const Auto 
    ENV_AfflictionScript Property ENV_AFFL_Infection_BrainInfection Mandatory Const Auto 
    ENV_AfflictionScript Property ENV_AFFL_Infection_IntestinalInfection Mandatory Const Auto 
    ReferenceAlias Property Alias_Colonist Mandatory Const Auto 
EndGroup 

Event OnQuestInit()
    RegisterForRemoteEvent(Self, "OnStageSet")
EndEvent

Event OnStageSet(int auiStageID, int auiItemID)
    If auiStageID == InfectionStage
        InfectPlayer()
        UnregisterForRemoteEvent(self, "OnStageSet")
    EndIf
EndEvent

; Gain the Affliction 
Function InfectPlayer() ;Actor AfflictionTarget
	Debug.Trace("Calling Gain() on ENV_AFFL_Infection_LungInfection")

    ; Infect the Player. 
    ENV_AFFL_Infection_LungInfection.Gain()

    ; Player killed the NPC as well.
    If Self.GetStageDone(600)
        ENV_AFFL_Infection_BrainInfection.Gain()
        ENV_AFFL_Infection_IntestinalInfection.Gain()
    EndIf 

    Alias_Colonist.GetActorRef().SetProtected(False)
    Alias_Colonist.GetActorRef().EvaluatePackage()
EndFunction

