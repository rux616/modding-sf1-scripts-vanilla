Scriptname MS06_EngineeringTerminalAliasScript extends ReferenceAlias

Int Property MenuItemTarget Mandatory Const Auto 
{REQUIRED: The ID of the terminal menu item.}

Int Property MenuItemTarget02 = -1 Const Auto 
{OPTIONAL: The ID of a second valid terminal menu item.}

TerminalMenu Property TargetTerminal Mandatory Const Auto 
{OPTIONAL: The specific terminal you want this to trigger on (used to check for subterminals).}

GlobalVariable Property RetrofitStatus Mandatory Const Auto
{REQUIRED: The Global Variable we need to assign a value to when the menu selection is made}

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    ;Check to see if the correct selection was made. Set the Global Variable to 1 for "complete", and check the status of all the Retrofit global variables, otherwise, set it to 0 for "incomplete"
    If (((MenuItemTarget == auiMenuItemID) || (MenuItemTarget02 == auiMenuItemID)) && TargetTerminal == akTerminalBase)
        Debug.Trace(self + "OnMenuItemRun: MenuItem=" + auiMenuItemID + " TargetTerminal=" + akTerminalBase)
        Quest myQuest = GetOwningQuest()
        MS06_QuestScript myQIScript = myQuest as MS06_QuestScript
        RetrofitStatus.SetValue(1)
        myQIScript.CheckEngineeringTerminalSettings()
    Else 
        RetrofitStatus.SetValue(0)
    EndIf
EndEvent