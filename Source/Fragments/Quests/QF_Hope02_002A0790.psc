;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Hope02_002A0790 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Enable the quest actors
Alias_AdellaFaheem.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Hope02_050_AdellaBark.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

; Give the player the slate
Game.GetPlayer().AddAliasedItem(Hope02_FaheemSlate, Alias_FaheemSlate)

; Ernesto is now in The Pit Stop
; Note: Fictionally he just just arrived, so the player wouldn't
;   have spotted him beforehand.
Alias_Ernesto.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Ernesto goes hostile
Actor aTarg = Alias_Ernesto.GetActorRef()
Actor aPlayer = Game.GetPlayer()

aTarg.StartCombat(aPlayer)
aTarg.AddToFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Flag this for next playthrough - you've killed Ernesto once
Game.GetPlayer().SetValue(Hope02_Foreknowledge_KilledErnestoAV, 1.0)

; Sal something after Ernesto is shot
Hope02_SalShout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
CompleteAllObjectives()
SetObjectiveCompleted(300)

; She says she's leaving - so make her leave now
Alias_AdellaFaheem.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(300)

Alias_Ernesto.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; She says she's leaving - so make her leave now
Alias_AdellaFaheem.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Get rid of the characters
Alias_AdellaFaheem.GetRef().Disable()
Alias_Ernesto.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AdellaFaheem Auto Const Mandatory

ReferenceAlias Property Alias_Ernesto Auto Const Mandatory

Book Property Hope02_FaheemSlate Auto Const Mandatory

ReferenceAlias Property Alias_FaheemSlate Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Scene Property Hope02_050_AdellaBark Auto Const Mandatory

GlobalVariable Property Hope02_Foreknowledge_KilledErnesto Auto Const Mandatory

ActorValue Property Hope02_Foreknowledge_KilledErnestoAV Auto Const Mandatory

Scene Property Hope02_SalShout Auto Const Mandatory
