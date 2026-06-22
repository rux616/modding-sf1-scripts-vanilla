;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF05_Alarm_000392DA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.RemoveFromFaction(LC043SY01Faction)
Alias_CF05_CargoDoorLock.GetRef().Lock(false)

LC043.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_01
Function Fragment_Stage_0060_Item_01()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.RemoveFromFaction(LC043SY02Faction)
CF05_CommandBayDoorREF.Lock(false)

if CF05.GetStageDone(1029)
    Alias_CF05_EngineerMedina.GetActorRef().StartCombat(Game.GetPlayer())
endif

LC043.SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_02
Function Fragment_Stage_0060_Item_02()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.RemoveFromFaction(LC043SY03Faction)
Alias_CF05_GabrielVogel.GetActorRef().RemovefromFaction(PlayerFriendFaction)

LC043.SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_03
Function Fragment_Stage_0060_Item_03()
;BEGIN CODE
CF05.SetStage(60)
CF05.SetObjectiveSkipped(810)

if !CF05.GetStageDone(1200)
    CF05.SetObjectiveDisplayed(1000)
endif

CF05.SetObjectiveSkipped(1014)
CF05.SetObjectiveSkipped(1016)
CF05.SetObjectiveSkipped(1020)
CF05.SetObjectiveSkipped(1030)
CF05.SetObjectiveSkipped(1040)
CF05.SetObjectiveSkipped(1041)
CF05.SetObjectiveSkipped(1050)
CF05.SetObjectiveSkipped(1060)
CF05.SetObjectiveSkipped(1700)
CF05.SetObjectiveSkipped(1710)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property LC043SYFaction Auto Const Mandatory

Faction Property LC043SY01Faction Auto Const Mandatory

Faction Property LC043SY02Faction Auto Const Mandatory

Faction Property LC043SY03Faction Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

ObjectReference Property CF05_CommandBayDoorREF Auto Const Mandatory

ReferenceAlias Property Alias_CF05_GabrielVogel Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

ReferenceAlias Property Alias_CF05_EngineerMedina Auto Const Mandatory

Quest Property LC043 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CargoDoorLock Auto Const Mandatory
