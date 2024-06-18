Scriptname FXScripts:FXSetBoundSizeActorValue extends ActiveMagicEffect
{Script for play a visual effect that connects one actor to another.}

;======================================================================================;
;  PROPERTIES  /
;=============/

ActorValue property VFXActorBoundSize Auto
Float property ScaleFactor = 2.002200 auto 
{Scale Value to modify bound volume.  Default will result in ~1.0 for human NPC}
;======================================================================================;
;  VARIABLES   /
;=============/

;======================================================================================;
;  EVENTS      /
;=============/


Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    Float x = akTarget.GetWidth()
    Float y = akTarget.GetLength()
    Float z = akTarget.GetHeight()
    Float Volume = ((X*X)+(Y*Y)+(Z*Z))
    Float Diagonal = math.sqrt(Volume)
    Debug.Trace("VFXActorBound is " + Diagonal)
    akTarget.SetValue(VFXActorBoundSize, (Diagonal / ScaleFactor))
    Debug.Trace("VFXActorBound Scaled is " + (Diagonal / ScaleFactor))
EndEvent


