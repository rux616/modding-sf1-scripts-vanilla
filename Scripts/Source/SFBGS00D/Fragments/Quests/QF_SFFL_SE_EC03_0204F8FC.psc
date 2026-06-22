;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_EC03_0204F8FC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Set SE Location Alias
Location currentLocation = Alias_CenterMarker.GetRef().GetCurrentLocation()
Alias_SELocation.ForceLocationTo(currentLocation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_EC03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_EC03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_SE_EC03_QuestScript
;END AUTOCAST
;BEGIN CODE
float initialVendorTrust = Game.GetPlayer().GetValue(VendorTrust)
Actor Bobby = Alias_Bobby.GetActorRef() as Actor
Bobby.SetValue(VendorTrust,initialVendorTrust)
int BobbyTrust = Bobby.GetValue(VendorTrust) as int
Debug.Trace("Vendor Trust value set at: " + BobbyTrust)

;Disable unused containers
kmyQuest.SetContainers(BobbyTrust)

;Enable Ship
SpaceshipReference MerchantShip = Alias_MerchantShip.GetShipRef() as SpaceshipReference
MerchantShip.Enable()
MerchantShip.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_EC03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_EC03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_SE_EC03_QuestScript
;END AUTOCAST
;BEGIN CODE
;Disable unused containers
Actor Bobby = Alias_Bobby.GetActorRef() as Actor
int debugVendorTrust = VendorTrustOverride.GetValueInt()
Bobby.SetValue(VendorTrust,debugVendorTrust)
kmyQuest.SetContainers(debugVendorTrust)

;Enable Ship
SpaceshipReference MerchantShip = Alias_MerchantShip.GetShipRef() as SpaceshipReference
MerchantShip.Enable()
MerchantShip.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Actor Bobby = Alias_Bobby.GetActorRef() as Actor
int BobbyTrust = Bobby.GetValue(VendorTrust) as int

; Start the hailing scene that corresponds to Vendor Trust value
Utility.Wait(5.0)
Alias_MerchantShip.GetShipRef().EvaluatePackage()

;There are only two variations:
;one if the VendorTrust AV is 0, and one if it's higher

if (BobbyTrust > 0)
    SFFL_SE_EC03_100a_Hailing_1.Start()
else
    PHailTemplate_100a_Hailing.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;Manage Vendor Trust and merchant ship flying away, but only if there's still someone on board

if (Alias_MerchantShip.GetRef().GetValue(SpaceshipCrew) > 0)

    Actor Bobby = Alias_Bobby.GetActorRef() as Actor
    int BobbyTrust = Bobby.GetValue(VendorTrust) as int

    if (IsStageDone(360))
        ;Set Vendor Trust to -1 if player attacked Bobby and Fanisha
        ;This is not strictly necessary as players shouldn't encounter them again
        Bobby.SetValue(VendorTrust,-1)
    else
        ;Decrease Vendor Trust by one if higher than 0
        if (BobbyTrust > 0)
            BobbyTrust == BobbyTrust - 1
            Bobby.SetValue(VendorTrust,BobbyTrust)
        endif
    endif
    SFFL_SE_EC03_95_ShotAtShip.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;If we ever initiate the hail before setup, make sure we setup
if (!IsStageDone(10))
    SetStage(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Scene_150_CompanionComment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Give Enough time for Merchant ship to fly away before grav jumping
Alias_MerchantShip.GetShipRef().EvaluatePackage()
Utility.Wait(1.0)
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Give Enough time for Merchant ship to fly away before grav jumping
Alias_MerchantShip.GetShipRef().EvaluatePackage()
Utility.Wait(10.0)
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_EC03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_EC03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_SE_EC03_QuestScript
;END AUTOCAST
;BEGIN CODE
;Calculate Vendor Credits at start
kmyQuest.CalculateInitialVendorCredits()

;Reset global used to tell player vendors have new wares
VendorTrustIncreased.SetValue(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetStage(350)
SFFL_SE_EC03_AttackedVendors.SetValue(1.0)

SFFL_SE_EC03_360_CompanionInterjection.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
Alias_PrincessScratch.GetRef().Drop(true)

if (Alias_Fanisha.GetActorRef().IsDead())
    SFFL_SE_EC03_600_SelfDestruct.Start()
    Utility.Wait(2.0)
    BoardingEncounter.SetStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
Alias_Fanisha.GetRef().AddItem(KeepsakeDataslate)

if (Alias_Bobby.GetActorRef().IsDead())
    SFFL_SE_EC03_600_SelfDestruct.Start()
    Utility.Wait(2.0)
    BoardingEncounter.SetStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Make sure companion is back as well
Actor activeCompanion = Alias_ActiveCompanion.GetActorRef()
if (activeCompanion.IsInLocation(Alias_MerchantShipInteriorLocation.GetLocation()))
    activeCompanion.MoveTo(Alias_Player.GetRef())
endif

;Determine if player killed Bobby and Fanisha, in which case the ship will not fly away
if (Alias_Bobby.GetActorRef().IsDead() && Alias_Fanisha.GetActorRef().IsDead())
    Alias_MerchantShip.GetShipRef().SetValue(SpaceshipCrew,0)
    SFFL_SE_EC03_400_CompanionInterjection.Start()
elseif (IsStageDone(360))
    Alias_MerchantShip.GetShipRef().InstantUndock()
    SetStage(500)
    SFFL_SE_EC03_400_CompanionInterjection.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;If someone is still alive on Merchant Ship, proceed to the ship's departure
;Otherwise stop quest

SpaceshipReference merchantShip = Alias_MerchantShip.GetRef() as SpaceshipReference 
merchantShip.EvaluatePackage()

if (merchantShip.GetValue(SpaceshipCrew) > 0)
    SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SpaceshipReference merchantShip = Alias_MerchantShip.GetRef() as SpaceshipReference 
merchantShip.PlaceAtMe(SelfDestruct,1,false,false,true,None,Alias_SelfDestructCharge,false)
merchantShip.KillEssential()
Utility.Wait(0.2)
Alias_SelfDestructCharge.GetRef().DamageObject(1000)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_EC03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_EC03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_SE_EC03_QuestScript
;END AUTOCAST
;BEGIN CODE
;Calculate how much money vendors made with Player
kmyQuest.CalculateFinalVendorCredits()

float finalVendorTrust = Alias_Bobby.GetActorRef().GetValue(VendorTrust)
Game.GetPlayer().SetValue(VendorTrust,finalVendorTrust)

Scene_800_Goodbye.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE SEScript
Quest __temp = self as Quest
SEScript kmyQuest = __temp as SEScript
;END AUTOCAST
;BEGIN CODE
;Merchant ship fast travel away.
;Jumps faster if player has attacked ship or vendors

if (IsStageDone(95) || IsStageDone(360))
    Utility.Wait(3.0)
else
    Utility.Wait(6.0)
endif
Alias_MerchantShip.GetShipRef().DisableWithGravJump()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
BoardingEncounter.Stop()
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_MerchantShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_Bobby Auto Const Mandatory

ActorValue Property VendorTrust Auto Const Mandatory

Scene Property SFFL_SE_EC03_100a_Hailing_1 Auto Const Mandatory

ReferenceAlias Property Alias_VendorContainer0 Auto Const Mandatory

ReferenceAlias Property Alias_VendorContainer1 Auto Const Mandatory

Scene Property Scene_800_Goodbye Auto Const Mandatory

ReferenceAlias Property Alias_Fanisha Auto Const Mandatory

ReferenceAlias Property Alias_FanishaContainer0 Auto Const Mandatory

ReferenceAlias Property Alias_FanishaContainer1 Auto Const Mandatory

Scene Property SFFL_SE_EC03_95_ShotAtShip Auto Const Mandatory

Scene Property Scene_150_CompanionComment Auto Const Mandatory

ReferenceAlias Property Alias_BobbyContainer2 Auto Const Mandatory

ReferenceAlias Property Alias_BobbyContainer3 Auto Const Mandatory

ReferenceAlias Property Alias_BobbyContainer4 Auto Const Mandatory

ReferenceAlias Property Alias_FanishaContainer2 Auto Const Mandatory

ReferenceAlias Property Alias_FanishaContainer3 Auto Const Mandatory

ReferenceAlias Property Alias_FanishaContainer4 Auto Const Mandatory

GlobalVariable Property SFFL_SE_EC03_AttackedVendors Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Scene Property SFFL_SE_EC03_360_CompanionInterjection Auto Const Mandatory

Scene Property SFFL_SE_EC03_400_CompanionInterjection Auto Const Mandatory

ReferenceAlias Property Alias_ActiveCompanion Auto Const Mandatory

LocationAlias Property Alias_MerchantShipInteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_PrincessScratch Auto Const Mandatory

MovableStatic Property SelfDestruct Auto Const Mandatory

ReferenceAlias Property Alias_SelfDestructCharge Auto Const Mandatory

Scene Property SFFL_SE_EC03_600_SelfDestruct Auto Const Mandatory

Quest Property BoardingEncounter Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

GlobalVariable Property VendorTrustOverride Auto Const Mandatory

Book Property KeepsakeDataslate Auto Const Mandatory

GlobalVariable Property VendorTrustIncreased Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

LocationAlias Property Alias_SELocation Auto Const Mandatory
