;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_KT01_0003BC4F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Actor CaptainRef = Alias_Captain.GetActorRef()

CaptainRef.RemoveFromFaction(CaptiveFaction)
CaptainRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ObjectReference[] MarkersRef = Alias_CrewSpawnMarkers.GetArray()
int k = Utility.RandomInt(0,5)
int i = 0

if k == 0
    while i < 7 && i < MarkersRef.Length
        Alias_creatures.AddRef(MarkersRef[i].PlaceAtMe(SEDerelict_LChar_HexapodAGlider))
        i += 1
    endwhile
elseif k == 1
    while i < 7 && i < MarkersRef.Length
        Alias_creatures.AddRef(MarkersRef[i].PlaceAtMe(SEDerelict_LChar_MantidACockroach))
        i += 1
    endwhile
elseif k == 2
    while i < 7 && i < MarkersRef.Length
        Alias_creatures.AddRef(MarkersRef[i].PlaceAtMe(SEDerelict_LChar_MantidACoralbug))
        i += 1
    endwhile
elseif k == 3
    while i < 7 && i < MarkersRef.Length
        Alias_creatures.AddRef(MarkersRef[i].PlaceAtMe(SEDerelict_LChar_MantidAHookneck))
        i += 1
    endwhile
elseif k == 4
    while i < 7 && i < MarkersRef.Length
        Alias_creatures.AddRef(MarkersRef[i].PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler))
        i += 1
    endwhile
elseif k == 5
    while i < 7 && i < MarkersRef.Length
        Alias_creatures.AddRef(MarkersRef[i].PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab))
        i += 1
    endwhile
endif

ObjectReference[] ComputerRefs = Alias_Computers.GetArray()


int p = 0
While p < ComputerRefs.Length
    if ComputerRefs[p].GetLinkedRef(LinkTerminalTurret) == None && ComputerRefs[i].GetLinkedRef(LinkTerminalSecurityDoor) == None
        ComputerRefs[p].SetLockLevel(255)
    endif
    p += 1
endWhile

Alias_Captain.GetRef().IgnoreFriendlyHits(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
;If hailing ship was FemaleEvenToned, enable matching voice captain

ObjectReference CaptainRef = Alias_Captain01.GetRef()

CaptainRef.EnableNoWait()
Alias_Captain.ForceRefTo(CaptainRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN CODE
;If hailing ship was GenericMale06, enable matching voice captain

ObjectReference CaptainRef = Alias_Captain02.GetRef()

CaptainRef.EnableNoWait()
Alias_Captain.ForceRefTo(CaptainRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_03
Function Fragment_Stage_0010_Item_03()
;BEGIN CODE
;If hailing ship was GenericMale08, enable matching voice captain

ObjectReference CaptainRef = Alias_Captain03.GetRef()

CaptainRef.EnableNoWait()
Alias_Captain.ForceRefTo(CaptainRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
if (!GetStageDone(66)) && !SE_KT01.GetStageDone(6)
     SetObjectiveDisplayed(20)
     BE_KT01_SceneStart.Start()
EndIf

;WwiseEvent.StopInstance(BE_KT01_InstanceID.GetValueInt())
Alias_SoftAlarm.GetRef().DisableNoWait()
kmyQuest.SetShipHazard(None)
kmyQuest.SetShipGravity(1)

Alias_Captain.GetRef().IgnoreFriendlyHits(false)
Alias_enemyShip.GetShipRef().SetValue(SpaceshipCrew, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by: Change Location script on the player alias.

;Start the welcome scene when the player enters the ship.
BE_KT01_SceneWelcome.Start()

SE_KT01.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetShipGravity(1)

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Alias_enemyShip.GetShipRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;int pInstance = Wwise_Event_OBJ_Alarm_Generic_Play.Play(Alias_Announcer.GetRef())
;BE_KT01_InstanceID.SetValue(pInstance)

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if !GetStageDone(15)
    WwiseEvent.StopInstance(BE_KT01_InstanceID.GetValueInt())
    Alias_Captain.GetActorRef().Kill()
endif

SpaceshipReference enemyShipRef = Alias_EnemyShip.GetShipRef()

if GetStageDone(100) && !GetStageDone(66)
     enemyShipRef.SetValue(DockingPermission, 4)
     enemyShipRef.DisableWithGravJump()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_Captain.GetRef().MoveTo(Alias_SpawnMarkerCaptain.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
Alias_PilotSeat.GetRef().BlockActivation(false, false)
Alias_enemyShip.GetShipRef().SetValue(SpaceshipCrew, 0)
SE_KT01.SetStage(66)
SetObjectiveSkipped(10)
SetObjectiveSkipped(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Cleanup on stop if player bails, fail objectives and stop alarm

WwiseEvent.StopInstance(BE_KT01_InstanceID.GetValueInt())
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property SpaceshipCrew Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory

GlobalVariable Property PBE_DerelictCreaturesMax Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

Scene Property BE_KT01_SceneWelcome Auto Const Mandatory

Hazard Property CreateVacuumHazard Auto Const Mandatory

Hazard Property myHazard01 Auto Const Mandatory

WwiseEvent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const Mandatory

Float Property GravityFloat Auto Const Mandatory

GlobalVariable Property BE_KT01_InstanceID Auto Const Mandatory

Scene Property BE_KT01_SceneStart Auto Const Mandatory

LeveledItem Property LL_OE_Default_Reward Auto Const Mandatory

Hazard Property myHazard02 Auto Const Mandatory

Hazard Property myHazard03 Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

ReferenceAlias Property Alias_Announcer Auto Const Mandatory

Quest Property SE_KT01 Auto Const Mandatory

ReferenceAlias Property Alias_Captain01 Auto Const Mandatory

ReferenceAlias Property Alias_Captain02 Auto Const Mandatory

ReferenceAlias Property Alias_Captain03 Auto Const Mandatory

RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const Mandatory

RefCollectionAlias Property Alias_creatures Auto Const Mandatory

RefCollectionAlias Property Alias_turretSpawnMarkers Auto Const Mandatory

RefCollectionAlias Property Alias_Computers Auto Const Mandatory

Keyword Property LinkTerminalSecurityDoor Auto Const Mandatory

Keyword Property LinkTerminalTurret Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ReferenceAlias Property Alias_SoftAlarm Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

ReferenceAlias Property Alias_SpawnMarkerCaptain Auto Const Mandatory
