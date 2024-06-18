;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueRedMile_002B2C2B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
DialogueRedMile_OpeningScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_Mei.GetActorRef().EvaluatePackage()
Alias_Stocker.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
If !FFRedMileR01.IsRunning() && !FFRedMileR01Misc.IsRunning()
	FFRedMileR01Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
;Checked via condition immediately prior to this stage getting set.
Game.GetPlayer().RemoveItem(Food_RS_Tavern_RunnersRush, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueRedMile_OpeningScene Auto Const Mandatory

Potion Property Food_RS_Tavern_RunnersRush Auto Const Mandatory

ReferenceAlias Property Alias_Jade Auto Const Mandatory

ReferenceAlias Property Alias_Mei Auto Const Mandatory

ReferenceAlias Property Alias_Stocker Auto Const Mandatory

Quest Property FFRedMileR01Misc Auto Const Mandatory

Quest Property FFRedMileR01 Auto Const Mandatory
