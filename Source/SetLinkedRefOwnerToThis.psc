Scriptname SetLinkedRefOwnerToThis extends Actor Const
{Sets this actor's LinkedRef to be owned by this actor.}

Event OnCellAttach()
	Debug.Trace("Our parent cell has attached")
	ObjectReference linkedRef = Self.GetLinkedRef( )
	Actor actorSelf = (Self As Actor)
	linkedRef.SetActorRefOwner( actorSelf )
	actorSelf = linkedRef.GetActorRefOwner( )
endEvent