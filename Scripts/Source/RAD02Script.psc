Scriptname RAD02Script extends Quest Const

GlobalVariable Property RAD02_InterviewCount Auto Const Mandatory

Function StoryCheck()
    ; Increment the story counter
    RAD02_InterviewCount.Mod(1)

    ; If you've done all the interviews, then the quest can finally end
    if RAD02_InterviewCount.GetValue() >= 6
        SetStage(8000)
    endif
EndFunction