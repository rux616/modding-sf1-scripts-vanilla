Scriptname LC113RedMileCheckpointScript extends ObjectReference
WwiseEvent property QST_FC05_Beacon_Activation_WEF auto Const

ObjectReference Property LC113_Checkpoint_Explosion Mandatory Const Auto
Explosion Property FlameExplosion Mandatory Const Auto

;Player presses the button at the checkpoint setting off an explosion out of the top of the stack
Event OnActivate(ObjectReference akActionRef)
    LC113_Checkpoint_Explosion.PlaceAtMe(FlameExplosion)
    QST_FC05_Beacon_Activation_WEF.Play(LC113_Checkpoint_Explosion)
	Debug.Trace("Playing Sound: " + QST_FC05_Beacon_Activation_WEF)
EndEvent