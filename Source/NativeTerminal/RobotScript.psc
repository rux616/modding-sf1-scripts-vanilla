Scriptname NativeTerminal:RobotScript extends TerminalMenu
{handles robots (and turrets) via native terminal}

Keyword property LinkTerminalRobot auto const mandatory
{ link that robots are linked to terminal with 
  NOTE: for turret terminal, use LinkTerminalTurret }

Group autofillProperties

    TerminalMenu property NativeTerminalRobotFriendSettings auto const mandatory
    { autofill }

    TerminalMenu property NativeTerminalRobotFrenzy auto const mandatory
    { autofill }

    ActorValue property Aggression auto const mandatory
    { autofill }

    SQ_ParentScript property SQ_Parent Auto Const Mandatory
    { autofill }

    ActorValue property NativeTerminalRobot_AnyRobotsActive auto const mandatory
    { autofill }

    ActorValue property NativeTerminalRobot_HasRobotPod auto const mandatory
    { autofill }

    ActorValue property NativeTerminalRobot_HasRobots auto const mandatory
    { autofill }

    ActorValue property NativeTerminalRobot_AnyRobotsAlive auto const mandatory
    { autofill }

    ActorValue property NativeTerminalRobot_AllRobotsFrenzied auto const mandatory
    { autofill }

    ActorValue property NativeTerminalRobot_AllRobotsTeammate auto const mandatory
    { autofill }

    Faction property NativeTerminalRobotAllyFaction auto const mandatory
    { autofill }
EndGroup

; enums
int property menuItemID_Activate01 = 1 auto const
int property menuItemID_Deactivate01 = 2 auto const
int property menuItemID_Ally01 = 1 auto const
int property menuItemID_Frenzy01 = 1 auto const

; script variables
bool anyRobotsActive = false  ; set to true if any robots are active
bool anyRobotsAlive = false  ; set to true if any robots are alive
bool hasRobotPod = false ; set to true if linked to any robot pods
bool hasRobots = false ; set to true if linked to any normal robots (non-pod)
bool allRobotsFrenzied = true  ; set to false if any robots are not frenzied
bool allRobotsTeammate = true  ; set to false if any robots are not teammates of player

; check linked refs to set up conditional actor values for what options the menu should show
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter " + akTerminalRef)
    UpdateAllTerminalVariables(akTerminalRef)
EndEvent

function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
    debug.trace(self + " UpdateAllTerminalVariables " + akTerminalRef)
    ; handle things linked either way
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalRobot)

    ; these will be set to true by UpdateTerminalVariablesForArray if any robots fall into these categories
    anyRobotsActive = false
    anyRobotsAlive = false
    hasRobotPod = false
    hasRobots = false
    allRobotsFrenzied = true ; set to false if any robot isn't frenzied
    allRobotsTeammate = true ; set to false if any robot isn't a teammate

    if linkedRefChain.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChain as Actor[])
    EndIf
    if linkedRefChildren.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChildren as Actor[])
    EndIf
    debug.trace(self + " actor values set:")
    debug.trace(self + "   NativeTerminalRobot_AnyRobotsActive: " + anyRobotsActive)
    debug.trace(self + "   NativeTerminalRobot_AnyRobotsAlive: " + anyRobotsAlive)
    debug.trace(self + "   NativeTerminalRobot_HasRobotPod: " + hasRobotPod)
    debug.trace(self + "   NativeTerminalRobot_HasRobots: " + hasRobots)
    debug.trace(self + "   NativeTerminalRobot_AllRobotsFrenzied: " + allRobotsFrenzied)
    debug.trace(self + "   NativeTerminalRobot_AllRobotsTeammate: " + allRobotsTeammate)

    akTerminalRef.SetValue(NativeTerminalRobot_AnyRobotsActive, anyRobotsActive as int)
    akTerminalRef.SetValue(NativeTerminalRobot_AnyRobotsAlive, anyRobotsAlive as int)
    akTerminalRef.SetValue(NativeTerminalRobot_HasRobotPod, hasRobotPod as int)
    akTerminalRef.SetValue(NativeTerminalRobot_HasRobots, hasRobots as int)
    akTerminalRef.SetValue(NativeTerminalRobot_AllRobotsFrenzied, allRobotsFrenzied as int)
    akTerminalRef.SetValue(NativeTerminalRobot_AllRobotsTeammate, allRobotsTeammate as int)

endFunction

function UpdateTerminalVariablesForArray(Actor[] actorArray)
    debug.trace(self + " UpdateTerminalVariablesForArray " + actorArray)
    int i = 0
    while i < actorArray.Length
        Actor theActor = actorArray[i]
        debug.trace(self + "  checking " + theActor)
        if theActor.IsDead() == false
            anyRobotsAlive = true
            debug.trace(self + "     ALIVE")
            RobotPodScript theRobotPodActor = actorArray[i] as RobotPodScript
            bool robotPod = (theRobotPodActor && theRobotPodActor.HasPod()) ; is this a robot with a pod?
            if robotPod
                hasRobotPod = true
                debug.trace(self + "     ROBOT POD")
            else
                hasRobots = true
                debug.trace(self + "     NORMAL ROBOT")
            endif
            if (robotPod == false && theActor.IsUnconscious() == false) || (robotPod && theRobotPodActor.isInPod == false)
                anyRobotsActive = true
                debug.trace(self + "     ACTIVE")
            endif
            if theActor.GetValue(Aggression) < 3
                allRobotsFrenzied = false
                debug.trace(self + "     NOT FRENZIED")
            endif
            if theActor.IsPlayerTeammate() == false
                allRobotsTeammate = false
                debug.trace(self + "     NOT TEAMMATE")
            endif
        endif
        i += 1
    EndWhile
EndFunction

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    ; handle things linked either way
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalRobot)
    if linkedRefChain.Length > 0
        HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChain as Actor[], akTerminalRef)
    EndIf
    if linkedRefChildren.Length > 0
        HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChildren as Actor[], akTerminalRef)
    EndIf
EndEvent

function HandleMenuItem(int auiMenuItemID, TerminalMenu akTerminalBase, Actor[] actorArray, ObjectReference akTerminalRef)
    debug.trace(self + " HandleMenuItem " + auiMenuItemID + " " + akTerminalBase + " " + actorArray)
    if akTerminalBase == self ; main menu
        if auiMenuItemID == menuItemID_Activate01
            int i = 0
            debug.trace(self + " activating actors")
            While i < actorArray.Length
                RobotPodScript theRobotPodActor = actorArray[i] as RobotPodScript
                if theRobotPodActor
                    theRobotPodActor.WakeRobotFromPod()
                else
                    actorArray[i].SetUnconscious(false)
                endif
                ; send custom event
                SQ_Parent.SendNativeTerminalActorUnconsciousEvent(akTerminalRef, actorArray[i], false)
                i += 1
            EndWhile
            ; update terminal variables
            UpdateAllTerminalVariables(akTerminalRef)
        elseif auiMenuItemID == menuItemID_Deactivate01
            debug.trace(self + " deactivating actors")
            int i = 0
            While i < actorArray.Length
                RobotPodScript theRobotPodActor = actorArray[i] as RobotPodScript
                if theRobotPodActor
                    theRobotPodActor.SendRobotToPod()
                else
                    actorArray[i].SetUnconscious(true)
                endif
                ; send custom event
                SQ_Parent.SendNativeTerminalActorUnconsciousEvent(akTerminalRef, actorArray[i], true)
                i += 1
            EndWhile
            ; update terminal variables
            UpdateAllTerminalVariables(akTerminalRef)
        EndIf
    elseif akTerminalBase == NativeTerminalRobotFriendSettings
        if auiMenuItemID == menuItemID_Ally01
            int i = 0
            debug.trace(self + " making actors allies")
            While i < actorArray.Length
                Actor theActor = actorArray[i]
                ; remove from factions
                theActor.RemoveFromAllFactions()
                ; make actor a teammate and ally
                theActor.SetPlayerTeammate(abTeammate = true, abCanDoFavor = false, abGivePlayerXP = false)
                theActor.AddToFaction(NativeTerminalRobotAllyFaction)
                ; stop combat
                theActor.StopCombat()
                ; send custom event
                SQ_Parent.SendNativeTerminalActorAllyEvent(akTerminalRef, actorArray[i])
                i += 1
            EndWhile
            ; update terminal variables
            UpdateAllTerminalVariables(akTerminalRef)
        EndIf
    elseif akTerminalBase == NativeTerminalRobotFrenzy
            debug.trace(self + " making actors frenzied")
        if auiMenuItemID == menuItemID_Frenzy01
            int i = 0
            While i < actorArray.Length
                actorArray[i].SetValue(Aggression, 3)
                ; send custom event
                SQ_Parent.SendNativeTerminalActorFrenzyEvent(akTerminalRef, actorArray[i])
                i += 1
            EndWhile
            ; update terminal variables
            UpdateAllTerminalVariables(akTerminalRef)
        EndIf
    endif
EndFunction