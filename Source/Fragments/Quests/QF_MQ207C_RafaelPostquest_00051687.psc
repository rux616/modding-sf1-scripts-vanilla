;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ207C_RafaelPostquest_00051687 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by: MQ207C, stage 929.

;Make Rafael a follower.
SQ_Followers.SetRoleActive(Alias_RafaelAguerro.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location Manager.

;Switch Rafael from a Follower to a Passenger.
Actor rafael = Alias_RafaelAguerro.GetActorRef()
SQ_Followers.SetRoleInactive(rafael)
kMyQuest.AddPassenger(Alias_RafaelAguerro)

;Force Rafael onto the ship if necessary.
if (rafael.GetCurrentLocation() != Alias_PlayerShipInteriorLocation.GetLocation())
     rafael.EvaluatePackage()
     rafael.MoveToPackageLocation()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location Manager.

;Remove Rafael as a passenger and disable him.
Actor rafael = Alias_RafaelAguerro.GetActorRef()
kMyQuest.RemovePassengerActor(rafael)
rafael.DisableNoWait()

;We're now waiting for the player to arrive in New Atlantis.
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by: MQ207C, stage 939.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Set by: Quest Script, Change Location Manager.

;Disable Rafael.
Alias_RafaelAguerro.GetActorRef().DisableNoWait()

;We're now waiting for the player to arrive in New Atlantis.
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set by: Stage 40 or 110.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Set by: Quest Script, Change Location Manager.

;Enable the Elite Crew version of Rafael.
CREW_EliteCrew_RafaelAguerro.SetStage(1)

;Display the objective to meet him.
SetObjectiveDisplayed(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Set by: CREW_EliteCrew_RafaelAguerro, stage 20.

;Complete objective and shut down.
SetObjectiveCompleted(210)
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RafaelAguerro Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Auto Const Mandatory

SQ_PlayerShipScript Property SQ_PlayerShip Auto Const Mandatory

LocationAlias Property Alias_playerShipInteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_RafaelAguerroPost Auto Const Mandatory

Quest Property CREW_EliteCrew_RafaelAguerro Auto Const Mandatory
