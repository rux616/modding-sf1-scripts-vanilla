;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RL082_EavesdroppingScene__002566CC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
Alias_Actor03.getref().disable()
Alias_Actor04.getref().disable()
EavesdropGroupAlias.RemoveFromFaction(PlayerAllyFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Actor03 Auto Const

ReferenceAlias Property Alias_Actor04 Auto Const

ReferenceAlias Property EavesdropGroup Auto Const

RefCollectionAlias Property EavesdropGroupAlias Auto Const

Faction Property PlayerAllyFaction Auto Const
