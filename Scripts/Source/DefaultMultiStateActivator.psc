Scriptname DefaultMultiStateActivator extends ObjectReference Default Conditional
{Generic script for managing and maintaining the animation state of activators.}

Struct AnimationStateDatum
	String StateName
	{The name of this animation state. This is the name expected by SetAnimationState.}
	String StateJumpAnim01
	{Animation to snap to this state.}
	String StateJumpAnim02
	{Animation to snap to this state. Played following StateJumpAnim01.}
	String StateStartAnim01
	{Animation to transition to the state. If empty, StateJumpAnim01, if any, will be used instead.}
	String StateStartAnim02
	{Animation to transition to the state. If empty, StateJumpAnim02, if any, will be used instead.}

	bool EnableOverrideDisplayName
	{If True, use OverrideDisplayName.}
	Message OverrideDisplayName
	{If EnableOverrideDisplayName, change the display name to this.}
	bool EnableOverrideActivateText
	{If True, use OverrideActivateText.}
	Message OverrideActivateText
	{If EnableOverrideActivateText, change the activate message to this.}
	bool EnableBlockActivation
	{If True, use BlockActivation & BlockActivationHideText.}
	bool BlockActivation
	{If EnableBlockActivation, set Block Activation to this.}
	bool BlockActivationHideText
	{If EnableBlockActivation, set Block Activation's Hide Text to this.}
EndStruct

Group Base_Properties
	AnimationStateDatum[] property AnimationStateData Auto Const Mandatory
	{A list of the object's animation states.}
EndGroup

Group Reference_Properties
	String property StartStateName = "" Auto Const
	{The StateName of the animation state to start in. If "" (the default), this defaults to AnimationState[0].}
EndGroup

;Custom Events
CustomEvent DefaultMultiStateActivator_StateChanged
;Sent whenever the activator changes state. Args are [int-OldIndex],[String-OldStateName],[int-NewIndex],[String-NewStateName]

;Variables
int property CurrentStateIndex = 0 Auto Hidden Conditional RequiresGuard(SetAnimationStateGuard)
int currentAnimatedStateIndex = 0

;Guards
Guard SetAnimationStateGuard



;On first load, set our initial animation state.
Auto State Initial
	Event OnLoad()
		GoToState("Main")
		if (StartStateName == "")
			SetAnimationState(AnimationStateData[0].StateName)
		Else
			SetAnimationState(StartStateName)
		EndIf
	EndEvent
EndState

;On subsequent loads, make sure we're in the animation state we want to be in.
State Main
	Event OnLoad()
		LockGuard(SetAnimationStateGuard)
			Private_SetAnimationStateIndex(CurrentStateIndex, True)
		EndLockGuard
	EndEvent
EndState


Function SetAnimationState(String newStateName, bool shouldUseJumpAnims=False)
	;If the object is set to a new animation state prior to its first load, we don't want it to initialize to StartStateName.
	;Switch to the Main state to prevent that.
	GoToState("Main")
	LockGuard(SetAnimationStateGuard)
		int newStateIndex = AnimationStateData.FindStruct("StateName", newStateName)
		if (newStateIndex < 0)
			Debug.Trace("ERROR: " + Self + " was asked to change to state " + newStateName + ", but that state is not in its struct.", 2)
		Else
			Private_SetAnimationStateIndex(newStateIndex, shouldUseJumpAnims)
		EndIf
	EndLockGuard
EndFunction

Function Private_SetAnimationStateIndex(int newStateIndex, bool shouldUseJumpAnims=False) RequiresGuard(SetAnimationStateGuard)
	int oldStateIndex = CurrentStateIndex
	CurrentStateIndex = newStateIndex
	AnimationStateDatum currentStateData = AnimationStateData[CurrentStateIndex]

	if (Is3DLoaded())
		currentAnimatedStateIndex = CurrentStateIndex
		if (!shouldUseJumpAnims && (currentStateData.StateStartAnim01 != ""))
			PlayAnimation(currentStateData.StateStartAnim01)
		ElseIf (currentStateData.StateJumpAnim01 != "")
			PlayAnimation(currentStateData.StateJumpAnim01)
		EndIf
		if (!shouldUseJumpAnims && (currentStateData.StateStartAnim02 != ""))
			PlayAnimation(currentStateData.StateStartAnim02)
		ElseIf (currentStateData.StateJumpAnim02 != "")
			PlayAnimation(currentStateData.StateJumpAnim02)
		EndIf
	EndIf

	if (currentStateData.EnableOverrideDisplayName)
		SetOverrideName(currentStateData.OverrideDisplayName)
	EndIf
	if (currentStateData.EnableOverrideActivateText)
		SetActivateTextOverride(currentStateData.OverrideActivateText)
	EndIf
	if (currentStateData.EnableBlockActivation)
		BlockActivation(currentStateData.BlockActivation, currentStateData.BlockActivationHideText)
	EndIf
	;Notify watchers that the activator's state has changed.
	Var[] argsEvent = new Var[4]
	argsEvent[0] = oldStateIndex
	argsEvent[1] = AnimationStateData[oldStateIndex].StateName
	argsEvent[2] = newStateIndex
	argsEvent[3] = AnimationStateData[newStateIndex].StateName
	SendCustomEvent("DefaultMultiStateActivator_StateChanged", argsEvent)
EndFunction

String Function GetCurrentStateName()
	LockGuard(SetAnimationStateGuard)
		return AnimationStateData[CurrentStateIndex].StateName
	EndLockGuard
EndFunction