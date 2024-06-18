Scriptname FABNoBoardScript extends ReferenceAlias 

ActorValue Property DockingPermission Auto Const Mandatory
Float Property fDocking = 4.0 Auto  

Event OnAliasInit()
    ; This script has one easy job - make sure that the player cannot dock with this ship
    ;   fDocking: 0 - Neutral, 1 - Friends, 2 - Allies, 3 - Only Hostile Boarding, 4 - No Boarding
    GetRef().SetValue(DockingPermission, fDocking)
EndEvent