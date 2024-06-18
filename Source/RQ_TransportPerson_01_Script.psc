Scriptname RQ_TransportPerson_01_Script extends RQ_TransportPersonScript

Group TransportPerson_Properties
    ActorValue property RQ_AV_TransportPerson_01_HabitatProblem auto const mandatory
    ActorValue property RQ_AV_TransportPerson_01_ShipProblem auto const mandatory
    
    int property HabitatProblemLineCount = 8 auto const
    { The number of randomly selectable dialogue lines related to the Quest Giver's habitat problems. }
    
    int property ShipProblemLineCount = 8 auto const
    { The number of randomly selectable dialogue lines related to the Quest Giver's ship problems. }
endGroup

bool assignedAVs = false

function OnQuestGiverSet(ObjectReference akQuestGiver)
    if !assignedAVs
        assignedAVs = true

        akQuestGiver.SetValue(RQ_AV_TransportPerson_01_HabitatProblem, Utility.RandomInt(0, HabitatProblemLineCount - 1))
        akQuestGiver.SetValue(RQ_AV_TransportPerson_01_ShipProblem, Utility.RandomInt(0, ShipProblemLineCount - 1))
    endif
endFunction
