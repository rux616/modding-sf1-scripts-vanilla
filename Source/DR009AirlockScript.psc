Scriptname DR009AirlockScript extends ObjectReference

Keyword property CosmeticDoorKeyword auto const mandatory
Keyword property InvisibleDoorKeyword auto const mandatory
Keyword property ArrivalTriggerVolumeKeyword auto const mandatory
Keyword property LinkedAirlockKeyword auto const mandatory
float property doorClosingSeconds auto const mandatory
float property WaitSeconds = 1.5 auto const mandatory

bool initialized = false
bool waitForPlayerArrival = false

event OnCellLoad()
	if(initialized == false)
        self.Init()

        DR009AirlockScript linkedAirlockScript = self.GetLinkedRef(LinkedAirlockKeyword) as DR009AirlockScript

        if(linkedAirlockScript != None)
            linkedAirlockScript.Init()
        endIf
    endIf
endEvent

function Init()
    initialized == true

    ObjectReference arrivalTriggerVolume = GetLinkedRef(ArrivalTriggerVolumeKeyword)

    if(arrivalTriggerVolume != None)
	    RegisterForRemoteEvent(arrivalTriggerVolume, "OnTriggerEnter")
    endIf
endFunction

event OnActivate(ObjectReference akActionRef)
    ObjectReference player = Game.GetPlayer()
	if(akActionRef == player)
        ObjectReference cosmeticDoor = self.GetLinkedRef(CosmeticDoorKeyword)
        ObjectReference invisibleDoor = self.GetLinkedRef(InvisibleDoorKeyword)
        DR009AirlockScript linkedAirlockScript = self.GetLinkedRef(LinkedAirlockKeyword) as DR009AirlockScript

        if(cosmeticDoor != None && invisibleDoor != None && linkedAirlockScript != None)
            cosmeticDoor.SetOpen(false)
            
            Utility.Wait(doorClosingSeconds)

            linkedAirlockScript.WaitForPlayerArrival()

            invisibleDoor.Activate(player)
        endIF
    endIf
endEvent

function WaitForPlayerArrival()
    waitForPlayerArrival = true
endFunction

event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    if(waitForPlayerArrival)
        waitForPlayerArrival = false

        ObjectReference cosmeticDoor = self.GetLinkedRef(CosmeticDoorKeyword)
        
        if(cosmeticDoor != None)
            Utility.Wait(WaitSeconds)

            cosmeticDoor.SetOpen(true)
        endIF
    endIf
endEvent