;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_FAB02_00088A03 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; The Hailing Ship won't repair it's engines
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.EnablePartRepair(ShipSystemEngineHealth, false)
oTarg.EnablePartRepair(ShipSystemShieldsHealth, false)
oTarg.SetValue(ShipSystemShieldsHealth, 0)

oTarg.SetGhost()
oTarg.IgnoreFriendlyHits()

Actor TeacherRef = Alias_Instructor.GetActorRef()
TeacherRef.SetGhost()
TeacherRef.SetRestrained(true)
Actor TraineeRef = Alias_Trainee.GetActorRef()
TraineeRef.SetGhost()

Cell myCell = TeacherRef.GetParentCell()
myCell.SetFactionOwner(SE_FAB02_Faction)
myCell.SetPublic(true)
Alias_CaptainsLocker.GetRef().SetFactionOwner(PlayerFaction)
Alias_SpaceshipInventory.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

Alias_ShipCrew.AddRef(Alias_Trainee.GetRef())
Alias_ShipCrew.AddRef(Alias_Instructor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
if !GetStageDone(500)
    Alias_Instructor.GetActorRef().Kill()
endif

SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Actor InstructorRef = Alias_Instructor.GetActorRef()
Actor TraineeRef = Alias_Trainee.GetActorRef()
ObjectReference PlayerRef = Game.GetPlayer()

TraineeRef.SetGhost(false)
TraineeRef.AddtoFaction(PlayerEnemyFaction)
TraineeRef.SetValue(Aggression, 1)
TraineeRef.StartCombat(PlayerRef)

if GetStageDone(500)
    InstructorRef.AddtoFaction(PlayerEnemyFaction)
    InstructorRef.SetValue(Aggression, 1)
    InstructorRef.StartCombat(PlayerRef)
endif

Actor TeacherRef = Alias_Instructor.GetActorRef()
TeacherRef.SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
SpaceshipReference ShipRef = Alias_HailingShip.GetShipRef()

ShipRef.RemoveFromFaction(PlayerFriendFaction)
ShipRef.AddtoFaction(PlayerEnemyFaction)
ShipRef.IgnoreFriendlyHits(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
PHailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(SpaceshipCrew, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SpaceshipReference ShipRef = Alias_HailingShip.GetShipRef()

ShipRef.DamageValue(ShipSystemShieldsHealth, 10000)
ShipRef.DamageValue(ShieldHealth, 10000)
Utility.Wait(1.0)
SetStage(69)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SpaceshipReference ShipRef = Alias_HailingShip.GetShipRef()

ShipRef.DamageValue(ShipSystemEngineHealth, 10000)
ShipRef.SetValue(DockingPermission, 0)

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 

oTarg.SetValue(DockingPermission, 4)
oTarg.SetGhost()
oTarg.SetValue(ShipSystemShieldsHealth, 1000)
oTarg.SetValue(ShipSystemEngineHealth, 10000)
Utility.Wait(12)
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; After the talk starts - new pilot is heading straight
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.EvaluatePackage()
oTarg.SetGhost(false)

; Have some running commentary
SE_FAB02_400_FlyingAway.Start()

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)

Actor TeacherRef = Alias_Instructor.GetActorRef()
TeacherRef.SetGhost(false)
TeacherRef.SetRestrained(false)

Alias_Trainee.GetActorRef().SetGhost(false)

;Restore ability to steal and return cargo hold to faction
Alias_SpaceshipInventory.GetRef().BlockActivation(false, false)
Alias_CaptainsLocker.GetRef().SetFactionOwner(SE_FAB02_Faction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_01_Small)
Utility.Wait(4)
Alias_Instructor.GetActorRef().EvaluatePackage()
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveSkipped(10)
SetObjectiveSkipped(20)
SetObjectiveSkipped(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

ActorValue Property ShipSystemEngineHealth Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Scene Property SE_FAB02_400_FlyingAway Auto Const Mandatory

ActorValue Property ShipSystemShieldsHealth Auto Const Mandatory

ReferenceAlias Property Alias_Instructor Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Trainee Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

RefCollectionAlias Property Alias_ShipCrew Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ActorValue Property ShieldHealth Auto Const Mandatory

Faction Property SE_FAB02_Faction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_CaptainsLocker Auto Const Mandatory

ReferenceAlias Property Alias_SpaceshipInventory Auto Const Mandatory
