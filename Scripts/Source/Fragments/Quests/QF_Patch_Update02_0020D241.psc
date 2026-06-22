;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update02_0020D241 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;City_NA_Well01 - Reopen the junction boxes or blocking door if they've been relocked
if City_NA_Well01.IsRunning()
	if City_NA_Well01.GetStageDone(20) && Well01Door01.GetRef().IsLocked()
		;unlock the first junction box
		Well01Door01.GetRef().Lock(False)
	endif
	if City_NA_Well01.GetStageDone(50) && Well01Door02.GetRef().IsLocked()
		;unlock the second junction box
		Well01Door02.GetRef().Lock(False)
	endif
	if City_NA_Well01.GetStageDone(100) && Well01Door03.GetRef().IsLocked()
		;unlock the third junction box
		Well01Door03.GetRef().Lock(False)
	endif
	if City_NA_Well01.GetStageDone(150) && Well01Door04.GetRef().IsLocked()
		;unlock the fourth junction box and puzzle junction boxes
		Well01Door04.GetRef().Lock(False)
		Well01Puzzle01.GetRef().Lock(False)
		Well01Puzzle02.GetRef().Lock(False)
		Well01Puzzle03.GetRef().Lock(False)
		Well01Puzzle04.GetRef().Lock(False)
	endif
	if City_NA_Well01.GetStageDone(185) && Well01BlockingDoor.GetRef().IsLocked()
		;unlock the blocking door
		Well01BlockingDoor.GetRef().Lock(False)
		Well01BlockingDoor.GetRef().SetOpen()
	endif
endif

;City_NA_Well02 - Reopen the junction boxes or apartment door if they've been relocked
if City_NA_Well02.IsRunning()
	if City_NA_Well02.GetStageDone(50) && Well02Door01.GetRef().IsLocked()
		;unlock the first junction box
		Well02Door01.GetRef().Lock(False)
	endif
	if City_NA_Well02.GetStageDone(70) && Well02Door02.GetRef().IsLocked()
		;unlock the second and third junction boxes
		Well02Door02.GetRef().Lock(False)
		Well02Door03.GetRef().Lock(False)
	endif
	if ( City_NA_Well02.GetStageDone(90) || City_NA_Well02.GetStageDone(110) ) && Well02Door04.GetRef().IsLocked()
		;unlock the fourth junction box
		Well02Door04.GetRef().Lock(False)
	endif
	if City_NA_Well02.GetStageDone(150) && Well02ApartmentDoor.GetRef().IsLocked()
		;unlock the apartment door
		Well02ApartmentDoor.GetRef().SetLockLevel(25)
	endif
endif

;UC08 - Reopen the transform room door if it's been relocked
if UC08.GetStageDone(430) && UC08_TransformRoomDoor.GetRef().IsLocked()
	UC08_TransformRoomDoor.GetRef().BlockActivation(false, false)
	UC08_TransformRoomDoor.GetRef().Unlock()
endif

;SF-11227: During LC088_Key, set Delgado unaggressive to avoid crime issues.
if (LC088_Key.GetStage() == 600)
     Alias_LC088KeyDelgado.GetActorRef().SetValue(Aggression, 0)
EndIf

;City_NA_Viewport03 - Reopen the Sub12 door if it's been relocked
if City_NA_Viewport03.GetStageDone(40) && City_NA_Viewport03_Sub12Door.GetRef().IsLocked()
	City_NA_Viewport03_Sub12Door.GetRef().Lock(False)
endif

;MS01 - Reopen the infirmary door if it's been relocked
if MS01.GetStageDone(420) && MS01InfirmaryDoor.GetRef().IsLocked()
	MS01InfirmaryDoor.GetRef().Unlock()
endif

;FC05 - If the announcement scene has ended early, update to start the Red Mile
if FC05.GetStageDone(700) && !FC05.GetStageDone(800) && !FC05_MeiAnnounceRunScene.IsPlaying()
    if Game.GetPlayer().GetCurrentLocation()==SettleRedMileLocation
        FC05.SetStage(800)
    else
        FC05.SetStage(790)
    endif
endif

;DialogueRedMile - If Mei's greeting scene is still playing, end it to allow dialogue 
if DialogueRedMile_Mei_Greeting.IsPlaying()
	DialogueRedMile_Mei_Greeting.Stop()
endif

;MQ202 - If companion's quest started during MQ202, make active companion
if MQ202.IsRunning() && !MQ202.GetStageDone(20)
	Actor AndrejaREF = Alias_Companion_Andreja.GetActorRef()
	Actor BarrettREF = Alias_Companion_Barrett.GetActorRef()
	Actor SamCoeREF = Alias_Companion_SamCoe.GetActorRef()
	Actor SarahMorganREF = Alias_Companion_SarahMorgan.GetActorRef()
	Actor ActiveCompanionREF = Alias_ActiveCompanion.GetActorRef()

	if AndrejaREF.GetValue(COM_PQ_LockedIn) == 1 && AndrejaREF != ActiveCompanionREF
		(SQ_Companions as SQ_CompanionsScript).SetRoleActive(AndrejaREF)
		AndrejaREF.MoveToPackageLocation()
	endif
	if BarrettREF.GetValue(COM_PQ_LockedIn) == 1 && BarrettREF != ActiveCompanionREF
		(SQ_Companions as SQ_CompanionsScript).SetRoleActive(BarrettREF)
		BarrettREF.MoveToPackageLocation()
	endif
	if SamCoeREF.GetValue(COM_PQ_LockedIn) == 1 && SamCoeREF != ActiveCompanionREF
		(SQ_Companions as SQ_CompanionsScript).SetRoleActive(SamCoeREF)
		SamCoeREF.MoveToPackageLocation()
	endif
	if SarahMorganREF.GetValue(COM_PQ_LockedIn) == 1 && SarahMorganREF != ActiveCompanionREF
		(SQ_Companions as SQ_CompanionsScript).SetRoleActive(SarahMorganREF)
		SarahMorganREF.MoveToPackageLocation()
	endif
endif

;remove COM objectives if active during the Eye quests
if MQ201B.IsRunning() || MQ202.IsRunning() || MQ204.IsRunning()
	if COM_Companion_Andreja.IsObjectiveDisplayed(10)
		COM_Companion_Andreja.SetObjectiveDisplayed(10, false)
	endif
	if COM_Companion_Barrett.IsObjectiveDisplayed(900)
		COM_Companion_Barrett.SetObjectiveDisplayed(900, false)
	endif
	if COM_Companion_SamCoe.IsObjectiveDisplayed(10)
		COM_Companion_SamCoe.SetObjectiveDisplayed(10, false)
	endif
	if COM_Companion_SamCoe.IsObjectiveDisplayed(798)
		COM_Companion_SamCoe.SetObjectiveDisplayed(798, false)
	endif
	if COM_Companion_SarahMorgan.IsObjectiveDisplayed(10)
		COM_Companion_SarahMorgan.SetObjectiveDisplayed(10, false)
	endif
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_NA_Well01 Auto Const

Quest Property City_NA_Well02 Auto Const

ReferenceAlias Property Well01Door01 Auto Const

ReferenceAlias Property Well01Door02 Auto Const

ReferenceAlias Property Well01Door03 Auto Const

ReferenceAlias Property Well01Door04 Auto Const

ReferenceAlias Property Well01Puzzle01 Auto Const

ReferenceAlias Property Well01Puzzle02 Auto Const

ReferenceAlias Property Well01Puzzle03 Auto Const

ReferenceAlias Property Well01Puzzle04 Auto Const

ReferenceAlias Property Well01BlockingDoor Auto Const

ReferenceAlias Property Well02Door01 Auto Const

ReferenceAlias Property Well02Door02 Auto Const

ReferenceAlias Property Well02Door03 Auto Const

ReferenceAlias Property Well02Door04 Auto Const

ReferenceAlias Property Well02ApartmentDoor Auto Const

Quest Property UC08 Auto Const

ReferenceAlias Property UC08_TransformRoomDoor Auto Const

ActorValue Property Aggression Auto Const Mandatory

Quest Property LC088_Key Auto Const Mandatory

ReferenceAlias Property Alias_LC088KeyDelgado Auto Const Mandatory

Quest Property City_NA_Viewport03 Auto Const

ReferenceAlias Property City_NA_Viewport03_Sub12Door Auto Const

ReferenceAlias Property MS01InfirmaryDoor Auto Const

Quest Property MS01 Auto Const

Quest Property FC05 Auto Const

Scene Property FC05_MeiAnnounceRunScene Auto Const

Location Property SettleRedMileLocation Auto Const

Scene Property DialogueRedMile_Mei_Greeting Auto Const

ReferenceAlias Property Alias_Companion_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_Companion_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_Companion_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_Companion_SarahMorgan Auto Const Mandatory

ReferenceAlias Property Alias_ActiveCompanion Auto Const Mandatory

Quest Property MQ202 Auto Const Mandatory

Quest Property MQ204 Auto Const Mandatory

Quest Property MQ201B Auto Const Mandatory

ActorValue Property COM_PQ_LockedIn Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

Quest Property COM_Companion_Andreja Auto Const Mandatory

Quest Property Com_Companion_Barrett Auto Const Mandatory

Quest Property COM_Companion_SamCoe Auto Const Mandatory

Quest Property COM_Companion_SarahMorgan Auto Const Mandatory
