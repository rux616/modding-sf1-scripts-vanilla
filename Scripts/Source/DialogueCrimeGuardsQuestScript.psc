Scriptname DialogueCrimeGuardsQuestScript extends Quest Conditional

ReferenceAlias property Alias_Guard auto const Mandatory

SQ_ParentScript property SQ_Parent auto const Mandatory

struct CrimeFactionGlobals
	Faction CrimeFaction
	GlobalVariable CountArrests
	GlobalVariable CountJail
	GlobalVariable CountPayFine
	GlobalVariable CountResist
endStruct
; internal "enum" to use for IncrementCrimeGlobal
int CountArrests = 0 Const
int CountJail = 1 Const
int CountPayFine = 2 Const
int CountResist = 3 Const

CrimeFactionGlobals[] property CrimeFactions auto const
{ array to hold globals for each crime faction to count player arrests etc. }

group CrimeGlobals
	GlobalVariable Property CrimeBribeAmount Auto Const Mandatory

	GlobalVariable Property CrimeAllowBribePlayerCreditsRequired Auto Const Mandatory

	GlobalVariable Property CrimeBountyAmount Auto Const Mandatory
EndGroup

group SpecialCases
	Keyword property LocTypeSettlement auto const mandatory

	; City_Akila_Ashta01
	Quest property City_Akila_Ashta01 auto const mandatory

	Location property CityAkilaCityLocation auto const mandatory

	int property Ashta01_StageRequired = 50 auto const
	int property Ashta01_StageToSet = 65 auto const
endGroup 

Function PlayerResistingArrest()
	debug.trace(self + "PlayerResistingArrest")
	IncrementCrimeGlobal(CountResist)
	Alias_Guard.TryToSetPlayerResistingArrest()
endFunction

Function PlayerGoToJail()
	debug.trace(self + "PlayerGoToJail")
	IncrementCrimeGlobal(CountJail)
	Alias_Guard.TryToSendPlayerToJail()

	; send contraband confiscated event
	SQ_Parent.SendContrabandConfiscatedEvent(Alias_Guard.TryToGetCrimeFaction())
endFunction

Function PlayerPayFine(bool abRemoveStolenItems=true, bool abGoToJail=true)
	debug.trace(self + "PlayerPayFine abGoTojail=" + abGoTojail + " abRemoveStolenItems=" + abRemoveStolenItems)
	IncrementCrimeGlobal(CountPayFine)
	; amount of crime gold determines whether we send player to jail or not
	Alias_Guard.TryToPlayerPayFine(abRemoveStolenItems = abRemoveStolenItems, abGoToJail = abGoToJail)

	if ( abRemoveStolenItems )
		; send contraband confiscated event
		SQ_Parent.SendContrabandConfiscatedEvent(Alias_Guard.TryToGetCrimeFaction())
	endif
endFunction

Function PlayerTryToArrest()
	CrimeAllowBribePlayerCreditsRequired.SetValue(0.0)
	CrimeBountyAmount.SetValue(0.0)

	Faction crimeFaction = Alias_Guard.TryToGetCrimeFaction()
	debug.trace(self + " PlayerTryToArrest guardRef=" + Alias_Guard.GetRef() + " crimeFaction=" + crimeFaction)
	if crimeFaction
		float currentBounty = crimeFaction.GetCrimeGold()
		; update current bounty amount
		CrimeBountyAmount.SetValue(currentBounty)
		; update total credits required for bribe
		CrimeAllowBribePlayerCreditsRequired.SetValue(currentBounty + CrimeBribeAmount.Getvalue())
		UpdateCurrentInstanceGlobal(CrimeBountyAmount)
		UpdateCurrentInstanceGlobal(CrimeAllowBribePlayerCreditsRequired)
	endif

	IncrementCrimeGlobal(CountArrests)

	; special cases:
	; City_Akila_Ashta01
	if City_Akila_Ashta01.GetStageDone(Ashta01_StageRequired) && City_Akila_Ashta01.GetStageDone(Ashta01_StageToSet) == false
		; advance quest if player is forcegreeted by guard in Akila City
		if Game.GetPlayer().GetCurrentLocation().IsSameLocation(CityAkilaCityLocation, LocTypeSettlement)
			City_Akila_Ashta01.SetStage(Ashta01_StageToSet)
		endif
	endif 
EndFunction

Function PlayerSmuggling()
	Alias_Guard.TryToSendSmugglingAlarm()
EndFunction

; Internal
Function IncrementCrimeGlobal(int globalTypeEnum = -1)
	if globalTypeEnum > -1 && globalTypeEnum <= CountResist
		; increment appropriate crime faction global
		Faction crimeFaction = Alias_Guard.TryToGetCrimeFaction()
		int factionIndex = CrimeFactions.FindStruct("CrimeFaction", crimeFaction)
		if factionIndex > -1
			CrimeFactionGlobals theFactionGlobals = CrimeFactions[factionIndex]
			GlobalVariable countGlobal
			if globalTypeEnum == CountArrests
				countGlobal = theFactionGlobals.CountArrests
			ElseIf globalTypeEnum == CountJail
				countGlobal = theFactionGlobals.CountJail
			ElseIf globalTypeEnum == CountPayFine
				countGlobal = theFactionGlobals.CountPayFine
			ElseIf globalTypeEnum == CountResist
				countGlobal = theFactionGlobals.CountResist
			endif
			if countGlobal
				countGlobal.Mod(1)
			endif
		endif
	endif
EndFunction

Function TestGoToJail(faction crimefaction, bool realJail)
	debug.trace(self + "TestGoToJail")
	crimeFaction.SendPlayerToJail(true, realJail)
endFunction

