Scriptname RL082PlatformHelper extends ObjectReference
{Script aniamting packages back and forth in third warehouse area}

WwiseEvent Property WwiseEvent_AMB_RL083_MovingRailHook Auto Const
float fposition = 1.0
int CraneIinstanceID

Event OnCellLoad()
  if Is3DLoaded()
    StartTimer(0.1)
  endif
EndEvent

Event OnTimer(int aiTimerID)		
  Debug.Trace(self + "Timer ended! Do some cool stuff now...")
  
  ;Send Object Across
  SetAnimationVariableFloat("Speed", Utility.RandomFloat(0.1, 0.15))
  SetAnimationVariableFloat("Position", fposition)
  CraneIinstanceID = WwiseEvent_AMB_RL083_MovingRailHook.Play(GetLinkedRef())
  if PlayAnimationAndWait("Play01","done")
    WwiseEvent.StopInstance(CraneIinstanceID) 
  endif

  if fposition == 1.0
    fposition = 0.0
  Else
      fposition = 1.0
  endif
  if Is3DLoaded()
    StartTimer(Utility.RandomFloat(4, 7))
  endif
EndEvent