;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Botany03_00270717 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;close out previous quests in the series
City_NA_Botany01.SetStage(200)
City_NA_Botany02.SetStage(200)

;move player to starting debug marker
Game.GetPlayer().MoveTo(Alias_DebugStartMarker.GetReference())
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(20)
Game.GetPlayer().Moveto(Alias_DebugAkilaMarker01.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(40)
SetStage(42)
Game.GetPlayer().MoveTo(Alias_DebugAkilaMarker02.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(40)
SetStage(50)
SetStage(60)
Game.GetPlayer().MoveTo(Alias_SSNNDebugMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;remove objective from Misc pointer
Botany03Pointer.SetStage(1000)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Branch.GetReference().Enable()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;remove objective from Misc pointer
Botany03Pointer.SetStage(1000)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0046_Item_00
Function Fragment_Stage_0046_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(46)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
SetObjectiveCompleted(46)
SetObjectiveDisplayed(47)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0048_Item_00
Function Fragment_Stage_0048_Item_00()
;BEGIN CODE
if GetStageDone(42)
SetObjectiveDisplayed(45,0)
endif

if IsObjectiveDisplayed(46)
SetObjectiveCompleted(46)
endif

SetObjectiveCompleted(47)

Alias_EarlFulton.GetActorRef().RemoveItem(Alias_Branch_Earl.GetRef())
Game.GetPlayer().AddItem(Alias_Branch_Earl.GetRef())

;remove branch from safe in museum
Alias_Leah_Safe.GetRef().RemoveItem(Alias_Branch.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;If player hasn't bought branch from Earl
if GetStageDone(47)== 0
;but did win the speech challenge
If GetStageDone(41)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(45,0)
else
;but did steal the branch from the museum
SetObjectiveDisplayed(40,0)
SetObjectiveCompleted(45)
Endif
;make sure we remove the other branch from the game
Alias_EarlFulton.GetReference().RemoveItem(Alias_Branch_Earl.GetReference())
else
;If player did buy branch from Earl, remove steal objective
SetObjectiveDisplayed(45,0)
endif

;If player stole branch after being directed to Earl, remove objective
if IsObjectiveCompleted(46) == 0
SetObjectiveDisplayed(46,0)
endif

;If player stole branch before talking to Leah
if IsObjectiveCompleted(20) == 0
SetObjectiveDisplayed(20,0)
endif

SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Branch.GetReference())
Game.GetPlayer().RemoveItem(Alias_Branch_Earl.GetReference())
City_NA_Botany03_005_Kelton.Start()
SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN CODE
SetObjectiveCompleted(55)
SetObjectiveDisplayed(56)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(56)
SetObjectiveDisplayed(60)

;if player has interacted with Nadia Muffaz enough for her to be available, show objective
if Rad02_InterviewCount.GetValue() >= 3
SetStage(70)
endif

;Kelton gives player the data slate
Alias_KeltonFrush.GetActorRef().RemoveItem(Alias_Kelton_Slate.GetRef())
Game.GetPlayer().AddItem(Alias_Kelton_Slate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Kelton_Slate.GetReference())

SetObjectiveCompleted(60)
SetObjectiveDisplayed(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0074_Item_00
Function Fragment_Stage_0074_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Kelton_Slate.GetReference())
SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
if GetStageDone(65)
	SetObjectiveCompleted(60)

	if IsObjectiveDisplayed(70)
		SetObjectiveDisplayed(70,0)
	endif
        if IsObjectiveDisplayed(65)
                SetObjectiveCompleted(65)
        endif
elseif GetStageDone(74)
	SetObjectiveCompleted(70)
	SetObjectiveDisplayed(60,0)
endif
SetObjectiveDisplayed(75)

;enable kiosk sound marker
KioskSoundMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(75)
SetObjectiveDisplayed(80)

;disable the tree sap
TreeSap_Enabler.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;start the hero tree flower enabler quest
pCity_NA_Botany03_FlowerStateChange.Start()
pCity_NA_Botany03_FlowerStateChange.SetStage(10)

;disable tree and kiosk sound markers
TreeSoundMarker.Disable()
KioskSoundMarker.Disable()

;stop botany03
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Branch Auto Const Mandatory

ReferenceAlias Property Alias_DebugStartMarker Auto Const Mandatory

Scene Property City_NA_Botany03_005_Kelton Auto Const Mandatory

Quest Property City_NA_Botany01 Auto Const Mandatory

Quest Property City_NA_Botany02 Auto Const Mandatory

GlobalVariable Property RAD02_InterviewCount Auto Const Mandatory

ReferenceAlias Property Alias_Kelton_Slate Auto Const Mandatory

ReferenceAlias Property Alias_EarlFulton Auto Const Mandatory

ReferenceAlias Property Alias_Branch_Earl Auto Const Mandatory

ReferenceAlias Property Alias_DebugAkilaMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_DebugAkilaMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_SSNNDebugMarker Auto Const Mandatory

Quest Property Botany03Pointer Auto Const

ReferenceAlias Property Alias_Leah_Safe Auto Const

ReferenceAlias Property Alias_KeltonFrush Auto Const Mandatory

Quest Property pCity_NA_Botany03_FlowerStateChange Auto Const Mandatory

ObjectReference Property TreeSoundMarker Auto Const

ObjectReference Property KioskSoundMarker Auto Const

ObjectReference Property TreeSap_Enabler Auto Const
