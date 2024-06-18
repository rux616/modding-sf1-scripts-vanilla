Scriptname FFConstantR02QuestScript extends Quest

LocationAlias Property FamilyLoc Mandatory Const Auto
Message[] Property FNameList Auto Const Mandatory
Message[] Property MNameList Auto Const Mandatory
ReferenceAlias Property Family Auto Const Mandatory
ReferenceAlias Property Slate Mandatory Const Auto
Book Property FFConstantR02_Slate Mandatory Const Auto
Int Property StartStage = 100 Const Auto

Struct CrimeFactionDatum
    Keyword SettlementCrimeFactionKeyword
    {The Crime Faction keyword used in the location where the family member can be found}
    
    Faction CrimeFaction
    {The corresponding Crime Faction for that Location}
EndStruct

CrimeFactionDatum[] property CrimeFactionData auto Const
{ Array of data for setting up crime factions for the family member }



;Finds which crime faction is associated with the location where the family member is, and assigns the local crime faction to them so they react appropriately to crime.
Function SetCrimeFaction()
    Location myFamilyLocation = FamilyLoc.GetLocation()
    Actor myFamily = Family.GetActorRef()

    Int i = 0
    Int iCount = CrimeFactionData.Length
    While i < iCount
        If myFamilyLocation.HasKeyword(CrimeFactionData[i].SettlementCrimeFactionKeyword)
            myFamily.SetCrimeFaction(CrimeFactionData[i].CrimeFaction)
            ;Stop checking once we find the right one
            i = iCount
        EndIf
        i += 1
    EndWhile
EndFunction



;Gets the gender of the Relative and Assigns a name from a list
Function SetRelativeName()
    ActorBase myActorBase = Family.GetActorRef().GetLeveledActorBase()
    Int iSex = myActorBase.GetSex()
    If iSex == 0
        SetMName()
    ElseIf iSex == 1
        SetFName()
    Else
        ;If the NPC is Non-binary, select a random name from either list
        Int iRandomSex = Utility.RandomInt(0,1)
        If iRandomSex == 0
            SetMName()
        ElseIf iRandomSex == 1
            SetFName()
        EndIf
    EndIf
    SetCrimeFaction()
EndFunction

;Set a name from the "Masculine" name list
Function SetMName() 
    ObjectReference myRelative = Family.GetRef()
    Message myName
    Int iRandom = Utility.RandomInt(0, MNameList.Length - 1)
    myName = MNameList[iRandom]
    myRelative.SetOverrideName(myName)
    CreateSlate(myName)
EndFunction

;Set a name from the "Feminine" name list
Function SetFName()
    ObjectReference myRelative = Family.GetRef()
    Message myName
    Int iRandom = Utility.RandomInt(0, FNameList.Length - 1)
    myName = FNameList[iRandom]
    myRelative.SetOverrideName(myName)
    CreateSlate(myName)
EndFunction


Function CreateSlate(Message amName)
    Game.GetPlayer().AddAliasedItem(FFConstantR02_Slate, Slate, 1, False)
    (Slate.GetRef()).AddTextReplacementData("myName", amName)
    SetStage(StartStage)
EndFunction

Function DebugObjective()
    SetObjectiveDisplayed(StartStage, true, true)
EndFunction


Event OnQuestInit()
    SetRelativeName()    
EndEvent