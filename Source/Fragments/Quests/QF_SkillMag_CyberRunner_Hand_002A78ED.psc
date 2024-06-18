;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SkillMag_CyberRunner_Hand_002A78ED Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;add one hacking attempt for the player
Game.GetPlayer().SetValue(SecurityMenuMaxAutoattemptPoints, (Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;add one hacking attempt for the player
Game.GetPlayer().SetValue(SecurityMenuMaxAutoattemptPoints, (Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property SecurityMenuMaxAutoattemptPoints Auto Const
