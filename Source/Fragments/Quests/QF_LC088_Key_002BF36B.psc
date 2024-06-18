;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC088_Key_002BF36B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Quickstart - Entrance

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Entrance)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Quickstart - Last Nova

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_LastNova)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Quickstart - Voss

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Set relevant prior stages.
SetStage(390)
SetStage(400)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Voss)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Quickstart - Shooting Range

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Set relevant prior stages.
SetStage(490)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Range)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Quickstart - Operations Entry

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_OperationsEntry)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Quickstart - Operations Entry

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Set relevant prior stages.
Game.GetPlayer().MoveTo(LC088_OpsIntroScene_PlayerMoveToMarker)
SetStage(601)
SetStage(700)

;Move the player to the quickstart marker.
if (!CF_Post.GetStageDone(0))
     Game.GetPlayer().MoveTo(LC088_OpsIntroScene_PlayerMoveToMarker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;Quickstart Helper Stage
;Set by: Other Quickstarts

;LC088_Space needs to be running in order for CF08_SysDef to fill its
;aliases, so set LC088_Space's SD Skip stage.
;
;This also spawns a ship for the player and sets prior stages.
LC088_Space.SetStage(45)

;Instant-dock the player's ship to the Key.
Alias_PlayerShip.GetShipRef().InstantDock(Alias_TheKey.GetShipRef())

;Update CF08 to this point.
CF08_SysDef.SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Startup Stage

;Reset the location.
Alias_LC088KeyInteriorLocation.GetLocation().Reset()

;Perform the basic state swap for the Key's interior.
TheKey_CF08_EnableMarker.Enable()
TheKey_CF08_DisableMarker.Disable()
TheKey_CF08_GenericActorsDisableMarker.Disable()
Alias_CargoBayLoadDoorsNormal.DisableAll()
Alias_CargoBayLoadDoorsLC088.EnableAll()
Alias_OpsEntryDoorsLoad.EnableAll()
Alias_OpsEntryDoorsNormal.DisableAll()

;Lock down the elevators.
kMyQuest.SetElevatorsLockedDown(True)

;Setup the Ops door.
kMyQuest.SetupOpsEntryDoor()

;Stop the Key's dialogue quest and disable its created actors.
DialogueCFTheKey.Start()
DialogueCFTheKey.SetStage(10000)

;Set up our actors.
kMyQuest.SetupAllCaptainEvents()
kMyQuest.SetupOtherActors()
if (!CF_Post.GetStageDone(1))
     kMyQuest.SetupAllEnemyGroups()
     kMyQuest.EnableEnemyGroup(1)
EndIf

;Set up Voss.
Actor vossRef = Alias_Voss.GetActorRef()
vossRef.Reset()
vossRef.AddToFaction(PlayerFriendFaction)

;Set up Delgado.
Actor delgadoRef = Alias_Delgado.GetActorRef()
delgadoRef.Reset()
delgadoRef.Enable()
delgadoRef.MoveToPackageLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
;Condition this fragment to check if she's on the Key and not following/crew
;If so, we move Jessamine to her new home

Alias_JessamineGriffin.GetRef().MoveTo(Alias_JessamineGriffin_GagarinLocation.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN CODE
Alias_JessamineGriffin.GetRef().SetLinkedRef(Alias_JessamineGriffin_GagarinLocation.GetRef(), SQ_LinkCompanionEliteCrewHomeMarker)

;GEN-513171: Adding the LinkHome Linked Ref to Jessamine for this moment as well
Alias_JessamineGriffin.GetRef().SetLinkedRef(Alias_JessamineGriffin_GagarinLocation.GetRef(), LinkHome)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Actor RokovRef = Alias_Rokov.GetActorRef()
RokovRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03)
RokovRef.AddToFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
;Set by: Startup

;Make sure Mathis is removed from SQ_Followers_GroupFormation_Faction.
Alias_Mathis.GetActorRef().SetGroupFaction(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set by: Captain Setup

;As a special case, Naeva is always disabled.
Alias_Naeva.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
;Adler Kemp Swap Factions
Actor AdlerRef = Alias_Adler.GetActorRef()

AdlerRef.RemoveFromFaction(CrimeFactionUC)
AdlerRef.RemoveFromFaction(CydoniaFaction)
AdlerRef.AddToFaction(CrimeFactionCrimsonFleet)
AdlerRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
;Set by: Captain Setup

;Force Huan into the Reactor 01 Commander alias.
Alias_Reactor01Commander.ForceRefTo(Alias_Huan.GetRef())
Alias_HuanReplacement.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
;Set by: Captain Setup

;Force Estelle into the Reactor 02 Commander alias.
Alias_Reactor03Commander.ForceRefTo(Alias_Estelle.GetRef())
Alias_EstelleReplacement.TryToDisable()
Actor EstelleRef = Alias_Estelle.GetActorRef()
EstelleRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04)
EstelleRef.RemoveFromFaction(CrimeFactionNeon)
EstelleRef.AddToFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Terminal script, CFKey_DelgadosTerminalSubMenu02.

;Disarm the bomb.
kMyQuest.VossBombTickStop()

;And update the objective on CF08.
CF08_SysDef.SetStage(440)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by: Docking Bay Entry

;Make absolutely sure the Key's dialogue quest has stopped.
DialogueCFTheKey.SetStage(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
LC088_Key_Stage160_AludraDeath.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
LC088_Key_Stage170_TKDeath.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
LC088_Key_Stage180_IsraDeath.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set by: Default Ref script, Foyer Door

;Start Jasmine's intro scene.
LC088_Key_200_JasmineIntro.Start()

;Delay briefly before continuing as the door opens.
Utility.Wait(1)
SetStage(201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
;Set by: Stage 200, after delay.

;Set Jasmine's Robot conscious.
Alias_JasmineRobot.GetActorRef().SetUnconscious(False)

;EVP Jasmine to put her into combat.
Actor jasmineRef = Alias_Jasmine.GetActorRef()
jasmineRef.EvaluatePackage()
jasmineRef.StartCombat(Game.GetPlayer())

;Switch Objectives (CF08_SysDef)
CF08_SysDef.SetStage(315)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Set by: RefCollectionAlias script, Foyer Doors

;Switch Objectives - Doors Open (CF08_SysDef)
CF08_SysDef.SetStage(316)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_01
Function Fragment_Stage_0210_Item_01()
;BEGIN CODE
LC088_Key_Stage150_DepotEntry.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Set by: Door, Market Area

;Start Mathis' intro scene.
;CURRENTLY: Omit, Mathis instead has a custom NormalToCombat.
;LC088_Key_250_MathisIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set by: Default Ref script, Last Nova Restraining Trigger

;Start Bog's intro scene.
LC088_Key_300_BogIntro.Start()

;Update CF08's objectives.
CF08_SysDef.SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Ref script, Reckoner's Core Door

;Enable the Atrium entry trigger.
Alias_AtriumEntryTrigger.TryToEnable()

;Update CF08's objectives.
CF08_SysDef.SetStage(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set by: Default Ref script, Last Nova Exit Trigger

;Update CF08's objectives.
CF08_SysDef.SetStage(340)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
;Set by: Default Ref script, Last Nova Exit Trigger

;Start Voss' intro scene.
LC088_Key_400_VossIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
Utility.Wait(1)
LC088_Key_400_VossIntro.Stop()
SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_400_VossIntro, scene end.

;EVP Voss to advance his package.
Alias_Voss.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0411_Item_00
Function Fragment_Stage_0411_Item_00()
;BEGIN CODE
;Set by: LC088_Key_410_VossDialogue, scene start.

;EVP Voss to advance his package.
Alias_Voss.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
;Set by: OnHit Alias Script, Voss Attacked.

;If Voss isn't already hostile...
if (!GetStageDone(420))
     ;Play the Voss Attacked scene.
     LC088_Key_420_VossAttacked.Start()

     ;Set stage 420 to have Voss rush the player.
     SetStage(420)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_420_VossDialogue attack option, or stage 415.

;Arm Voss' bomb.
kMyQuest.VossBombArmed()

;Make Voss hostile.
Actor vossRef = Alias_Voss.GetActorRef()
vossRef.RemoveFromFaction(PlayerFriendFaction)
vossRef.SetValue(Aggression, 1)
vossRef.StartCombat(Game.GetPlayer())

;EVP Voss to advance his package.
vossRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_420_VossDialogue attack option.

;Give the player the optional objective to disable Voss' bomb.
CF08_SysDef.SetStage(345)

;Register for Voss to sit in his chair to progress.
kMyQuest.VossWaitForSit()

;EVP Voss.
Alias_Voss.TryToEvaluatePackage()
Alias_Voss.GetActorRef().AddtoFaction(CaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
;Set by: Voss entering triggers at the perimeter of the
;Reckoner's Core, if bomb not yet disarmed.

;Kill Voss, which triggers his bomb.
if (!GetStageDone(19))
     Alias_Voss.TryToKill()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
;Set by: Stage 450 (Explosion) or Voss death alias script (no explosion)

;Play the mainframe failure scene.
LC088_Key_490_VossDead.Start()

;Update CF08's objectives.
CF08_SysDef.SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_410_VossDialogue (persuade success), or
;stage 480 (Voss death).

;Enable the enemies in the next section.
kMyQuest.EnableEnemyGroup(2)

;Open the exit from the Reckoner's Core.
kMyQuest.OpenDoorCollection(Alias_SecurityDoors_ReckonersCore)

;Update CF08's objectives.
CF08_SysDef.SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
;Set by: OnOpen Ref Script, Stairs Bottom Door.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
;Set by: OnOpen Ref Script, Stairs Top Door.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Triggers or Doors, Quarters hall.

;If Rokov is active...
if (GetStageDone(13) && (GetStage() < 600))
     ;Play Rokov's intro scene.
     LC088_Key_550_RokovIntro.Start()

     ;Trigger the ambush.
     kMyQuest.OpenDoorCollection(Alias_QuartersAmbushDoorsGroup1)

     ;Then trigger Adler's ambush, if it hasn't happened yet.
     SetStage(570)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Triggers or Doors, Quarters hall.

;If Adler is active...
if (GetStageDone(16) && (GetStage() < 600))
     ;Play Adler's intro scene.
     LC088_Key_570_AdlerIntro.Start()

     ;Trigger the ambush.
     kMyQuest.OpenDoorCollection(Alias_QuartersAmbushDoorsGroup2)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Player enters Ops.

;Update CF08's objectives.
CF08_SysDef.SetStage(360)

;SF-11227: Set Delgado to unaggressive to avoid crime issues.
Alias_Delgado.GetActorRef().SetValue(Aggression, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0601_Item_00
Function Fragment_Stage_0601_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_600_OperationsIntro, during fadeout.

;Teleport any followers into the room with the player.
SQ_Followers.TeleportFollowers(Alias_Ops_FollowerMoveToMarker.GetRef())

;Seal the Ops Entry Door.
Alias_OpsEntryDoorsLoad.DisableAll()
Alias_OpsEntryDoorsNormal.EnableAll()
kMyQuest.SealOpsEntryDoor()

;Have the quest script set up for the Reactor fight.
kMyQuest.SetupReactorBattleNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_600_OperationsIntro

;Abort the Reactor Battle.
kMyQuest.AbortReactorBattleNoWait()

;Skip to stage 1100.
SetStage(1100)

;Make sure the player can't kill Delgado now.
Alias_Delgado.GetActorRef().SetEssential(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_600_OperationsIntro, if player ends up fighting.

;Unlock player controls.
kMyQuest.LockPlayerControls(False)

;Start the Reactor Battle music.
kMyQuest.StartReactorBattle()

;Open the Reactor Group 1 doors.
kMyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor01Group)

;SF-11227: Set Delgado back to Aggressive.
Alias_Delgado.GetActorRef().SetValue(Aggression, 1)

;Update CF08's objectives.
CF08_SysDef.SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
;Set by: Trigger in the Reactor Room.

;Start the Huan Intro scene.
LC088_Key_710_HuanIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Reactor01ShutdownControl

;Set Reactor01 to blue.
kMyQuest.SetReactorState(1, kMyQuest.CONST_ReactorState_Active)

;Start the Reactor01 Complete scene.
Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer())
LC088_Key_790_Reactor01Complete.Start()

;Update CF08's objectives.
CF08_SysDef.SetStage(390)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_790_Reactor01Complete scene, in scene.

;Open the Reactor Group 2 doors.
kMyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor02Group)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0890_Item_00
Function Fragment_Stage_0890_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Reactor02ShutdownControl

;Set Reactor02 to blue.
kMyQuest.SetReactorState(2, kMyQuest.CONST_ReactorState_Active)

;Start the Reactor02 Complete scene.
Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer())
LC088_Key_890_Reactor02Complete.Start()

;Update CF08's objectives.
CF08_SysDef.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_890_Reactor02Complete scene, in scene.

;Open the Reactor Group 3 doors.
kMyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor03Group)

;And release the robots.
RobotPodScript[] robots = Alias_Reactor03_Robots.GetArray() as RobotPodScript[]
int i = 0
While (i < robots.Length)
     if (robots[i] != None)
          robots[i].WakeRobotFromPod()
     EndIf
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Reactor03ShutdownControl

;Set Reactor03 to blue.
kMyQuest.SetReactorState(3, kMyQuest.CONST_ReactorState_Active)

;Start the Reactor03 Complete scene.
Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer())
LC088_Key_990_Reactor03Complete.Start()

;Open Delgado's doors.
kMyQuest.OpenDoorCollection(Alias_SecurityDoors_Delgado)

;Update CF08's objectives.
CF08_SysDef.SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key_890_Reactor03Complete scene, in scene.

;Update CF08's objectives.
CF08_SysDef.SetStage(420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
;Set by: Default Alias Script, Delgado

;Force combat with the player.
Alias_Delgado.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1070_Item_00
Function Fragment_Stage_1070_Item_00()
;BEGIN CODE
;Set by: Default Alias Script, Delgado

;Update CF08's objectives.
CF08_SysDef.SetStage(430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1080_Item_00
Function Fragment_Stage_1080_Item_00()
;BEGIN CODE
;Set by: Default Alias Script, Delgado's Password
CF08_SysDef.SetStage(435)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1090_Item_00
Function Fragment_Stage_1090_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Fragment script, CFKey_DelgadosTerminal.

;Re-enable the pre-Reactor Battle enemies.
kMyQuest.EndReactorBattleNoWait()

;Play the abort scene.
LC088_Key_1090_SelfDestructAborted.Start()

;Adjust CF08_SysDef
CF08_SysDef.SetStage(437)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 650 or LC088_Key_1090_SelfDestructAborted.

;Unlock player controls.
kMyQuest.LockPlayerControls(False)

;Stop the Reactor Battle music, if it was active.
kMyQuest.EndReactorBattleNoWait()

;Release the lodkdown on the elevators.
kMyQuest.SetElevatorsLockedDown(False)

;Open all security doors.
kMyQuest.OpenDoorCollection(Alias_SecurityDoors_All)

;Swap the Cargo Bay and Ops Entry Doors.
Alias_CargoBayLoadDoorsNormal.EnableAll()
Alias_CargoBayLoadDoorsLC088.DisableAll()
Alias_OpsEntryDoorsLoad.DisableAll()
Alias_OpsEntryDoorsNormal.EnableAll()

;Open the Ops door.
kMyQuest.OpenOpsEntryDoor()

;Unlock Delgado's terminal.
Alias_DelgadosTerminal.GetRef().Unlock()

;Update LC088_Space.
LC088_Space.SetStage(293)

;Start the SD postquest.
CF_Post.SetStage(200)

;Update CF08's objectives.
CF08_SysDef.SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_00
Function Fragment_Stage_1101_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF_Post Stage 1.

;This stage should exactly mirror Stage 1100, just using the
;latent version of all function calls.
;Unlock player controls.
kMyQuest.LockPlayerControls(False)
kMyQuest.EndReactorBattleAndWait()
kMyQuest.SetElevatorsLockedDown(False)
kMyQuest.OpenDoorCollection(Alias_SecurityDoors_All)
Alias_CargoBayLoadDoorsNormal.EnableAll()
Alias_CargoBayLoadDoorsLC088.DisableAll()
Alias_OpsEntryDoorsLoad.DisableAll()
Alias_OpsEntryDoorsNormal.EnableAll()
kMyQuest.OpenOpsEntryDoor()
Alias_DelgadosTerminal.GetRef().Unlock()
CF_Post.SetStage(200)
CF08_SysDef.SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE LC088_KeyQuestScript
Quest __temp = self as Quest
LC088_KeyQuestScript kmyQuest = __temp as LC088_KeyQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Shutdown Stage

;Clean up quest variables and actors.
kMyQuest.Cleanup()

;Then stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property LC088_Quickstart_Entrance Auto Const Mandatory

ObjectReference Property LC088_Quickstart_LastNova Auto Const Mandatory

ObjectReference Property LC088_Quickstart_Voss Auto Const Mandatory

ObjectReference Property LC088_Quickstart_Range Auto Const Mandatory

ObjectReference Property LC088_Quickstart_OperationsEntry Auto Const Mandatory

ObjectReference Property LC088_Quickstart_Delgado Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property UCSysDefFaction Auto Const Mandatory

Faction Property CrimsonFleetFaction Auto Const Mandatory

ObjectReference Property TheKey_CF08_EnableMarker Auto Const Mandatory

ObjectReference Property TheKey_CF08_DisableMarker Auto Const Mandatory

ObjectReference Property TheKey_CF08_GenericActorsDisableMarker Auto Const Mandatory

ReferenceAlias Property Alias_JasmineRobot Auto Const Mandatory


Scene property LC088_Key_200_JasmineIntro Auto Const Mandatory
Scene property LC088_Key_300_BogIntro Auto Const Mandatory
Scene property LC088_Key_400_VossIntro Auto Const Mandatory
Scene property LC088_Key_410_VossDialogue Auto Const Mandatory
Scene property LC088_Key_420_VossAttacked Auto Const Mandatory
Scene property LC088_Key_550_RokovIntro Auto Const Mandatory
Scene property LC088_Key_570_AdlerIntro Auto Const Mandatory
Scene property LC088_Key_250_MathisIntro Auto Const Mandatory
Scene property LC088_Key_600_OperationsIntro Auto Const Mandatory
Scene property LC088_Key_710_HuanIntro Auto Const Mandatory
Scene property LC088_Key_790_Reactor01Complete Auto Const Mandatory
Scene property LC088_Key_890_Reactor02Complete Auto Const Mandatory
Scene property LC088_Key_990_Reactor03Complete Auto Const Mandatory



ReferenceAlias Property Alias_Jasmine Auto Const Mandatory

ReferenceAlias Property Alias_Voss Auto Const Mandatory

RefCollectionAlias Property Alias_SecurityDoors_All Auto Const Mandatory

RefCollectionAlias Property Alias_SecurityDoors_ReckonersCore Auto Const Mandatory

RefCollectionAlias Property Alias_SecurityDoors_Reactor01Group Auto Const Mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor02Group Auto Const Mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor03Group Auto Const Mandatory
RefCollectionAlias Property Alias_SecurityDoors_Delgado Auto Const Mandatory

RefCollectionAlias Property Alias_SecurityDoors_Reactor Auto Const Mandatory

ReferenceAlias Property Alias_Delgado Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ReferenceAlias Property Alias_Reactor01Commander Auto Const Mandatory
ReferenceAlias Property Alias_Reactor02Commander Auto Const Mandatory
ReferenceAlias Property Alias_Reactor03Commander Auto Const Mandatory

ReferenceAlias Property Alias_Estelle Auto Const Mandatory
ReferenceAlias Property Alias_Huan Auto Const Mandatory
ReferenceAlias Property Alias_Naeva Auto Const Mandatory

RefCollectionAlias Property Alias_Reactor01Activators Auto Const Mandatory
RefCollectionAlias Property Alias_Reactor02Activators Auto Const Mandatory
RefCollectionAlias Property Alias_Reactor03Activators Auto Const Mandatory

ReferenceAlias Property Alias_Ops_EntryDoor Auto Const Mandatory

ReferenceAlias Property Alias_Jasmine_Terminal Auto Const Mandatory

RefCollectionAlias Property Alias_QuartersAmbushDoorsGroup1 Auto Const Mandatory

RefCollectionAlias Property Alias_QuartersAmbushDoorsGroup2 Auto Const Mandatory

Quest Property LC082 Auto Const Mandatory
Quest Property DialogueCFTheKey Auto Const Mandatory

ReferenceAlias Property Alias_AtriumEntryTrigger Auto Const Mandatory

Scene Property LC088_Key_490_VossDead Auto Const Mandatory

Explosion Property ParticleGrenadeExplosion Auto Const Mandatory

Scene Property LC088_Key_1090_SelfDestructAborted Auto Const Mandatory

ReferenceAlias Property Alias_NaevaReplacement Auto Const Mandatory

ReferenceAlias Property Alias_HuanReplacement Auto Const Mandatory

ReferenceAlias Property Alias_EstelleReplacement Auto Const Mandatory

ReferenceAlias Property Alias_Rokov_DisableMarker Auto Const Mandatory

ObjectReference Property LC088_OpsIntroScene_PlayerMoveToMarker Auto Const

Quest Property CF08_SysDef Auto Const Mandatory

Quest Property LC088_Space Auto Const Mandatory

RefCollectionAlias Property Alias_LoadElevators Auto Const Mandatory

ReferenceAlias Property Alias_Rokov_EnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Rokov_CombatTravelTarget Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_TheKey Auto Const Mandatory

RefCollectionAlias Property Alias_Reactor03_Robots Auto Const Mandatory

ReferenceAlias Property Alias_DelgadosTerminal Auto Const Mandatory

ReferenceAlias Property Alias_JessamineGriffin Auto Const Mandatory

Spell Property CritLaser Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

ReferenceAlias Property Alias_JessamineGriffin_GagarinLocation Auto Const Mandatory

Scene Property LC088_Key_Stage160_AludraDeath Auto Const Mandatory

Scene Property LC088_Key_Stage170_TKDeath Auto Const Mandatory

Scene Property LC088_Key_Stage180_IsraDeath Auto Const Mandatory

Scene Property LC088_Key_Stage150_DepotEntry Auto Const Mandatory

Quest Property CF_Post Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Auto Const Mandatory

ReferenceAlias Property Alias_Ops_FollowerMoveToMarker Auto Const Mandatory

ReferenceAlias Property Alias_Adler_DisableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Adler Auto Const Mandatory

Faction Property CydoniaFaction Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

ActorBase Property CF_AdlerKemp Auto Const Mandatory

Outfit Property Outfit_Clothes_CrimsonFleet_Captain_01 Auto Const Mandatory

Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const Mandatory

Outfit Property Outfit_Clothes_CrimsonFleet_Captain_04 Auto Const Mandatory

ReferenceAlias Property Alias_Rokov Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

LocationAlias Property Alias_LC088KeyInteriorLocation Auto Const Mandatory

WwiseEvent Property DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open Auto Const Mandatory

RefCollectionAlias Property Alias_CargoBayLoadDoorsNormal Auto Const Mandatory
RefCollectionAlias Property Alias_CargoBayLoadDoorsLC088 Auto Const Mandatory
RefCollectionAlias Property Alias_OpsEntryDoorsLoad Auto Const Mandatory
RefCollectionAlias Property Alias_OpsEntryDoorsNormal Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

Keyword Property SQ_LinkCompanionEliteCrewHomeMarker Auto Const Mandatory

Quest Property CFSD01 Auto Const Mandatory

Faction Property SQ_Followers_GroupFormation_Faction Auto Const Mandatory

ReferenceAlias Property Alias_Mathis Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Mainframe Auto Const Mandatory

Keyword Property LinkHome Auto Const Mandatory
