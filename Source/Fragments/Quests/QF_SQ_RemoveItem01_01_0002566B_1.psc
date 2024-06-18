;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_RemoveItem01_01_0002566B_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Start-up.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; The bot unloaded; stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; The bot arrived at the item; pick up the item and stop
ObjectReference theBot = Bot.GetRef()
theBot.AddItem(theItem.GetRef())
int s1 = BotPickUpSound.Play(theBot)
Utility.Wait(2)
int s2 = BotSuccessSound.Play(theBot)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WwiseEvent Property BotPickUpSound Auto Const Mandatory

ReferenceAlias Property Bot Auto Const

ReferenceAlias Property theItem Auto Const

WwiseEvent Property BotSuccessSound Auto Const
