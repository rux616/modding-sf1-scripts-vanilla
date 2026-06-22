Scriptname CF02_RestartTourOnActivate extends ReferenceAlias

struct TourScene
  Scene sceneToStart
  int requiredStage
  int turnOffStage
endStruct

TourScene[] property TourScenes Auto Const Mandatory

int property DoneStage Auto Const Mandatory
{Scene to change to done state}

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		goToState("Done")
		Quest pQuest = GetOwningQuest()
		if pQuest.GetStageDone(DoneStage)
			return
		elseif akActionRef == Game.GetPlayer()
			int i = 0
			while i < TourScenes.Length
				TourScene TourSceneData = TourScenes[i]
				if pQuest.GetStageDone(TourSceneData.requiredStage) && !pQuest.GetStageDone(TourSceneData.turnOffStage) && !TourSceneData.sceneToStart.IsPlaying()
					TourSceneData.sceneToStart.Start()
                    goToState("Waiting")
					return
				endif
				i += 1
			endwhile
		endif
		goToState("Waiting")
	EndEvent
endSTATE

State Done
endState
