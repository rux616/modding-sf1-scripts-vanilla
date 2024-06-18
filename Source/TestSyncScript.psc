Scriptname TestSyncScript extends ObjectReference Const

Keyword Property LinkCustom01 Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
    ;self.GetLinkedRef(LinkCustom01).SetOpen(false)
    ObjectReference theThing = self
    debug.trace("TestDoorScript: Self: " + theThing)
    theThing = self.GetLinkedRef(LinkCustom01)
    debug.trace("TestDoorScript: LinkCustom01 LinkedRef: " + theThing)
    theThing.SetOpen(false)
    debug.trace("TestDoorScript: " + theThing + " OpenState: " + theThing.GetOpenState())
EndEvent


