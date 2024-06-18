Scriptname CYDetonationHelperQuestScript extends Quest

GlobalVariable Property CY_DetonationCount Mandatory Const Auto
GlobalVariable Property CY_DetonationStartOfDay Mandatory Const Auto
GlobalVariable Property CY_DetonationEndOfDay Mandatory Const Auto
GlobalVariable Property CY_AnnouncementStartOfDay Mandatory Const Auto
GlobalVariable Property CY_AnnouncementEndOfDay Mandatory Const Auto
Quest Property DialogueCydonia_Detonation Mandatory Const Auto
Quest Property DialogueCydonia_Announcement Mandatory Const Auto
Quest Property DialogueCydonia Mandatory Const Auto
Keyword Property DialogueCydoniaDetonationQuestStartKeyword Mandatory Const Auto
Keyword Property DialogueCydoniaAnnouncementQuestStartKeyword Mandatory Const Auto
LocationAlias Property Cydonia Mandatory Const Auto
Int Property DetonationTimerID = 0 Const Auto
Float Property DetonationMinTimerLength = 300.0 Const Auto
Float Property DetonationMaxTimerLength = 900.0 Const Auto
Int Property AnnouncementTimerID = 1 Const Auto
Float Property AnnouncementMinTimerLength = 120.0 Const Auto
Float Property AnnouncementMaxTimerLength = 300.0 Const Auto
Int Property EstablishingSceneDoneStage = 15 Const Auto

Function StartDetonationTimer()
    Float fTimer = Utility.RandomFloat(DetonationMinTimerLength, DetonationMaxTimerLength)
    StartTimer(fTimer, DetonationTimerID)
EndFunction

Function StartAnnouncementTimer()
    Float fTimer = Utility.RandomFloat(AnnouncementMinTimerLength, AnnouncementMaxTimerLength)
    StartTimer(fTimer, AnnouncementTimerID)
EndFunction

;Before starting the detonation sequence, we want to make sure this occurs during the proper times, and not while another instance of the sequence is already running
;For example, after the last detonation call for the day, the quest will remain running for a time to prevent another last call.
Function StartDetonationSequence()
    ;If a General Announcement is running, wait a minute or two and try again.
    If DialogueCydonia_Announcement.IsRunning()
        Float fTimer = Utility.RandomFloat(60, 120)
        StartTimer(fTimer, DetonationTimerID)
    Else
        If CY_DetonationCount.GetValue() >= 1 && !DialogueCydonia_Detonation.IsRunning()
            If ( Game.GetLocalTime() >= CY_DetonationStartOfDay.GetValue() && Game.GetLocalTime() <= CY_DetonationEndOfDay.GetValue() )
                If Game.GetPlayer().IsInLocation(Cydonia.GetLocation())
                    DialogueCydoniaDetonationQuestStartKeyword.SendStoryEvent()
                EndIf
            EndIf
        EndIf
        StartDetonationTimer()
    EndIf
EndFunction


;Before starting the Announcement sequence, we want to make sure this occurs during the proper times, and not while another instance of the sequence is already running
Function StartAnnouncementSequence()
    ;If a Detonation is running, wait a minute or two and try again.
    If DialogueCydonia_Detonation.IsRunning()
        Float fTimer = Utility.RandomFloat(60, 120)
        StartTimer(fTimer, AnnouncementTimerID)
    Else
        If !DialogueCydonia_Announcement.IsRunning()
            If ( Game.GetLocalTime() >= CY_AnnouncementStartOfDay.GetValue() && Game.GetLocalTime() <= CY_AnnouncementEndOfDay.GetValue() )
                Actor myPlayer = Game.GetPlayer()
                If myPlayer.IsInLocation(Cydonia.GetLocation()) && myPlayer.IsInInterior()
                    DialogueCydoniaAnnouncementQuestStartKeyword.SendStoryEvent()
                EndIf
            EndIf
        EndIf
        StartAnnouncementTimer()
    EndIf
EndFunction


Event OnQuestInit()
    StartDetonationTimer()
    StartAnnouncementTimer()
EndEvent

Event OnTimer(int aiTimerID)
    If aiTimerID == DetonationTimerID
        StartDetonationSequence()
    ElseIf aiTimerID == AnnouncementTimerID
        If DialogueCydonia.GetStageDone(EstablishingSceneDoneStage)
            StartAnnouncementSequence()
        Else
            Float fTimer = Utility.RandomFloat(60, 120)
            StartTimer(fTimer, AnnouncementTimerID)
        EndIf
    EndIf
EndEvent