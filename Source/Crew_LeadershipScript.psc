Scriptname Crew_LeadershipScript extends Actor Const
{Attach this script to any actor with the Cew_Leadership perk}

ActorValue property CrewSlotCost auto const mandatory
{ will be set to CrewSlotCostValue on this actor OnInit }

int property CrewSlotCostValue = -1 auto Const

Event OnInit()
    ModValue(CrewSlotCost, CrewSlotCostValue)
EndEvent

