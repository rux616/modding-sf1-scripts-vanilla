Scriptname CF05_PlayerAliasScript extends ReferenceAlias
{This script handles the behavior of the player picking up items for this quest.}

Key Property CF05_UCID_Elijah Auto Const Mandatory
Key Property LC043_SY01CommandAccessKey Auto Const Mandatory
Key Property LC043_SY02EngineeringAccessKey Auto Const Mandatory
Key Property LC043_SY03DockingPortKey Auto Const Mandatory
ReferenceAlias Property CF05_UCIDCard Auto Const Mandatory
ReferenceAlias Property CF05_EnsignUniform Auto Const Mandatory
ReferenceAlias Property CF05_CommandBayAccessCard Auto Const Mandatory
ReferenceAlias Property CF05_PilotUniform Auto Const Mandatory
Armor Property CF05_EnsignUniformArmor Auto Const Mandatory
Armor Property CF05_EnsignUniformArmor02 Auto Const Mandatory
Armor Property CF05_EnsignUniformArmor03 Auto Const Mandatory
Armor Property CF05_Clothes_ScienceLabTec Auto Const Mandatory
Armor Property CF05_PilotUniformArmor Auto Const Mandatory
Faction Property LC043SYFaction Auto Const Mandatory
Faction Property LC043SY01Faction Auto Const Mandatory
Faction Property LC043SY02Faction Auto Const Mandatory
Faction Property LC043SY03Faction Auto Const Mandatory
Keyword Property CF05_EnsignArmorKeyword_Disguise Auto Const Mandatory
Quest Property LC043 Auto Const Mandatory

Group QuestStageProperties
    Int Property iUCIDStage = 1011 Auto Const
    Int Property iEnsignUniformStage = 1021 Auto Const
    Int Property iCommandBayKeyCardStage = 1101 Auto Const
    Int Property iEngineeringBayKeyCardStage = 1501 Auto Const
    Int Property iPilotUniformStage = 1711 Auto Const
    Int Property iDockingBayKeyCardStage = 1800 Auto Const
    Int Property iWearEnsignUniformObjective = 1030 Auto Const
    Int Property iTalkToSecurityGuardStage = 1040 Auto Const
    Int Property iWearPilotUniformObjective = 1720 Auto Const
    Int Property iWorePilotUniformStage = 1721 Auto Const
EndGroup

; When the player equips a uniform, add them to the LC043SY factions so they are no longer trespassing.
; Also set the appropriate stages if Objectives to wear them are displayed.
Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)

    If akBaseObject == CF05_EnsignUniformArmor || akBaseObject == CF05_PilotUniformArmor || akBaseObject == CF05_EnsignUniformArmor02 || akBaseObject == CF05_EnsignUniformArmor03 || akBaseObject == CF05_Clothes_ScienceLabTec

    Actor PlayerRef = Game.GetPlayer()
    Quest MyQuest = GetOwningQuest()
    If akBaseObject == CF05_EnsignUniformArmor
        If MyQuest.IsObjectiveDisplayed(iWearEnsignUniformObjective)
            MyQuest.SetStage(iTalkToSecurityGuardStage)
        EndIf
    ElseIf akBaseObject == CF05_PilotUniformArmor
        If MyQuest.IsObjectiveDisplayed(iWearPilotUniformObjective)
            MyQuest.SetStage(iWorePilotUniformStage)
        EndIf
    EndIf

 	;PlayerRef.AddToFaction(LC043SYFaction)
	    If !LC043.GetStageDone(150)
		    PlayerRef.AddToFaction(LC043SY01Faction)
        EndIf
	    If !LC043.GetStageDone(250)
            PlayerRef.AddToFaction(LC043SY02Faction)
        EndIf
        If !LC043.GetStageDone(350)
            PlayerRef.AddToFaction(LC043SY03Faction)
        EndIf
    EndIf
EndEvent

; When the player removes a uniform, remove them from the LC043SY factions so they are trespassing.

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
    If akBaseObject == CF05_EnsignUniformArmor || akBaseObject == CF05_PilotUniformArmor || akBaseObject == CF05_EnsignUniformArmor02 || akBaseObject == CF05_EnsignUniformArmor03 || akBaseObject == CF05_Clothes_ScienceLabTec

        Actor PlayerRef = Game.GetPlayer() 
	if !(PlayerRef.WornHasKeyword(CF05_EnsignArmorKeyword_Disguise))
        PlayerRef.RemoveFromFaction(LC043SYFaction)
        PlayerRef.RemoveFromFaction(LC043SY01Faction)
        PlayerRef.RemoveFromFaction(LC043SY02Faction)
        PlayerRef.RemoveFromFaction(LC043SY03Faction)
	endif
    endif
EndEvent