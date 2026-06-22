Scriptname CFCredTankScript extends ObjectReference
{Activator script for CF_CredTanks.}

Group Optional_SetStageProperties
	Quest property QuestToSetStageOn Auto Const
	{OPTIONAL. Quest to set a stage on when the CredTank is opened.}

	int property StageToSet = -1 Auto Const
	{OPTIONAL. Stage to set.}

	int property PrereqStage = -1 Auto Const
	{OPTIONAL. If set, StageToSet will only be set if this stage has been set.}

	int property TurnOffStage = -1 Auto Const
	{OPTIONAL. If set, StageToSet will not be set if the quest is at this stage or higher.}

	int property TurnOffStageDone = -1 Auto Const
	{OPTIONAL. If set, StageToSet will not be set if this specific stage has been set.}
EndGroup

Group AutofillProperties
	Key property CF_GalbankTransferModule Auto Const Mandatory
	LeveledItem property LL_CFCredtankCredits Auto Const Mandatory
EndGroup

;Local Consts
String CONST_Animation_Insert = "Play01" Const
String CONST_Animation_Remove = "Play02" Const
String CONST_AnimVariable_Position = "Position" Const
String CONST_AnimVariable_Speed = "Speed" Const

float CONST_UpdateTimerDelay = 0.25 Const
float CONST_AnimVariableSpeedMax = 10.0 Const
float CONST_CredTankProximityMaxRange = 20.0 Const
float CONST_CredTankProximityMinRange = 8.0 Const

;Guards
Guard UpdateCredTankGuard ProtectsFunctionLogic


Auto State Waiting
	Event OnCellLoad()
		if (Game.GetPlayer().GetItemCount(CF_GalbankTransferModule) > 0)
			RegisterForDistanceLessThanEvent(Game.GetPlayer(), Self, CONST_CredTankProximityMaxRange)
			BlockActivation(False, False)
		Else
			BlockActivation(True, True)
		EndIf
	EndEvent

	Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
		StartTimer(0)
	EndEvent

	Event OnTimer(int timerID)
		float newPosition = 1 - Math.Min(Math.Max(Math.Max(Game.GetPlayer().GetDistance(Self) - CONST_CredTankProximityMinRange, 0) / (CONST_CredTankProximityMaxRange - CONST_CredTankProximityMinRange), 0), 1)
		;Debug.Trace(Self + " position=" + newPosition)
		SetAnimationVariableFloat("Position", newPosition)
		if (newPosition > 0)
			StartTimer(CONST_UpdateTimerDelay)
		Else
			RegisterForDistanceLessThanEvent(Game.GetPlayer(), Self, CONST_CredTankProximityMaxRange)
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		GoToState("Done")
		SetAnimationVariableFloat(CONST_AnimVariable_Position, 1)
		PlayAnimationAndWait(CONST_Animation_Insert, "Done")
		Utility.Wait(2)
		Game.GetPlayer().AddItem(LL_CFCredtankCredits)
		if ((QuestToSetStageOn != None) && (StageToSet >= 0))
			if (((PrereqStage < 0) || (QuestToSetStageOn.GetStageDone(PrereqStage))) && \
				((TurnOffStage < 0) || (QuestToSetStageOn.GetStage() < TurnOffStage)) && \
				((TurnOffStageDone < 0) || (!QuestToSetStageOn.GetStageDone(TurnOffStageDone))))
				QuestToSetStageOn.SetStage(StageToSet)
			EndIf
		EndIf
		PlayAnimation(CONST_Animation_Remove)
		SetAnimationVariableFloat(CONST_AnimVariable_Speed, CONST_AnimVariableSpeedMax)
		SetAnimationVariableFloat(CONST_AnimVariable_Position, 0)
		BlockActivation(True, True)
	EndEvent
EndState

State Done
EndState

Function ResetCredTank()
	GoToState("Waiting")
	OnCellLoad()
EndFunction