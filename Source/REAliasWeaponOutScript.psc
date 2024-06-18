Scriptname REAliasWeaponOutScript extends ReferenceAlias

REWeaponOutScript Property myScript Auto

Event OnAliasInit()
	Debug.Trace(self + "registering for custom event.")
	RegisterForCustomEvent(myScript, "OnWeaponAway")
Endevent

Event REWeaponOutScript.OnWeaponAway(REWeaponOutScript akSender, Var[] akArgs)
	Debug.Trace(self + "recieved custom event from" + akSender)
	;break AI out of 'Warn' interrupt so they can go back to non-hostile
	GetActorRef().EvaluatePackage()
EndEvent