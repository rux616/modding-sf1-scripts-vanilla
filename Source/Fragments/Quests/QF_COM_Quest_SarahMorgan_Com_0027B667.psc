;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_SarahMorgan_Com_0027B667 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;"lock in" companion to prevent player dismissing them:
SQ_Companions.LockInCompanion(Alias_SarahMorgan.GetActorReference() as CompanionActorScript, TextReplaceActivator = COM_CQ_TxtReplace_QuestName_SarahMorgan)

SetStage(10)

;MOVE AJA INTO POSITION:
Actor myAja = Alias_AjaMamasa.GetActorRef()
myAja.MoveTo(Alias_AjaMarker.GetRef())
myAja.Enable()


If Alias_SarahMorgan.GetActorRef().GetValue(COM_MEM_SarahMorgan_CommitmentMother) == 1
	SetStage(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
ObjectReference myAbigail = Alias_AbigailMorgan.GetActorRef()
myAbigail.Enable()
myAbigail.MoveTo(Alias_AbigailMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaMarker.GetRef())
Alias_AbigailMorgan.GetActorRef().MoveTo(Alias_AbigailMarker.GetRef())
Alias_SarahMorgan.GetActorRef().MoveTo(Alias_SarahMarker.GetRef())

Game.GetPlayer().MoveTo(Alias_PlayerMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(30)

Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaMarker.GetRef())

If GetStageDone(1)
	Actor myAbigail = Alias_AbigailMorgan.GetActorRef()
	myAbigail.Enable()
	myAbigail.MoveTo(Alias_AbigailMarker.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)

;If Abigail is present, give the objective to speak with her first.
;If not, just talk to Aja.
If GetStageDone(1)
	SetStage(35)
Else
	SetStage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(35)
	SetObjectiveCompleted(35)
EndIf

SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
COM_Quest_SarahMorgan_Commitment_PreCeremony.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

Alias_SarahMorgan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE COMQuestSarahMorganCommitmentScript
Quest __temp = self as Quest
COMQuestSarahMorganCommitmentScript kmyQuest = __temp as COMQuestSarahMorganCommitmentScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(60)

;"release the lock" companion to allow player dismissing them:
SQ_Companions.LockInCompanion(Alias_SarahMorgan.GetActorReference() as CompanionActorScript, LockedIn = false)

((kmyquest as quest) as COM_COmmitmentQuestScript).MakeCommitted()

;Starts the scripting to clean up Abigail after she "leaves" in 3 weeks
kmyQuest.StartAbigailLeave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaPostCeremonyMarker.GetRef())

If GetStageDone(1)
	Alias_AbigailMorgan.GetActorRef().MoveTo(Alias_AbigailPostCeremonyMarker.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
Alias_AbigailMorgan.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property COM_Quest_SarahMorgan_Commitment_PreCeremony Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

ReferenceAlias Property Alias_AjaMamasa Auto Const Mandatory

ReferenceAlias Property Alias_AbigailMorgan Auto Const Mandatory

ActorValue Property COM_MEM_SarahMorgan_CommitmentMother Auto Const Mandatory

ReferenceAlias Property Alias_SarahMarker Auto Const Mandatory

ReferenceAlias Property Alias_AjaMarker Auto Const Mandatory

ReferenceAlias Property Alias_AbigailMarker Auto Const Mandatory

ReferenceAlias Property Alias_AjaPostCeremonyMarker Auto Const Mandatory

ReferenceAlias Property Alias_AbigailPostCeremonyMarker Auto Const Mandatory

ReferenceAlias Property Alias_PlayerMarker Auto Const Mandatory

sq_companionsscript Property SQ_Companions Auto Const Mandatory

Activator Property COM_CQ_TxtReplace_QuestName_SarahMorgan Auto Const Mandatory
