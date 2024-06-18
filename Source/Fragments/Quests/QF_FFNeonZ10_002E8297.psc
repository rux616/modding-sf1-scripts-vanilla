;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ10_002E8297 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Manaia.GetReF().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Check if the Gang Showdown is running, if not, play flavor scene

if City_Neon_Gang03.IsRunning()
    Alias_Thug01.GetRef().DisableNoWait()
else
    FFNeonZ10_020_TL_ThugScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Actor Thug01 = Alias_Thug01.GetActorRef()

; Check if Gang Showdown is running before enabling flavor thugs
if !City_Neon_Gang03.IsRunning()
    Thug01.EnableNoWait()
    Thug01.SetValue(Aggression, 1)
    Alias_Thug02.GetActorRef().SetValue(Aggression, 1)
    Alias_Thug03.GetActorRef().SetValue(Aggression, 1)
endif

; Close the pointer
FFNeonGuardPointer_Z10.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Ensure objective pops up if player repeats stage, enable thugs

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20, abforce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Player contraband removed. If perk used, pay extra
Game.GetPlayer().RemoveItem(Alias_Contraband.GetRef())

if GetStageDone(40)
    Game.GetPlayer().AddItem(Credits, Trait_Credit_ExtortionMedium.GetValueInt())
else
    Game.GetPlayer().AddItem(Credits, FFNeonZ10_SidestarValue.GetValueInt())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Manaia.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Thug01 Auto Const Mandatory

Scene Property FFNeonZ10_020_TL_ThugScene Auto Const Mandatory

ReferenceAlias Property Alias_FrankContainer Auto Const Mandatory

ReferenceAlias Property Alias_Contraband Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Thug02 Auto Const Mandatory

ReferenceAlias Property Alias_Thug03 Auto Const Mandatory

Quest Property City_Neon_Gang03 Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property CreditsRewardMinorExtortion Auto Const Mandatory

GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const Mandatory

GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const Mandatory

Quest Property FFNeonGuardPointer_Z10 Auto Const Mandatory

ReferenceAlias Property Alias_Manaia Auto Const Mandatory

GlobalVariable Property FFNeonZ10_SidestarValue Auto Const Mandatory
