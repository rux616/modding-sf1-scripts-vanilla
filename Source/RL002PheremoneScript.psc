Scriptname RL002PheremoneScript extends ActiveMagicEffect


Faction Property FactionName Auto Const Mandatory


EVENT OnEffectStart(Objectreference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
  akCaster.AddToFaction(FactionName)
  akCaster.StopCombat()

 Debug.Notification("start")
 ImageSpaceStart.Apply()

Utility.Wait(15)
Debug.Notification("EFFECT ENDING SOON")
Debug.Notification("EFFECT ENDING SOON")
Debug.Notification("EFFECT ENDING SOON")


Utility.Wait(5)


   Debug.Notification("end")
 ImageSpaceStart.Remove()
  ImageSpaceEnd.Apply()
  akCaster.RemoveFromFaction(FactionName)
ENDEVENT



EVENT OnEffectFinish(Objectreference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
   Debug.Notification("end")
  akCaster.RemoveFromFaction(FactionName)
ENDEVENT
Float Property duration Auto Const

ImageSpaceModifier Property ImageSpaceEnd Auto Const

ImageSpaceModifier Property ImageSpaceStart Auto Const
