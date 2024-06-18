;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_UCR04_HarvestSamplePerk_000066AA Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_02
Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
;Send off the custom event
(DialogueUCFactionAlwaysOn as UCParentFactionQuestScript).SendUCR04SampleCollectedEvent(akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property UCR04_SpecimenSample Auto Const Mandatory

Quest Property UCR04 Auto Const Mandatory

Quest Property DialogueUCFactionAlwaysOn Auto Const Mandatory
