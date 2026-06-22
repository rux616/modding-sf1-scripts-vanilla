Scriptname RL064FreezeTestScript extends ObjectReference

;Test script for a canister that will melt or hyper freeze ice. Quick prototype that will scale objects to appear as ice is melting or growing.

ObjectReference Property IceLinked Auto
{Linked ref from Canister to ice}

Explosion Property fragGrenadeExplosion Auto Const
{Test Explosion that triggers on hit}

Keyword Property RL064_Freeze Auto Const
{Keyword on linked ref to tell that ice should freeze}

Keyword Property RL064_Melt Auto Const
{Keyword on linked ref to tell that ice should melt}

Bool Property isFreeze Auto
{If True, ice will freeze. If false, ice will melt}

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self)
    
    ;Checking for linked ref keyword to determin whterh ice needs to be freezed or melted.
    if self.GetLinkedRef(RL064_Freeze)
      IceLinked = GetLinkedRef(RL064_Freeze)
      isFreeze = true
    endif
    if self.GetLinkedRef(RL064_Melt)
      IceLinked = GetLinkedRef(RL064_Melt)
      isFreeze = false
    endif
	
  EndIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
  Debug.Trace(akTarget + " was hit by " + akAggressor)
  self.PlaceAtMe(fragGrenadeExplosion)
  
  ;Determining whether to freeze or melt ice
  if isFreeze == True
    FreezeIce()
  EndIf
  if isFreeze == False
    MeltIce()
  EndIf

EndEvent

Function FreezeIce()
  ;Enables ice object and scales is up over time.
    float currentScale = IceLinked.GetScale()
    IceLinked.Enable()
    IceLinked.SetScale(0.1)

    while currentScale <= 0.45
        Utility.Wait(0.1)
        IceLinked.SetScale(currentScale * 1.2)
        currentScale = IceLinked.GetScale()
    EndWhile

    IceLinked.SetScale(0.5)
    UnregisterForAllHitEvents()
 EndFunction 

 Function MeltIce()
  ;Scales down ice object over time, then diables ice to appear as if it is melting.
    float currentScale = IceLinked.GetScale()
    
    while currentScale >= 0.1
        Utility.Wait(0.1)
        IceLinked.SetScale(currentScale * 0.9)
        currentScale = IceLinked.GetScale()
    EndWhile
    
    IceLinked.Disable()
    UnregisterForAllHitEvents()
EndFunction 

