;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_IncomingStorm_0005EC57 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
OE_KT_IncomingStormTotalMoves_Global.SetValue(3)
OE_KT_IncomingStormGenA_Global.SetValue(80)
OE_KT_IncomingStormGenB_Global.SetValue(50)
OE_KT_IncomingStormGenC_Global.SetValue(50)

kmyQuest.PuzzleStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
OE_KT_IncomingStormTotalMoves_Global.SetValue(3)
OE_KT_IncomingStormGenA_Global.SetValue(30)
OE_KT_IncomingStormGenB_Global.SetValue(100)
OE_KT_IncomingStormGenC_Global.SetValue(50)

kmyQuest.PuzzleStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
OE_KT_IncomingStormTotalMoves_Global.SetValue(3)
OE_KT_IncomingStormGenA_Global.SetValue(100)
OE_KT_IncomingStormGenB_Global.SetValue(50)
OE_KT_IncomingStormGenC_Global.SetValue(30)

kmyQuest.PuzzleStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
;Requires four moves to complete
OE_KT_IncomingStormTotalMoves_Global.SetValue(4)
OE_KT_IncomingStormGenA_Global.SetValue(50)
OE_KT_IncomingStormGenB_Global.SetValue(90)
OE_KT_IncomingStormGenC_Global.SetValue(40)

kmyQuest.PuzzleStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
SetObjectiveFailed(20)
SetObjectiveFailed(30)
SetObjectiveFailed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
OE_KT_IncomingStorm_Scene00.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
OE_KT_IncomingStormGenA_Global.Mod(-30)
OE_KT_IncomingStormGenB_Global.Mod(30)

kmyQuest.CheckPuzzle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
OE_KT_IncomingStormGenA_Global.Mod(-10)
OE_KT_IncomingStormGenC_Global.Mod(10)

kmyQuest.CheckPuzzle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
OE_KT_IncomingStormGenB_Global.Mod(-20)
OE_KT_IncomingStormGenA_Global.Mod(20)

kmyQuest.CheckPuzzle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
OE_KT_IncomingStormGenB_Global.Mod(-20)
OE_KT_IncomingStormGenC_Global.Mod(20)

kmyQuest.CheckPuzzle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE OE_KT_IncomingStormTerminalScript
Quest __temp = self as Quest
OE_KT_IncomingStormTerminalScript kmyQuest = __temp as OE_KT_IncomingStormTerminalScript
;END AUTOCAST
;BEGIN CODE
OE_KT_IncomingStormGenA_Global.Mod(10)
OE_KT_IncomingStormGenC_Global.Mod(-10)

kmyQuest.CheckPuzzle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
StormWeather.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
Sandstorm.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_02
Function Fragment_Stage_0100_Item_02()
;BEGIN CODE
Snowstorm.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_03
Function Fragment_Stage_0100_Item_03()
;BEGIN CODE
Alias_Terminal.GetRef().EnableNoWait()
Alias_Terminal01.GetRef().EnableNoWait()
OE_KT_IncomingStorm_Start.Start()


;Randomize the puzzle start so the answer isn't the same
int random = Utility.RandomInt()

if random > 75
    SetStage(1)
elseif random > 50
    SetStage(2)
elseif random > 25
    SetStage(3)
else
    SetStage(4)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
int instance1 = Wwise_Event_OBJ_Alarm_Generic_Play.Play(Alias_Terminal.GetRef())

Utility.Wait(Timer)
WwiseEvent.StopInstance(instance1)
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Alias_NPC03.GetRef().PlaceAtMe(ElectricalExplosionSmall)
Utility.Wait(0.5)
Alias_NPC03.GetActorRef().Kill()
SetObjectiveFailed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
WWise_SuccessSound.Play(Game.GetPlayer())
SetObjectiveCompleted(30)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
OE_KT_IncomingStorm_Scene00.Stop()
OE_KT_IncomingStorm_ExplosionStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Weather.ReleaseOverride()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property OE_KT_IncomingStorm_Scene00 Auto Const Mandatory

Weather Property StormWeather Auto Const Mandatory

Weather Property Sandstorm Auto Const Mandatory

Weather Property Snowstorm Auto Const Mandatory

Scene Property OE_KT_IncomingStorm_Start Auto Const Mandatory

ReferenceAlias Property Alias_Generator Auto Const Mandatory

Explosion Property ElectricalExplosionSmall Auto Const Mandatory

ReferenceAlias Property Alias_Terminal Auto Const Mandatory

WwiseEvent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const Mandatory

WwiseEvent Property Wwise_SuccessSound Auto Const Mandatory

GlobalVariable Property OE_KT_IncomingStormGenA_Global Auto Const Mandatory

GlobalVariable Property OE_KT_IncomingStormGenB_Global Auto Const Mandatory

GlobalVariable Property OE_KT_IncomingStormGenC_Global Auto Const Mandatory

ReferenceAlias Property Alias_NPC03 Auto Const Mandatory

Scene Property OE_KT_IncomingStorm_ExplosionStart Auto Const Mandatory

LeveledItem Property LL_OE_Default_Reward Auto Const Mandatory

MovableStatic Property BlowingFX_SmokeBillowing_lg Auto Const Mandatory

Float Property Timer Auto Const Mandatory

GlobalVariable Property OE_KT_IncomingStormTotalMoves_Global Auto Const Mandatory

ReferenceAlias Property Alias_Terminal01 Auto Const Mandatory

Scene Property OE_KT_IncomingStorm_Geologist_Greet Auto Const Mandatory
