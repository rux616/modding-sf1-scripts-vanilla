Scriptname MQ401VariantQuestScript extends Quest

ReferenceAlias[] Property RefAliasesToEnableArray Const Auto
Bool Property MQ402NoLodgeArtifacts Const Auto
GlobalVariable Property MQ401_NoLodgeArtifacts Mandatory Const Auto
Int Property QuestInitStage=10 Const Auto

Event OnQuestInit()
    ;for a MQ401 variant, we disable many of the MQ actors, so enable any that the variant needs
    If RefAliasesToEnableArray != None
      EnableQuestActors()
    EndIf

    ;if this Variant doesn't have any Artifacts at the Lodge, or we hand over all of them immediately, then MQ402 needs to skip returning there
    If MQ402NoLodgeArtifacts
        MQ401_NoLodgeArtifacts.SetValueInt(1)
    EndIf

   SetStage(QuestInitStage)
EndEvent

 Function EnableQuestActors()
   int currentElement = 0
   while (currentElement < RefAliasesToEnableArray.Length)
     RefAliasesToEnableArray[currentElement].GetActorRef().Enable()
     currentElement += 1
   endWhile
 EndFunction