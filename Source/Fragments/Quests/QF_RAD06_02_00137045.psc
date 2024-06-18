;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RAD06_02_00137045 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE rad06script
Quest __temp = self as Quest
rad06script kmyQuest = __temp as rad06script
;END AUTOCAST
;BEGIN CODE
; Set up the resource, quantity, and reward for the quest
kmyQuest.InitResource()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if ( !GetStageDone(100) )
  SetObjectiveDisplayed(50)
endif

; Tracks whether you've heard about the job before
;   (Checked in the Top Level intro)
if ( RAD06_KA_Job.GetValue() == 0 )
  RAD06_KA_Job.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE rad06script
Quest __temp = self as Quest
rad06script kmyQuest = __temp as rad06script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

; Add the appropriate data slate
Actor pPlayer = Game.GetPlayer()
ObjectReference oItem = pPlayer.PlaceAtMe(RAD06_Trident_Dataslate)
Alias_ContractSlate.ForceRefTo(oItem)
pPlayer.AddItem(oItem)

; Make it so the first time pointer no longer enters
RAD06_KA_Job.SetValue(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor pPlayer = Game.GetPlayer()

; Remove the Contract Slate
pPlayer.RemoveItem(RAD06_Trident_Dataslate, 1, TRUE)

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8800_Item_00
Function Fragment_Stage_8800_Item_00()
;BEGIN CODE
; The quest wasn't accepted - so close it out
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory

Book Property RAD06_Trident_Dataslate Auto Const Mandatory

ReferenceAlias Property Alias_ContractSlate Auto Const Mandatory

MiscObject Property InorgExoticPlutonium Auto Const Mandatory

GlobalVariable Property RAD06_CurrentResource Auto Const Mandatory

GlobalVariable Property RAD06_KA_Job Auto Const Mandatory

GlobalVariable Property RAD06_CurrentReward Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory
