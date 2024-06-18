Scriptname TrapElectricalPanelScript extends ObjectReference

Group TrapElectricityDefaults
    Keyword Property TrapStartUnbrokenKeyword Mandatory Const Auto
    {If the trap has this keyword it will start inactive and will need to be damaged to start}
    Keyword Property TrapElectricityCanArcToKeyword Mandatory Const Auto
    {Keyword for object references that electricity will arc to}
    Keyword Property TrapRequiresPower Mandatory Const Auto
    {Keyword for object references that electricity will arc to}
    Keyword Property ActorTypeRobot Mandatory Const Auto
    {Keyword for robots, so electricity will arc to them}
    Keyword Property ActorTypeHuman Mandatory Const Auto
    {Keyword for humans, so electricity will arc to them}
    Keyword Property ActorTypeCreature Mandatory Const Auto
    {Keyword for humans, so electricity will arc to them}
    Keyword Property LinkCustom01 Mandatory Const Auto
    {Keyword for link to point where projectile comes out}
    float Property DamageToStartDestroyed = 1000.0 Const Auto
EndGroup

Group TrapElectricityArcData
    Spell Property ElectricitySpell Mandatory Const Auto
    {Spell Cast by trap at each interval}
    float Property fDistanceToArc = 12.0 Auto
    {Distance from arc start point that electricity will arc}
    float property arcMinTime = 1.9 auto Const
    {Minimum base time between strikes}
    float property arcMaxTime = 2.5 auto Const
    {Maximum base time between strikes}
EndGroup

Group TrapElectricityArcPanelSounds
    WwiseEvent Property WwiseEvent_OBJ_ElectricalPanel_Destroyed Mandatory Const Auto
    WwiseEvent Property WwiseEvent_State_Switches_PowerOff Mandatory Const Auto
    WwiseEvent Property WwiseEvent_State_Switches_PowerOn Mandatory Const Auto
EndGroup

auto State Inactive
    Event OnCellLoad()
        if !(GetLinkedRef().HasKeyword(TrapStartUnbrokenKeyword))
            DamageObject(DamageToStartDestroyed)
        endif
        WwiseEvent_State_Switches_PowerOn.Play(self)
    EndEvent

    Event OnPowerOn(ObjectReference akPowerGenerator)
        WwiseEvent_State_Switches_PowerOn.Play(self)
        if (IsDestroyed() && GetLinkedRef().HasKeyword(TrapRequiresPower))
            GotoState("Active")
        endif
    EndEvent

    Event OnDestroyed(ObjectReference akDestroyer)
        WwiseEvent_OBJ_ElectricalPanel_Destroyed.Play(self)
        if GetLinkedRef().HasKeyword(TrapRequiresPower)
            if(IsPowered())
                GotoState("Active")
            EndIf
        Else
            GotoState("Active")
        EndIf
    EndEvent
EndState

State Active
    Event OnBeginState(string asOldState)
        ArcElectricityToTarget(FindTarget())
        StartTimer(Utility.RandomFloat(ArcMinTime, ArcMaxTime))  
    EndEvent

    Event OnPowerOff()
        WwiseEvent_State_Switches_PowerOff.Play(self)
        if(GetLinkedRef().HasKeyword(TrapRequiresPower))
            GotoState("Inactive")
            CancelTimer()
        EndIf
    EndEvent

    Event OnTimer(int aiTimerID)
        Debug.Trace(self + "Timer Event")
        ArcElectricityToTarget(FindTarget())
        StartTimer(Utility.RandomFloat(ArcMinTime, ArcMaxTime))   
    EndEvent

    Event OnUnload()
        GotoState("Inactive")
    EndEvent
EndState

Function ArcElectricityToTarget(ObjectReference target)
    Debug.Trace(self + "Attacking: " + target)
    if(target)
        ElectricitySpell.Cast(GetLinkedRef(LinkCustom01), target)
    EndIf
EndFunction

ObjectReference Function FindTarget()
    ;Prioritize Robots, then living things, then inanimate targets
    ObjectReference ArcTarget = NONE
    ArcTarget = FindRobotTarget()
    if(ArcTarget == NONE)
        ArcTarget = FindHumanOrCreatureTarget()
    endif
    if(ArcTarget == NONE)
        ArcTarget = FindStaticArcTarget()
    EndIf
    Debug.Trace(self + "Found Target: " + ArcTarget)
    return ArcTarget
EndFunction

ObjectReference Function FindRobotTarget()
    {Get a list of robots in range, find the ones in LOS, get the closest one of those.}
    ObjectReference RobotTarget = ClosestTarget(TargetsInLOS(FindAllReferencesWithKeyword(ActorTypeRobot, fDistanceToArc)))
    return RobotTarget
EndFunction

ObjectReference Function FindHumanOrCreatureTarget()
{Get a list of creatures and humans in range, find the ones in LOS, get the closest one of those.}
    ObjectReference CreatureTarget = ClosestTarget(TargetsInLOS(FindAllReferencesWithKeyword(ActorTypeCreature, fDistanceToArc)))
    ObjectReference HumanTarget = ClosestTarget(TargetsInLOS(FindAllReferencesWithKeyword(ActorTypeHuman, fDistanceToArc)))
    ObjectReference target = None

    if(HumanTarget && CreatureTarget)
        if(GetDistance(HumanTarget) < GetDistance(CreatureTarget))
            target = HumanTarget
        Else
            target = CreatureTarget
        EndIf
    ElseIf(HumanTarget)
         target = HumanTarget
    ElseIf(CreatureTarget)
        target = CreatureTarget
    EndIf
    return target
EndFunction   

ObjectReference Function FindStaticArcTarget()
    ;Choose at random each time. check LOS.
    ObjectReference[] ArcTargets = TargetsInLOS(FindAllReferencesWithKeyword(TrapElectricityCanArcToKeyword, fDistanceToArc))
    if(ArcTargets.Length > 0)
        ObjectReference ArcTarget = ArcTargets[Utility.RandomInt(0, ArcTargets.length -1)]
        return ArcTarget
    Else
        return None
    EndIf
EndFunction

ObjectReference[] Function TargetsInLOS(ObjectReference[] targets)
{Returns an array of all targets from the passed in array that are in Line Of Sight}
    if(targets.length > 0)
        ObjectReference[] TargetsInLOS = new ObjectReference[0]
        int i = 0
        while (i < targets.length)
            if(HasDirectLOS(targets[i]))
                TargetsInLOS.Add(targets[i])
            endif
            i = i + 1
        EndWhile
        return TargetsInLOS
    Else
        return None
    EndIf
EndFunction

ObjectReference Function ClosestTarget(ObjectReference[] targets)
{Returns the closest target from an array of targets}
    if(targets.length > 0)
        ObjectReference currentTarget = targets[0]
        float currentTargetDistance = GetDistance(currentTarget)
        int i = 1
        while (i < targets.length)
            float nextTargetDistance = GetDistance(targets[i])
            if(nextTargetDistance < currentTargetDistance)
                currentTarget = targets[i]
                currentTargetDistance = nextTargetDistance
            endif
            i = i + 1 
        EndWhile
        return currentTarget
    Else
        return None
    EndIf
EndFunction


