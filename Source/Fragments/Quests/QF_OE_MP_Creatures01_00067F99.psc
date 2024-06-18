;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_Creatures01_00067F99 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_Nest.GetRef().AddItem(StandardLoot, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor Backup = Alias_Backup.GetActorRef()
Actor Attacker = Alias_Attacker.GetActorRef()
Actor Defender = Alias_Defender.GetActorRef()

Attacker.StartCombat(Defender)
Defender.StartCombat(Attacker)
Attacker.EvaluatePackage()
Defender.EvaluatePackage()

Backup.Enable()
Backup.EvaluatePackage()
Backup.StartCombat(Attacker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
If !GetStageDone(300)
   Alias_Attacker.GetRef().AddItem(StandardLoot,1)
EndIf 

If !GetStageDone(500)
   Alias_Nest.GetRef().AddItem(BonusLoot, 1)      
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Attacker Auto Const Mandatory
ReferenceAlias Property Alias_Nest Auto Const Mandatory
LeveledItem Property BonusLoot Auto Const Mandatory
LeveledItem Property StandardLoot Auto Const Mandatory

ReferenceAlias Property Alias_Defender Auto Const Mandatory

ReferenceAlias Property Alias_Backup Auto Const Mandatory
