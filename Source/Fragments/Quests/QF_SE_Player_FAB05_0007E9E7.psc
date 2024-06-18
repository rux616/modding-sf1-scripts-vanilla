;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB05_0007E9E7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SE_Player_FAB05_GrandmaDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SE_Player_FAB05_GrandmaDead.SetValue(1)
SpaceshipReference GrandmaRef = Alias_HailingShip.GetShipRef()

GrandmaRef.SetValue(SpaceshipCrew, 0)
GrandmaRef.SetValue(Aggression, 0)
GrandmaRef.StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
Actor GrandmaRef = Alias_Grandma.GetActorRef()
SpaceshipReference GrandmaShipRef = Alias_HailingShip.GetShipRef()
ObjectReference PlayerRef = Game.GetPlayer()

GrandmaRef.AddtoFaction(PlayerEnemyFaction)
GrandmaRef.SetValue(Aggression, 1)
GrandmaShipRef.AddtoFaction(PlayerEnemyFaction)
GrandmaShipRef.SetValue(Aggression, 1)

if GrandmaRef.GetParentCell() == PlayerRef.GetParentCell()
    GrandmaRef.StartCombat(Game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_Grandma Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property SE_Player_FAB05_GrandmaDead Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory
