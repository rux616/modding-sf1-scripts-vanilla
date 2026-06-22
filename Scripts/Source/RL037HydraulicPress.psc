Scriptname RL037HydraulicPress extends ObjectReference
{Script for the Hydraulic Lift used for the Mantis' ship.}

ObjectReference Property MovementHelperRef Auto Const Mandatory
ObjectReference Property LandingEnableRef Auto Const Mandatory
ObjectReference Property CollisionEnableRef Auto Const Mandatory
Keyword Property LinkCustom01 Auto Const Mandatory
Keyword Property LinkCustom02 Auto Const Mandatory

float CONST_DistanceAlongHelper = 0.45 Const


Auto State Waiting
  Event OnActivate(ObjectReference akActionRef)

     if akActionRef == game.getPlayer() 
        GotoState("Done")
        ObjectReference soundMarker = GetLinkedRef(LinkCustom01)
        SpaceshipReference mantisShipRef = GetLinkedRef(Linkcustom02) as SpaceshipReference
        CollisionEnableRef.Enable()
        mantisShipRef.Enable()
        LandingEnableRef.Enable()

        ; TEMP until we get the event: GEN-527399
        SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript
        SQ_PlayerShip.AddPlayerOwnedShip(mantisShipRef)
        ; once bug is fixed, can return to using:
        ;Game.AddPlayerOwnedShip(mantisShipRef)

        soundMarker.Enable()
        MovementHelperRef.SetAnimationVariableFloat("Speed", 0.025)
        MovementHelperRef.SetAnimationVariableFloat("Position", CONST_DistanceAlongHelper)
        MovementHelperRef.PlayAnimationAndWait("Play01", "done")
        soundMarker.Disable()
      
     endIf
  EndEvent
EndState

State Done
EndState