;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:TopicInfos:TIF_SFFL_MS01_CrimeDialogue_02034E63 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
float Bounty = SFFL_MS01_NewBabylonFaction.GetCrimeGold()
SFFL_MS01_CrimeGold_Amount.SetValue(Bounty)
GetOwningQuest().UpdateCurrentInstanceGlobal(SFFL_MS01_CrimeGold_Amount)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property SFFL_MS01_NewBabylonFaction Auto Const Mandatory

GlobalVariable Property SFFL_MS01_CrimeGold_Amount Auto Const Mandatory
