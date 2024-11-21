;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS003:Fragments:Quests:QF_Patch_Update7_1_SFBGS003_FD00FFDF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Refreshes the player's bounty totals.
SFBGS003_DialogueTAHQ.UpdateCurrentInstanceGlobal(SFBGS003_Bounties_Total)

; Stops any currently running Bounty Scanner quests to prevent issues
SFBGS003_BountyScannerQuest.Stop()
SFBGS003_BountyScannerQuest00.Stop()
SFBGS003_BountyScannerQuest01.Stop()
SFBGS003_BountyScannerQuest02.Stop()
SFBGS003_BountyScannerQuest03.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFBGS003_DialogueTAHQ Auto Const Mandatory

GlobalVariable Property SFBGS003_Bounties_Total Auto Const Mandatory

Quest Property SFBGS003_BountyScannerQuest Auto Const Mandatory

Quest Property SFBGS003_BountyScannerQuest00 Auto Const Mandatory

Quest Property SFBGS003_BountyScannerQuest01 Auto Const Mandatory

Quest Property SFBGS003_BountyScannerQuest02 Auto Const Mandatory

Quest Property SFBGS003_BountyScannerQuest03 Auto Const Mandatory
