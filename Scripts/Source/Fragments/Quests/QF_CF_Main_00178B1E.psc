;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF_Main_00178B1E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Quickstart - CF02

;Set stages.
SetStage(10)
SetStage(20)

;Enable the Vigilance and set up its interior.
LC082.SetStage(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Quickstart - CF03+

;Set stages.
SetStage(0)
CFKey.SetStage(200)
DialogueCFTheKey.SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddtoFaction(CrimsonFleetFaction)
Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk)
PlayerJoined_CrimsonFleet.SetValue(1)

;Move the Key's arrival point closer to the station.
TheKeyMapMarkerHeadingRef.MoveTo(TheKeyOriginMarkerRef)
TheKeyPlanetUniqueArrivalMarkerRef.MoveTo(TheKeyOriginMarkerRef)

;Make CF friends of Crew, Companions, and Outpost defenses
int i = 0

while i < FleetFriendFactions.Length
    CrimsonFleetFaction.SetAlly(FleetFriendFactions[i], true, true)
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
PlayerFaction.SetAlly(UCSysDefFaction)
LC082.SetStage(200)
PlayerJoined_SysDef.SetValue(1)
Game.GetPlayer().AddPerk(FactionUnitedColoniesSysDefPerk)
DialogueUCVigilance.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(CrimsonFleetFaction)
PlayerFaction.SetEnemy(CrimsonFleetFaction)
Game.GetPlayer().RemovePerk(FactionCrimsonFleetPerk)

;Make CF friends of Crew, Companions, and Outpost defenses
int i = 0

while i < FleetFriendFactions.Length
    CrimsonFleetFaction.SetEnemy(FleetFriendFactions[i], true, true)
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Player killed innocents during a mission - first time
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN AUTOCAST TYPE cf_main_questscript
Quest __temp = self as Quest
cf_main_questscript kmyQuest = __temp as cf_main_questscript
;END AUTOCAST
;BEGIN CODE
;Player killed innocents during a mission - second (last) time
kmyQuest.RegisterForLoadScreenEvent()
Game.GetPlayer().MoveTo(PrisonMarkerNewAtlantis)
kmyQuest.SendPlayerToJail()

;On Changing location from the Vigilance, this quest will set Stage 300
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE cf_main_questscript
Quest __temp = self as Quest
cf_main_questscript kmyQuest = __temp as cf_main_questscript
;END AUTOCAST
;BEGIN CODE
PlayerFaction.SetEnemy(UCSysDefFaction)
CF_SysDefShutdown.SetValue(1)
kmyQuest.SysDefShutdown()
LC082.SetStage(250)
Game.GetPlayer().RemovePerk(FactionUnitedColoniesSysDefPerk)

;CF02 Handling
if CF02.GetStageDone(999) && !CF02.GetStageDone(1700)
    CF02.SetStage(998)
endif

;Start up CFSD01 if it hasn't (for item placement) and then Cancel CFSD01 Objectives
If CFSD01.GetStageDone(5) == 0
CFSD01.SetStage(5)
Endif

;Display the kickout message unless CF08/LC088 has started.
if (LC088.GetStage() == 0)
     CF_Main_SysDefKickout.Show()
else
     SetStage(75)
EndIf

CFSD01.SetStage(1500)

;Handle Alternate Quest Start in CF01 if you want to shoot your way off the Vigilance.
if (CF01.IsRunning() && CF01.GetStageDone(175) == 0)
     if (CF01.GetStageDone(310) == 0)
          CF01.SetStage(230)
     ElseIf (CF01.GetStageDone(310) == 1 && CF01.GetStageDone(340) == 0)
          CF01.SetStage(309)
     EndIf
EndIf

;Fail misc objective if in progress
DialogueUCVigilance.FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CrimsonFleetFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Perk Property FactionCrimsonFleetPerk Auto Const Mandatory

GlobalVariable Property CF_SysDefShutdown Auto Const Mandatory

Quest Property LC082 Auto Const Mandatory

Faction Property UCSysDefFaction Auto Const Mandatory

Quest Property CFKey Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

GlobalVariable Property PlayerJoined_CrimsonFleet Auto Const Mandatory

GlobalVariable Property PlayerJoined_SysDef Auto Const Mandatory

Perk Property FactionUnitedColoniesSysDefPerk Auto Const Mandatory

Quest Property CF01 Auto Const Mandatory

Message Property CF_Main_SysDefKickout Auto Const Mandatory

Quest Property LC088 Auto Const Mandatory

Quest Property DialogueUCVigilance Auto Const Mandatory

ObjectReference Property TheKeyMapMarkerHeadingRef Auto Const Mandatory
ObjectReference Property TheKeyOriginMarkerRef Auto Const Mandatory
ObjectReference Property TheKeyPlanetUniqueArrivalMarkerRef Auto Const Mandatory

ObjectReference Property PrisonMarkerNewAtlantis Auto Const Mandatory

GlobalVariable Property CF04_UCArrested Auto Const Mandatory

Quest Property CF04 Auto Const Mandatory

Quest Property CFSD01 Auto Const Mandatory

Faction[] Property FleetFriendFactions Auto Const Mandatory

Quest Property CF02 Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
