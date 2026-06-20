Scriptname SFBGS00D:AddPerkOnPickupScript extends ObjectReference
{Script added to action figure MiscObject that adds a perk when the action figure is added to the player's inventory, and counts them for achievements.}

;Properties
Group PlayerPickupProperties
    Perk Property PerkToAdd Mandatory Const Auto
    Message Property PickupMessage Mandatory Const Auto
    WwiseEvent Property SFBGS00D_WwiseEvent_ITM_ActionFigure_Find Mandatory Const Auto
EndGroup

Group AchievementProperties
    Form Property FigureForm Mandatory Const Auto
    {The action figure MiscObject this script is attached to.}
    ActionFigureAchievementScript Property actionFigureAchievementScript Auto
    {The quest that has the ActionFigureAchievementScript, which holds the action figure and actor values as a struct}
    
EndGroup
;number of sealed and unsealed figures
int MaxFigureCount = 54

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    Actor player = Game.GetPlayer()
    If (akNewContainer == Game.GetPlayer())
        If (player.HasPerk(PerkToAdd) == false)
            int instance1 = SFBGS00D_WwiseEvent_ITM_ActionFigure_Find.Play(game.GetPlayer())
            player.AddPerk(PerkToAdd)
            PickupMessage.Show()
        EndIf
        AchievementCheck()
    EndIf
EndEvent

Function AchievementCheck()
    Actor player = Game.GetPlayer()
        ;The index of the figure in the AllFigures form lists
        ActorValue figureAV = actionFigureAchievementScript.GetAVForFigure(FigureForm As MiscObject)
        If (player.GetValueInt(figureAV) < 1)
            player.SetValue(figureAV, 1)
            ;add 1 to CWAH_AchievementCount value on player when new figure picked up
            player.SetValue(actionFigureAchievementScript.CWAH_AchievementCount, player.GetValueInt(actionFigureAchievementScript.CWAH_AchievementCount) + 1)
         EndIf
    If (player.GetValueInt(actionFigureAchievementScript.CWAH_AchievementCount) >= MaxFigureCount)
        Game.AddAchievement(77)
        Debug.Trace("They're Not Toys: Achievement Unlocked")
    EndIf
EndFunction