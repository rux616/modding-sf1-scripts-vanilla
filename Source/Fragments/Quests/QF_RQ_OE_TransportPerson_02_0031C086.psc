;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_OE_TransportPerson_02_0031C086 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE RQ_TransportPersonScript
Quest __temp = self as Quest
RQ_TransportPersonScript kmyQuest = __temp as RQ_TransportPersonScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDialogueAV_Hello_None()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)
kmyquest.AddPassengers(Alias_Actors)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE RQ_TransportPersonScript
Quest __temp = self as Quest
RQ_TransportPersonScript kmyQuest = __temp as RQ_TransportPersonScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AgreeToTransportPassenger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0285_Item_00
Function Fragment_Stage_0285_Item_00()
;BEGIN AUTOCAST TYPE RQ_TransportPersonScript
Quest __temp = self as Quest
RQ_TransportPersonScript kmyQuest = __temp as RQ_TransportPersonScript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(100) && !IsObjectiveCompleted(100)
    SetObjectiveFailed(100)
endif
kmyquest.SetDialogueAV_PrimaryObjectiveFail()
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN AUTOCAST TYPE RQ_TransportPersonScript
Quest __temp = self as Quest
RQ_TransportPersonScript kmyQuest = __temp as RQ_TransportPersonScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()
kmyquest.SetDialogueAV_Hello_DepartingShip()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN AUTOCAST TYPE RQ_TransportPersonScript
Quest __temp = self as Quest
RQ_TransportPersonScript kmyQuest = __temp as RQ_TransportPersonScript
;END AUTOCAST
;BEGIN CODE
SetStage(990)
kmyquest.SetDialogueAV_Hello_Calm_Success()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_Actors Auto Const
