;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_OE_Deliver_01_00043278 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE RQ_DeliverScript
Quest __temp = self as Quest
RQ_DeliverScript kmyQuest = __temp as RQ_DeliverScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(400)
Alias_Recipient.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0485_Item_00
Function Fragment_Stage_0485_Item_00()
;BEGIN AUTOCAST TYPE RQ_DeliverScript
Quest __temp = self as Quest
RQ_DeliverScript kmyQuest = __temp as RQ_DeliverScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyquest.SetDialogueAV_PrimaryObjectiveFail()
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Item.GetReference())
Actor recipient = Alias_Recipient.GetActorRef()
recipient.ChangeAnimArchetype(AnimArchetypeDepressed)

SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
Alias_Recipient.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
CompleteAllObjectives()
setStage(990)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Item Auto Const Mandatory

ReferenceAlias Property Alias_Recipient Auto Const Mandatory

Keyword Property AnimArchetypeDepressed Auto Const Mandatory
