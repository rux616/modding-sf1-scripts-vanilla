;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC01_PostQuest_0010ACEE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Unlock bank doors and set levels to unlocked

Alias_BankFrontDoor.GetRef().Unlock()
Alias_BankFrontDoor.GetRef().SetLockLevel(0)
Alias_BankRearDoor.GetRef().Unlock()
Alias_BankRearDoor.GetRef().SetLockLevel(0)

;Restrain the robbers
Alias_JedBullock.GetActorRef().SetRestrained()
Alias_Robber02.GetActorRef().SetRestrained()
Alias_Robber03.GetActorRef().SetRestrained()
Alias_Robber04.GetActorRef().SetRestrained()
Alias_Robber05.GetActorRef().SetRestrained()
Alias_Robber06.GetActorRef().SetRestrained()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
; Disable bank robbers
FC01_BankRobbersEnableMarker.Disable()

; Disable barricades
FC01_EnableMarker.Disable()

; Disable Crowley's corpse if he's dead
if Alias_WilliamCrowley.GetActorRef().IsDead()
  ALias_WilliamCrowley.GetReference().Disable()
endif

; Give weapons back to the hostages
Alias_WilliamCrowley.GetActorRef().AddItem(lli_npc_unique, 2)
Alias_MarkoJansen.GetActorRef().AddItem(lli_npc_unique, 2)
Alias_ElizabethCardwell.GetActorRef().AddItem(lli_npc_unique, 2)

; Kill the dialogue holder quest
FC_JobsDoneSlateHolderQuest.SetStage(2000)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property CityAkilaCityLocation Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_JedBullock Auto Const Mandatory

ReferenceAlias Property Alias_Robber02 Auto Const Mandatory

ReferenceAlias Property Alias_Robber03 Auto Const Mandatory

ReferenceAlias Property Alias_Robber04 Auto Const Mandatory

ReferenceAlias Property Alias_Robber05 Auto Const Mandatory

ReferenceAlias Property Alias_Robber06 Auto Const Mandatory

ReferenceAlias Property Alias_BankFrontDoor Auto Const Mandatory

ReferenceAlias Property Alias_BankRearDoor Auto Const Mandatory

Scene Property FC01_PostQuest_MarkoSimoneScene Auto Const Mandatory

Scene Property FC01_PostQuest_ElizabethFrankScene Auto Const Mandatory

LeveledItem Property LLI_NPC_Unique Auto Const Mandatory

ReferenceAlias Property Alias_WilliamCrowley Auto Const Mandatory

ReferenceAlias Property Alias_MarkoJansen Auto Const Mandatory

ReferenceAlias Property Alias_ElizabethCardwell Auto Const Mandatory

ObjectReference Property FC01_EnableMarker Auto Const Mandatory

ObjectReference Property FC01_BankRobbersEnableMarker Auto Const Mandatory

Quest Property FC_JobsDoneSlateHolderQuest Auto Const Mandatory
