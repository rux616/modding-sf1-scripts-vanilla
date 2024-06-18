;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RL027Quest_002611DC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Remove Negate Damage Spell
Int ExtActorCount = Alias_ExtCreatures.GetCount()
int currentExtActorIndex = 0

	While (currentExtActorIndex <  ExtActorCount)
		(Alias_ExtCreatures.GetAt(currentExtActorIndex) as Actor).RemoveSpell(AbModIncomingDamageFakeCombat)
    		currentExtActorIndex += 1
 	endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Remove Negate Damage Spell
Int ActorCount = Alias_MainRoomCreatures.GetCount()
int currentActorIndex = 0

	While (currentActorIndex <  ActorCount)
		(Alias_MainRoomCreatures.GetAt(currentActorIndex) as Actor).RemoveSpell(AbModIncomingDamageFakeCombat)
    		currentActorIndex += 1
 	endWhile

;DamagePipes
Int PipeCount = Alias_DamagedPipes.GetCount()
int currentPipeIndex = 0

	While (currentPipeIndex <  PipeCount)
		Alias_DamagedPipes.GetAt(currentPipeIndex).DamageObject(2000.0)
    		currentPipeIndex += 1
 	endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_AmbianceMarker.getref().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;play audio for shutters
RL027_MassiveShutters_Open.play(Alias_CentralRoomDoor.getref())
Alias_StingerTrigger.getref().enable()

utility.wait(1.5)
Alias_EnableMarkerLightsMain.getref().enable()

utility.wait(4.0)
Alias_EnableMarkerLights.getref().enable()

Alias_ControlRoomDoor.getref().unlock()
Alias_ControlRoomDoor.getref().setopen()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EnableMarkerShutters Auto Const Mandatory

ReferenceAlias Property Alias_EnableMarkerLights Auto Const Mandatory

ReferenceAlias Property Alias_Robot01 Auto Const Mandatory

Faction Property CreatureFaction Auto Const

ReferenceAlias Property Alias_Boss Auto Const Mandatory

ReferenceAlias Property Alias_ControlRoomDoor Auto Const Mandatory

ReferenceAlias Property Alias_CentralRoomDoor Auto Const Mandatory

Faction Property PredatorAFaction Auto Const

Faction Property PredatorAEnemyFaction Auto Const

WwiseEvent Property RL027_MassiveShutters_Open Auto Const

RefCollectionAlias Property Alias_DamagedPipes Auto Const Mandatory

RefCollectionAlias Property Alias_AllFlyers Auto Const Mandatory

RefCollectionAlias Property Alias_MainRoomCreatures Auto Const Mandatory

Spell Property AbModIncomingDamageFakeCombat Auto Const

RefCollectionAlias Property Alias_ExtCreatures Auto Const Mandatory

ReferenceAlias Property Alias_AmbianceMarker Auto Const Mandatory

ReferenceAlias Property Alias_EnableMarkerLightsMain Auto Const Mandatory

ReferenceAlias Property Alias_StingerTrigger Auto Const Mandatory
