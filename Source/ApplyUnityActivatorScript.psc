Scriptname ApplyUnityActivatorScript extends ReferenceAlias

ReferenceAlias Property SourceActor Auto Const
ReferenceAlias Property ReceivingActor Auto Const

ActorValue Property Health Mandatory Const Auto
ActorValue Property Oxygen Mandatory Const Auto
MiscObject Property Credits Mandatory Const Auto

Function ApplyUnityCharacter(Actor akSourceActor)
;take the data from the Source character and apply it to the Receiving character

    Actor ReceivingActorREF = ReceivingActor.GetActorRef()

    ;get all non-default actor values off the source actor
    ;(for now, just grabbing a couple to test)
    int myHealth = akSourceActor.GetValue(Health) as int
    int myOxygen = akSourceActor.GetValue(Oxygen) as int
    int myLevel = akSourceActor.GetLevel() as int
    ;need a way to grab Source Actor's name
    ;need a way to grab Source Actor's body/face data (GEN-297831)

    ReceivingActorREF.SetValue(Health, myHealth)
    ReceivingActorREF.SetValue(Oxygen, myOxygen)
    ;need a way to set an Actor's level
    ;need a way to set an Actor's name
    ;need a way to set Source Actor's body/face data (GEN-297831)

    ;clone this actor's inventory (just doing Credits for now)
    int myCredits = akSourceActor.GetItemCount(Credits)
    ReceivingActorREF.AddItem(Credits, myCredits)

    ;since we can't clone everything yet, transfer inventory over
    akSourceActor.RemoveAllItems(akTransferTo=ReceivingActorREF)
EndFunction

Event OnActivate(ObjectReference akActionRef)
    ;firing this off of a Button in a test cell for now, so whenever it gets activated
    ApplyUnityCharacter(SourceActor.GetActorRef())
EndEvent