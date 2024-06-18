Scriptname TestNPCRandomTeams extends ObjectReference Const

ObjectReference Property SpawnController auto const
{Either fill this with the spawn controller, or use a default linkedRef to the spawn controller}

bool Property instantSpawn = false auto const
{If true, will randomize and spawn NPCs with a single activation}

bool Property onlyRedTeam = false auto const

int Property teamSizeMinimum = -1 auto const

int Property teamSizeMaximum = -1 auto const

Event OnActivate(ObjectReference akActionRef)
    ObjectReference SpawnControllerFromLink = self.GetLinkedRef()
    if(SpawnControllerFromLink)
        if(teamSizeMaximum > -1 && teamSizeMinimum > -1)
            (SpawnControllerFromLink as TestNPCArenaScript).SetRandomTeams(instantSpawn, onlyRedTeam, self, teamSizeMinimum, teamSizeMaximum)
        else
            (SpawnControllerFromLink as TestNPCArenaScript).SetRandomTeams(instantSpawn, onlyRedTeam, self)
        endif
    elseif(SpawnController)
        (SpawnController as TestNPCArenaScript).SetRandomTeams(instantSpawn, onlyRedTeam, self)
    endif
EndEvent