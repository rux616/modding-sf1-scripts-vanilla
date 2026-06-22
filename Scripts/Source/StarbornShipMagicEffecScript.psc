Scriptname StarbornShipMagicEffecScript extends ActiveMagicEffect
{Script that manages granting Quantum Essence to the player after destroying a Starborn ship.}

;Properties
Message Property QuantumEssenceAddMSG Mandatory Const Auto
Spell Property FortifyQuantumEssenceSpell Mandatory Const Auto

;Non-Properties
SpaceshipReference StarbornShip 

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    ;Gets the Starborn ship and registers for OnDying event
    StarbornShip = akCaster.GetSpaceship()
    RegisterForRemoteEvent(StarbornShip, "OnDying")
EndEvent

Event SpaceshipReference.OnDying(SpaceshipReference akSender, ObjectReference akKiller)
    ;Cast FortifyQuantumEssence on player and display message
    If (akSender == Starbornship)
        FortifyQuantumEssenceSpell.Cast(akSender, Game.GetPlayer())
        QuantumEssenceAddMSG.Show()
    EndIf
EndEvent