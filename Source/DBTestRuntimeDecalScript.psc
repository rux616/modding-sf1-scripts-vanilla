Scriptname DBTestRuntimeDecalScript extends ObjectReference Const

TextureSet Property DecalPuddleMd01 Auto Const Mandatory

Event OnLoad()
    PlaceTestDecal()
EndEvent

Function PlaceTestDecal()
    PlaceAtMe(DecalPuddleMd01)
EndFunction