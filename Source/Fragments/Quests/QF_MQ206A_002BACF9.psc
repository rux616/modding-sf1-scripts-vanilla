;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ206A_002BACF9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()
MQ102.Stop()
MQ204.SetStage(620)
MQ204.SetStage(1000)

Int ButtonPressed = TestMQ206AMSG.Show()
If ButtonPressed == 0
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef())
  Alias_SarahMorgan.getActorRef().disable()
  COM_Quest_SarahMorgan_Q01.SetStage(1000)
ElseIf ButtonPressed == 1
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef())
  Alias_SamCoe.getActorRef().disable()
ElseIf ButtonPressed == 2
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef())
  Alias_Andreja.getActorRef().disable()
ElseIf ButtonPressed == 3
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef())
  Alias_Barrett.getActorRef().disable()
EndIf

PlayerREF.MoveTo(LodgeStartMarker)

DialogueUCTheLodge.SetStage(10)
DialogueUCTheLodge.SetStage(20)


SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()
MQ102.Stop()
MQ204.SetStage(620)
MQ204.SetStage(1000)

Int ButtonPressed = TestMQ206AMSG.Show()
If ButtonPressed == 0
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef())
  Alias_SarahMorgan.getActorRef().disable()
  COM_Quest_SarahMorgan_Q01.SetStage(1000)
ElseIf ButtonPressed == 1
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef())
  Alias_SamCoe.getActorRef().disable()
ElseIf ButtonPressed == 2
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef())
  Alias_Andreja.getActorRef().disable()
ElseIf ButtonPressed == 3
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef())
  Alias_Barrett.getActorRef().disable()
EndIf

PlayerREF.MoveTo(LodgeStartMarker)

DialogueUCTheLodge.SetStage(10)
DialogueUCTheLodge.SetStage(20)


SetStage(10)
SetStage(15)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;SetObjectiveDisplayed(10)

Alias_Noel.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Alias_Noel.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetMemorialWaitGameDay()

;block normal activation so we can pop a message box
Alias_LodgeBed.GetRef().BlockActivation()

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
MQ206A_002b_PlayerSkip.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateGameTimeOnSkip()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
;start timer to see if player skips
kmyquest.CallMemorialTimer()

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
SetObjectiveDisplayedAtTop(20)
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
Alias_SetStage35Trigger.GetRef().EnableNoWait()

Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor MatteoKhatriREF = Alias_MatteoKhatri.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()
Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor VladimirREF = Alias_VladimirSall.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()

;dismiss companion
Actor CompanionREF = Alias_Companion.GetactorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleInActive(CompanionREF)
DismissedCrew.RemoveRef(CompanionREF)
DisembarkingCrew.RemoveRef(CompanionREF)

;Lodge state is repaired
MQ204LodgeAttackClutterEnableMarker.Disable()

;allow normal activation of the player bed
Alias_LodgeBed.GetRef().BlockActivation(False)

;enable the memorial easel and podium
Alias_Casket.GetRef().EnableNoWait()
ObjectReference PodiumREF = Alias_Podium.GetRef()
PodiumREF.Enable()
PodiumREF.BlockActivation(True, true)

Alias_PodiumFurniture.GetRef().EnableNoWait()

;update the count of who is present
kmyquest.SetMemorialTalksTotal()

;set everyone to be depressed
AndrejaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
AndrejaREF.EvaluatePackage()
BarrettREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
BarrettREF.EvaluatePackage()
SamCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
SamCoeREF.EvaluatePackage()
SarahMorganREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
SarahMorganREF.EvaluatePackage()
CoraCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
CoraCoeREF.EvaluatePackage()
MatteoKhatriREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
MatteoKhatriREF.EvaluatePackage()
NoelREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
NoelREF.EvaluatePackage()
WalterREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
WalterREF.EvaluatePackage()
VladimirREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
VladimirREF.EvaluatePackage()

;conditional emotion change depending on who is at the memorial
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
If DeadCompanionREF == SamCoeREF
  Actor JacobCoeREF = Alias_JacobCoe.GetActorRef()
  Actor LilianREF = Alias_LilianHart.GetActorRef()
  JacobCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  JacobCoeREF.EvaluatePackage()
  JacobCoeREF.moveto(LodgeStartMarker)
  LilianREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  LilianREF.EvaluatePackage()
  LilianREF.moveto(LodgeStartMarker)
  LilianREF.EnableNoWait()
  Alias_PictureSamCoe.GetRef().Enable()
ElseIf DeadCompanionREF == SarahMorganREF
  Actor AjaREF = Alias_AjaMamasa.GetActorRef()
  Actor SonaREF = Alias_Sona.GetActorRef()
  AjaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  AjaREF.Disable()
  AjaREF.EvaluatePackage()
  AjaREF.moveto(LodgeStartMarker)
  AjaREF.Enable()
  If COM_Quest_SarahMorgan_Q01.GetStageDone(1000)
    SonaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
    SonaREF.EvaluatePackage()
    SonaREF.moveto(LodgeStartMarker)
  EndIf
  Alias_PictureSarahMorgan.GetRef().Enable()
ElseIf DeadCompanionREF == BarrettREF
  Actor AjaREF = Alias_AjaMamasa.GetActorRef()
  AjaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  AjaREF.Disable()
  AjaREF.EvaluatePackage()
  AjaREF.moveto(LodgeStartMarker)
  AjaREF.Enable()
  Alias_PictureBarrett.GetRef().Enable()
ElseIF DeadCompanionREF == AndrejaREF
  Alias_PictureAndreja.GetRef().Enable()
EndIf

;make sure no one is stuck in the crew state
DismissedCrew.RemoveRef(AndrejaREF)
DismissedCrew.RemoveRef(BarrettREF)
DismissedCrew.RemoveRef(SamCoeREF)
DismissedCrew.RemoveRef(SarahMorganREF)
DismissedCrew.RemoveRef(VascoREF)
DisembarkingCrew.RemoveRef(AndrejaREF)
DisembarkingCrew.RemoveRef(BarrettREF)
DisembarkingCrew.RemoveRef(SamCoeREF)
DisembarkingCrew.RemoveRef(SarahMorganREF)
DisembarkingCrew.RemoveRef(VascoREF)

;start a scene that moves everyone to the Lodge that's needed
MQ206A_002_TransitionFuneral.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
MQ206A_007a_SarahSpeech.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_01
Function Fragment_Stage_0035_Item_01()
;BEGIN CODE
MQ206A_007b_MatteoSpeech.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_02
Function Fragment_Stage_0035_Item_02()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
MQ206A_002_TransitionFuneral.Stop()

;cancel timer waiting for player to skip
kmyquest.CancelMemorialTimer()

SetObjectiveDisplayed(25, abdisplayed=false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
Alias_Noel.GetActorRef().EvaluatePackage()

kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
Game.GetPlayer().additem(LL_Drink_Alcohol_Expensive)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()

;Toggle for Post Quest Dialogue for Sona
COM_Quest_SarahMorgan_Q01_Post.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MQ206A_006_PodiumDone.Start()

SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(50)
SetObjectiveDisplayedAtTop(50)

ObjectReference PodiumREF = Alias_Podium.GetRef()
PodiumREF.BlockActivation(True, True)

Alias_MemorialEaselTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayedAtTop(30)

Alias_SarahMorgan.GetActorRef().EvaluatePackage()

ObjectReference PodiumREF = Alias_Podium.GetRef()
PodiumREF.BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Alias_MatteoKhatri.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_01
Function Fragment_Stage_0220_Item_01()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayedAtTop(30)

ObjectReference PodiumREF = Alias_Podium.GetRef()
PodiumREF.BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Alias_Barrett.GetActorRef().EvaluatePackage()

SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
Alias_WalterStroud.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Andreja and Matteo walk off
Alias_MatteoKhatri.GetActorRef().EvaluatePackage()
Alias_Andreja.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMemorialTalks()

Alias_MemorialEaselTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE MQ206AScript
Quest __temp = self as Quest
MQ206AScript kmyQuest = __temp as MQ206AScript
;END AUTOCAST
;BEGIN CODE
MQ206A_004_Casket.Stop()
kmyquest.MQ206AEnableLayer = InputEnableLayer.Create()
kmyquest.MQ206AEnableLayer.DisablePlayerControls()
Game.ForceThirdPerson()
Utility.Wait(5.0)
Game.ForceFirstPerson()
kmyquest.MQ206AEnableLayer.EnablePlayerControls()
kmyquest.MQ206AEnableLayer=None
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;disable podium and easel
Alias_Casket.GetRef().DisableNoWait()
Alias_Podium.GetRef().DisableNoWait()
Alias_PodiumFurniture.GetRef().DisableNoWait()
Alias_PictureAndreja.GetRef().DisableNoWait()
Alias_PictureBarrett.GetRef().DisableNoWait()
Alias_PictureSamCoe.GetRef().DisableNoWait()
Alias_PictureSarahMorgan.GetRef().DisableNoWait()
Alias_MemorialEaselTrigger.GetRef().DisableNoWait()

;Eye is fixed up
MQ204EyeAttackEnableMarker.DisableNoWait()

;set everyone to default face
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor MatteoKhatriREF = Alias_MatteoKhatri.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()
Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor VladimirREF = Alias_VladimirSall.GetActorRef()

AndrejaREF.ChangeAnimFaceArchetype()
BarrettREF.ChangeAnimFaceArchetype()
SamCoeREF.ChangeAnimFaceArchetype()
SarahMorganREF.ChangeAnimFaceArchetype()
CoraCoeREF.ChangeAnimFaceArchetype()
MatteoKhatriREF.ChangeAnimFaceArchetype()
NoelREF.ChangeAnimFaceArchetype()
WalterREF.ChangeAnimFaceArchetype()
VladimirREF.ChangeAnimFaceArchetype()

;disable Coe family if Sam died, disable Sona if Sarah died, move Aja back if sarah or barrett died
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
If DeadCompanionREF == SamCoeREF
  Actor JacobCoeREF = Alias_JacobCoe.GetActorRef()
  Actor LilianREF = Alias_LilianHart.GetActorRef()
  JacobCoeREF.ChangeAnimFaceArchetype()
  LilianREF.ChangeAnimFaceArchetype()
  JacobCoeREF.DisableNoWait()
  LilianREF.DisableNoWait()
  CoraCoeREF.DisableNoWait()
ElseIf DeadCompanionREF == SarahMorganREF
  Actor AjaREF = Alias_AjaMamasa.GetActorRef()
  Actor SonaREF = Alias_Sona.GetActorRef()
  AjaREF.ChangeAnimFaceArchetype()
  AjaREF.MovetoMyEditorLocation()
  If COM_Quest_SarahMorgan_Q01.GetStageDone(1000)
    SonaREF.ChangeAnimFaceArchetype()
    SonaREF.Disable()
  EndIf
ElseIf DeadCompanionREF == BarrettREF
  Actor AjaREF = Alias_AjaMamasa.GetActorRef()
  AjaREF.ChangeAnimFaceArchetype()
  AjaREF.MovetoMyEditorLocation()
EndIf

;if any committment quests are active, locked in companion must re-follow
If COM_Quest_Andreja_Commitment.IsRunning() || COM_Quest_Andreja_Q01.IsRunning()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(AndrejaREF)
  AndrejaREF.EvaluatePackage()
ElseIf COM_Quest_Barrett_Commitment.IsRunning() || COM_Quest_Barrett_Q01.IsRunning() || COM_Quest_Barrett_Q02.IsRunning()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(BarrettREF)
  BarrettREF.EvaluatePackage()
ElseIf COM_Quest_SamCoe_Commitment.IsRunning() || COM_Quest_SamCoe_Q01.IsRunning()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(SamCoeREF)
  SamCoeREF.EvaluatePackage()
ElseIf COM_Quest_SarahMorgan_Commitment.IsRunning() || COM_Quest_SarahMorgan_Q01.IsRunning()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(SarahMorganREF)
  SarahMorganREF.EvaluatePackage()
EndIf

Alias_LodgeBed.GetRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property TestMQ206AMSG Auto Const Mandatory

GlobalVariable Property MQ_CompanionDead Auto Const Mandatory

ReferenceAlias Property Alias_Noel Auto Const Mandatory

Scene Property MQ206A_002_TransitionFuneral Auto Const Mandatory

ReferenceAlias Property Alias_Casket Auto Const Mandatory

ReferenceAlias Property Alias_JacobCoe Auto Const Mandatory

ReferenceAlias Property Alias_AjaMamasa Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

Quest Property DialogueUCTheLodge Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionWhoDies Auto Const

ObjectReference Property LodgeStartMarker Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

ReferenceAlias Property Alias_Podium Auto Const Mandatory

Scene Property MQ206A_006_PodiumDone Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ObjectReference Property MQ206A_PlayerContemplatesMarker Auto Const Mandatory

Scene Property MQ206A_004_Casket Auto Const Mandatory

ReferenceAlias Property Alias_SetStage35Trigger Auto Const Mandatory

Scene Property MQ206A_007a_SarahSpeech Auto Const Mandatory

Scene Property MQ206A_007b_BarrettSpeech Auto Const Mandatory

ReferenceAlias Property Alias_MatteoKhatri Auto Const Mandatory

ReferenceAlias Property Alias_LodgeBed Auto Const Mandatory

Scene Property MQ206A_002b_PlayerSkip Auto Const Mandatory

Faction Property AvailableCompanionFaction Auto Const Mandatory

Scene Property MQ206A_007b_MatteoSpeech Auto Const Mandatory

Quest Property MQ204xPostQuest Auto Const Mandatory

ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

ReferenceAlias Property Alias_LilianHart Auto Const Mandatory

Quest Property MQ204 Auto Const Mandatory

ObjectReference Property MQ204EyeAttackEnableMarker Auto Const Mandatory

Quest Property COM_Quest_SarahMorgan_Q01 Auto Const Mandatory

ReferenceAlias Property Alias_Sona Auto Const Mandatory

Quest Property COM_Quest_SarahMorgan_Q01_Post Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

ReferenceAlias Property Alias_VladimirSall Auto Const Mandatory

ReferenceAlias Property Alias_WalterStroud Auto Const Mandatory

Keyword Property AnimFaceArchetypeDepressed Auto Const Mandatory

LeveledItem Property LL_Drink_Alcohol_Expensive Auto Const Mandatory

ReferenceAlias Property Alias_PodiumFurniture Auto Const Mandatory

ReferenceAlias Property Alias_PictureAndreja Auto Const Mandatory

ReferenceAlias Property Alias_PictureBarrett Auto Const Mandatory

ReferenceAlias Property Alias_PictureSamCoe Auto Const Mandatory

ReferenceAlias Property Alias_PictureSarahMorgan Auto Const Mandatory

ReferenceAlias Property Alias_MemorialEaselTrigger Auto Const Mandatory

RefCollectionAlias Property DismissedCrew Auto Const

RefCollectionAlias Property DisembarkingCrew Auto Const

ReferenceAlias Property Alias_Vasco Auto Const Mandatory

Quest Property COM_Quest_Andreja_Commitment Auto Const Mandatory

Quest Property COM_Quest_Andreja_Q01 Auto Const Mandatory

Quest Property COM_Quest_Barrett_Commitment Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q01 Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Commitment Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Q01 Auto Const Mandatory

Quest Property COM_Quest_SarahMorgan_Commitment Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q02 Auto Const Mandatory
