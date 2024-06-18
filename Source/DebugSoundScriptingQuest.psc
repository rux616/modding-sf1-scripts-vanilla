Scriptname DebugSoundScriptingQuest extends Quest
{ Look up the WwiseEvent script on the wiki }

WwiseEvent Property EventForm1 Mandatory Const Auto   
{3D positional, loop.  Attenuation should start after a couple meters.}

WwiseEvent Property EventForm2 Mandatory Const Auto   
{2D positionless, loop.}

WwiseEvent Property EventForm3 Mandatory Const Auto
{3D positional, not looping.}

ReferenceAlias Property ThreeDPost_Switch_On Mandatory Const Auto
{3D event source}

Float Property GlobalRTPCValue1 Mandatory Const Auto
{Global RTPC Value1}

Float Property GlobalRTPCValue2 Mandatory Const Auto
{Global RTPC Value2}

Float Property InstanceRTPCValue1 Mandatory Const Auto
{Instance RTPC Value1}

Float Property InstanceRTPCValue2 Mandatory Const Auto
{Instance RTPC Value2}

Message Property TEST_SoundScriptingWarning Const Auto
{Warning messagebox}

string GlobalRTPCName = "Papyrus_Test_Global_RTPC" ;Should affect both sounds above in some obvious way (pitch?)
;float GlobalRTPCValue1 = 15.0
;float GlobalRTPCValue2 = 0.0
string InstanceRTPCName = "Papyrus_Test_Instance_RTPC" ;Should affect only one of the sounds above in some obvious way (volume?)
;float InstanceRTPCValue1 = 9.0
;float InstanceRTPCValue2 = 0.0
string GlobalStateGroup = "Papyrus_Test_Global_State" ;Should affect both sounds above in some obvious way, but maybe only when the sound starts?  (drive a Switch container?)
string GlobalStateName1 = "Papyrus_Global_State_01"
string GlobalStateName2 = "Papyrus_Global_State_02"
string InstanceSwitchGroup = "Papyrus_Test_Switch_Instance" ;Should affect only one of the sounds above in some obvious way, but maybe only when the sound starts?  (drive a Switch container?)
string InstanceSwitchName1 = "Papyrus_3D_Loop"
string InstanceSwitchName2 = "Papyrus_2D_Loop"


;Local vars
int eventInstance1 = 0
int eventInstance2 = 0

Function TriggerButtonBehavior(int iButtonIndex)
    
    ;Button 1 turns on the 3D positional audio
    if iButtonIndex == 1
        WwiseEvent.StopInstance(eventInstance1)   
        EventForm3.PlayAndWait(ThreeDPost_Switch_On.GetRef())
        eventInstance1 = EventForm1.Play(ThreeDPost_Switch_On.GetRef())

    ;Button 2 turns off the 3D positional audio
    elseif iButtonIndex == 2
        WwiseEvent.StopInstance(eventInstance1)

    ;Button 3 turns on the 2D nonpositional audio    
    elseif iButtonIndex == 3
        WwiseEvent.StopInstance(eventInstance2)   
        eventInstance2 = EventForm2.PlayUI() 

    ;Button 4 turns off the 2D nonpositional audio    
    elseif iButtonIndex == 4
        WwiseEvent.StopInstance(eventInstance2)

    ;Button 5 sets the SetGlobalRTPC to GlobalRTPCValue1
    elseif iButtonIndex == 5
        WwiseEvent.SetGlobalRTPC(GlobalRTPCName, GlobalRTPCValue1)

    ;Button 6 sets the SetGlobalRTPC to GlobalRTPCValue2
    elseif iButtonIndex == 6
        WwiseEvent.SetGlobalRTPC(GlobalRTPCName, GlobalRTPCValue2)

    ;Button 7 sets the GlobalStateGroup to GlobalStateName1
    elseif iButtonIndex == 7
        WwiseEvent.SetGlobalState(GlobalStateGroup, GlobalStateName1)

    ;Button 8 sets the GlobalStateGroup to GlobalStateName2
    elseif iButtonIndex == 8
        WwiseEvent.SetGlobalState(GlobalStateGroup, GlobalStateName2)

    ;Button 9 sets the InstanceRTPCName to InstanceRTPCValue1
    elseif iButtonIndex == 9
        WwiseEvent.UpdateInstanceRTPC(eventInstance2, GlobalRTPCName, InstanceRTPCValue1)

    ;Button 10 sets the InstanceRTPCName to InstanceRTPCValue2
    elseif iButtonIndex == 10
        WwiseEvent.UpdateInstanceRTPC(eventInstance2, GlobalRTPCName, InstanceRTPCValue2)

    ;Button 11 sets the InstanceSwitchGroup to InstanceSwitchName2
    elseif iButtonIndex == 11
        WwiseEvent.StopInstance(eventInstance2)
        WwiseEvent:WwiseSwitchParam[] switches = new WwiseEvent:WwiseSwitchParam[1]
        switches[0] = WwiseEvent.MakeNewWwiseSwitchParam(InstanceSwitchGroup, InstanceSwitchName2)
        eventInstance2 = EventForm2.PlayUI(switches)

    ;Button 12 sets the InstanceSwitchGroup to InstanceSwitchName1
    elseif iButtonIndex == 12
        WwiseEvent.StopInstance(eventInstance2)
        WwiseEvent:WwiseSwitchParam[] switches = new WwiseEvent:WwiseSwitchParam[1]
        switches[0] = WwiseEvent.MakeNewWwiseSwitchParam(InstanceSwitchGroup, InstanceSwitchName1)
        eventInstance2 = EventForm2.PlayUI(switches)

    else
        TEST_SoundScriptingWarning.Show(iButtonIndex)
    endif
EndFunction

