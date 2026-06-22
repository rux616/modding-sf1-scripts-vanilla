Scriptname FXScripts:ImpactFXOnAnimEvent extends ActiveMagicEffect
{Play an impact effect in response to an animation event.}

;Each attack needs and explosion, an anim event, and a location node. 
Struct ImpactRaycastDatum
    ImpactDataSet ImpactFX
    String sAnimEventName
    String sFXNodeName = "Root"
    float x = 0.0
    float y = 0.0
    float z = -1.0
    bool bUseNodeRotation = true
EndStruct

ImpactRaycastDatum[] Property ImpactRaycastList Auto Const Mandatory

float Property ImpactRecastDelay = 0.1 Auto Const 
float Property ImpactRange = 10.0 Auto Const
float Property ImpactRecastStopTime = 4.0 Auto Const 

ObjectReference ObjRef

;bool bPlayImpactEffects = false

;These are ID numbers, not times!
;int ImpactTimer = 5
;int ImpactStopTimer = 9

;float Xdir
;float Ydir
;float Zdir

;Loop through and register for all the required animation events.
Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    ObjRef = akCaster as ObjectReference
    int i = 0
     while (i < ImpactRaycastList.Length)
        RegisterForAnimationEvent(akCaster, ImpactRaycastList[i].sAnimEventName)
        i += 1
     endWhile
EndEvent

;Not actually needed, due to this being a magic effect, but it is good practice to unregister for things when we are done with them.
Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    int i = 0
     while (i < ImpactRaycastList.Length)
        UnRegisterForAnimationEvent(akCaster, ImpactRaycastList[i].sAnimEventName)
        i += 1
     endWhile
EndEvent

;When we get an event, see if the event is in our list, and trigger the impact from the correct location node.
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    PlayEffectFromListRecursive(ObjRef, ImpactRaycastList, asEventName, 0)
EndEvent


;Run the search until we find all instances of the anim event.
Function PlayEffectFromListRecursive(ObjectReference akSourceRef, ImpactRaycastDatum[] DataSet, String asAnimEvent, int aiStartIndex)
    int iFoundIndex = DataSet.FindStruct("sAnimEventName", asAnimEvent, aiStartIndex)
    if iFoundIndex >= 0
        ;Xdir = DataSet[iFoundIndex].x
        ;Ydir = DataSet[iFoundIndex].y
        ;Zdir = DataSet[iFoundIndex].z
        ;debug.trace("Trying to play an ImpactFX")
        ;StartTimer(ImpactRecastDelay, ImpactTimer)
        ;StartTimer(ImpactRecastStopTime, ImpactStopTimer)
        ;bPlayImpactEffects = true
        akSourceRef.PlayImpactEffect(DataSet[iFoundIndex].ImpactFX, DataSet[iFoundIndex].sFxNodeName, DataSet[iFoundIndex].x, DataSet[iFoundIndex].y, DataSet[iFoundIndex].z, ImpactRange, DataSet[iFoundIndex].bUseNodeRotation, false)
        ;We should keep checking, in case the same anim event name is used for another effect in the list.
        if (iFoundIndex >= 0) && (iFoundIndex + 1) < DataSet.length
            PlayEffectFromListRecursive(akSourceRef, DataSet, asAnimEvent, (iFoundIndex + 1))
        endif
    endif
EndFunction

;/ Event OnTimer(int aiTimerID)
    if aiTimerID == ImpactStopTimer
        bPlayImpactEffects = false
    endif
    if aiTimerID == ImpactTimer
        if bPlayImpactEffects == True
            ObjRef.PlayImpactEffect(ImpactRaycastList[0].ImpactFX, ImpactRaycastList[0].sFxNodeName, Xdir, Ydir, Zdir, ImpactRange, true, false)
            StartTimer(ImpactRecastDelay, ImpactTimer)
        endif
    endif
EndEvent /;
