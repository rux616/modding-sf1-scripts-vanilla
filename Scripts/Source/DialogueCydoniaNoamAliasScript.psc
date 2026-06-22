Scriptname DialogueCydoniaNoamAliasScript extends ReferenceAlias

ActorValue Property Health Auto Const Mandatory

Event OnAliasInit()
    Actor myActor = GetActorRef()
	myActor.SetEssential(True)
	myActor.SetNoBleedoutRecovery(True)
	myactor.AllowBleedoutDialogue(True)
	Float fHealth = myActor.GetValue(Health)
	myActor.DamageValue(Health, fHealth + 100) 
EndEvent
