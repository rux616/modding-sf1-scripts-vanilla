;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFCydoniaZ05_000D6927 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(10)
Game.GetPlayer().MoveTo(Alias_RailLeanMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_PartingGift.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor SivanRef = Alias_Sivan.GetActorRef()
ObjectReference RailRef = Alias_RailLeanMarker.GetRef()

RailRef.SetActorOwner(SivanActorBase)
SivanRef.EnableNoWait()
SivanRef.MoveTo(RailRef)
SivanRef.SnapIntoInteraction(RailRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_RailLeanMarker.GetRef().SetActorOwner(NONE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Actor SivanRef = Alias_Sivan.GetActorRef()
SQ_Followers.SetRoleInactive(SivanRef)
SivanRef.MoveTo(Alias_passengerMarker.GetRef())
SivanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_01
Function Fragment_Stage_0025_Item_01()
;BEGIN CODE
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
FFCydoniaZ05_SceneIntro.Stop()
Actor SivanRef = Alias_Sivan.GetActorRef()
SQ_Followers.SetRoleActive(SivanRef)
SivanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SQ_GuardShipsScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_CaptainMarker.RefillAlias()

ObjectReference ShipRef = Alias_CaptainMarker.GetRef()
ObjectReference PassengerRef = Alias_PassengerMarker.GetRef()

ObjectReference SivanRef = Alias_Sivan.GetRef()

if SivanRef.GetDistance(ShipRef) > 10 && ShipRef != None
    SivanRef.MoveTo(ShipRef)
elseif SivanRef.GetDistance(PassengerRef) > 10 && (PassengerRef) != None
    SivanRef.MoveTo(PassengerRef)
endif

SQ_GuardShipsScene.Stop()
FFCydoniaZ05_Scene01_Space.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
FFCydoniaZ05_Scene01_Space.Stop()
SetObjectiveDisplayed(50)
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Actor SivanRef = Alias_Sivan.GetActorRef()
SQ_Followers.SetRoleInactive(SivanRef)

SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_01
Function Fragment_Stage_0070_Item_01()
;BEGIN CODE
Actor SivanRef = Alias_Sivan.GetActorRef()
SivanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_02
Function Fragment_Stage_0070_Item_02()
;BEGIN CODE
Actor SivanRef = Alias_Sivan.GetActorRef()
SivanRef.MoveTo(Game.GetPlayer())
SivanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Sivan.GetActorRef().EvaluatePackage()
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Sivan.GetActorRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Sivan Auto Const Mandatory

ReferenceAlias Property Alias_RailLeanMarker Auto Const Mandatory

Scene Property FFCydoniaZ05_Scene01_Space Auto Const Mandatory

Scene Property FFCydoniaZ05_SceneIntro Auto Const Mandatory

ActorBase Property SivanActorBase Auto Const Mandatory

ReferenceAlias Property Alias_passengerMarker Auto Const Mandatory

sq_followersscript Property SQ_Followers Auto Const Mandatory

Quest Property City_NewAtlantis_Z_PartingGift Auto Const Mandatory

Scene Property SQ_GuardShipsScene Auto Const Mandatory

ReferenceAlias Property Alias_CaptainMarker Auto Const Mandatory
