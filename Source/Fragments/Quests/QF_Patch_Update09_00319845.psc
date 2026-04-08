;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update09_00319845 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
if SE_Player_Attack01.IsRunning()
    Alias_SE_PlayerAttack01.AddtoFaction(FreestarFaction)
endif

if SE_Player_Attack04.IsRunning()
    Alias_SE_PlayerAttack04.AddtoFaction(FreestarFaction)
endif

if SE_Player_Attack06.IsRunning()
    Alias_SE_PlayerAttack06.AddtoFaction(FreestarFaction)
endif

if SE_Player_Attack10.IsRunning()
    Alias_SE_PlayerAttack10.AddtoFaction(FreestarFaction)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
Alias_UC05_930Trigger.GetRef().MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_03
Function Fragment_Stage_0000_Item_03()
;BEGIN CODE
Int i

; There is no way of knowing if this music is playing or
; how many times it has been added, so we pick a large number 
; and loop through until they're all gone. The bug is an edge case, 
; and this should fix it for everyone, except for extreme edge cases.
While i < 50
	_MUSExplore_WwiseSilence.Remove()
	Utility.Wait(1)
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_04
Function Fragment_Stage_0000_Item_04()
;BEGIN CODE
(FC09 as FC09QuestScript).RefillCriticalAliases()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_05
Function Fragment_Stage_0000_Item_05()
;BEGIN CODE
SpaceshipReference myRewardShip = Alias_RewardShip.GetShipRef()
SpaceshipReference myStarEagle = Alias_StarEagle.GetShipRef()
SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript


Int i
Int iCount = Alias_Playerships.GetCount()
Bool bHasStarEagle = False

; Check to see if the player already has a Star Eagle in their 
; collection of ships, and set a bool as True if so.
While i < iCount
	ObjectReference myShip = Alias_Playerships.GetAt(i)

	Form myShipBaseObject = myShip.GetBaseObject()
	Form myStarEagleBaseObject = myStarEagle.GetBaseObject()
	If  myShipBaseObject == myStarEagleBaseObject
		bHasStarEagle = True
	EndIf
	i +=1
EndWhile

; If the player does not have the Star Eagle, and they've completed 
; FC098 (Condition on quest stage), then give them a Star Eagle. 
; It's okay if they had it and sold it.
If bHasStarEagle == False
	; Give reward ship
	myStarEagle.SetValue(SpaceshipCrew, 0)
	myStarEagle.SetValue(SpaceshipRegistration, 1)

	SQ_PlayerShip.AddPlayerOwnedShip(myStarEagle)

	FC09_ShipRewardMessage.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_06
Function Fragment_Stage_0000_Item_06()
;BEGIN CODE
RI05.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_07
Function Fragment_Stage_0000_Item_07()
;BEGIN CODE
Actor myDeadCompanion = Alias_CompanionWhoDies.GetActorRef()
If myDeadCompanion == Alias_ActiveCompanion.GetActorRef()
	(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(myDeadCompanion)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_08
Function Fragment_Stage_0000_Item_08()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SE_Player_Attack01 Auto Const Mandatory
Quest Property SE_Player_Attack04 Auto Const Mandatory
Quest Property SE_Player_Attack06 Auto Const Mandatory
Quest Property SE_Player_Attack10 Auto Const Mandatory
RefCollectionAlias Property Alias_SE_PlayerAttack01 Auto Const Mandatory

Faction Property FreestarFaction Auto Const Mandatory

RefCollectionAlias Property Alias_SE_PlayerAttack04 Auto Const Mandatory

RefCollectionAlias Property Alias_SE_PlayerAttack06 Auto Const Mandatory

RefCollectionAlias Property Alias_SE_PlayerAttack10 Auto Const Mandatory

ReferenceAlias Property Alias_UC05_930Trigger Auto Const Mandatory

MusicType Property _MUSExplore_WwiseSilence Auto Const Mandatory

Quest Property FC09 Auto Const Mandatory

RefCollectionAlias Property Alias_PlayerShips Auto Const Mandatory

ReferenceAlias Property Alias_StarEagle Auto Const Mandatory

SpaceshipBase Property FC09_Combat_B_Generic_FreestarRanger_Ship Auto Const

ReferenceAlias Property Alias_RewardShip Auto Const Mandatory

Message Property FC09_ShipRewardMessage Auto Const Mandatory

ActorValue Property SpaceshipRegistration Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Quest Property RI05 Auto Const Mandatory

ReferenceAlias Property Alias_ActiveCompanion Auto Const Mandatory

ReferenceAlias Property Alias_CompanionWhoDies Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory
