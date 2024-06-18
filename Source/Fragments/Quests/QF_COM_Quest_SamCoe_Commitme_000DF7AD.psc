;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_SamCoe_Commitme_000DF7AD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Setup
Alias_CoraCoe.GetActorRef().MoveTo(Commitment_SamCoe_Marker_RoundUp_Cora)
Alias_CoraCoe.GetActorRef().EvaluatePackage()

Game.GetPLayer().MoveTo(Commitment_SamCoe_PLayer_Start_Marker)
SetStage(100)
SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;"lock in" companion to prevent player dismissing them:
SQ_Companions.LockInCompanion(Alias_SamCoe.GetActorReference() as CompanionActorScript, TextReplaceActivator = COM_CQ_TxtReplace_QuestName_SamCoe)

SetObjectiveDisplayed(100)

Alias_CoeMainDoor.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)

;Move everyone into position
Alias_JacobCoe.GetActorRef().MoveTo(CommitmentCeremonyMarker_Jacob)
Alias_JacobCoe.GetActorRef().EvaluatePackage()
Alias_EliasCartwright.GetActorRef().MoveTo(CommitmentCeremonyMarker_Elias)
Alias_EliasCartwright.GetActorRef().EvaluatePackage()
Alias_LillianHart.GetActorRef().Disable()
Alias_LillianHart.GetActorRef().MoveTo(Commitment_SamCoe_Marker_RoundUp_Lillian)
Alias_LillianHart.GetActorRef().EvaluatePackage()
Alias_CoraCoe.GetActorRef().MoveTo(Commitment_SamCoe_Marker_RoundUp_Cora)
Alias_CoraCoe.GetActorRef().EvaluatePackage()

;Enable Art for Ceremony in Coe Estate
CommitmentCeremonyEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(300)
SetObjectiveDisplayed(400)

Alias_LillianHart.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

Alias_CoraCoe.GetActorRef().EvaluatePackage()

; If you've fetched both ladies, the quest proceeds
if ( GetStageDone(400) )
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
Commitment_SamCoe_0325_CoraSinclair_BarkScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

Alias_LillianHart.GetActorRef().EvaluatePackage()

; If you've fetched both ladies, the quest proceeds
if ( GetStageDone(300) )
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
Actor SamCoeRef = Alias_SamCoe.GetActorRef()

;Release Sam from Follow
SQ_Followers.SetRoleInactive(SamCoeRef)
SamCoeRef.EvaluatePackage()

;Move the player/Sam to their spots
Game.GetPlayer().MoveTo(CommitmentCeremonyMarker_Player)
SamCoeRef.MoveTo(CommitmentCeremonyMarker_Sam)

;If Lillian and Cora don't make it, pull them here
Alias_LillianHart.GetActorRef().MoveTo(Commitment_OverrideMarker)
Alias_CoraCoe.GetActorRef().MoveTo(Commitment_OverrideMarker)

(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=SamCoeREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)

DismissedCrew.RemoveRef(SamCoeREF)
DisembarkingCrew.RemoveRef(SamCoeREF)

;Block reassignment of companion
SamCoeRef.SetValue(CrewReassignDisabled, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE com_commitmentquestscript
Quest __temp = self as Quest
com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
kmyquest.MakeCommitted()

;Return Sarah to follow
Actor SamCoeRef = Alias_SamCoe.GetActorReference()

SQ_Followers.SetRoleActive(SamCoeRef)

;"release the lock" companion to allow player dismissing them:
SQ_Companions.LockInCompanion(SamCoeRef as CompanionActorScript, LockedIn = false)

(SQ_Crew as SQ_CrewScript).SetRoleAvailable(ActorToUpdate=SamCoeRef, DisplayMessageIfChanged=False)
;allow Sam to be re-assigned
SamCoeRef.SetValue(CrewReassignDisabled, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Lillian disappears forever
Alias_LillianHart.GetActorRef().Disable()

;Revert art in Coe Estate
CommitmentCeremonyEnableMarker.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

ReferenceAlias Property Alias_JacobCoe Auto Const Mandatory

ReferenceAlias Property Alias_LillianHart Auto Const Mandatory

ReferenceAlias Property Alias_AhnjongSinclair Auto Const Mandatory

ReferenceAlias Property Alias_EliasCartwright Auto Const Mandatory

Keyword Property Commitment_SamCoe_PreCeremony Auto Const Mandatory

Keyword Property Commitment_SamCoe_RoundUp Auto Const Mandatory

ActorValue Property Commitment_SamCoe_State Auto Const Mandatory

ObjectReference Property CommitmentCeremonyMarker_Player Auto Const Mandatory

Scene Property Commitment_SamCoe_0325_CoraSinclair_BarkScene Auto Const Mandatory

sq_companionsscript Property SQ_Companions Auto Const Mandatory

ObjectReference Property CommitmentCeremonyMarker_Jacob Auto Const Mandatory

ObjectReference Property CommitmentCeremonyMarker_Elias Auto Const Mandatory

ObjectReference Property Commitment_SamCoe_Marker_RoundUp_Lillian Auto Const Mandatory

ObjectReference Property Commitment_OverrideMarker Auto Const Mandatory

ObjectReference Property Commitment_SamCoe_Cora_Start_Marker Auto Const Mandatory

ObjectReference Property Commitment_SamCoe_Player_Start_Marker Auto Const Mandatory

ObjectReference Property CommitmentCeremonyMarker_Sam Auto Const Mandatory

sq_followersscript Property SQ_Followers Auto Const Mandatory

ObjectReference Property CommitmentCeremonyEnableMarker Auto Const Mandatory

ActorValue Property CrewReassignDisabled Auto Const Mandatory

RefCollectionAlias Property DismissedCrew Auto Const Mandatory

RefCollectionAlias Property DisembarkingCrew Auto Const Mandatory

Quest Property SQ_Crew Auto Const Mandatory

Activator Property COM_CQ_TxtReplace_QuestName_SamCoe Auto Const Mandatory

ObjectReference Property Commitment_SamCoe_Marker_RoundUp_Cora Auto Const Mandatory

ReferenceAlias Property Alias_CoeMainDoor Auto Const Mandatory
