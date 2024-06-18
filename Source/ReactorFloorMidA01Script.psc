Scriptname ReactorFloorMidA01Script extends ObjectReference
{Script for the ReactorFloorMidA01 object.}

int property ReactorState = 0 Auto RequiresGuard(ReactorStateGuard)
{DEFAULT=0. The state of the Reactor. 0=Active, 1=Inactive, 2=Destroyed.}

;Local Consts
int CONST_ReactorState_Active = 0 Const
int CONST_ReactorState_Inactive = 1 Const
int CONST_ReactorState_Destroyed = 2 Const

String CONST_Animation_Active = "Play02" Const
String CONST_Animation_Inactive = "Play01" Const
int CONST_DestroyedStateDamage = 1000 Const

;Guards
Guard ReactorStateGuard

Event OnCellLoad()
	LockGuard(ReactorStateGuard)
		SetReactorState(ReactorState, True)
	EndLockGuard
EndEvent

Function SetReactorState(int newState, bool forceUpdate=False)
	LockGuard(ReactorStateGuard)
		if ((forceUpdate) || (newState != ReactorState))
			ReactorState = newState
			if (ReactorState == CONST_ReactorState_Active)
				ClearDestruction()
				if (Is3DLoaded())
					PlayAnimation(CONST_Animation_Active)
				EndIf
			ElseIf (ReactorState == CONST_ReactorState_Inactive)
				ClearDestruction()
				if (Is3DLoaded())
					PlayAnimation(CONST_Animation_Inactive)
				EndIf
			ElseIf (ReactorState == CONST_ReactorState_Destroyed)
				if (Is3DLoaded())
					DamageObject(CONST_DestroyedStateDamage)
				EndIf
			EndIf
		EndIf
	EndLockGuard
EndFunction