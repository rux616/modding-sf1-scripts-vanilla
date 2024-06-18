;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_MQ207C_0022D67C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by: DefaultAliasOnLoad script on the satellite.

;Start the Distress Signal hailing scene.
if (MQ207C.GetStage() < 100)
     MQ207C_100_DistressSignalHail.Start()
EndIf

;MQ207B displays 'Listen to the Distress Signal'
MQ207B.SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set by: MQ207C_100_DistressSignalHail, scene end.

;Notify MQ207C that the player has listened to the hailing scene.
MQ207C.SetStage(105)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ207C_100_DistressSignalHail Auto Const Mandatory

Quest Property MQ207C Auto Const Mandatory

Quest Property MQ207B Auto Const Mandatory
