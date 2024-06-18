ScriptName TestPlaceAliasRelativeToPlayerShip extends ReferenceAlias
{OnAliasInit, places this alias relative to the player's ship.}

Group AliasProperties
	bool property ShouldEnableAfterPlaced = True Auto Const
EndGroup

Group AutofillProperties CollapsedOnBase
	ReferenceAlias property PlayerShip Auto Const Mandatory
	Static property XMarker Auto Const Mandatory
EndGroup


Event OnAliasInit()
	float[] offsets = new float[6]
	offsets[0] = 0
	offsets[1] = 100
	offsets[2] = 0
	offsets[5] = 0
	ObjectReference marker = PlayerShip.GetRef().PlaceAtMe(XMarker, akOffsetValues=offsets)

	ObjectReference myRef = GetRef()
	myRef.MoveTo(marker)

	Debug.Trace("PLAYER'S SHIP: " + PlayerShip.GetRef().GetPositionX() + ", " + PlayerShip.GetRef().GetPositionY() + ", " + PlayerShip.GetRef().GetPositionZ())
	Debug.Trace("PLACE MARKER:  " + marker.GetPositionX() + ", " + marker.GetPositionY() + ", " + marker.GetPositionZ())
	Debug.Trace("PLACED ALIAS:  " + myRef.GetPositionX() + ", " + myRef.GetPositionY() + ", " + myRef.GetPositionZ())
	Debug.Trace("Distance Check:" + PlayerShip.GetRef().GetDistance(marker) + " " + PlayerShip.GetRef().GetDistance(myRef))

	marker.Delete()
	if (ShouldEnableAfterPlaced)
		myRef.EnableNoWait()
	EndIf
EndEvent