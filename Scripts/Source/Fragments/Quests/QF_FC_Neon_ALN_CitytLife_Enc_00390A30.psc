;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC_Neon_ALN_CitytLife_Enc_00390A30 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; This property needs to be set for each quest
LifeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Do nothing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Flag the actor to exit their initial package
Alias_Actor01.GetRef().SetValue(FC_Neon_ALN_CityLife_State, 1.0)
Alias_Actor02.GetRef().SetValue(FC_Neon_ALN_CityLife_State, 1.0)

; Make them move sooner than later
Alias_Actor01.GetActorRef().EvaluatePackage()
Alias_Actor02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Remove the actors
Alias_Actor01.GetRef().Disable()
Alias_Actor02.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Actor01 Auto Const Mandatory

ReferenceAlias Property Alias_Actor02 Auto Const Mandatory

Scene Property LifeScene Auto Const

ActorValue Property FC_Neon_ALN_CityLife_State Auto Const Mandatory
