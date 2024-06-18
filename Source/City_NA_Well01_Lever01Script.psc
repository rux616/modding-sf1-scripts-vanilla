Scriptname City_NA_Well01_Lever01Script extends ReferenceAlias

ReferenceAlias Property Light01 Auto

ReferenceAlias Property Light02 Auto

ReferenceAlias Property Light03 Auto

ReferenceAlias Property Light04 Auto

ReferenceAlias Property ActiveLight Auto

ReferenceAlias Property Lever01 Auto

ReferenceAlias Property Lever02 Auto

ReferenceAlias Property Lever03 Auto

ReferenceAlias Property Lever04 Auto

ReferenceAlias Property LightIndicator Auto Const

Quest Property City_NA_Well01 Auto Const Mandatory

ObjectReference Property MySelf Auto

Event OnActivate(objectreference akactionref)

	Myself = Self.GetReference()

	If Myself == Lever01.GetReference()

		(Light01 as City_NA_Well01_LightScript).SwapState()
		(Light02 as City_NA_Well01_LightScript).SwapState()

	Elseif Myself == Lever02.GetReference()

		(Light01 as City_NA_Well01_LightScript).SwapState()
		(Light03 as City_NA_Well01_LightScript).SwapState()

	elseif Myself == Lever03.GetReference()

		(Light02 as City_NA_Well01_LightScript).SwapState()
		(Light04 as City_NA_Well01_LightScript).SwapState()

	elseif Myself == Lever04.GetReference()

		(Light01 as City_NA_Well01_LightScript).SwapState()
		(Light04 as City_NA_Well01_LightScript).SwapState()
	
	endif

	if City_NA_Well01_Light01State.GetValueInt() == 1 && City_NA_Well01_Light02State.GetValueInt()==1 && City_NA_Well01_Light03State.GetValueInt() == 1 && City_NA_Well01_Light04State.GetValueInt() == 1

		City_NA_Well01.SetStage(185)
		
	endif



EndEvent








GlobalVariable Property City_NA_Well01_Light01State Auto Const Mandatory

GlobalVariable Property City_NA_Well01_Light02State Auto Const Mandatory

GlobalVariable Property City_NA_Well01_Light03State Auto Const Mandatory

GlobalVariable Property City_NA_Well01_Light04State Auto Const Mandatory
