;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_HuntedHomesteaders_000F3D39 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_Leader.GetActorRef().EvaluatePackage()

Alias_Homesteaders.EnableAll()
Alias_Homesteaders.EvaluateAll()

Alias_PredatorGroup.DisableAll()

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
ObjectReference LeaderRef = Alias_Leader.GetRef()
ObjectReference ContainerRef = Alias_RewardContainer.GetRef()
int PlayerLevel = Game.GetPlayer().GetLevel()
int LockLevel = 0

If PlayerLevel > 100
   LockLevel = 100
ElseIf PlayerLevel > 75
   LockLevel = 75
ElseIf PlayerLevel > 50
   LockLevel = 50
Else
   LockLevel = 25
EndIf 

ContainerRef.Lock(True, True, True)
ContainerRef.SetLockLevel(LockLevel)
LeaderRef.AddKeyIfNeeded(ContainerRef)

Alias_Homesteaders.EvaluateAll()
Alias_Leader.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
int SceneTheme = Utility.RandomInt(0,2)

If SceneTheme == 1
   SetStage(110)
ElseIf SceneTheme == 2
   SetStage(120)
Else
   SetStage(100) ; No alt selected.
EndIf 

Alias_Homesteaders.EvaluateAll()
Alias_Leader.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If !GetStageDone(25)
   SetStage(25)
EndIf

If !GetStageDone(50) 
   SetStage(50)
EndIf 

If !GetStageDone(75) 
   SetStage(75)
EndIf 

SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_Homesteaders.EvaluateAll()

SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE OE_HuntedHomesteaders_QuestScript
Quest __temp = self as Quest
OE_HuntedHomesteaders_QuestScript kmyQuest = __temp as OE_HuntedHomesteaders_QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Leader.TryToAddToFaction(REPlayerAlly)
Alias_Homesteaders.AddToFaction(REPlayerAlly)
Alias_Homesteaders.EvaluateAll()
Alias_Leader.GetActorRef().EvaluatePackage()

SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE OE_HuntedHomesteaders_QuestScript
Quest __temp = self as Quest
OE_HuntedHomesteaders_QuestScript kmyQuest = __temp as OE_HuntedHomesteaders_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartWaitTimer()
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

;Alias_PredatorGroup.SetValue(Game.GetAggressionAV(), 1)
Alias_PredatorGroup.EnableAll()
Alias_PredatorGroup.EvaluateAll()

Alias_Homesteaders.EvaluateAll()
Alias_Leader.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveCompleted(400)
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
If !GetStageDone(990)
   If !GetStageDone(200)         ; Quest not accepted.
      SetStage(999)
   EndIf 
   
   If IsObjectiveDisplayed(900)    ; Leader died before Rewards
      SetStage(940)
   EndIf 

   If GetStageDone(820)   ; Other NPCs are dead.
      SetStage(999)
   EndIf
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
If !GetStageDone(990)
   If !GetStageDone(200)         ; Quest not accepted.
      SetStage(999)
   ElseIf IsObjectiveDisplayed(900)    ; Died before Rewards
      SetStage(940)
   ElseIf GetStageDone(810)   ; Leader is dead.
      If GetStageDone(700)
         SetStage(940)
      Else 
         SetObjectiveDisplayed(400)
         SetObjectiveSkipped(300)
      EndIf
   EndIf
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
If !GetStageDone(810)
   Alias_Leader.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Check optional endings
If GetStageDone(810)  ; Leader Died
   If GetStageDone(820) ; All NPCs are dead
      SetStage(940)
   Else ; Some survive
      SetObjectiveDisplayed(910)
      Alias_Homesteaders.EvaluateAll()
   EndIf 
Else  ; Leader is alive
   SetObjectiveDisplayed(900)
   Alias_Leader.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
If GetStageDone(810) 
   If GetStageDone(820)
      SetStage(940)
   Else
      SetStage(930)
   EndIf 
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
ObjectReference ContainerRef = Alias_RewardContainer.GetRef()

ContainerRef.Lock(True)
ContainerRef.SetLockLevel(25)
PlayerRef.AddKeyIfNeeded(ContainerRef)

SetStage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
SetStage(940)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0940_Item_00
Function Fragment_Stage_0940_Item_00()
;BEGIN CODE
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
CompleteAllObjectives()
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; General Quest Variables
Faction Property REPlayerAlly Auto Const Mandatory

; Markers
ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

; Actors
RefCollectionAlias Property Alias_Homesteaders Auto Const Mandatory
ReferenceAlias Property Alias_Leader Auto Const Mandatory
RefCollectionAlias Property Alias_PredatorGroup Auto Const Mandatory

; Objects
ReferenceAlias Property Alias_RewardContainer Auto Const Mandatory
