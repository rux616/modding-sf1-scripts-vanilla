;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_GenericDerelict_Geneta_000F2E6B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
ObjectReference MournerRef = Alias_Mourner_UC01.GetRef()
ObjectReference SandboxRef = Alias_NewAtlantisSanctumMarker.GetRef()

Alias_Mourner.ForceRefTo(MournerRef)
MournerRef.EnableNoWait()
MournerRef.SetLinkedRef(SandboxRef)
MournerRef.MoveTo(SandboxRef)
Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard01, Alias_IDCard)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
ObjectReference MournerRef = Alias_Mourner_UC01.GetRef()
ObjectReference SandboxRef = Alias_NewAtlantisHoEMarker.GetRef()

Alias_Mourner.ForceRefTo(MournerRef)
MournerRef.EnableNoWait()
MournerRef.SetLinkedRef(SandboxRef)
MournerRef.MoveTo(SandboxRef)

Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard02, Alias_IDCard)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
ObjectReference MournerRef = Alias_Mourner_Freestar.GetRef()
ObjectReference SandboxRef = Alias_CydoniaMarker.GetRef()

Alias_Mourner.ForceRefTo(MournerRef)
MournerRef.EnableNoWait()
MournerRef.SetLinkedRef(SandboxRef)
MournerRef.MoveTo(SandboxRef)

Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard03, Alias_IDCard)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
ObjectReference MournerRef = Alias_Mourner_Freestar.GetRef()
ObjectReference SandboxRef = Alias_AkilaSanctumMarker.GetRef()

Alias_Mourner.ForceRefTo(MournerRef)
MournerRef.EnableNoWait()
MournerRef.SetLinkedRef(SandboxRef)
MournerRef.MoveTo(SandboxRef)

Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard04, Alias_IDCard)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SE_GenericDerelict_GeneTagGlobal.SetValue(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SE_GenericDerelict_GeneTagGlobal.SetValue(0)
Game.GetPlayer().RemoveItem(Alias_IDCard.GetRef())
CompleteAllObjectives()
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
FailAllObjectives()
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Mourner.GetRef().DisableNoWait()
SE_GenericDerelict_GeneTagGlobal.SetValue(0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SE_GenericDerelict_GeneTagGlobal Auto Const Mandatory

MiscObject Property SE_GenericDerelict_Genetag Auto Const Mandatory

ReferenceAlias Property Alias_Mourner_UC01 Auto Const Mandatory

ReferenceAlias Property Alias_Mourner Auto Const Mandatory

ReferenceAlias Property Alias_Mourner_Freestar Auto Const Mandatory

ReferenceAlias Property Alias_AkilaSanctumMarker Auto Const Mandatory

ReferenceAlias Property Alias_NewAtlantisHoEMarker Auto Const Mandatory

ReferenceAlias Property Alias_CydoniaMarker Auto Const Mandatory

ReferenceAlias Property Alias_NewAtlantisSanctumMarker Auto Const Mandatory

ReferenceAlias Property Alias_IDCard Auto Const Mandatory

MiscObject Property SE_GenericDerelict_IDCard01 Auto Const Mandatory

MiscObject Property SE_GenericDerelict_IDCard02 Auto Const Mandatory

MiscObject Property SE_GenericDerelict_IDCard03 Auto Const Mandatory

MiscObject Property SE_GenericDerelict_IDCard04 Auto Const Mandatory
