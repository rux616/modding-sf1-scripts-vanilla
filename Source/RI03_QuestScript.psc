Scriptname RI03_QuestScript extends Quest

GlobalVariable Property RI03_SimonIntroCount Auto Const Mandatory

Function AddToSimonCount()

    Float fCurrentCount = RI03_SimonIntroCount.GetValue()

    RI03_SimonIntroCount.SetValue(fCurrentCount + 1)

EndFunction
