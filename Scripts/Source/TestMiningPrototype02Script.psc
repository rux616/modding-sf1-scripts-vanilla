Scriptname TestMiningPrototype02Script extends ObjectReference
{Allow player to loot ore once deposit has "broken up"}

Faction Property CurrentCompanionFaction Auto Const Mandatory
Int MineralAmount=6
MiscObject Property MineralType Auto Const Mandatory
effectshader Property MiningShader Auto Const
Weapon Property MiningWeapon Auto Const Mandatory
Bool CanLootOre=False
Message Property TestMiningPrototypeMSG Auto Const Mandatory
WwiseEvent Property FXMineOreIronALPMEvent Auto Const Mandatory
WwiseEvent Property FXMineOreIronBBreakEvent Auto Const Mandatory
Int SoundInstanceID

Function myRegisterForHit()
	;we want to know if the player or the player's companion ever hits the Mineral Deposit
	RegisterForHitEvent(self, Game.GetPlayer())
	RegisterForHitEvent(self, CurrentCompanionFaction)
EndFunction

Event OnLoad()
	myRegisterForHit()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	;only damage it if the player hits it with the right weapon 
	;otherwise, pop a message telling him what weapon to use
	If akSource == MiningWeapon
		Self.DamageObject(1.1)
	Else
		TestMiningPrototypeMSG.Show()
		myRegisterForHit()
	EndIf
EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if aiCurrentStage == 2
		if MiningShader
			MiningShader.play(Self)
			SoundInstanceID = FXMineOreIronALPMEvent.Play(self) ;play looping sound
		EndIf
	EndIf
	if aiCurrentStage >= 3
		;allow the player to activate ore to loot it
		CanLootOre=True
		WwiseEvent.StopInstance(SoundInstanceID)
		FXMineOreIronBBreakEvent.Play(self)
		Utility.Wait(0.2)
		MiningShader.stop(Self)
  	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	;if the mineral deposit is damaged enough (see OnDestructionStateChanged event), then add the minerals to whoever activates the deposit
	;Otherwise, show the message to the player that the mineral deposit needs to be attacked
	If (akActionRef== game.GetPlayer()) && (CanLootOre == False)
		TestMiningPrototypeMSG.Show()
	Else
		Self.Disable()
		akActionRef.AddItem(MineralType, MineralAmount)
	EndIf
EndEvent