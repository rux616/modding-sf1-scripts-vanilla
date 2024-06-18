Scriptname RMDisplayLeaderboardScript extends ObjectReference Const
{Show the selected message when this REFERENCE is activated.}

Group Message_Properties
	Message Property RM_Display_LeaderboardOver5thMSG Auto Const Mandatory
	{The message to show when activated if the player hasn't placed on the board.}
    Message Property RM_Display_Leaderboard5thMSG Auto Const Mandatory
	{The message to show when activated if the player is in 5th place.}
    Message Property RM_Display_Leaderboard4thMSG Auto Const Mandatory
	{The message to show when activated if the player is in 4th place.}
    Message Property RM_Display_Leaderboard3rdMSG Auto Const Mandatory
	{The message to show when activated if the player is in 3rd place.}
    Message Property RM_Display_Leaderboard2ndMSG Auto Const Mandatory
	{The message to show when activated if the player is in 2nd place.}
    Message Property RM_Display_Leaderboard1stMSG Auto Const Mandatory
	{The message to show when activated if the player is in 1st place.}
EndGroup

Group Other_Properties
    GlobalVariable Property PlayerCompletedRedMile Mandatory Const Auto
    {Global for the number of times the player has completed the Red Mile}
    GlobalVariable Property RM_Record_5thPlace Mandatory Const Auto
    GlobalVariable Property RM_Record_4thPlace Mandatory Const Auto
    GlobalVariable Property RM_Record_3rdPlace Mandatory Const Auto
    GlobalVariable Property RM_Record_2ndPlace Mandatory Const Auto
    GlobalVariable Property RM_DonovanRecord Mandatory Const Auto
EndGroup

Event OnActivate(ObjectReference akActionRef)
    Float fCompletedValue = PlayerCompletedRedMile.GetValue()
    Float f5Value = RM_Record_5thPlace.GetValue()
    Float f4Value = RM_Record_4thPlace.GetValue()
    Float f3Value = RM_Record_3rdPlace.GetValue()
    Float f2Value = RM_Record_2ndPlace.GetValue()
    Float f1Value = RM_DonovanRecord.GetValue()
    If fCompletedValue <= f5Value
        RM_Display_LeaderboardOver5thMSG.Show()
    ElseIf fCompletedValue > f5Value && fCompletedValue <= f4Value
        RM_Display_Leaderboard5thMSG.Show()
    ElseIf fCompletedValue > f4Value && fCompletedValue <= f3Value
        RM_Display_Leaderboard4thMSG.Show()
    ElseIf fCompletedValue > f3Value && fCompletedValue <= f2Value
        RM_Display_Leaderboard3rdMSG.Show()
    ElseIf fCompletedValue > f2Value && fCompletedValue <= f1Value
        RM_Display_Leaderboard2ndMSG.Show()
    Else
        RM_Display_Leaderboard1stMSG.Show()
    EndIf
EndEvent