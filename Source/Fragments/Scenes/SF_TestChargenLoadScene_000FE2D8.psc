;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_TestChargenLoadScene_000FE2D8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
Game.GetPlayer().SnapIntoInteraction(CharGenFurniture.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CharGenFurniture Auto Const

ReferenceAlias Property CharacterGenFurniture Auto Const
