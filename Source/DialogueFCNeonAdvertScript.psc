Scriptname DialogueFCNeonAdvertScript extends ReferenceAlias

Scene[] Property AdvertScenes auto const
{ array of scenes we want to stop/start when the player is in Neon }

Location Property CityNeonLocation Auto Const Mandatory
{ autofill }

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    Debug.Trace(Self + " OnLocationChange: akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)

    if akOldLoc == CityNeonLocation
        ; if you leave Neon or go into a shop, stop any playing ad scenes
        UpdateScenes(false)
    elseif akNewLoc == CityNeonLocation
        UpdateScenes(true)
    EndIf
EndEvent

Guard sceneGuard ProtectsFunctionLogic

function UpdateScenes(bool bStart)
    LockGuard sceneGuard
        int i = 0
        while i < AdvertScenes.Length
            Scene theScene = AdvertScenes[i]
            if theScene
                if bStart
                    theScene.Start()
                Else
                    theScene.Stop()
                EndIf
            endif
            i += 1
        EndWhile
    EndLockGuard
EndFunction


