Scriptname CF06CombatDetectionScript extends ObjectReference

Quest property CF06 auto Const
Location property LC0939Location auto const
Faction property RobotSecurityFaction auto Const
Faction property RobotJanitorFaction auto Const

bool stageIsSet = false
int stageToSet = 195

Event OnCellLoad()
    Actor player = Game.GetPlayer()

    RegisterForRemoteEvent(player, "OnKill")
EndEvent

Event OnCellDetach()
    if(!stageIsSet)
        UnregisterForKillEvents()
    endIf
EndEvent

Event Actor.OnKill(Actor akSender, ObjectReference akVictim)
    if(akSender.GetCurrentLocation() == LC0939Location)
        Actor victimActor = akVictim as Actor

        if(victimActor != NONE)
            bool victimIsInRobotSecurityFaction = victimActor.IsInFaction(RobotSecurityFaction)
            bool victimIsInRobotJanitorFaction = false ;;victimActor.IsInFaction(RobotJanitorFaction)

            if(!victimIsInRobotSecurityFaction && !victimIsInRobotJanitorFaction)
                SetCombatStage()
                UnregisterForKillEvents()
            endIf
        endIf
    endIf
EndEvent

function SetCombatStage()
    CF06.SetStage(stageToSet)

    stageIsSet = true
endFunction

function UnregisterForKillEvents()
    Actor player = Game.GetPlayer()

    UnregisterForRemoteEvent(player, "OnKill")
endFunction