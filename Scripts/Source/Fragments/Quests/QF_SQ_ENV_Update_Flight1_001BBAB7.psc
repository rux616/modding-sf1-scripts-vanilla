;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_ENV_Update_Flight1_001BBAB7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SQ_ENV.Trace(self, "SQ_ENV_Update_Flight1 run on start stage 0")

;make sure the main SQ_ENV quest is running - it's a start game enabled quest, we just need to make sure it's running before we touch it
while SQ_ENV.IsRunning() == false
   Utility.Wait(1)
   SQ_ENV.Trace(self, "SQ_ENV_Update_Flight1 run on start stage 0... waiting for SQ_ENV to start...")
endwhile

;we changed some abilities given to player, they will have incorrect effects in them until the abilities restart.
;so we need to remove and re-add the player to the alias to "reboot" the abilities so they have the correct effects in them
SQ_ENV.Trace(self, "SQ_ENV_Update_Flight1 run on start stage 0... clearing SQ_ENV Player alias and refilling it, to fix up magic ability effects")

;SQ_ENV.Player.Clear()
;SQ_ENV.Player.ForceRefTo(Game.GetPlayer())
;that didn't work, 1) required optional flag, 2) when set it still didn't work, never readded spells to player
;that seems like a bug that should get looked at.

SQ_ENV.Player.RefillAlias()


stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
SQ_ENV.Trace(self, "SQ_ENV_Update_Flight1 run on stop stage 999")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

sq_envscript Property SQ_ENV Auto Const Mandatory
