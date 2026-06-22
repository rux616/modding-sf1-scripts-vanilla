;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ07_0006E0A1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)


;put all the fliers in player inventory
Game.GetPlayer().AddItem(Alias_Flyer.GetRef())
Game.GetPlayer().AddItem(Alias_Flyer01.GetRef())
Game.GetPlayer().AddItem(Alias_Flyer02.GetRef())
Game.GetPlayer().AddItem(Alias_Flyer03.GetRef())
Game.GetPlayer().AddItem(Alias_Flyer04.GetRef())


; Close pointer
FFNeonGuardPointer_Z07.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)
NewillFlyerHandedOut.Mod(1)


if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)
KosmoLeeFlyerHandedOut.Mod(1)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef()) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())

ModObjectiveGlobal(1, FlyersHandedOut)

if FlyersHandedOut.GetValue() == 5
self.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
NeonDialogueQuest.SetStage(460)

;Set a global variable to be == DaysPassed + 2 and one that's +4, so we can condition TLs with it
TLTimer.SetValue(DaysPassed.GetValue() + 2)
TLTimer2.SetValue(DaysPassed.GetValue() + 4)

CompleteAllObjectives()

;remove fliers from inventory
Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer05.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer06.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer07.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer08.GetRef())
Game.GetPlayer().RemoveItem(Alias_Flyer09.GetRef())

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FlyersHandedOut Auto Const

GlobalVariable Property NewillFlyerHandedOut Auto Const

ReferenceAlias Property Alias_Flyer Auto Const Mandatory

ReferenceAlias Property Alias_Saburo Auto Const Mandatory

ReferenceAlias Property Alias_Flyer01 Auto Const Mandatory

ReferenceAlias Property Alias_Flyer02 Auto Const Mandatory

ReferenceAlias Property Alias_Flyer03 Auto Const Mandatory

ReferenceAlias Property Alias_Flyer04 Auto Const Mandatory

ReferenceAlias Property Alias_Flyer05 Auto Const Mandatory

ReferenceAlias Property Alias_Flyer06 Auto Const Mandatory

ReferenceAlias Property Alias_Flyer07 Auto Const Mandatory

ReferenceAlias Property Alias_Flyer08 Auto Const Mandatory

ReferenceAlias Property Alias_Flyer09 Auto Const Mandatory

Quest Property NeonDialogueQuest Auto Const

GlobalVariable Property TLTimer Auto Const

GlobalVariable Property DaysPassed Auto Const



GlobalVariable Property TLTimer2 Auto Const

GlobalVariable Property KosmoLeeFlyerHandedOut Auto Const

Quest Property FFNeonGuardPointer_Z07 Auto Const Mandatory
