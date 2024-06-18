Scriptname TestZachDungeon extends ObjectReference

ObjectReference[] property EntranceDoors auto
ObjectReference[] property StartMarkers auto
int TotalLength
int CurrentLength

Event OnInit()
    Reinit()        
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    debug.trace(self + " OnActivate akActionRef=" + akActionRef)
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ;arrays start at zero, length at 1?
    int r = Utility.RandomInt(0,(CurrentLength-1))
    ; move player to the randomly selected startpoint
    Game.GetPlayer().moveto(StartMarkers[r])
    ;sort the current startmarker to the end of the list
    Objectreference h = StartMarkers[r]
    StartMarkers.Remove(r)
    StartMarkers.Add(h)
    CurrentLength = CurrentLength - 1

    ;Every time I go through all of the spawnpoints, reset everything
    if (CurrentLength == 0)
        Reinit()
    EndIf
EndEvent

Function Reinit()
         int i = 0
         ;listen for the remote events of all possible doors
         While (i < EntranceDoors.Length)
            RegisterForRemoteEvent(EntranceDoors[i], "OnActivate")
            i += 1
         EndWhile
         TotalLength = StartMarkers.length
         CurrentLength = StartMarkers.length
EndFunction