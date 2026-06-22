Scriptname FXScripts:FXPlaceExplosionOnAnimScript extends ActiveMagicEffect
{This script places explosions at specific locations on an actor when the specified animation events are called.  For use with AOE attacks.}

;Each attack needs and explosion, an anim event, and a location node. 
Struct AreaAttackDatum
    Explosion ExplosionEffect
    String sAnimEventName
    String sFXNodeName
EndStruct

AreaAttackDatum[] Property AttackData Auto Const Mandatory

;Loop through and register for all the required animation events.
Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    int i = 0
     while (i < AttackData.Length)
        RegisterForAnimationEvent(akCaster, AttackData[i].sAnimEventName)
        i += 1
     endWhile
EndEvent

;Not actually needed, due to this being a magic effect, but it is good practice to unregister for things when we are done with them.
Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    int i = 0
     while (i < AttackData.Length)
        UnRegisterForAnimationEvent(akCaster, AttackData[i].sAnimEventName)
        i += 1
     endWhile
EndEvent

;When we get an event, see if the event is in our list, and place the respective explosion at the correct location node.
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    PlayEffectFromListRecursive(akSource, AttackData, asEventName, 0)
EndEvent


;Run the search until we find all instances of the anim event.
Function PlayEffectFromListRecursive(ObjectReference akSourceRef, AreaAttackDatum[] DataSet, String asAnimEvent, int aiStartIndex)
    int iFoundIndex = DataSet.FindStruct("sAnimEventName", asAnimEvent, aiStartIndex)
    if iFoundIndex >= 0
        akSourceRef.placeatNode(DataSet[iFoundIndex].sFxNodeName, DataSet[iFoundIndex].ExplosionEffect)
        
        ;We should keep checking, in case the same anim event name is used for another effect in the list.
        if (iFoundIndex >= 0) && (iFoundIndex + 1) < DataSet.length
            PlayEffectFromListRecursive(akSourceRef, DataSet, asAnimEvent, (iFoundIndex + 1))
        endif
    endif
EndFunction



;Backup of original OnAnimationEvent in case the recursion idea is considered overkill.

;/
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    AreaAttackDatum FoundAttackDatum = AttackData[AttackData.FindStruct("sAnimEventName", asEventName)]
    akSource.placeatNode(FoundAttackDatum.sFxNodeName, FoundAttackDatum.ExplosionEffect)
EndEvent
/;