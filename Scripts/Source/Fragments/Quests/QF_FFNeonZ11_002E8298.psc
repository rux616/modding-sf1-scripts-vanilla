;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ11_002E8298 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Lendel.GetRef())

Alias_Vasco.GetRef().MoveTo(Alias_Lendel.GetRef())
;SetStage on this quest to make Vasco recruitable and already hired
CREW_EliteCrew_Vasco.SetStage(1)
CREW_EliteCrew_Vasco.SetStage(50)

;Move Vasco to the player, make him the active follower, and remind him about his AI package
Actor VascoRef = Alias_Vasco.GetActorRef()
(VascoRef as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
VascoRef.EvaluatePackage()

;Add Vasco's Elite Crew perks
VascoRef.AddPerk(Crew_Ship_AneutronicFusion)
VascoRef.AddPerk(Crew_Ship_Shields)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DialogueFCNeon.SetStage(486)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueFCNeon Auto Const Mandatory

ReferenceAlias Property Alias_Vasco Auto Const Mandatory

ReferenceAlias Property Alias_Lendel Auto Const Mandatory

sq_followersscript Property SQ_Followers Auto Const Mandatory

Quest Property CREW_EliteCrew_Vasco Auto Const Mandatory

Perk Property CREW_Ship_AneutronicFusion Auto Const Mandatory

Perk Property CREW_Ship_Shields Auto Const Mandatory
