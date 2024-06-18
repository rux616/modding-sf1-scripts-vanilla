Scriptname MQ_TutorialQuestScript extends Quest

Message Property Tutorial_LockpickingMSGBox Mandatory Const Auto
Message Property Tutorial_IndustrialMSGBox Mandatory Const Auto
Message Property Tutorial_ResearchMSGBox Mandatory Const Auto
Message Property Tutorial_SpeechMSGBox Mandatory Const Auto
Message Property Tutorial_InventoryDetail_MSGBox Mandatory Const Auto
Message Property Tutorial_SkillsMenu_MSGBox Mandatory Const Auto
Message Property Tutorial_SkillsMenu_MSGBox_PC Mandatory Const Auto
Message Property Tutorial_ScannerDetail_MSGBox Mandatory Const Auto
Message Property Tutorial_MissionMenu_MSGBox Mandatory Const Auto
Message Property Tutorial_ShipMenu_MSGBox Mandatory Const Auto
Message Property Tutorial_CrewMenu_MSGBox Mandatory Const Auto
Message Property Tutorial_StarMap_MSGBox Mandatory Const Auto
Message Property Tutorial_StarMap_MSGBox_PC Mandatory Const Auto
Message Property MQ104APowerTutorial02MSG Mandatory Const Auto
Quest Property MQ101 Mandatory Const Auto
Int Property StarMapPreReqStage=510 Const Auto
Int Property StarMapPostStage=605 Const Auto
int Property CompanionEMWeapon=20 Const Auto
ReferenceAlias Property Companion Auto Const Mandatory
ReferenceAlias Property EliteCrew Auto Const Mandatory
Keyword Property WeaponTypeEM Mandatory Const Auto
ConditionForm Property UC04_WeaponIsTypeEM Mandatory Const Auto
ReferenceAlias Property PlayerShip Mandatory Const Auto
Int Property ShipLowHealthStage = 30 Const Auto
Int Property ShipDamagedSystemStage = 40 Const Auto
ActorValue Property Health Mandatory Const Auto
Message Property Tutorial_ShipBuilderUpgrade_MSGBox Mandatory Const Auto
Message Property Tutorial_ShipBuilderModify_MSGBox Mandatory Const Auto
Message Property Tutorial_ShipBuilderModify_MSGBox_PC Mandatory Const Auto
Message Property Tutorial_SocialSkills Mandatory Const Auto
Message Property Tutorial_SocialSkills_PC Mandatory Const Auto
Perk Property Skill_Instigation Mandatory Const Auto
Perk Property Skill_Intimidation Mandatory Const Auto
Perk Property Skill_Manipulation Mandatory Const Auto
Perk Property Skill_Diplomacy Mandatory Const Auto
Int Property ScannerTutorialStage = 60 Const Auto
Int Property MissionsTutorialStage = 70 Const Auto
Message Property Tutorial_StarbornPower01 Mandatory Const Auto
Message Property Tutorial_StarbornPower02 Mandatory Const Auto
Message Property Tutorial_StarbornPower03 Mandatory Const Auto
Message Property Tutorial_StarbornPower04 Mandatory Const Auto
Keyword Property Artifact_Power Mandatory Const Auto
ActorValue Property SpaceshipRegistration Mandatory Const Auto
Message Property Tutorial_UnregisteredShip Mandatory Const Auto

Event OnQuestInit()
    Actor PlayerREF = Game.GetPlayer()
    RegisterForMenuOpenCloseEvent("SecurityMenu")
    RegisterForMenuOpenCloseEvent("IndustrialCraftingMenu")
    RegisterForMenuOpenCloseEvent("ResearchMenu")
    RegisterForMenuOpenCloseEvent("InventoryMenu")
    RegisterForMenuOpenCloseEvent("SkillsMenu")
    RegisterForMenuOpenCloseEvent("MonocleMenu")
    RegisterForMenuOpenCloseEvent("BSMissionMenu")
    RegisterForMenuOpenCloseEvent("SpaceshipInfoMenu")
    RegisterForMenuOpenCloseEvent("SpaceshipEditorMenu")
    RegisterForMenuOpenCloseEvent("ShipCrewMenu")
    RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
    RegisterForTutorialEvent("Dialogue_PersuasionStart")
    RegisterForRemoteEvent(PlayerRef, "OnItemEquipped")
    RegisterForRemoteEvent(Companion, "OnAliasChanged")
    RegisterForRemoteEvent(EliteCrew, "OnAliasChanged")
    RegisterForRemoteEvent(PlayerShip, "OnAliasChanged")
    ShipLowHealth()
    RegisterForRemoteEvent(PlayerShip.GetShipRef(), "OnShipSystemDamaged")
    RegisterForTutorialEvent("ShipbuilderUpgradeModeEntered")
    RegisterForTutorialEvent("ShipbuilderModifyModeEntered")
    RegisterForRemoteEvent(PlayerRef, "OnPlayerFailedPlotRoute")
EndEvent

Function ShipLowHealth()
    ;we want to know if the Player Ship is ever at low health
    SpaceshipReference PlayerShipREF = PlayerShip.GetShipRef()
    Float iLowHealth = PlayerShipREF.GetValue(Health) / 2
    RegisterForActorValueLessThanEvent(PlayerShipREF, Health, iLowHealth)
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    ;the PlayerShip alias could have changed, so double check before popping message
    SpaceshipReference PlayerShipREF = PlayerShip.GetShipRef()
    If ((akObjRef as SpaceshipReference) == PlayerShipREF) && (GetStageDone(ShipLowHealthStage) == False)
       Self.SetStage(ShipLowHealthStage)
       UnRegisterForRemoteEvent(PlayerShip, "OnAliasChanged")
    ElseIf ((akObjRef as SpaceshipReference) != PlayerShipREF) && (GetStageDone(ShipLowHealthStage) == False)
       ShipLowHealth()
    EndIf
EndEvent

Event SpaceshipReference.OnShipSystemDamaged(SpaceshipReference akSender, ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)
    SpaceshipReference PlayerShipREF = PlayerShip.GetShipRef()
    If ((akSender as SpaceshipReference) == PlayerShipREF) && (GetStageDone(ShipDamagedSystemStage) == False)
        UnRegisterForRemoteEvent(akSender, "OnShipSystemDamaged")
        Self.SetStage(ShipDamagedSystemStage)
    ElseIf ((akSender as SpaceshipReference) != PlayerShipREF) && (GetStageDone(ShipDamagedSystemStage) == False)
        UnRegisterForRemoteEvent(akSender, "OnShipSystemDamaged")
        RegisterForRemoteEvent(PlayerShipREF, "OnShipSystemDamaged")
    EndIf
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    Actor PlayerREF = Game.GetPlayer()
    if (asMenuName== "SecurityMenu")
        if (abOpening)
	        Tutorial_LockpickingMSGBox.Show()
            UnRegisterForMenuOpenCloseEvent("SecurityMenu")
        endif
    ElseIf (asMenuName== "IndustrialCraftingMenu")
        if (abOpening)
	        Tutorial_IndustrialMSGBox.Show()
            UnRegisterForMenuOpenCloseEvent("IndustrialCraftingMenu")
        endif
    ElseIf (asMenuName== "ResearchMenu")
        if (abOpening)
	        Tutorial_ResearchMSGBox.Show()
            UnRegisterForMenuOpenCloseEvent("ResearchMenu")
        endif
    ElseIf (asMenuName== "InventoryMenu")
        if (abOpening)
            Message.ClearHelpMessages()
            ;Tutorial_InventoryDetail_MSGBox.Show()
            UnRegisterForMenuOpenCloseEvent("InventoryMenu")
        EndIf
    ElseIf (asMenuName== "SkillsMenu")
        if (abOpening)
            If Game.UsingGamepad()
                Tutorial_SkillsMenu_MSGBox.Show()
            Else
                Tutorial_SkillsMenu_MSGBox_PC.Show()
            EndIf
            UnRegisterForMenuOpenCloseEvent("SkillsMenu")
        EndIf
    ElseIf (asMenuName== "MonocleMenu")
        if (abOpening) && (GetStageDone(ScannerTutorialStage) == 0)
            SetStage(ScannerTutorialStage)
            Tutorial_ScannerDetail_MSGBox.Show()
        EndIf
    ElseIf (asMenuName== "BSMissionMenu")
        if (abOpening) && (GetStageDone(MissionsTutorialStage) == 0)
            Message.ClearHelpMessages()
            SetStage(MissionsTutorialStage)
            Tutorial_MissionMenu_MSGBox.Show()
            UnRegisterForMenuOpenCloseEvent("BSMissionMenu")
        Else
            Message.ClearHelpMessages()
            UnRegisterForMenuOpenCloseEvent("BSMissionMenu")
        EndIf
    ElseIf (asMenuName== "SpaceshipInfoMenu")
        if (abOpening)
            Tutorial_ShipMenu_MSGBox.Show()
            UnRegisterForMenuOpenCloseEvent("SpaceshipInfoMenu")
        EndIf
    ElseIf (asMenuName== "ShipCrewMenu")
        if (abOpening)
            Tutorial_CrewMenu_MSGBox.Show()
            UnRegisterForMenuOpenCloseEvent("ShipCrewMenu")
        EndIf
    ElseIf (asMenuName== "GalaxyStarMapMenu")
        if (abOpening) && (MQ101.GetStageDone(StarMapPreReqStage)) && (MQ101.GetStageDone(StarMapPostStage)==False)
            If Game.UsingGamepad()
                Tutorial_StarMap_MSGBox.Show()
            Else
                Tutorial_StarMap_MSGBox_PC.Show()
            EndIf
            UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
        ElseIf !(abOpening) ;clear help messages from failed jump route when closing star map
            Message.ClearHelpMessages()
            UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
        EndIf
    ElseIf (asMenuName== "SpaceshipEditorMenu")
        if (abOpening)
            SpaceshipReference[] AllPlayerShips = Game.GetPlayerOwnedShips()
            Int iNumShips = AllPlayerShips.Length
            Bool bUnregisteredShip = False
            Int iCurrentIndex = 0

            ;check all player owned ships for an unregistered ship
            While iCurrentIndex < iNumShips
                If AllPlayerShips[iCurrentIndex].GetValue(SpaceshipRegistration) == 0
                    bUnregisteredShip = True
                EndIf
                iCurrentIndex += 1
            EndWhile

            If bUnregisteredShip
                Tutorial_UnregisteredShip.Show()
                UnRegisterForMenuOpenCloseEvent("SpaceshipEditorMenu")
            EndIf
        EndIf
    EndIf

    ;Starborn Power Tutorial
    If (asMenuName == "DataMenu")
        If (abOpening)
            If GetStageDone(100) && !GetStageDone(130)
                Message.ClearHelpMessages()
                Tutorial_StarbornPower02.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
                SetStage(110)
            EndIf
        ElseIf !(abOpening) ;handle the player opening/closing the menu
            If GetStageDone(100) && !GetStageDone(130)
                Message.ClearHelpMessages()
                Tutorial_StarbornPower01.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
            EndIf

            If GetStageDone(130) && !GetStageDone(140) ; player leaves menu after selecting power
                If PlayerREF.GetEquippedSpell(2).HasKeyword(Artifact_Power)
                    Message.ClearHelpMessages()
                    Tutorial_StarbornPower04.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
                    RegisterForRemoteEvent(PlayerREF, "OnSpellCast")
                EndIf
            EndIf
        Endif
	EndIf

    If (asMenuName== "PowersMenu")
        if (abOpening)
            If !GetStageDone(130)
                Message.ClearHelpMessages()
                Tutorial_StarbornPower03.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
                RegisterForRemoteEvent(PlayerREF, "OnItemEquipped")
                SetStage(120)
            EndIf
        ElseIf !(abOpening)           
            If !GetStageDone(130)
                Message.ClearHelpMessages()
                Tutorial_StarbornPower02.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
            EndIf
        EndIf
    EndIf

    ;double-check if player has social skill and also pop the social skill menu
    If (asMenuName== "MonocleMenu")
        If PlayerREF.HasPerk(Skill_Diplomacy) || PlayerREF.HasPerk(Skill_Instigation) || PlayerREF.HasPerk(Skill_Intimidation) || PlayerREF.HasPerk(Skill_Manipulation)
            if (abOpening)
                Utility.Wait(0.1) ;wait a beat for the other message box to close
                If Game.UsingGamepad()
                    Tutorial_SocialSkills.Show()
                Else
                    Tutorial_SocialSkills_PC.Show()
                EndIf
                UnRegisterForMenuOpenCloseEvent("MonocleMenu")
            EndIf
        EndIf
    EndIf
EndEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
    if asEventName == "Dialogue_PersuasionStart"
        Tutorial_SpeechMSGBox.Show()
        UnregisterForTutorialEvent("Dialogue_PersuasionStart")
    EndIf

    If asEventName == "ShipbuilderUpgradeModeEntered"
        Tutorial_ShipBuilderUpgrade_MSGBox.Show()
        UnregisterForTutorialEvent("ShipbuilderUpgradeModeEntered")
    EndIf

    If asEventName == "ShipbuilderModifyModeEntered"
        If Game.UsingGamepad()
            Tutorial_ShipBuilderModify_MSGBox.Show()
        Else
            Tutorial_ShipBuilderModify_MSGBox_PC.Show()
        EndIf
        UnregisterForTutorialEvent("ShipbuilderModifyModeEntered")
    EndIf

EndEvent

Event ObjectReference.OnSpellCast(ObjectReference akSender, Form akSpell)
    If akSpell.HasKeyword(Artifact_Power)
        Actor PlayerREF = Game.GetPlayer()
        Tutorial_StarbornPower04.UnshowAsHelpMessage()
        UnRegisterForRemoteEvent(PlayerREF, "OnItemEquipped")
        UnRegisterForRemoteEvent(PlayerREF, "OnSpellCast")
        UnRegisterForMenuOpenCloseEvent("PowersMenu")
        UnRegisterForMenuOpenCloseEvent("DataMenu")
        SetStage(140)
    EndIf
EndEvent

Event Actor.OnItemEquipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
    ProcessCompanionEMWeaponTutorial(akSender)
    If akBaseObject.HasKeyword(Artifact_Power)
        Tutorial_StarbornPower03.UnshowAsHelpMessage()
        SetStage(130)
    EndIf
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
    if akSender == Companion || akSender == EliteCrew
        ProcessCompanionEMWeaponTutorial(Game.GetPlayer())
    endif

    If akSender == PlayerShip
        ShipLowHealth()
    EndIf
EndEvent

Function ProcessCompanionEMWeaponTutorial(Actor akTriggeringActor)
    debug.trace("akTriggeringActor has an EM weapon equipped: " + UC04_WeaponIsTypeEM.IsTrue())
    if !GetStageDone(CompanionEMWeapon) && akTriggeringActor == Game.GetPlayer() && UC04_WeaponIsTypeEM.IsTrue() && (Companion.GetRef() != none || EliteCrew.GetRef() != none)
        UnregisterForRemoteEvent(akTriggeringActor, "OnItemEquipped")
        UnregisterForRemoteEvent(Companion, "OnAliasChanged")
        UnregisterForRemoteEvent(EliteCrew, "OnAliasChanged")
        SetStage(CompanionEMWeapon)
    endif
EndFunction

Function StartPowerTutorial()
    Tutorial_StarbornPower01.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
    RegisterForMenuOpenCloseEvent("DataMenu")
    RegisterForMenuOpenCloseEvent("PowersMenu")
EndFunction

Message Property Tutorial_FailedJump01 Mandatory Const Auto
Message Property Tutorial_FailedJump02 Mandatory Const Auto
Message Property Tutorial_FailedJump03 Mandatory Const Auto

Event Actor.OnPlayerFailedPlotRoute(Actor akSender, int aeFailedPlotReason)
    Message.ClearHelpMessages() ;clear any previous tutorials
    RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ;check if the map ever closes
    RegisterForMenuOpenCloseEvent("BSMissionMenu") ;check if we go to mission menu

    if (aeFailedPlotReason == 1)
        ;not enough fuel
        Tutorial_FailedJump01.ShowAsHelpMessage(asEvent="None", afDuration=30, afInterval=0, aiMaxTimes=1)
    ElseIf (aeFailedPlotReason == 2)
        ;out of jump range
        Tutorial_FailedJump02.ShowAsHelpMessage(asEvent="None", afDuration=30, afInterval=0, aiMaxTimes=1)
    ElseIf (aeFailedPlotReason == 3)
        ;unexplored system
        Tutorial_FailedJump03.ShowAsHelpMessage(asEvent="None", afDuration=30, afInterval=0, aiMaxTimes=1)
    endIf
EndEvent