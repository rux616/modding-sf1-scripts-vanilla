Scriptname SFBGS00D:ActionFigureAchievementScript extends Quest
{Helps track action figures and associated actor values for achievement purposes.}

struct ActionFigureAV
    MiscObject figure
    ActorValue value
EndStruct

;Properties
ActionFigureAV[] Property ActionFigures Auto Const Mandatory
{Struct that holds action figure MiscObjects and their associated ActorValues}
ActorValue Property CWAH_AchievementCount Mandatory Auto
{Actor value used to track how many unique action figures the player has picked up.}

ActorValue Function GetAVForFigure(MiscObject aFigure)
    int index = ActionFigures.FindStruct("Figure", aFigure)
    if index < 0
        return None
    else
        return ActionFigures[index].value
    endIf
    endFunction