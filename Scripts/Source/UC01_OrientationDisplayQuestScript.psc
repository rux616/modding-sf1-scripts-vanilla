Scriptname UC01_OrientationDisplayQuestScript extends Quest

ReferenceAlias Property TualaReads Mandatory Auto
{Alias used to manage Commander Tuala looking at his slate while the UCR quests spool up}

ReferenceAlias Property Tuala Mandatory Const Auto
{Ref alias for Commander Tuala}

Function StartTualaAnimState()
    Actor TAct = Tuala.GetActorRef()
    TualaReads.ForceRefTo(TAct)
    TAct.EvaluatePackage()
EndFunction

CustomEvent HaltOrientationScenes

Function SendHaltScenes(ObjectReference akSceneTarget)
    Var[] kargs = new Var[1]
    kargs[0] = akSceneTarget
    SendCustomEvent("HaltOrientationScenes", kargs)
EndFunction