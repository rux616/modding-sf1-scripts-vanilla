;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update04_DupePlanet_002EE09B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;SQ_GravitationalTraits - refill duped temple planet locations
;to prevent the acquisiton of powers due to the temple quest's
;inability to find another eligible planet if a temple is
;completed on a duped planet.
if pSQ_GravitationalTraits.ArePlanetLocationsDuped()
    pSQ_GravitationalTraits.CheckAndRefillPlanetDupes()
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SQ_GravitationalTraitsScript Property pSQ_GravitationalTraits Auto Const Mandatory
