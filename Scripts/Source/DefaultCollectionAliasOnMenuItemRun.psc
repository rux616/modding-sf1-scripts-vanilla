Scriptname DefaultCollectionAliasOnMenuItemRun extends RefCollectionAlias Default
{Default script to set stages and/or send story events when terminal menu items run.)}

Group Required_Properties
	DefaultAliasOnMenuItemRun:MenuItemDatum[] Property MenuItemData Auto Const Mandatory
	{Array of stages to set when terminal menu items are run.}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnTerminalMenuItemRun(ObjectReference akSender, int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
	DefaultScriptFunctions.Trace(self, "OnTerminalMenuItemRun() akSender: " + akSender + ", auiMenuItemID: " + auiMenuItemID + ", akTerminalBase: " + akTerminalBase + ", akTerminalRef: " + akTerminalRef, ShowTraces)
	DefaultAliasOnMenuItemRun.HandleMenuItem(self, MenuItemData, auiMenuItemID, akTerminalBase, akTerminalRef, ShowTraces)
EndEvent

