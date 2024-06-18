;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ12_0025544A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Quickstart

Game.GetPlayer().MoveTo(Alias_Miguel.GetRef())
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
FFNeonZ12_040_ScenePaige.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
FFNeonZ12_060_ErikaScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
FFNeonZ12_070_MovePosition.Stop()
FFNeonZ12_060_ErikaScene03.Start()
SetObjectiveCompleted(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Enable encounter

Actor MiguelRef = Alias_Miguel.GetActorRef()

MiguelRef.EnableNoWait()
MiguelRef.SnapIntoInteraction(Alias_StartCouch.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
FFNeonZ12_070_MovePosition.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Quickstart 2

SetStage(20)
Game.GetPlayer().MoveTo(Alias_Miguel.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Quickstart 3

SetStage(40)
Game.GetPlayer().MoveTo(Alias_Miguel.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;Quickstart 4

SetStage(50)
Game.GetPlayer().MoveTo(Alias_PaigeOverton.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Quickstart 4

SetStage(70)
Game.GetPlayer().MoveTo(Alias_MiguelEnhanced.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Alias_Miguel.GetRef().MoveTo(Alias_Legrande.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
FFNeonZ12_001_SceneOpener.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
FFNeonZ12_005_SceneOpener.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Food_RS_MSauvage_VelocityRed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set stage on main dialogue quest
;Change Miguel's archetype now that he's tried Aurora

Actor MiguelRef = Alias_Miguel.GetActorRef()

DialogueFCNeon.SetStage(583)
MiguelRef.RemoveKeyword(AnimArchetypeDepressed)
MiguelRef.AddKeyword(AnimArchetypeConfident)
MiguelRef.MoveTo(Alias_Booth02.GetRef())

Alias_Hapa.GetRef().MoveTo(Alias_Booth02.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Quickstart 6

SetStage(13)
Game.GetPlayer().MoveTo(Alias_Legrande.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_Miguel.GetRef().MoveTo(Alias_DancingMarker.GetRef())
Alias_Hapa.GetRef().MoveTo(Alias_AstralCouch.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Disable old Miguel, add the new enhanced Miguel to alias

ObjectReference MiguelEnhanced = Alias_MiguelEnhanced.GetRef()

Alias_Miguel.GetRef().DisableNoWait()
MiguelEnhanced.EnableNoWait()
MiguelEnhanced.MoveTo(Alias_EnhanceMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Alias_MiguelEnhanced.GetRef().MoveTo(Alias_Chair.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Enable spouse, give objective

SetObjectiveDisplayed(80)
ObjectReference ErikaRef = Alias_Erika.GetRef()
ErikaRef.EnableNoWait()
ErikaRef.MoveTo(Alias_Booth03.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Spouse dumps Miguel, Enhanced version is now forced to main alias

SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)
Miguel.ForceRefTo(Alias_MiguelEnhanced.GetRef())
Alias_Erika.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
Alias_Erika.GetActorRef().EvaluatePackage()
SetObjectiveDisplayed(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Disable new Miguel, return old Miguel and put keywords back

Actor MiguelRef = Alias_Miguel.GetActorRef()

Alias_MiguelEnhanced.GetRef().DisableNoWait()
MiguelRef.EnableNoWait()
MiguelRef.RemoveKeyword(AnimArchetypeDepressed)
MiguelRef.AddKeyword(AnimArchetypeConfident)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueFCNeon Auto Const Mandatory

ReferenceAlias Property Alias_Miguel Auto Const Mandatory

ActorBase Property FC_Neon_MiguelReeves Auto Const Mandatory

Keyword Property AnimArchetypeConfident Auto Const Mandatory

Keyword Property AnimArchetypeDepressed Auto Const Mandatory

ReferenceAlias Property Alias_Booth Auto Const Mandatory

ReferenceAlias Property Alias_MiguelEnhanced Auto Const Mandatory

ReferenceAlias Property Miguel Auto Const Mandatory

Scene Property FFNeonZ12_001_SceneOpener Auto Const Mandatory

ReferenceAlias Property Alias_Booth02 Auto Const Mandatory

ReferenceAlias Property Alias_Hapa Auto Const Mandatory

ReferenceAlias Property Alias_Chair Auto Const Mandatory

Scene Property FFNeonZ12_040_ScenePaige Auto Const Mandatory

ReferenceAlias Property Alias_PaigeOverton Auto Const Mandatory

Scene Property FFNeonZ12_060_ErikaScene01 Auto Const Mandatory

Scene Property FFNeonZ12_060_ErikaScene03 Auto Const Mandatory

ReferenceAlias Property Alias_Erika Auto Const Mandatory

ReferenceAlias Property Alias_Sauvage Auto Const Mandatory

Scene Property FFNeonZ12_070_MovePosition Auto Const Mandatory

ReferenceAlias Property Alias_Booth03 Auto Const Mandatory

ReferenceAlias Property Alias_LegrandeSpot Auto Const Mandatory

Scene Property FFNeonZ12_005_SceneOpener Auto Const Mandatory

ReferenceAlias Property Alias_Legrande Auto Const Mandatory

Potion Property Food_RS_MSauvage_VelocityBlue Auto Const Mandatory

Potion Property Food_RS_MSauvage_VelocityRed Auto Const Mandatory

ReferenceAlias Property Alias_AstralCouch Auto Const Mandatory

ReferenceAlias Property Alias_DancingMarker Auto Const Mandatory

ReferenceAlias Property Alias_EnhanceMarker Auto Const Mandatory

ReferenceAlias Property Alias_StartCouch Auto Const Mandatory
