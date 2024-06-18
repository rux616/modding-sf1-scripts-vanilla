Scriptname RL089PoisonPodScript extends ObjectReference Const

ObjectReference Property myCollision Mandatory Const Auto
ObjectReference Property myPoison Mandatory Const Auto
ObjectReference Property myPoisonEffect01 Mandatory Const Auto
ObjectReference Property myPoisonEffect02 Mandatory Const Auto
ObjectReference Property myTreePlatform Const Auto
ObjectReference Property myTreePlatformCollision Const Auto

Event OnLoad()
    Utility.Wait(2)
    myTreePlatform.SetScale(0.05)
    myTreePlatformCollision.Disable()
    RegisterForHitEvent(myCollision)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    ShrinkPod()
EndEvent

Function ShrinkPod()
;float random = Utility.RandomFloat(3.0, 6.0)
    myPoison.Disable()
    myPoisonEffect01.Disable()
    myPoisonEffect02.Disable()
    myCollision.Disable()
    self.SetScale(0.1)
    Utility.Wait(3)
    TreeGrowThenDie()
EndFunction

Function TreeGrowThenDie()
    myTreePlatform.SetScale(0.2)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.3)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.4)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.5)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.6)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.7)
    myTreePlatformCollision.Enable()
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.8)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.9)
    utility.Wait(0.05)
    myTreePlatform.SetScale(1)
    Utility.Wait(6)
    self.SetScale(0.2)
    utility.Wait(0.1)
    self.SetScale(0.3)
    utility.Wait(0.1)
    self.SetScale(0.4)
    utility.Wait(0.1)
    self.SetScale(0.5)
    myPoison.Enable()
    myPoisonEffect01.Enable()
    myPoisonEffect02.Enable()
    myCollision.Enable()
    RegisterForHitEvent(myCollision)
    Utility.Wait(4.5)
    myTreePlatform.SetScale(0.8)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.6)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.4)
    myTreePlatformCollision.Disable()
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.2)
    utility.Wait(0.05)
    myTreePlatform.SetScale(0.05)
EndFunction

    