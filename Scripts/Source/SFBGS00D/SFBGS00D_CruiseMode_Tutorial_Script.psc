Scriptname SFBGS00D:SFBGS00D_CruiseMode_Tutorial_Script extends Quest

Group Mandatory
    int Property iDisplayTutorialStage Mandatory Const Auto
    {Stage of quest that activates the popup tutorial window.}

    int Property iEndTutorialStage Mandatory Const Auto
    {Stage of quest that shuts down the quest.}

    int Property iMQ101StageCompletionStage Mandatory Const Auto
    {Stage of MQ101 quest that must be completed before the tutorial becomes enabled.}

    int Property CF01MissionStartStage Mandatory Const Auto
    {Stage of CF01 quest that represent its quest start.}

    InputEnableLayer Property CruiseEnableLayer Auto Hidden
    {InputEnableLayer used to hide UI access to Cruise mode input}
EndGroup

Group Autofill
    quest Property MQ101 Mandatory Const Auto
    {Reference to MQ101 quest}
    
    quest Property CF01 Mandatory Const Auto
    {Reference to CF01 quest}

    ReferenceAlias Property PlayerShip Mandatory Const Auto
    {Refernce to the Alias of the Player's ship.}

    ActorValue Property PlayerUnityTimesEntered Mandatory Const Auto 
    {Actor value that tracks instances of the player entering the Unity}

    ActorValue Property SFFL_CruiseMode_TutorialSeen Mandatory Const Auto
    {Actor value that tracks player having been presented the Cruise Mode tutorial}
EndGroup

;Local variables.
SpaceshipReference playerShipRef

Event OnQuestStarted()
    If Game.GetPlayer().GetValue(SFFL_CruiseMode_TutorialSeen) == 0
        ;If the player hasn't seen the tutorial already, start by removing access to Cruise mode
        CruiseEnableLayer = InputEnableLayer.Create() ;create UI layer to toggle CruiseMode button access
        EnableCruiseModeAccess(false)
        Debug.Trace("Cruise Tutorial - ********* Disabling Cruise Mode access at start...")
    EndIf

    playerShipRef = PlayerShip.GetShipRef() ;will be null at game start
    Debug.Trace("Cruise Tutorial - ********* Setting playerShip to " + playerShipRef)

        If Game.GetPlayer().GetValue(SFFL_CruiseMode_TutorialSeen) == 1
            ;case - player has already seen the tutorial
            ;Shut down the tutorial quest
            SetStage(iEndTutorialStage)
            Debug.Trace("Cruise Tutorial - ********* Player has already seen the tutorial, shutdown...")
        ElseIf !playerShipRef
            ;playerShipRef is not defined yet, should mean player started a new game.
            RegisterForRemoteEvent(PlayerShip, "OnAliasChanged")
            RegisterForRemoteEvent(PlayerShipRef, "OnLocationChange")
            Debug.Trace("Cruise Tutorial - ********* playerShipRef not defined yet. Register to look for it to change,update it, and watch its location.")
        ElseIf playerShipRef 
            ;Tutorial quest stared after the player has gotten their first ship or later
            If playerShipRef.IsInSpace() && !playerShipRef.IsDocked() && Game.GetPlayer().GetValue(SFFL_CruiseMode_TutorialSeen) == 0 && MQ101.GetStageDone(iMQ101StageCompletionStage)
                ;case - player ship is in space, MQ101 seen as complete (pre-unity pass), and has not seen the tutorial.
                ShowTutorial()
                Debug.Trace("Cruise Tutorial - ********* Show tutorial at start, player ship in space post MQ101...")
            ElseIf playerShipRef.IsInSpace() && !playerShipRef.IsDocked() && Game.GetPlayer().GetValue(SFFL_CruiseMode_TutorialSeen) == 0 && Game.GetPlayer().GetValue(PlayerUnityTimesEntered) >= 1
                ;case - player ship in space, player has not seen the tutorial, and player has passed through the unity at least once.
                ;need this because all quest progress is reset on Unity passes.
                ShowTutorial()
                Debug.Trace("Cruise Tutorial - ********* Show tutorial at start, player ship in space post Unity...")
            ElseIf playerShipRef.IsInSpace() && playerShipRef.IsDocked() && Game.GetPlayer().GetValue(SFFL_CruiseMode_TutorialSeen) == 0
                ;case - player ship starts in space, docked to some other location or ship.
                ;wait for ship to completely undock to pop the tutorial.
                RegisterForRemoteEvent(PlayerShipRef, "OnShipUndock")
                Debug.Trace("Cruise Tutorial - ********* Player ship is in space but docked... Register for undocking event.")
            ElseIf !playerShipRef.IsInSpace()
                ;ship isn't in space, register to watch for a ship change and for it to change location (enter orbit)
                RegisterForRemoteEvent(PlayerShip, "OnAliasChanged")
                RegisterForRemoteEvent(PlayerShipRef, "OnLocationChange")
                Debug.Trace("Cruise Tutorial - ********* playerShipRef is defined, but its not in space. Update and watch it...")
            Else
                Debug.Trace("Cruise Tutorial - ********* Passthrough Case: Cruise Tutorial IF block caught no cases, do nothing, ERROR...")
            EndIf
        EndIf
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
    Debug.Trace("Cruise Tutorial - ********* OnAliasChangedFired")
    If akSender == PlayerShip
        ;update the playerShip's reference if the player changes ships
        playerShipRef = PlayerShip.GetShipRef() 
        Debug.Trace("Cruise Tutorial - ********* Updating PlayerShipRef - ShipRefAlias changed to:" + playerShipRef)
    EndIf

    If playerShipRef
        ;reregister the ship for the OnLocationChange Event if the Alias has been updated
        RegisterForRemoteEvent(PlayerShipRef, "OnLocationChange")
        Debug.Trace("Cruise Tutorial - ********* OnAliasChanged ship attempt to reg for OnLocationChange")
    EndIf
EndEvent

Event SpaceshipReference.OnLocationChange(SpaceshipReference source, Location akOldLoc, Location akNewLoc)
    
    If source == PlayerShipRef
        Debug.Trace("Cruise Tutorial - *********Location Change for SpaceshipReference/Cruise Tutorial registered!")
        Debug.Trace("Cruise Tutorial - *********PlayerShip has left the location " + akOldLoc + "and arrived at " + akNewLoc)
        Debug.Trace("Cruise Tutorial - *********source = PlayerShipRef passed!")
        ;if player has finished MQ101 - either a new game, or an old save passes once past the Lodge
        If MQ101.GetStageDone(iMQ101StageCompletionStage) || Game.GetPlayer().GetValue(PlayerUnityTimesEntered) >= 1
            Debug.Trace("Cruise Tutorial - *********sees MQ101 complete OR player has entered Unity at least once!")
            If playerShipRef.IsInSpace() && !playerShipRef.IsDocked() && !GetStageDone(iDisplayTutorialStage)
                ;if player not seen the tutorial AND they are in space AND not docked to something
                Debug.Trace("Cruise Tutorial - *********sees tutorial not shown yet AND the PlayerShip is in space!")
                
                ShowTutorial()

            ElseIf playerShipRef.IsInSpace() && playerShipRef.IsDocked() && !GetStageDone(iDisplayTutorialStage) && CF01.GetStageDone(CF01MissionStartStage)
                ;CF01 special case - player on the Vigilance, ship docked. 
                Debug.Trace("Cruise Tutorial - *********player and ship are docked at the Vigilance...")
                ;Start looking for the player undocking from the Vigilance...
                RegisterForRemoteEvent(PlayerShipRef, "OnShipUndock")
            EndIf
        EndIf
    EndIf
EndEvent

Event SpaceshipReference.OnShipUndock(SpaceshipReference akSender, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
    If akSender == PlayerShipRef
        If abComplete == true
            Debug.Trace("Cruise Tutorial - *********Player completed undocking!")
            
            ShowTutorial()

        Else
            Debug.Trace("Cruise Tutorial - *********Player undocking!")
        EndIf    
    EndIf
EndEvent 

Function EnableCruiseModeAccess(bool CruiseModeOn)
    CruiseEnableLayer.EnableCruiseMode(CruiseModeOn)
EndFunction

Function ShowTutorial()
    UnregisterForRemoteEvent(PlayerShipRef, "OnLocationChange")
    UnregisterForRemoteEvent(PlayerShipRef, "OnShipUndock")
    Utility.Wait(2) ;make sure space load is complete, wait a beat
    SetStage(iDisplayTutorialStage) ;show tutorial
    Utility.Wait(5)

    ;Delete InputEnableLayer used 
    CruiseEnableLayer.Delete()
    CruiseEnableLayer = None

    ;Shut down the tutorial quest
    SetStage(iEndTutorialStage)
EndFunction