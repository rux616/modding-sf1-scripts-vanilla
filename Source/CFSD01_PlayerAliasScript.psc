Scriptname CFSD01_PlayerAliasScript extends ReferenceAlias

Quest Property CFSD01 Auto Const Mandatory
Location Property LC082VigilanceLocation Mandatory Const Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if (akOldLoc == LC082VigilanceLocation)
    	(CFSD01 as CFSD01_QuestScript).JailCheck()
       debug.trace("Jail check done")
    EndIf
EndEvent