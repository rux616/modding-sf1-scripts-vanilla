Scriptname UC03_TextReplacementScript extends TerminalMenu Const

GlobalVariable Property UC03_JakobsDebtAmount Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_00 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_01 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_02 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_03 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_04 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_05 Auto Const Mandatory


Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)

    akTerminalRef.AddTextReplacementValue("CurrentDebt", UC03_JakobsDebtAmount.GetValueInt())
    akTerminalRef.AddTextReplacementValue("Debt00", UC03_JakobsDebtNewValue_00.GetValueInt())
    akTerminalRef.AddTextReplacementValue("Debt01", UC03_JakobsDebtNewValue_01.GetValueInt())
    akTerminalRef.AddTextReplacementValue("Debt02", UC03_JakobsDebtNewValue_02.GetValueInt())
    akTerminalRef.AddTextReplacementValue("Debt03", UC03_JakobsDebtNewValue_03.GetValueInt())
    akTerminalRef.AddTextReplacementValue("Debt04", UC03_JakobsDebtNewValue_04.GetValueInt())
    akTerminalRef.AddTextReplacementValue("Debt05", UC03_JakobsDebtNewValue_05.GetValueInt())

EndEvent