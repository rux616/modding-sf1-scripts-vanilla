;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_005_FaceGenScene_00005743_2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE mq101script
mq101script kmyQuest = GetOwningQuest() as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
ObjectReference MedBenchREF = MedBench.GetRef()
PlayerREF.Waitfor3dLoad()
MedBenchREF.Waitfor3dLoad()
;MedBenchREF.Activate(PlayerREF)
PlayerREF.SnapIntoInteraction(MedBenchREF)
kmyquest.StartCharGen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
;save before chargen scene
Game.SetInCharGen(False, false, false)
Game.RequestSave()
Game.SetInCharGen(True, True, False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MedBench Auto Const
