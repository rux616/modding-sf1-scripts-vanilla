;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update05_002F0912 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
COM_Companion_SamCoe_CoraCoe_Handler.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

if PlayerRef.HasPerk(Trait_KidStuff)
  TraitKidStuff.SetStageNoWait(25)
  TraitKidStuff.SetStageNoWait(50)
endif

; If the player has the Starter Home trait, queue up the quest
If PlayerRef.HasPerk(Trait_StarterHome)
  TraitStarterHome.SetStageNoWait(100)
Else
  TraitStarterHome.Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property COM_Companion_SamCoe_CoraCoe_Handler Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property Trait_StarterHome Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory
