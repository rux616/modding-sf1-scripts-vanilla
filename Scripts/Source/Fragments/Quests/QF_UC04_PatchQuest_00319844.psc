;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC04_PatchQuest_00319844 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;debug.notification("patch quest run")
Actor ShipTech = Alias_ShipTech02.GetActorRef()

;revive ship tech and restart uc04 to fix broken states
if ShipTech.IsDead() == 1 && UC03.IsCompleted() == 0
  ShipTech.Resurrect()
  ShipTech.Reset()
elseif ShipTech.IsDead() == 1 && UC03.IsCompleted() == 1 && UC04.IsRunning() == 0
  ShipTech.Resurrect()
  ShipTech.Reset()
  UC04.Start()
endif

;make shiptech essential
ShipTech.SetEssential(true)

;stop quest here
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ShipTech02 Auto Const Mandatory

Quest Property UC04 Auto Const Mandatory

Quest Property UC03 Auto Const Mandatory
