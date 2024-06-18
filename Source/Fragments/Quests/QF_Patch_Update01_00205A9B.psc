;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update01_00205A9B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;CF03/LC030 - Check for actors burrowing out of the shuttle bay.
if (LC030.GetStageDone(640) && !LC030.GetStageDone(650))
     LC030.StartShuttleBayMonitor()
EndIf

;UC02/MQ204 - If UC01 is done, but UC02 hasn't started, try to start it again
;and make sure the MQ204 state handler is wrapped up

if UC01.IsCompleted() && !UC02.GetStageDone(100)
  ;Check to make sure the state handler's done with first
  if MQ204_NA_StateChangeHandler.IsRunning() && !MQ204_NA_StateChangeHandler.GetStageDone(100)
    MQ204_NA_StateChangeHandler.SetStage(100)
  endif

  ;Then start UC02
  UC02.Start() 
endif

;MQ202 - Reopen the Scow door if it's been relocked
if !LC012ScowTrigger.GetRef().IsEnabled() && LC012ScowDoor.GetRef().GetOpenState() == 3
	LC012ScowDoor.GetRef().SetOpen()
endif

;FFLodge04 - If a scene is running with Sarah outside the Lodge, shut down the quest
if !FFLodge04.GetStageDone(50) && FFLodge04.IsRunning() && (Companion_SarahMorgan.GetRef().GetCurrentLocation() != CityNewAtlantisLodgeLocation)
    FFLodge04.SetStage(200)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lc030_questscript Property LC030 Auto Const Mandatory

Quest Property MQ204_NA_StateChangeHandler Auto Const Mandatory

Quest Property UC01 Auto Const Mandatory

Quest Property UC02 Auto Const Mandatory

ReferenceAlias Property LC012ScowTrigger Auto Const

ReferenceAlias Property LC012ScowDoor Auto Const

Quest Property FFLodge04 Auto Const

ReferenceAlias Property Companion_SarahMorgan Auto Const

Location Property CityNewAtlantisLodgeLocation Auto Const
