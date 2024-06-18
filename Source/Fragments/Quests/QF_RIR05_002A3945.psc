;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RIR05_002A3945 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
RI01_JobAdRadio.Stop()
RI01.CompleteQuest()
RIR04.Start()
RIR04.SetStage(100)
RIR04.SetStage(200)
RIR04.SetStage(300)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_ImogeneQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RI01_JobAdRadio.Stop()
RI01.CompleteQuest()
SetStage(100)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_ImogeneQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
RI01_JobAdRadio.Stop()
RI01.CompleteQuest()
SetStage(100)
LC044.SetStage(1000)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_MasakoQS.GetRef())
PlayerRef.AddPerk(Manipulation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Check who the current quest giver is and force them into 
; the QuestGiver alias.
; 0 - Imogene / 1 - Masako

Float fQuestGiver = RI_RadiantQuestGiver.GetValue()
Debug.Trace(Self + "Stage 10: fQuestGiver = " + fQuestGiver)

If fQuestGiver == 0
     Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef())
ElseIf fQuestGiver == 1
     Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
EndIf

ObjectReference ContainerRef = Alias_ChosenContainer.GetRef()
ContainerRef.Enable()
ContainerRef.Lock()
ContainerRef.SetLockLevel(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)

If RIR05_RadiantCount.GetValueInt() == 0
     RIR04.Stop()
Else
     RI_RadiantPointerQuest.SetStage(10000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(100)

; If pointer quest is running for radiants, setstage to stop it.
If RI_RadiantPointerQuest.IsRunning()
     RI_RadiantPointerQuest.SetStage(10000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

Location ChosenLocation = Alias_ChosenLocation.GetLocation()

If (ChosenLocation != CityNeonLocation) && !(CityNeonLocation.IsChild(ChosenLocation))
     SetObjectiveDisplayed(150)     
     If ChosenLocation.HasKeyword(LocTypeStarstationInterior)
          SetStage(155)
     EndIf
     Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap()
     Alias_ChosenMapMarker.GetRef().AddToMapScanned()
Else
     SetStage(200)
EndIf

Game.GetPlayer().AddItem(Digipick, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveCompleted(155)
SetObjectiveDisplayed(200)

; Place the schematics in the container.
Alias_ChosenContainer.GetRef().AddAliasedItem(RIR05_Schematic, Alias_PrototypeSchematic)

; Add schematics to appropriate faction.
Location ChosenSystem = Alias_ChosenLocation_System.GetLocation()
ObjectReference Schematic = Alias_PrototypeSchematic.GetRef()
If ChosenSystem.HasKeyword(LocSystemFactionUnitedColonies)
     Schematic.SetFactionOwner(CrimeFactionUC)
ElseIf ChosenSystem.HasKeyword(LocSystemFactionFreestarCollective)
     Schematic.SetFactionOwner(CrimeFactionFreestar)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

Alias_ChosenContainer.Clear()

Actor PlayerRef = Game.GetPlayer()
PlayerRef.RemoveItem(RIR05_Schematic, 99, abSilent = True)
PlayerRef.AddAliasedItem(RIR05_Schematic, Alias_PrototypeSchematic, abSilent = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RIR05_Schematic, 99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
Alias_ChosenContainerRef.GetRef().Disable()

Float fCurrentRadiantCount = RIR05_RadiantCount.GetValue()

; If this is the real radiant version given by Masako, reset the
; Mission Board count, set this quest as the last completed, 
; and shut it down.
If fCurrentRadiantCount >= 1 
     (RI_Support as RI_RadiantSupportQuestScript).ResetMBCount()
     RI_LastChosenRadiant.SetValue(2)
     RIR05_RadiantCount.SetValue(fCurrentRadiantCount + 1)
     Stop()
EndIf

; If it's the first time this radiant is being done, start RI03.
If fCurrentRadiantCount == 0 
     RI03.SetStage(100)
     RIR05_RadiantCount.SetValue(1)
     Alias_TridentLuxuryLinesLocation.GetLocation().RemoveKeyword(LocTypeRadiantsNotAllowed)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE ri_crimetrackingquestscript
Quest __temp = self as Quest
ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RI01 Auto Const Mandatory

Quest Property RIR04 Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_PrototypeSchematic Auto Const Mandatory

GlobalVariable Property RIR05_RadiantCount Auto Const Mandatory

Quest Property RI03 Auto Const Mandatory

MiscObject Property RIR05_Schematic Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneQS Auto Const Mandatory

ReferenceAlias Property Alias_MasakoQS Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

ReferenceAlias Property Alias_ChosenContainer Auto Const Mandatory

LocationAlias Property Alias_ChosenLocation Auto Const Mandatory

Keyword Property LocTypeStarstationInterior Auto Const Mandatory

Location Property CityNeonLocation Auto Const Mandatory

LocationAlias Property Alias_ChosenLocation_System Auto Const Mandatory

Keyword Property LocSystemFactionFreestarCollective Auto Const Mandatory

Keyword Property LocSystemFactionUnitedColonies Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Faction Property CrimeFactionFreestar Auto Const Mandatory

ReferenceAlias Property Alias_ChosenMapMarker Auto Const Mandatory

Perk Property Manipulation Auto Const Mandatory

GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

Quest Property RI08 Auto Const Mandatory

GlobalVariable Property RI_LastChosenRadiant Auto Const Mandatory

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory

Quest Property RI_RadiantPointerQuest Auto Const Mandatory

ReferenceAlias Property Alias_ChosenContainerRef Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory

LocationAlias Property Alias_TridentLuxuryLinesLocation Auto Const Mandatory

Keyword Property LocTypeRadiantsNotAllowed Auto Const Mandatory
