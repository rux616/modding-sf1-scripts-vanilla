Scriptname Test_PryOpenDoors extends ObjectReference Const

; On activate, slowly open the lift doors
Keyword Property ActivatorLever Mandatory Const Auto

Event OnLoad()
    RegisterForRemoteEvent(GetLinkedRef(ActivatorLever), "OnTriggerEnter")
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    utility.Wait(5.0)
    ObjectReference Destination = self.GetLinkedRef()
    self.TranslateToRef(Destination, 0.001)
EndEvent

