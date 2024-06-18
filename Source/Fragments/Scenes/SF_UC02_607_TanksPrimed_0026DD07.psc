;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UC02_607_TanksPrimed_0026DD07 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE UC02_QuestScript
UC02_QuestScript kmyQuest = GetOwningQuest() as UC02_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.TriggerPumpPrimeAudio(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
