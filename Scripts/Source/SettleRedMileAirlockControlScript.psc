Scriptname SettleRedMileAirlockControlScript extends ObjectReference
;A switch outside teleports the player inside then the inner doors on the interior airlock 
;opens via this script. And closes when the player leaves. 
ObjectReference Property InsideFrontDoor Mandatory Const Auto  
ObjectReference Property InsideCourseDoor Mandatory Const Auto   

Event OnCellLoad()
    
    int openStateFrontDoor = InsideFrontDoor.GetOpenState()
    int openStateCourseDoor = InsideCourseDoor.GetOpenState()

    ;Waits for the door animations to finish closing if they are doing so already
    While (openStateCourseDoor == 4 || openStateFrontDoor == 4)
        Utility.Wait(0.1)
        openStateFrontDoor = InsideFrontDoor.GetOpenState()
        openStateCourseDoor = InsideCourseDoor.GetOpenState()
    EndWhile
    
    ;Opens the inner airlock doors.
    InsideFrontDoor.SetOpen(true)
    InsideCourseDoor.SetOpen(true)  
    

EndEvent

Event OnCellDetach()
    ; Sets the doors to closed when the player leaves via one of the two airlocks. 
    ;TODO - GEN-339222 - Change to SetOpen with snap.
    InsideFrontDoor.SetOpen(false)
    InsideCourseDoor.SetOpen(false)
EndEvent


