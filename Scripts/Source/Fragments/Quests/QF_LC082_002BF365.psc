;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC082_002BF365 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Quickstart: Basic quickstart for the Vigilance.

;Move the player to the Docking Bay.
Game.GetPlayer().MoveTo(LC082_StartDockingBay)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE LC082_VigilanceQuestScript
Quest __temp = self as Quest
LC082_VigilanceQuestScript kmyQuest = __temp as LC082_VigilanceQuestScript
;END AUTOCAST
;BEGIN CODE
;DEBUG: Vigilance Combat Demo
kMyQuest.DEBUG_SetupVigilanceCombatDemo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN AUTOCAST TYPE LC082_VigilanceQuestScript
Quest __temp = self as Quest
LC082_VigilanceQuestScript kmyQuest = __temp as LC082_VigilanceQuestScript
;END AUTOCAST
;BEGIN CODE
;DEBUG: Defensive Battery Combat Demo
kMyQuest.DEBUG_SetupBatteryCombatDemo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set by: Startup.

;Add the Vigilance's invulnerability keyword.
SpaceshipReference vigilanceRef = Alias_VigilanceShip.GetShipRef()
vigilanceRef.AddKeyword(DisallowAsCombatTargetKeyword)
vigilanceRef.AddPerk(LC088_Space_VigilanceDamageImmunityPerk)

;Disable the pile of clutter in the Brig.
Alias_BrigClutter.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
CF01.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN AUTOCAST TYPE LC082_VigilanceQuestScript
Quest __temp = self as Quest
LC082_VigilanceQuestScript kmyQuest = __temp as LC082_VigilanceQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quickstarts for CF02-CF07.

;Unlock and open all of the doors as if CF01 has been completed.
LC082_InterrogationRoomDoorRef.Unlock()
LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True)
LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)

;Move Ikande to the Operations Center.
Alias_Kibwe.TryToMoveTo(CF01KibweOpsMarker)

;Disable CF01's Interrogation Room Guards.
SetStage(25)

;Enable and move the Vigilance based on the current running quest.
if ((LC088.GetStage() > 0) || CF07.IsRunning())
     kMyQuest.UpdateVigilanceLocation("CF07")
ElseIf (CF06.IsRunning())
     kMyQuest.UpdateVigilanceLocation("CF06")
ElseIf (CF05.IsRunning())
     kMyQuest.UpdateVigilanceLocation("CF05")
ElseIf (CF04.IsRunning())
     kMyQuest.UpdateVigilanceLocation("CF04")
Else
     kMyQuest.UpdateVigilanceLocation("CF01")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Set by: CF01 Stage 1000, or LC082 Stage 11 (Quickstarts)

;Disable the CF01 Interrogation Room Guards.
Alias_CF01InterrogationRoomGuards.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set by: CF01 stages 165 or 206
;If this stage has been set, but stage 210 has NOT been set, the player
;will fail the SysDef side of the questline if they attack:
; - The Vigilance
; - Any of the Vigilance's escort ships.
; - Any SysDef NPC on the Vigilance.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE LC082_VigilanceQuestScript
Quest __temp = self as Quest
LC082_VigilanceQuestScript kmyQuest = __temp as LC082_VigilanceQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space, stage 200.
;If this stage has been set, the player will no longer
;fail the SysDef side of the questline by attacking anyone.

;Additionally, set the Vigilance's actors to Essential, No Pickpocket,
;Ignore Friendly Hits for the duration of CF08.
kMyQuest.ProtectVigilanceMainActors(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN AUTOCAST TYPE LC082_VigilanceQuestScript
Quest __temp = self as Quest
LC082_VigilanceQuestScript kmyQuest = __temp as LC082_VigilanceQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF_Post, stage 210.
;
;Clear the special protections on the Vigilance's actors after CF08.
kMyQuest.ProtectVigilanceMainActors(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE LC082_VigilanceQuestScript
Quest __temp = self as Quest
LC082_VigilanceQuestScript kmyQuest = __temp as LC082_VigilanceQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias Scripts
;If stage 200 has been set, and stage 210 has not been set, this stage
;will be set if the player attacks:
; - The Vigilance
; - Any of the Vigilance's escort ships.
; - Any SysDef NPC on the Vigilance.

;Set the failure stage in CF_Main
CF_Main.SetStage(300)

;Wake the turrets in the Operations Center.
kMyQuest.ActivateTurrets()

;Disable docking with the Vigilance.
kMyQuest.SetAllowDockingWithVigilance(False)

;Disable the Vigilance and its escorts at the next opportunity.
kMyQuest.UpdateVigilanceLocation("Shutdown")

;Play the fail scene at the next opportunity.
kMyQuest.TryToStartKickoutScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0251_Item_00
Function Fragment_Stage_0251_Item_00()
;BEGIN CODE
;Set by: Quest script, TryToStartKickoutScene or OnShipUndock

;Start the kickout scene.
LC082_SysDefKickoutScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0252_Item_00
Function Fragment_Stage_0252_Item_00()
;BEGIN CODE
;Set by: LC082_SysDefKickoutScene, on scene end.

;Disable the Vigilance.
Alias_VigilanceShip.GetShipRef().DisableWithGravJumpNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_CF01InterrogationRoomGuards Auto Const Mandatory
RefCollectionAlias Property Alias_BrigClutter Auto Const Mandatory
ReferenceAlias Property Alias_VigilanceShip Auto Const Mandatory
ReferenceAlias Property Alias_Kibwe Auto Const Mandatory

ObjectReference property LC082_StartDockingBay Auto Const Mandatory
ObjectReference Property LC082_InterrogationRoomDoorRef Auto Const Mandatory
ObjectReference Property LC082_OperationsCenterElevatorAccessDoorRef Auto Const Mandatory
ObjectReference Property LC082_PlayerShipDockingPortAccessDoorRef Auto Const Mandatory
ObjectReference Property CF01KibweOpsMarker Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory
Quest Property CF01 Auto Const Mandatory
Quest Property CF02 Auto Const Mandatory
Quest Property CF03 Auto Const Mandatory
Quest Property CF04 Auto Const Mandatory
Quest Property CF05 Auto Const Mandatory
Quest Property CF06 Auto Const Mandatory
Quest Property CF07 Auto Const Mandatory
Quest Property LC088 Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory
Faction Property CrimsonFleetFaction Auto Const Mandatory
Faction Property UCSysDefFaction Auto Const Mandatory
Scene Property LC082_SysDefKickoutScene Auto Const Mandatory
Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const Mandatory
Keyword Property DisallowAsCombatTargetKeyword Auto Const Mandatory
