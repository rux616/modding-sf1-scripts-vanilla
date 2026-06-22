Scriptname SFBGS00D:SFBGS00DDR001ConveyorJunkScript extends ObjectReference
{Spawns (and cleans up) a continuous junk loop}

LeveledItem Property SFBGS00DDR001_ConveyorJunkList auto const mandatory
Int Property iMaxObjects = 60 auto const
{Max objects existing at once, when limit is reached the oldest object will be deleted each cycle}
Int Property iDelay = 3 auto const
{Delay between object spawns - and deletions when limit reached}

ObjectReference[] JunkArray

Event OnLoad()
    if(WaitFor3DLoad())
        JunkArray = new ObjectReference[iMaxObjects]
        StartTimer(iDelay)
    endif
EndEvent

Event OnTimer(int aiTimerID)
    JunkArray.Add(PlaceAtMe(SFBGS00DDR001_ConveyorJunkList))
    ;when max object limit reached, start trimming off the front of the array
    if(JunkArray.Length >= iMaxObjects)
        JunkArray[0].Delete()
        JunkArray.Remove(0)
    endif
    StartTimer(iDelay)
EndEvent

;clean up objects
Event OnUnload()
    CancelTimer()
    int i = 0
    while(i < JunkArray.Length)
        JunkArray[i].Delete()
        JunkArray[i] = None
        i+=1
    endwhile
EndEvent