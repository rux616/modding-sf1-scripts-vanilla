Scriptname POI026ShipCrashScript extends ObjectReference


ObjectReference Property ExplosionLocation Auto Const
Explosion Property ExplosionEffect Auto Const
ObjectReference Property EnableMarkerRef Auto Const

bool activateOnce = false


;Prototype script mock up for ship crash


Event OnTriggerEnter(ObjectReference akActionRef)
    if((akActionRef == Game.getplayer()) && (activateOnce==false))
    activateOnce = true
    ;Debug.Notification("Test1")
    ExplosionLocation.PlaceAtMe(ExplosionEffect)
    ;utility.wait(2)
    EnableMarkerRef.Enable()
    endIf
EndEvent

