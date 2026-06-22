;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFBGS00D_CruiseMode_Tutor_0107DCFA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFBGS00D_CruiseMode_Tutorial_Script
Quest __temp = self as Quest
SFBGS00D:SFBGS00D_CruiseMode_Tutorial_Script kmyQuest = __temp as SFBGS00D:SFBGS00D_CruiseMode_Tutorial_Script
;END AUTOCAST
;BEGIN CODE
;Disable access to Cruise Mode button
;kmyquest.EnableCruiseModeAccess(false)

Debug.Trace(self + "Cruise Tutorial - Quest: First stage...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFBGS00D_CruiseMode_Tutorial_Script
Quest __temp = self as Quest
SFBGS00D:SFBGS00D_CruiseMode_Tutorial_Script kmyQuest = __temp as SFBGS00D:SFBGS00D_CruiseMode_Tutorial_Script
;END AUTOCAST
;BEGIN CODE
;show Cruise Mode tutorial message based on source
if (Game.UsingGamepad() == false)
   CruiseTutorialMessage.Show()
else
   CruiseTutorialMessageGamepad.Show()
endif

;Set Actor Value to show player has seen the tutorial
   Game.GetPlayer().SetValue(SFFL_CruiseMode_TutorialSeen, 1)
;Re-enable access to Cruise Mode button
   kmyquest.EnableCruiseModeAccess(true)

Debug.Trace(self + "Cruise Tutorial - Tutorial Message Quest Stage fired!")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property CruiseTutorialMessage Auto Const

Message Property CruiseTutorialMessageGamepad Auto Const

ActorValue Property SFFL_CruiseMode_TutorialSeen Auto Const
