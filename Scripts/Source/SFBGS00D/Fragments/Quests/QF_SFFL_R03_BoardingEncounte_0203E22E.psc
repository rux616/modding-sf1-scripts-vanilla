;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_R03_BoardingEncounte_0203E22E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SlateGlobal.SetValue(Utility.RandomInt(0, 10))

;block activation on the pilot seat
Alias_PilotSeat.GetRef().BlockActivation(true, true)

;if SFFL_R03 scenario global = 2, put the dataslate in the captain's inventory 50% of the time
if scenarioglobal.getvalue() == 2 
 if SlateGlobal.getvalue() <= 5
  Alias_Captain.GetActorRef().AddItem(Slate)
 endif
endif

;set stage 20 if spawning corpse
if ScenarioGlobal01.GetValue() == 1
  setstage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_SFFL_R03_Corpse.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SFFL_R03_Corpse Auto Const Mandatory

GlobalVariable Property ScenarioGlobal01 Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

GlobalVariable Property ScenarioGlobal Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

GlobalVariable Property SlateGlobal Auto Const Mandatory

Book Property Slate Auto Const Mandatory
