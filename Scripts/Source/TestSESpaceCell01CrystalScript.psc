Scriptname TestSESpaceCell01CrystalScript extends ObjectReference Const

MiscObject Property InorgUncommonBeryllium Mandatory Auto Const

Event OnDestroyed(ObjectReference akDestroyer)
    Int MineralCount = Utility.RandomInt(1,4)
    Utility.Wait(1)
    Game.GetPlayer().AddItem(InorgUncommonBeryllium, MineralCount)
EndEvent

Event OnActivate(ObjectReference akActionRef)
    debug.Notification("THIS IS A TEST!")
    DisableNoWait()
EndEvent