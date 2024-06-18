Scriptname PEO:SQ_PEO_QuestScript extends Quest

Guard AVArrayGuard
Guard GlobalArrayGuard
Guard SpellArrayGuard
Guard XPMultGuard

struct OptionDatum
    GameplayOption Option
    {gameplay option form} ;game play option forms are a new form type that appear as gameplay option sliders in the menu
    GlobalVariable ValueGlobal
    {global associated with the option - this global is used as a proxy for the value of the game play option in various data and will appear in the updated ESM so other creations can refer to the settings}
endstruct

struct OptionAVDatum
    GlobalVariable GlobalToCheck
    {global value associated with the option}
    float ValueToCheck
    {associated value in OptionGlobal}
    ActorValue AVToSet
    {associated actorvalue to set}
    float ValueToSet
    {value AVToSet should be set to when OptionGlobal == OptionValue}
endstruct

struct OptionGlobalDatum
    GlobalVariable GlobalToCheck
    {global value associated with the option}
    float ValueToCheck
    {associated value in OptionGlobal}
    GlobalVariable GlobalToSet
    {associated global value to set}
    float ValueToSet
    {value GlobalToSet should be set to when OptionGlobal == OptionValue}
    GlobalVariable ValueToSetFromGlobal
    {<some descriptor> global value GlobalToSet should be set to when not using a discrete value}
endstruct

struct OptionSpellDatum
    GlobalVariable GlobalToCheck
    {global value associated with the option}
    Spell SpellToRefresh
    {spell to remove and add to the player}
endstruct

Group Properties
    ReferenceAlias Property Player_Alias Mandatory Const Auto
    {autofill}

    OptionDatum[] Property OptionData Mandatory Const Auto
    {used to set related Option and Global}

    OptionAVDatum[] Property OptionAVData Mandatory Const Auto RequiresGuard(AVArrayGuard) 
    {use to set ActorValues based on PEO GlobalVariable Values}

    OptionGlobalDatum[] Property OptionGlobalData Mandatory Const Auto RequiresGuard(GlobalArrayGuard) 
    {use to set GlobalVariables based on PEO GlobalVariable Values}

    OptionSpellDatum[] Property OptionSpellData Mandatory Const Auto RequiresGuard(SpellArrayGuard) 
    {use to refresh Spells based on changing gameplay options}

    ActorValue Property PEO_XP_Mult Mandatory Const Auto RequiresGuard(XPMultGuard) 
    {autofill; an AV used by PEO_XP_Mult_Perk to scale player XP based on gameplay option settings}
EndGroup

Group RemapValues
    GameplayOption Property PEO_GPO_EnvironmentalDamage Mandatory Const Auto
EndGroup



;/
******************************************************************************************************************************************************************************
*** Disambiguating GlobalValues in this script ***
******************************************************************************************************************************************************************************
    There are two types of GlobalValues associated with options.
    
    First type is the option that maps one to one with gameplay option itself. It literally stores the value of the gameplay option.
    These exist because work began on this system before gameplay option form and code existed. And we used the globals as place holders for the gameplay options.
    These are mapped in OptionData
    
    Second type is other globals that we set based on the current value of the gameplay option. These are used in condition forms, perks, etc. and represent game logic data.
    These are set up in the OptionGlobalData.
    These are analogous to the actorvalues in OptionAVData.
******************************************************************************************************************************************************************************
/;


Event OnQuestInit()
    ;register for event - this happens first to make sure we don't miss any slider events
    RegisterForGameplayOptionChangedEvent()

    ;if changes were made to Gameplay Options at Start Menu, make sure we set up the related globals for all options
    GlobalVariable[] AllPlayerExperienceOptionGlobals = UpdateOptionsAndGetGlobals(GetAllPlayerExperienceOptions())

    ;set up defaults
    UpdateSpecificOptions(AllPlayerExperienceOptionGlobals) ;by default set up all
EndEvent

Event OnGameplayOptionChanged(GameplayOption[] aChangedOptions)
    Trace(self, "OnGameplayOptionChanged() aChangedOptions: " + aChangedOptions)

    GlobalVariable[] globalsToUpdate = UpdateOptionsAndGetGlobals(aChangedOptions)

    Trace(self, "UpdateOptionsAndGetGlobals() globalsToUpdate: " + globalsToUpdate)

    UpdateSpecificOptions(globalsToUpdate)
    UpdateXPMult()

    ;THIS MUST GO LAST IN THIS EVENT. It pokes the game to update inventory data, etc.
    GameplayOption.NotifyGameplayOptionUpdateFinished()
EndEvent

GameplayOption[] Function GetAllPlayerExperienceOptions()
    GameplayOption[] options = new GameplayOption[OptionData.Length]

    int i = 0
    While (i < OptionData.length)
        options[i] = OptionData[i].Option
        i += 1
    EndWhile

    RETURN options
EndFunction

GlobalVariable[] Function GetAllPlayerExperienceOptionGlobals()
    GlobalVariable[] allOptionGlobals = new GlobalVariable[0]
    int i = 0
    While (i < OptionData.length)
        allOptionGlobals.add(OptionData[i].ValueGlobal)
        i += 1
    EndWhile

    RETURN allOptionGlobals
EndFunction


GlobalVariable[] Function UpdateOptionsAndGetGlobals(GameplayOption[] OptionsToUpdateAndGetGlobalsFor)
    GlobalVariable[] globalsToGet = new GlobalVariable[0]

    int i = 0
    While (i < OptionsToUpdateAndGetGlobalsFor.length)
        GameplayOption currentGameplayOption = OptionsToUpdateAndGetGlobalsFor[i]
        Trace(self, "UpdateOptionsAndGetGlobals() currentGameplayOption: " + currentGameplayOption)

        GlobalVariable matchingGlobal = GetMatchingGlobalForOption(currentGameplayOption)
        if matchingGlobal
            matchingGlobal.SetValue(currentGameplayOption.GetValue()) ;store the value of the option in the global

            ;remap to deal with deleting an option after setting up all the data for specific global value
            if currentGameplayOption == PEO_GPO_EnvironmentalDamage
                if currentGameplayOption.GetValue() == 2
                    ;remap it to 3 because we removed 2 from the option but still have magic effects etc conditioned on things being 3
                    matchingGlobal.SetValue(3)
                endif
            endif


            globalsToGet.Add(matchingGlobal)
        endif
        
        i += 1
    EndWhile

    Trace(self, "UpdateOptionsAndGetGlobals() globalsToGet: " + globalsToGet)

    RETURN globalsToGet
EndFunction

GlobalVariable Function GetMatchingGlobalForOption(GameplayOption OptionToCheck)
    int iFound = OptionData.FindStruct("Option", OptionToCheck)
    OptionDatum foundOptionDatum
    if iFound > -1
        foundOptionDatum = OptionData[iFound]
        RETURN foundOptionDatum.ValueGlobal ;option only appears once in the array
    else 
        trace(self, "GetMatchingGlobalForOption() could not find a matching GlobalVariable for OptionToCheck: " + OptionToCheck + ". Note: this might be for an option from another creation and doesn't nessassarily mean it's a bug.")
        RETURN none
    endIf
EndFunction

Function UpdateSpecificOptions(GlobalVariable[] GlobalsToUpdate = None) Private
    ;calls all update functions

    ;see to do above to use GlobalsToUpdate in the calls below
    UpdateActorValues(GlobalsToUpdate)
    UpdateGlobalVariables(GlobalsToUpdate)
    
    ;refreshes spells on the player
    UpdateSpells(GlobalsToUpdate)
EndFunction

Function UpdateActorValues(GlobalVariable[] GlobalsToUpdate = None) Private
   LockGuard AVArrayGuard
        Trace(self, "UpdateActorValues() GlobalsToUpdate: " + GlobalsToUpdate)

        ;loops through OptionAVData setting AVs based on PEO GlobalVariable values

        if GlobalsToUpdate == None
            GlobalsToUpdate = GetAllPlayerExperienceOptionGlobals() ;default behavior of function is to update for all
            Trace(self, "UpdateActorValues() using ALL GlobalsToUpdate: " + GlobalsToUpdate)
        endif

        ;outer while loop is looping through an array of GlobalsToUpdate.
        ;inner while loop is looping through an array of things to update based on each global in the outer loop

        int index_GlobalsToUpdate = 0
        While (index_GlobalsToUpdate < GlobalsToUpdate.length)
            GlobalVariable currentGlobal = GlobalsToUpdate[index_GlobalsToUpdate]
            
            ;get data matching the current global and loop through it updating things
            OptionAVDatum[] matchingData =  OptionAVData.GetAllMatchingStructs("GlobalToCheck", currentGlobal)

            int index_AVData = 0
            While (index_AVData < matchingData.length)
                OptionAVDatum currentDatum = matchingData[index_AVData]

                GlobalVariable currentOptionGlobal = currentDatum.GlobalToCheck
                float currentValueToCheck = currentDatum.ValueToCheck
                ActorValue currentAVToSet = currentDatum.AVToSet
                float currentValueToSet = currentDatum.ValueToSet

                float currentActualValue = currentOptionGlobal.GetValue()

                if currentActualValue == currentValueToCheck
                    Trace(self, "UpdateActorValues() currentOptionGlobal: " + currentOptionGlobal + "--> setting currentAVToSet: " + currentAVToSet + " to currentValueToSet: " + currentValueToSet)
                    Game.GetPlayer().SetValue(currentAVToSet, currentValueToSet)
                endif
            
                index_AVData += 1
            EndWhile

            index_GlobalsToUpdate += 1
        EndWhile
   EndLockGuard
EndFunction

Function UpdateGlobalVariables(GlobalVariable[] GlobalsToUpdate = None) Private
    LockGuard GlobalArrayGuard
        Trace(self, "UpdateGlobalVariables() GlobalsToUpdate: " + GlobalsToUpdate )
        ;loops through OptionGlobalData setting Globals based on PEO GlobalVariable values

        if GlobalsToUpdate == None
            GlobalsToUpdate = GetAllPlayerExperienceOptionGlobals() ;default behavior of function is to update for all
            Trace(self, "UpdateGlobalVariables() using ALL GlobalsToUpdate: " + GlobalsToUpdate)
        endif

        ;outer while loop is looping through an array of GlobalsToUpdate.
        ;inner while loop is looping through an array of things to update based on each global in the outer loop

        int index_GlobalsToUpdate = 0
        While (index_GlobalsToUpdate < GlobalsToUpdate.length)
            GlobalVariable currentGlobal = GlobalsToUpdate[index_GlobalsToUpdate]

            ;get data matching the current global and loop through it updating things
            OptionGlobalDatum[] matchingData =  OptionGlobalData.GetAllMatchingStructs("GlobalToCheck", currentGlobal)

            int index_GlobalData = 0
            While (index_GlobalData < matchingData.length)
                OptionGlobalDatum currentDatum = matchingData[index_GlobalData]

                GlobalVariable currentOptionGlobal = currentDatum.GlobalToCheck
                float currentValueToCheck = currentDatum.ValueToCheck
                GlobalVariable currentGlobalToSet = currentDatum.GlobalToSet
                float currentValueToSet = currentDatum.ValueToSet
                GlobalVariable currentValueToSetFromGlobal = currentDatum.ValueToSetFromGlobal

                float currentActualValue = currentOptionGlobal.GetValue()

                if currentActualValue == currentValueToCheck
                    
                    ;set ValueToSet from global instead of ValueToCheck if ValueToSetFromGlobal global variable property is populated
                    if currentValueToSetFromGlobal
                        currentValueToSet = currentValueToSetFromGlobal.GetValue()
                    endif
                    
                    Trace(self, "UpdateGlobalVariables() currentOptionGlobal: " + currentOptionGlobal + "--> setting currentGlobalToSet: " + currentGlobalToSet + " to currentValueToSet: " + currentValueToSet)
                    currentGlobalToSet.SetValue(currentValueToSet)
                endif
            
                index_GlobalData += 1
            EndWhile

            index_GlobalsToUpdate += 1
        EndWhile
    EndLockGuard
EndFunction

Function RemoveAndAddSpell(Actor akActor, Spell spellToRemoveAndAdd)
    Trace(self, "RemoveAndAddSpell() akActor: " + akActor + ", spellToRemoveAndAdd: " + spellToRemoveAndAdd)
    Trace(self, "RemoveAndAddSpell() akActor.HasSpell(spellToRemoveAndAdd): " + akActor.HasSpell(spellToRemoveAndAdd))
    if akActor.HasSpell(spellToRemoveAndAdd)
        akActor.RemoveSpell(spellToRemoveAndAdd)
        Trace(self, "RemoveSpell() akActor.HasSpell(spellToRemoveAndAdd): " + akActor.HasSpell(spellToRemoveAndAdd))
        int timeoutIterations = 0
        while (akActor.HasSpell(spellToRemoveAndAdd) && timeoutIterations < 100)
            Utility.Wait(0.1)
            timeoutIterations += 1
            Trace(self, "Timeout interation #: " + timeoutIterations + " akActor.HasSpell(spellToRemoveAndAdd): " + akActor.HasSpell(spellToRemoveAndAdd))
        endWhile
        akActor.AddSpell(spellToRemoveAndAdd, abVerbose = false)
        Trace(self, "AddSpell() akActor.HasSpell(spellToRemoveAndAdd): " + akActor.HasSpell(spellToRemoveAndAdd))
    endif

    Trace(self, "RemoveAndAddSpell() Done.")
EndFunction

Function UpdateSpells(GlobalVariable[] GlobalsToUpdate = None) Private
    LockGuard SpellArrayGuard
        Trace(self, "UpdateSpells() GlobalsToUpdate: " + GlobalsToUpdate )
        ;loops through OptionSpellData based on changing gameplay options

        Actor PlayerRef = Game.GetPlayer()

        if GlobalsToUpdate == None
            GlobalsToUpdate = GetAllPlayerExperienceOptionGlobals() ;default behavior of function is to update for all
            Trace(self, "UpdateSpells() using ALL GlobalsToUpdate: " + GlobalsToUpdate)
        endif

        ;outer while loop is looping through an array of GlobalsToUpdate.
        ;inner while loop is looping through an array of things to update based on each global in the outer loop

        int index_GlobalsToUpdate = 0
        While (index_GlobalsToUpdate < GlobalsToUpdate.length)
            GlobalVariable currentGlobal = GlobalsToUpdate[index_GlobalsToUpdate]

            ;get data matching the current global and loop through it updating things
            OptionSpellDatum[] matchingData =  OptionSpellData.GetAllMatchingStructs("GlobalToCheck", currentGlobal)

            int index_GlobalData = 0
            While (index_GlobalData < matchingData.length)
                OptionSpellDatum currentDatum = matchingData[index_GlobalData]

                Spell currentSpellToRefresh = currentDatum.SpellToRefresh
                
                Trace(self, "UpdateSpells() calling RemoveAndAddSpell for currentSpellToRefresh: " + currentSpellToRefresh)
                RemoveAndAddSpell(PlayerRef, currentSpellToRefresh)
            
                index_GlobalData += 1
            EndWhile

            index_GlobalsToUpdate += 1
        EndWhile
    EndLockGuard
EndFunction

Function UpdateXPMult() private
    LockGuard XPMultGuard
        float OptionRewardXPTotal ;stores the numeric total of all the player experience gameplay options. These can be negative values. 10 = 10%, -5 = -5%

        OptionRewardXPTotal = GameplayOption.GetXPTotal()
        Trace(self, "UpdateXPMult() OptionRewardXPTotal: " + OptionRewardXPTotal)

        float XPMult = 1 + (OptionRewardXPTotal * 0.01) ;this will modify a default 1.0 value actorvalue that will multiply EXP via perk entry. A total of 10 OptionRewardXPTotal becomes 1.10 to scale the incoming EXP.
        Trace(self, "UpdateXPMult() XPMult: " + XPMult)

        Game.GetPlayer().SetValue(PEO_XP_Mult, XPMult)
    EndLockGuard
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "PEO",  string SubLogName = "SQ_PEO", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "PEO",  string SubLogName = "SQ_PEO", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction