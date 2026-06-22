Scriptname TestNPCArenaAddScript extends ObjectReference Const
{Adds a specific NPC to one of the teams.}

ObjectReference Property ArenaController auto const Mandatory

int Property TypeToAdd auto const
{0. Assault, 1. Charger, 2. Heavy, 3. Officer, 4. Recruit, 5. Sniper, 6. Support}

int property TeamToAddTo auto const Mandatory
{1. Red Team, 2. Blue Team}

Event OnActivate(ObjectReference akActionRef)
    (ArenaController as TestNPCArenaScript).AddSpecificNPC(TypeToAdd, TeamToAddTo)
EndEvent