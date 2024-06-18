Scriptname MQ207HunterScript extends ReferenceAlias

ReferenceAlias Property KeeperAquilus Mandatory Const Auto

Auto State WaitingForPlayer
    Event OnLoad()
        gotostate("hasbeentriggered")
        Actor HunterREF = Self.GetActorRef()
        HunterREF.WaitFor3dLoad() ;wait for 3d to fully load
        HunterREF.CopyAppearance(KeeperAquilus.GetActorRef())
    EndEvent

    Event OnUnload()
        ;do nothing
    EndEvent
EndState

State hasbeentriggered
    Event OnLoad()
        ;empty
    EndEvent

    Event OnUnload()
        gotostate("WaitingForPlayer") ;Copy Appearrance needs to be called once per Load since it can reset
    EndEvent
EndState