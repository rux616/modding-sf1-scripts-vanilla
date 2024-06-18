Scriptname TestOpenStarbornTempleScript extends ObjectReference Const

ObjectReference Property TempleWall Mandatory Const Auto
ObjectReference Property TempleWallMoveToMarker Mandatory Const Auto
ObjectReference Property TempleWallOpenSoundMarker Mandatory Const Auto

WwiseEvent Property sOpenWallEvent Mandatory Const Auto

Event OnActivate(ObjectReference akActionRef)
    TempleWall.TranslateToRef(TempleWallMoveToMarker, 4)
    sOpenWallEvent.Play(TempleWallOpenSoundMarker)
EndEvent