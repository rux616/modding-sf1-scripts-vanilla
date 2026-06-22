;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_SC06Debug_0027A973 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by: OnDeath, McGrath ship.

;If the player attacked destroyed the ship,
;this encounter will never trigger again.
BE_SC03_McGrathEncounterStateGlobal.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BE_SC03_McGrathEncounterStateGlobal Auto Const Mandatory
