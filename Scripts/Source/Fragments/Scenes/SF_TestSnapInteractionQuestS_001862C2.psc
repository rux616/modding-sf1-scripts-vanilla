;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_TestSnapInteractionQuestS_001862C2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
ObjectReference MedBenchREF = CharGenFurniture.GetRef()
PlayerREF.Waitfor3dLoad()
MedBenchREF.Waitfor3dLoad()
MedBenchREF.Activate(PlayerREF)
;PlayerREF.SnapIntoInteraction(MedBenchREF)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CharGenFurniture Auto Const

ReferenceAlias Property CharacterGenFurniture Auto Const
