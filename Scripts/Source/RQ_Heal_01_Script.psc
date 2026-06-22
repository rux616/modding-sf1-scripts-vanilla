Scriptname RQ_Heal_01_Script extends RQScript

import Utility

Group Heal_Properties
    ActorValue property RQ_AV_Heal_01_Hook_Danger auto const mandatory
    ActorValue property RQ_AV_Heal_01_Hook_LeftBehind auto const mandatory
    ActorValue property RQ_AV_Heal_01_Hook_HelpUs auto const mandatory
    
    int property DangerLineCount = 3 auto const
    { The number of randomly selectable dialogue lines related to the Quest Giver's dangerous situation. }
    
    int property LeftBehindLineCount = 3 auto const
    { The number of randomly selectable dialogue lines related to the Quest Giver's circumstances leaving a person behind. }

    int property HelpUsLineCount = 3 auto const
    { The number of randomly selectable dialogue lines where the Quest Giver asks for help. }
endGroup

Group DPIERCE_TESTING
    RefCollectionAlias property Alias_Actors auto const mandatory
endGroup

function SetQuestHookDialogueAVs()
    debug.trace("**** Alias_Actors has a value, continuing!")
    ObjectReference questGiverRef = Alias_QuestGiver.GetRef()

    SetDialogueAV(RQ_AV_Heal_01_Hook_Danger, RandomInt(1, DangerLineCount))
    SetDialogueAV(RQ_AV_Heal_01_Hook_LeftBehind, RandomInt(1, LeftBehindLineCount))
    SetDialogueAV(RQ_AV_Heal_01_Hook_HelpUs, RandomInt(1, HelpUsLineCount))
endFunction
