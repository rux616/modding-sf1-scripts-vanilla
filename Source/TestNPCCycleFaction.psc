Scriptname TestNPCCycleFaction extends ObjectReference Const

int Property teamFactionToChange = 1 auto Const
{1. Red, 2. Blue}

FormList Property AllFactionFormList auto mandatory	const	
{Form List of FormLists, for complete list of factions}	


Event OnActivate(ObjectReference akActionRef)
    ObjectReference SpawnControllerFromLink = self.GetLinkedRef()
    if(SpawnControllerFromLink)
        ;Get the current faction for the Red Team
        FormList oldFactionList = (SpawnControllerFromLink as TestNPCArenaScript).GetFactionFormList(teamFactionToChange)
        
        ;Get the index of the current faction from the all factions list
        int currentIndex = AllFactionFormList.Find(oldFactionList as Form)

        ;Find the next faction in the allFactions list
        int newIndex = 0
        if(currentIndex >= 0)
            if(currentIndex != (AllFactionFormList.GetSize() -1))
                newIndex = currentIndex +1
            endif
            ;Get the faction from all factions list at the new index
            FormList newFactionList = (AllFactionFormList.GetAt(newIndex) as FormList)

            ;Set the faction for the team.
            (SpawnControllerFromLink as TestNPCArenaScript).SetFactionToSpawn(newFactionList, teamFactionToChange)
        else
            ;Warning No Form found in AllFactionsList 
        endif   
    endif
EndEvent

