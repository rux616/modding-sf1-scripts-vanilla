Scriptname SFBGS00D:MagnetSwitchScript extends ReferenceAlias

Keyword Property LinkCustom01 Auto Const Mandatory
Keyword Property LinkCustom02 Auto Const Mandatory
Float Property MagnetLoadTime Auto Const
Float Property MagnetChargeTime Auto Const
Float Property MagnetSpeed Auto Const
Float Property MagnetPosition Auto Const
WwiseEvent Property pMagnetMoveSound Auto Const Mandatory
WwiseEvent Property pMagnetChargeSound Auto Const Mandatory
WwiseEvent Property pMagnetReleaseSound Auto Const Mandatory
WwiseEvent Property pJunkPileAudio Auto Const Mandatory
ReferenceAlias Property pJunkPileRefAlias Auto Const Mandatory
Hazard Property SFBGS00D_GravWellHazard Auto Const Mandatory
GlobalVariable Property pGlobalToCheck Auto Const

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		ObjectReference SwitchRef = Self.GetRef()
		ObjectReference TriggerRef = SwitchRef.GetLinkedRef()
		ObjectReference AttachRef = SwitchRef.GetLinkedRef(LinkCustom01)
		ObjectReference MagnetRef = SwitchRef.GetLinkedRef(LinkCustom01)
		SwitchRef.BlockActivation(true, true)
		pGlobalToCheck.SetValue(1)
		pMagnetMoveSound.Play(AttachRef)
		AttachRef.SetAnimationVariableFloat("Speed", MagnetSpeed)
		AttachRef.SetAnimationVariableFloat("Position", MagnetPosition)
		
		Utility.Wait(MagnetLoadTime)

		ObjectReference MagnetPull = MagnetRef.PlaceAtMe(SFBGS00D_GravWellHazard)
		TriggerRef.EnableNoWait()
		pMagnetChargeSound.Play(AttachRef)

		Utility.Wait(MagnetChargeTime)
		pMagnetReleaseSound.Play(AttachRef)
		MagnetPull.DisableNoWait()
		MagnetPull.Delete()
		TriggerRef.DisableNoWait()
		
		Utility.Wait(1.0)
		pJunkPileAudio.Play(pJunkPileRefAlias.GetRef())
		AttachRef.SetAnimationVariableFloat("Position", 0.0)
		pMagnetMoveSound.Play(AttachRef)		

		Utility.Wait(MagnetLoadTime)
		pGlobalToCheck.SetValue(0)
		SwitchRef.BlockActivation(false, false)
		GoToState("Waiting")		
	EndEvent
EndState

State Busy
EndState