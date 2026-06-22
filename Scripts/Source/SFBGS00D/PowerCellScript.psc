Scriptname SFBGS00D:PowerCellScript extends ObjectReference
{Power cell receptacle that you can add/remove the power cell from but only works if you have an ID Card}

ActorValue Property PowerCellReceptacleAV Auto Const
Bool Property HasPowerCell = true Auto 
GlobalVariable Property SFFL_MS01_TotalGeneratorsEnabled Auto
GlobalVariable Property SFFL_MS01_GeneratorsStabilized Auto
MiscObject Property Power_Cell Auto Const 
Message Property PowerCellMissingMessage Auto Const Mandatory
Message Property SFFL_MS01_KeycardMissingMessage Auto Const Mandatory
WwiseEvent Property SoundPowerUp Auto Const Mandatory
WwiseEvent Property SoundPowerDown Auto Const Mandatory
Keyword Property LinkCustom01 Auto Const Mandatory
Keyword Property LinkCustom02 Auto Const Mandatory
Keyword Property LinkCustom03 Auto Const Mandatory
ObjectReference Property StablePowerEnableMarker Auto Const
ObjectReference Property MaxPowerEnableMarker Auto Const
Key Property SFFL_MS01_IvicaKeycard Auto Const

int Property MaxPower = 4 Auto Const
int Property StablePower = 3 Auto Const

Auto State CheckPowerState
	Event OnLoad()
		if HasPowerCell == false
			SetValue(PowerCellReceptacleAV, 0.0)
			(Self.GetLinkedRef() as GenericSwitchScript).SetColor("Red")
			BlockActivation()
			GoToState("NoPowerCell")
		else
			Self.Activate(Self)
			BlockActivation()
			SetValue(PowerCellReceptacleAV, 1.0)
			GoToState("HasPowerCell")
		endif
    EndEvent
EndState

State NoPowerCell
	Event OnActivate(ObjectReference akActionRef)
	;Interact with Power Cell Receptacle
		GotoState("Busy")
		if akActionRef == Game.GetPlayer() 	
			if akActionRef.GetItemCount(SFFL_MS01_IvicaKeycard) >= 1
				if akActionRef.GetItemCount(Power_Cell) >= 1 ;Check if player has power cell
					InsertPowerCell(akActionRef)
					GotoState("HasPowerCell")
				else
					PowerCellMissingMessage.Show()
					GotoState("NoPowerCell")
				endif
			else
				SFFL_MS01_KeycardMissingMessage.Show()
				GotoState("NoPowerCell")
			endif
		endif
    EndEvent
EndState

State HasPowerCell
	Event OnActivate(ObjectReference akActionRef)
		GotoState("Busy")
		if akActionRef == Game.GetPlayer()
			if akActionRef.GetItemCount(SFFL_MS01_IvicaKeycard) >= 1
				RemovePowerCell(akActionRef)
				GotoState("NoPowerCell")
			else
				SFFL_MS01_KeycardMissingMessage.Show()
				GotoState("HasPowerCell")
			endif
		endif
	EndEvent
EndState

State Busy
    ;Do Nothing
EndState

Function InsertPowerCell(ObjectReference akActionRef)
	akActionRef.RemoveItem(Power_Cell)
	BlockActivation(false)
	Self.Activate(Self)
	BlockActivation()
	SoundPowerUp.Play(Self)
	Self.GetLinkedRef(LinkCustom03).EnableNoWait()
	SetValue(PowerCellReceptacleAV, 1.0)
	(Self.GetLinkedRef() as GenericSwitchScript).SetColor("Green")
	CheckTotalPower()
EndFunction

Function RemovePowerCell(ObjectReference akActionRef)
	BlockActivation(false)
	Self.Activate(Self)
	BlockActivation()
	akActionRef.AddItem(Power_Cell)
	Self.GetLinkedRef(LinkCustom03).DisableNoWait()
	SoundPowerDown.Play(Self)
	SetValue(PowerCellReceptacleAV, 0.0)
	(Self.GetLinkedRef() as GenericSwitchScript).SetColor("Red")
	CheckTotalPower()
EndFunction

Function CheckTotalPower()
	ObjectReference[] LinkedGenerators = Self.GetLinkedRef(LinkCustom01).GetLinkedRefChain(LinkCustom02)
	int i = 0
	int TotalPower = 0
	while i < LinkedGenerators.Length
		int CellValue = LinkedGenerators[i].GetValueInt(PowerCellReceptacleAV)
		TotalPower += CellValue
		i += 1
	endwhile
	SFFL_MS01_TotalGeneratorsEnabled.SetValue(TotalPower)
	if TotalPower == MaxPower || (TotalPower >= StablePower && SFFL_MS01_GeneratorsStabilized.GetValueInt() >= 1)
		MaxPowerEnableMarker.Enable()
		StablePowerEnableMarker.Enable()
	elseif TotalPower >= StablePower
		MaxPowerEnableMarker.Disable()
		StablePowerEnableMarker.Enable()
	else
		MaxPowerEnableMarker.Disable()
		StablePowerEnableMarker.Disable()
	endif
EndFunction