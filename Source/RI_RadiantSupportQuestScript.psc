Scriptname RI_RadiantSupportQuestScript extends Quest Conditional

GlobalVariable Property RI_MBQuestCount Auto Const Mandatory
GlobalVariable Property RI_NPCRadiantAvailable Auto Const Mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const Mandatory

Quest Property RI_RadiantPointerQuest Auto Const Mandatory
Int Property iStartStage = 10 Auto Const

Keyword Property RI_RadiantQuestStartKeyword Auto Const Mandatory

Int Property iCurrentMBCount Auto Conditional

; On quest initialize, random roll to see how many MB quests will be required
; to be completed for an NPC given radiant to become available.
Event OnQuestInit()
    ResetMBCount()
EndEvent

; Function called on quest init or when radiant quest is completed.
Function ResetMBCount()
    Int iMBCount = Utility.RandomInt(3, 5)
    RI_MBQuestCount.SetValueInt(iMBCount)
    RI_NPCRadiantAvailable.SetValue(0)
EndFunction

; Function called when a MB quest is completed in Stage 100:
; MB_Hack01_RIR01 / MB_PlantEvidence01_RIR02 / MB_Sabotage01_RIR04
Function MBCompleted()

    iCurrentMBCount = iCurrentMBCount + 1

    ; If the current count matches the random roll, 
    ; set up an NPC given radiant to be available.
    If iCurrentMBCount >= RI_MBQuestCount.GetValueInt() && RI_NPCRadiantAvailable.GetValue() == 0
        RI_NPCRadiantAvailable.SetValue(1)
    ;    RI_RadiantPointerQuest.SetStage(iStartStage)
        RI_RadiantQuestStartKeyword.SendStoryEvent()
        iCurrentMBCount = 0
    EndIf
         
EndFunction

; Handling for lock/block and unlock/unblocking vent doors in Ryujin Tower
RefCollectionAlias Property VentDoors Auto Const Mandatory

Function LockVentDoors()

    Int TotalVentDoors = VentDoors.GetCount()
    Int Current = 0

    While (Current < TotalVentDoors)
        
        ObjectReference ChosenRef = VentDoors.GetAt(Current)
        ChosenRef.Lock()
        ChosenRef.SetLockLevel(254)
        Current += 1

    EndWhile

EndFunction

Function UnlockVentDoors()

    Int TotalVentDoors = VentDoors.GetCount()
    Int Current = 0

    While (Current < TotalVentDoors)
        
        ObjectReference ChosenRef = VentDoors.GetAt(Current)
        ChosenRef.Unlock()
        Current += 1

    EndWhile

EndFunction

; Handling for Mod_Player_Bounty perk entry to track when the players are getting bounties in specific locations.

Function BountyReceived(Quest myQuest)
Debug.Trace(Self + "RI_CRIME: Quest: " + myQuest + ": Bounty Received custom function called")
    (myQuest as RI_CrimeTrackingQuestScript).iBountiesGained += 1
EndFunction

