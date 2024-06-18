Scriptname LC165BridgeRescueTriggerScript extends ObjectReference
{Script for the rescue trigger inside the bridge in LC165.}

LC165QuestScript property MQ302B Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	MQ302B.StarbornBridgeForceRescueTeleport(akActionRef as Actor)
EndEvent