Scriptname SFBGS00D:EC08RegisterDerelictShip extends ReferenceAlias

RefCollectionAlias Property DerelictShips Auto Const
Keyword Property DestroyShipWhenLoaded Auto Const Mandatory

Event OnInit()
    Debug.Trace("EC08: adding" + self.GetShipRef() + " to " + DerelictShips)
    DerelictShips.AddRef(self.GetShipRef())
EndEvent

Event OnLoad()
    ; Destroy ship if it has the correct keyword
    SpaceshipReference derelict = self.GetShipRef()
    if derelict.IsEnabled() && derelict.HasKeyword(DestroyShipWhenLoaded)
        ;Add a bit of random timing so that the ships don't all blow up at the same time.
        Utility.Wait(Utility.RandomFloat(0.0,2.0))
        derelict.KillSilent()
        Debug.Trace("Ship " + derelict + " destroyed after 3D was loaded.")
    EndIf
EndEvent