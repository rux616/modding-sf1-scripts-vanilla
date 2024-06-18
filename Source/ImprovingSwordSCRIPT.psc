Scriptname ImprovingSwordSCRIPT extends ActiveMagicEffect

GLOBALVARIABLE PROPERTY pImprovingSword AUTO

Event OnDying(ObjectReference akKiller)
	pImprovingSword.setValue(pImprovingSword.getValue() + 1)
	
EndEvent