;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_DialogueAnchorpoint_02025B98 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(SFFL_AnchorpointZ02_PT1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Move to Maddie Wing to taste SFFL_AnchorpointZ02

Game.GetPlayer().MoveTo(SFFL_AnchorpointZ02_PT1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Add NPCs to factions

Alias_DanicaVolkov.GetActorRef().AddToFaction(ShipServicesFaction)
Alias_Cutty.GetActorRef().AddToFaction(SQ_DoctorsFaction)
Alias_CuttyClean.GetActorRef().AddToFaction(SQ_DoctorsFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SFFL_DialogueAnchorpoint_TigerApproachScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
; Tiger approach scene done, begin follow Maddie procedure

Alias_Tiger.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
; Set when the player enters trigger volume "x"
SFFL_DialogueAnchorpoint_IntroSceneAlternate.Start()

; Spin up AnchorpointZ03
SFFL_AnchorpointZ03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
; Set when the intro scene ends (for any reason)
; Until this stage is set, random conversations cannot play

SFFL_AnchorpointZ01.SetStage(5)

Alias_RishiSaint.GetActorRef().EvaluatePackage()
Alias_ChanHuang.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set at the end of SFFL_DialogueAnchorpoint_IntroScene

Alias_RishiSaint.GetActorRef().EvaluatePackage()
Alias_ChanHuang.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Alias_MaddieWing.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set in Phase 8, Action 8, phase 1 of scene SFFL_DialogueAnchorpoint_RishiGreet
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; This stage is referenced in Anchorpoint_Z03 in a speech challenge
; The stage is set if the player asks the question in
; the scene SFFL_DialogueAnchorpoint_CuttyTL03Quest phase 7 action 8
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
; This stage was added due to issue SF-71423
; Danika was selling several ships that could not travel to the 
; central planets of the Settled Systems due ot jump range
; To allow her to sell ships again, this stage will need to be set.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; This stage gets set in the completion stage of AnchorpointZ03
; if stage 250 of that quest had already been set
; This is used to condition the location change script that 
; changes Cutty and his infirmary to the cleaned-up versions
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Swap Cutty and the infirmary to their cleaned-up state
SFFL_AnchorpointInfirmaryAltStateMarker.Enable()

; Move Miles to his scene marker, update his factions
actor Miles = Alias_MilesCutler.GetActorRef()
Miles.MoveTo(SFFL_AnchorpointZ03_PQSceneMarkerMiles)
Miles.AddToFaction(SFFL_CrimeFactionANchorpoint)
Miles.RemoveFromFaction(CaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
; Set when the player enters the trigger volume 'SFFL_Anchorpoint_CuttyMilesSceneTrigger'
; This trigger is placed outside the infirmary door and is initially disabled, enabling
; when stage 1100 on this quest has been set

; Start the scene
SFFL_DialogueAnchorpoint_CuttyMilesScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
Alias_CuttyClean.GetActorRef().EvaluatePackage()
Alias_MilesCutler.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SFFL_DialogueAnchorpoint_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_Tiger Auto Const Mandatory

Quest Property SFFL_AnchorpointZ01 Auto Const Mandatory

ObjectReference Property SFFL_AnchorpointZ02_PT1 Auto Const Mandatory

Faction Property ShipServicesFaction Auto Const Mandatory

Faction Property SQ_DoctorsFaction Auto Const Mandatory

ReferenceAlias Property Alias_CuttyClean Auto Const Mandatory

ReferenceAlias Property Alias_DanicaVolkov Auto Const Mandatory

ReferenceAlias Property Alias_Cutty Auto Const Mandatory

ReferenceAlias Property Alias_ChanHuang Auto Const Mandatory

ReferenceAlias Property Alias_RishiSaint Auto Const Mandatory

ObjectReference Property SFFL_AnchorpointInfirmaryAltStateMarker Auto Const Mandatory

Scene Property SFFL_DialogueAnchorpoint_CuttyMilesScene Auto Const Mandatory

ObjectReference Property SFFL_AnchorpointZ03_PQSceneMarkerMiles Auto Const Mandatory

ReferenceAlias Property Alias_MilesCutler Auto Const Mandatory

Scene Property SFFL_DialogueAnchorpoint_IntroSceneAlternate Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

Faction Property SFFL_CrimeFactionAnchorpoint Auto Const Mandatory

ObjectReference Property SFFL_RishiCredstickRef Auto Const Mandatory

Quest Property SFFL_AnchorpointZ03 Auto Const Mandatory

Scene Property SFFL_DialogueAnchorpoint_TigerApproachScene Auto Const Mandatory

ReferenceAlias Property Alias_MaddieWing Auto Const Mandatory
