Scriptname TestFormantSceneScript extends ReferenceAlias

Scene Property SceneToStop Auto
Scene Property MyScene Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	If akActionREF == Game.GetPlayer()
		SceneToStop.Stop()
		MyScene.Start()
	EndIf

EndEvent