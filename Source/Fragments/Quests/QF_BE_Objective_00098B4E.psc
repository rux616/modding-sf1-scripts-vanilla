;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_Objective_00098B4E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set by: Startup.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by: BEScript.

;Display 'Leave the ship'
SetObjectiveDisplayed(40)

;Display 'Kill the Enemy Crew'
SetObjectiveDisplayedAtTop(20)

;Advance the quest and display QTs if appropriate.
DefaultCounterAliasColIncOnDeathA allCrewCol = Alias_AllCrew as DefaultCounterAliasColIncOnDeathA
if (allCrewCol.GetCount() <= allCrewCol.TargetRemainingCount)
     SetStage(25)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Set by: AllCrew alias counter.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set by: AllCrew alias counter.

;Complete 'Kill the Enemy Crew'
SetObjectiveCompleted(20)

;Display 'Take over the ship'
SetObjectiveDisplayed(30)

;Display 'Leave the ship'
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by: Taking over the ship. (Default Sit in Pilot Seat)

;Pop tutorial about home ships
MQ_TutorialQuest.SetStage(300)

;Wrap up objectives.
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveSkipped(40)
CompleteQuest()

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Set by: Leaving the ship.

;Wrap up objectives.
SetObjectiveSkipped(20)
SetObjectiveSkipped(30)
SetObjectiveCompleted(40)
CompleteQuest()

;And stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BEObjective_OnceOnly_Global Auto Const Mandatory

GlobalVariable Property BEObjective_OnceOnly_DoneGlobal Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

ActorValue Property BE_SpaceshipTakenOver Auto Const Mandatory

ReferenceAlias Property Alias_enemyShip Auto Const Mandatory

Message Property Tutorial_NewHomeShip Auto Const Mandatory

Quest Property MQ_TutorialQuest Auto Const Mandatory
