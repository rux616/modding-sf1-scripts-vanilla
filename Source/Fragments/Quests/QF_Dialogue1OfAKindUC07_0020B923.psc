;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Dialogue1OfAKindUC07_0020B923 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Actor Unit99REF = Alias_Unit99.GetActorRef()
Unit99Ref.SetValue(Aggression, 2)
Unit99REF.SetRestrained(false)
Unit99Ref.AddToFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor Unit99REF = Alias_Unit99.GetActorRef()
Unit99Ref.RemoveFromFaction(EclipticFaction)
Unit99Ref.AddToFaction(UC07_EclipticEnemyFaction)
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Unit99 Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property UC07_EclipticEnemyFaction Auto Const Mandatory

GlobalVariable Property PlayerKnows_Freestar1stCavalry Auto Const Mandatory

Faction Property EclipticFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
