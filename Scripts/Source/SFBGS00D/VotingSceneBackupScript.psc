Scriptname SFBGS00D:VotingSceneBackupScript extends ReferenceAlias

struct SceneQueueDatum
	int StageToStart
	int StageToStop
	ReferenceAlias RefToCheck
	Scene SceneToStop
	Scene SceneToStart
endStruct

Group Properties
	SceneQueueDatum[] Property SceneQueueData Auto Const Mandatory
EndGroup

Event OnTriggerEnter(ObjectReference akActionRef)
	int i = 0
	Quest pQuest = GetOwningQuest()
	while i < SceneQueueData.Length
		SceneQueueDatum theCurrentDatum = SceneQueueData[i]
		if akActionRef == theCurrentDatum.RefToCheck.GetRef()
			if pQuest.GetStageDone(theCurrentDatum.StageToStart) && !pQuest.GetStageDone(theCurrentDatum.StageToStop)
				theCurrentDatum.SceneToStop.Stop()
				theCurrentDatum.SceneToStart.Start()
			endif
		endif
		i += 1
	endwhile
EndEvent