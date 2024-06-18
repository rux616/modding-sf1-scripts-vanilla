Scriptname FCRQuestScript extends Quest

GlobalVariable Property FCRMissionCounter Auto Const Mandatory
Quest Property FCR01 Auto Const Mandatory

; Called when a FC radiant mission is complete
Function FCRMissionComplete()
    FCRMissionCounter.Mod(1)    ; Increment the counter

    ; Every three missions you do - you get a chance to kill a Crime Boss
    if ( FCRMissionCounter.GetValue() >= 3 && !FCR01.IsRunning() )
        FCR01.Start()                       ; Then start up "One Riot, One Ranger"
        FCRMissionCounter.SetValue(0)       ; And reset the counter to 0
    EndIf
EndFunction

