;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC043_002BF370 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set by: Startup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set by: When not on quest, player attacks any guard (Stage 51)
;or enters the trigger around the station.

;Play the attack scene.
LC043_50_GuardAttack.Start()

;Start combat with the player.
LC043SYNonquestShipFaction.SetEnemy(PlayerFaction)
Alias_SY_Ships_Guards.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
;Set by: Alias OnHit script, all nonquest ships.

;Set the ships hostile.
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN AUTOCAST TYPE LC043QuestScript
Quest __temp = self as Quest
LC043QuestScript kmyQuest = __temp as LC043QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF05 stage 721.

;Swap to the quest ships.
Alias_SY_Ships_Prequest_All.DisableAll()
Alias_SY_Ships_Quest_All.EnableAll()

;Update aliases.
kMyQuest.CleanupPrequestAliases()
kMyQuest.FillInteriorAliases()

;Disable the moving platform navmesh refs.
Alias_SY01_NavmeshPlatformDisableSpecial.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by: Quest Script, HandleLocationChange.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Set by: CF05 stage 1005

;Add the player to a Friend faction, so NPCs in LC043SY01
;will no longer be hostile.
Game.GetPlayer().AddToFaction(LC043SY01FriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Set by: Triggers, Barracks.

;Enable the Barracks guard.
Alias_SY01_CargoBayBarracksGuard.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE LC043QuestScript
Quest __temp = self as Quest
LC043QuestScript kmyQuest = __temp as LC043QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Collection Script when any actor in SY01
;enters combat with the player, or CF05 quest events.

;Remove the player from the friend faction, if they were in it.
Game.GetPlayer().RemoveFromFaction(LC043SY01FriendFaction)

;Enable the Barracks Guard, if not already enabled.
SetStage(130)

;Trigger the security alarm.
kMyQuest.TriggerSecurityAlarm(Alias_SY01_ActorsAll, LC043SY01Faction)

;Handle faction removal for disguise based on cell
CF05_Alarm.SetStage(60)
CF05.SetStage(61)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set by: Quest Script, HandleLocationChange.

;Enable the actors in LC043SY02.
Alias_SY02_ActorsInitiallyEnabled.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Set by: CF05 stage 1205

;Check whether the SY02 Security Alarm has been tripped.
;If not, disable the lobby soldiers to make sneaking out easier.
if (!GetStageDone(250))
     Alias_SY02_CommandBayLobbySoliders.DisableAll()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE LC043QuestScript
Quest __temp = self as Quest
LC043QuestScript kmyQuest = __temp as LC043QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Collection Script when any actor in SY02
;enters combat with the player, or CF05 quest events.

;Trigger the security alarm.
kMyQuest.TriggerSecurityAlarm(Alias_SY02_ActorsAll, LC043SY02Faction)

;Handle faction removal for disguise based on cell
CF05_Alarm.SetStage(60)
CF05.SetStage(62)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN AUTOCAST TYPE LC043QuestScript
Quest __temp = self as Quest
LC043QuestScript kmyQuest = __temp as LC043QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, leaving the Records Area.

;Check whether the SY02 Security Alarm has been tripped.
;If so, enable some additional enemies and repeatedly EVP them to
;make sure they run into the Operations Center.
if (GetStageDone(250))
     Alias_SY02_CommandBaySecurityDoor.GetRef().SetOpen(True)
     Alias_SY02_CommandBayCombatResponders.EnableAll()
     Alias_SY02_CommandBayCombatResponders.SetValue(Aggression, 2)
     Alias_SY02_CommandBayCombatResponders.EvaluateAll()
     Utility.Wait(2)
     Alias_SY02_CommandBayCombatResponders.EvaluateAll()
     Utility.Wait(2)
     Alias_SY02_CommandBayCombatResponders.EvaluateAll()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set by: Quest Script, HandleLocationChange.

;Enable the actors in LC043SY03.
Alias_SY03_ActorsInitiallyEnabled.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;Set by: CF05 stage 19
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE LC043QuestScript
Quest __temp = self as Quest
LC043QuestScript kmyQuest = __temp as LC043QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Collection Script when any actor in SY03
;enters combat with the player, or CF05 quest events.

;Trigger the security alarm.
kMyQuest.TriggerSecurityAlarm(Alias_SY03_ActorsAll, LC043SY03Faction)

;Handle faction removal for disguise based on cell
CF05_Alarm.SetStage(60)
CF05.SetStage(63)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE LC043QuestScript
Quest __temp = self as Quest
LC043QuestScript kmyQuest = __temp as LC043QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF05 stage 1900 (undocking the Prototype without clearance),
;or attacking any of the guard ships (451).

;Block space travel to our orbit location to keep the player from
;trivially cheesing the prototype ship escape.
kMyQuest.BlockSpaceTravelForEscape(True)

;Start combat with the player.
LC043SYQuestShipFaction.SetEnemy(PlayerFaction)
Alias_SY_Ships_Quest_All.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0451_Item_00
Function Fragment_Stage_0451_Item_00()
;BEGIN CODE
;Set by: Alias OnHit script, all quest ships.

;Set the ships hostile.
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
;Set by: CF05 stage 1900.
;Stage 1000 will then be set on next Change Location away from SY-920.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE LC043QuestScript
Quest __temp = self as Quest
LC043QuestScript kmyQuest = __temp as LC043QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, Change Location away from SY-920
;after stage 460 has been set during the escape.

;Re-enable space travel to SY-920's orbit location.
kMyQuest.BlockSpaceTravelForEscape(False)

;Swap to the postquest ships.
Alias_SY_Ships_Prequest_All.DisableAll()
Alias_SY_Ships_Quest_All.DisableAll()
Alias_SY_Ships_Postquest_All.EnableAll()

;Update aliases.
kMyQuest.CleanupQuestAliases()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_SY01_ActorsAll Auto Const Mandatory
RefCollectionAlias Property Alias_SY02_ActorsAll Auto Const Mandatory
RefCollectionAlias Property Alias_SY03_ActorsAll Auto Const Mandatory
RefCollectionAlias Property Alias_SY02_ActorsInitiallyEnabled Auto Const Mandatory
RefCollectionAlias Property Alias_SY03_ActorsInitiallyEnabled Auto Const Mandatory

RefCollectionAlias Property Alias_SY_Ships_Quest_All Auto Const
RefCollectionAlias Property Alias_SY_Ships_Prequest_All Auto Const Mandatory
RefCollectionAlias Property Alias_SY_Ships_Postquest_All Auto Const Mandatory
RefCollectionAlias Property Alias_SY_Ships_Guards Auto Const Mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

RefCollectionAlias Property Alias_SY01_NavmeshPlatformDisableSpecial Auto Const Mandatory
ReferenceAlias Property Alias_SY01_CargoBayBarracksGuard Auto Const Mandatory
RefCollectionAlias Property Alias_SY02_CommandBayLobbySoliders Auto Const Mandatory
ReferenceAlias Property Alias_SY02_Natara Auto Const Mandatory
RefCollectionAlias Property Alias_SY02_CommandBayCombatResponders Auto Const Mandatory
ReferenceAlias Property Alias_SY02_CommandBaySecurityDoor Auto Const Mandatory

Scene Property LC043_50_GuardAttack Auto Const Mandatory

Faction Property LC043SYQuestShipFaction Auto Const Mandatory
Faction Property LC043SYNonquestShipFaction Auto Const Mandatory
Faction Property PlayerFaction Auto Const Mandatory
Faction Property LC043SY01FriendFaction Auto Const Mandatory
Faction Property LC043SY01Faction Auto Const Mandatory
Faction Property LC043SY02Faction Auto Const Mandatory
Faction Property LC043SY03Faction Auto Const Mandatory

Quest Property CF05_Alarm Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory
