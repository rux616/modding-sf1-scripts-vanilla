Scriptname DefaultEnableAliasesQuestScript extends Quest Const Default
{enabled aliases on start or quest stages}

struct AliasEnableDatum
    Alias AliasToEnable
    int StageToEnable = -1
    {Stage to enable, if -1 (default) will enable at quest start}
endStruct

AliasEnableDatum[] Property AliasEnableData Mandatory Const Auto 

Event OnQuestStarted()
    EnableAliasByStage(-1)
EndEvent

Event OnStageSet(int auiStageID, int auiItemID)
    EnableAliasByStage(auiStageID)
EndEvent

Function EnableAliasByStage(int EnableStage)
    AliasEnableDatum[] enableData = AliasEnableData.GetAllMatchingStructs("StageToEnable", EnableStage)

    int i = 0
    While (i < enableData.length)
        AliasEnableDatum currentDatum = enableData[i]

        ReferenceAlias ReferenceAliasToEnable = currentDatum.AliasToEnable as ReferenceAlias

        if ReferenceAliasToEnable
            ReferenceAliasToEnable.TryToEnable() ;failure expected in case of optional aliases
        else
            RefCollectionAlias RefCollectionAliasToEnable = currentDatum.AliasToEnable as RefCollectionAlias

            if RefCollectionAliasToEnable
                RefCollectionAliasToEnable.EnableAll()
            endif
        endif

        i += 1
    EndWhile
EndFunction