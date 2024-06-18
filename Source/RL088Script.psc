Scriptname RL088Script extends Quest

Cell Property RL088ArmoredStarship Mandatory Const Auto
ReferenceAlias Property LightsEnableMarker Auto Const
ReferenceAlias Property EngineRotationHelper Auto Const
WwiseEvent Property WwiseEvent_QST_RL088ArmoredShip_Power_Off Auto Const
WwiseEvent Property WwiseEvent_QST_RL088ArmoredShip_Power_On Auto Const
WwiseEvent Property WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn Auto Const
WwiseEvent Property WwiseEvent_AMB_RL088_SpinningMachine Auto Const
Quest Property MQ_TutorialQuest Const Auto

int gravTimerID = 10
Bool tutorialMSG
Bool  bGravityActive = true
int EngineinstanceID

Explosion Property RL088_NoVFXExplosion Const Auto
ObjectReference Property ExplosionXmarker Auto 

Function StartGravityCountdown(int minNum, int maxNum)
    StartTimer(Utility.RandomInt(minNum, maxNum), 10)
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == gravTimerID
        if Game.GetPlayer().GetParentCell() == RL088ArmoredStarship
            if bGravityActive
                DisableGravityAutoDuration()
            else
                EnableGravityAutoDuration()
            endif
        endif
    endif
EndEvent


Function EnableGravityAutoDuration()
    bGravityActive = true
    WwiseEvent_QST_RL088ArmoredShip_Power_On.Play(Game.GetPlayer())
    Game.ShakeCamera(afStrength = 0.2)
    Utility.Wait(2.0)
    Game.ShakeCamera()
    WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn.Play(Game.GetPlayer())
    LightsEnableMarker.getref().enable()
    Utility.Wait(0.3)
    LightsEnableMarker.getref().disable()
    Utility.Wait(0.3)
    LightsEnableMarker.getref().enable()
    RL088ArmoredStarship.SetGravityScale(1.0)
    SpeedRotationHelper()
    StartGravityCountdown(9,13)
EndFunction

Function DisableGravityAutoDuration()
    bGravityActive = false
    WwiseEvent_QST_RL088ArmoredShip_Power_Off.Play(Game.GetPlayer())
    Game.ShakeCamera(afStrength = 0.2)
    Utility.Wait(2.0)
    Game.ShakeCamera()
    WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn.Play(Game.GetPlayer())
    LightsEnableMarker.getref().disable()
    Utility.Wait(0.3)
    LightsEnableMarker.getref().enable()
    Utility.Wait(0.3)
    LightsEnableMarker.getref().disable()
    RL088ArmoredStarship.SetGravityScale(0.0)
    ExplosionXmarker.PlaceAtMe(RL088_NoVFXExplosion)
    if tutorialMSG == false
        MQ_TutorialQuest.SetStage(10)
    EndIf
    tutorialMSG = true
    SlowRotationHelper()
    StartGravityCountdown(12,15)
EndFunction

Function SpeedRotationHelper()
    EngineRotationHelper.getref().SetAnimationVariableFloat("Speed", 0.2)
    EngineRotationHelper.getref().PlayAnimation("RotateCW_Loop")
    EngineinstanceID = WwiseEvent_AMB_RL088_SpinningMachine.play(EngineRotationHelper.getref())
EndFunction

 Function SlowRotationHelper()
    EngineRotationHelper.getref().SetAnimationVariableFloat("Speed", 0.0)
    EngineRotationHelper.getref().PlayAnimation("RotateCW_Loop")
    WwiseEvent.StopInstance(EngineinstanceID) 
 EndFunction




