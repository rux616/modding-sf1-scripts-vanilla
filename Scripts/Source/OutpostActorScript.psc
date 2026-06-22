Scriptname OutpostActorScript extends Actor Const

bool property AssignAsCrewOnCreation = false auto Const
{ if true, actor will be assigned as crew when it is created }

ActorValue property CrewReassignDisabled auto const
{ optional - if exists, will be set on this actor when it is created }

ActorValue property CrewSlotCost auto const
{ optional - if exists, will be set to CrewSlotCostValue on this actor when it is created }

int property CrewSlotCostValue = -1 auto Const

bool property SetEssentialOnCreation = true auto Const
bool property SetNoBleedoutRecoveryOnCreation = true auto Const

Event OnWorkshopObjectPlaced(ObjectReference akReference)
    ObjectReference myWorkshop = GetWorkshop()

    SetEssential(SetEssentialOnCreation)
    SetNoBleedoutRecovery(SetNoBleedoutRecoveryOnCreation)
    if CrewReassignDisabled
        SetValue(CrewReassignDisabled, 1)
    endif
    if CrewSlotCost
        ModValue(CrewSlotCost, CrewSlotCostValue)
    endif

    CheckAssignAsCrew(myWorkshop, true)
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
    CheckAssignAsCrew(akReference, false)
EndEvent

function CheckAssignAsCrew(ObjectReference myWorkshop, bool bAssign)
    if AssignAsCrewOnCreation
        if myWorkshop
            debug.trace(self + " OnWorkshopObjectPlaced workshop=" + myWorkshop + " - assigning as crew=" + bAssign)
            if bAssign
                myWorkshop.AssignCrew(self)
            Else
                myWorkshop.UnassignCrew(self)
            EndIf
            debug.trace(self + "   workshop's current crew=" + myWorkshop.GetAllCrewMembers())
        endif
    endif
EndFunction

function testGetAllCrew()
    ObjectReference myWorkshop = GetWorkshop()
    if myWorkshop
        debug.trace(self + " testGetAllCrew: Ouworkshop's current crew=" + myWorkshop.GetAllCrewMembers())
    endif
endFunction
