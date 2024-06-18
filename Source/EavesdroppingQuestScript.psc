Scriptname EavesdroppingQuestScript extends Quest
{Quest script for eavesdropping quests based on EavesdroppingTemplate.}

Group QuestProperties
	Scene property EavesdroppingScene Auto Const Mandatory
	{The Eavesdropping Scene.}
	
	ReferenceAlias[] property SceneAliases Auto Const Mandatory
	{Array of actor aliases involved in the Eavesdropping Scene.}
EndGroup

Group AutofillProperties CollapsedOnBase
	ActorValue property DMP_EavesdroppingSceneComplete Auto Const Mandatory
EndGroup


Event OnQuestInit()
	;All of the actor aliases on the quest are Optional. If any of them have failed to fill
	;(probably because an actor is dead), we abort, set our completed actor values so the actor
	;can get on with their post-scene packages, and shut down.
	bool anySceneAliasDead
	int i = 0
	While ((!anySceneAliasDead) && (i < SceneAliases.Length))
		anySceneAliasDead = (SceneAliases[i].GetRef() == None)
		i = i + 1
	EndWhile
	if (anySceneAliasDead)
		;Abort, set actor values, and shut down.
		ShutdownQuest()
	Else
		;If all of the aliases are filled, start the scene.
		RegisterForRemoteEvent(EavesdroppingScene, "OnEnd")
		EavesdroppingScene.Start()
	EndIf
EndEvent

;When the scene has finished, shut down the quest.
Event Scene.OnEnd(Scene akSource)
	ShutdownQuest()
EndEvent

;Called by OnQuestInit, above, to abort the quest, or by the scene when it finishes.
;Set the DMP_EavesdroppingSceneComplete actor value on all of the actors in the scene,
;allowing them to proceed with their normal packages, then stop the quest.
Function ShutdownQuest()
	int i = 0
	While (i < SceneAliases.Length)
		SceneAliases[i].TryToSetValue(DMP_EavesdroppingSceneComplete, 1)
		i = i + 1
	EndWhile
	Stop()
EndFunction