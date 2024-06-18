ScriptName REAssaultQuestScript extends Quest
{Script for REAssault aliases.}

; In Assault REs, Variable06 indicates attacker/defender (0=Defender, 1=Attacker). When all defenders are dead, any surviving attackers become the new 'defenders'.

;Attacker and Defender Aliases and Actor objects.
ReferenceAlias property Attacker01Links auto
ReferenceAlias property Attacker02Links auto
ReferenceAlias property Attacker03Links auto
ReferenceAlias property Attacker04Links auto
ReferenceAlias property Attacker05Links auto

ReferenceAlias property Defender01Links auto
ReferenceAlias property Defender02Links auto
ReferenceAlias property Defender03Links auto
ReferenceAlias property Defender04Links auto
ReferenceAlias property Defender05Links auto

Faction property REAssaultFactionFriend auto

ActorValue property REAssaultRole auto ;0=Defender, 1=Attacker, 2=Attackers during Attack Run

Actor Attacker01Act
Actor Attacker02Act
Actor Attacker03Act
Actor Attacker04Act
Actor Attacker05Act

Actor Defender01Act
Actor Defender02Act
Actor Defender03Act
Actor Defender04Act
Actor Defender05Act

;Has this assault been completed?
bool assaultComplete = False

;Called as part of the REAssault Stage 10 setup. Can optionally be called later to change the attack and defense radii.
Function InitAssault()
	Debug.Trace("Initializing assault.")

	;Safety check: Ignore calls to InitAssault once the assault has been completed (all attackers or defenders dead).
	if (assaultComplete)
		return
	EndIf

	;Store off actors.
	Attacker01Act = Attacker01Links.GetActorRef()
	Attacker02Act = Attacker02Links.GetActorRef()
	Attacker03Act = Attacker03Links.GetActorRef()
	Attacker04Act = Attacker04Links.GetActorRef()
	Attacker05Act = Attacker05Links.GetActorRef()
	Defender01Act = Defender01Links.GetActorRef()
	Defender02Act = Defender02Links.GetActorRef()
	Defender03Act = Defender03Links.GetActorRef()
	Defender04Act = Defender04Links.GetActorRef()
	Defender05Act = Defender05Links.GetActorRef()

	;Initialize attackers.
	if (Attacker01Act != None)
		debug.trace(self + " setting to assault role " + Attacker01Act)
		Attacker01Act.SetValue(REAssaultRole, 1)
		Attacker01Act.EvaluatePackage()
	EndIf
	if (Attacker02Act != None)
		debug.trace(self + " setting to assault role " + Attacker02Act)
		Attacker02Act.SetValue(REAssaultRole, 1)
		Attacker02Act.EvaluatePackage()
	EndIf
	if (Attacker03Act != None)
		debug.trace(self + " setting to assault role " + Attacker03Act)
		Attacker03Act.SetValue(REAssaultRole, 1)
		Attacker03Act.EvaluatePackage()
	EndIf
	if (Attacker04Act != None)
		debug.trace(self + " setting to assault role " + Attacker04Act)
		Attacker04Act.SetValue(REAssaultRole, 1)
		Attacker04Act.EvaluatePackage()
	EndIf
	if (Attacker05Act != None)
		debug.trace(self + " setting to assault role " + Attacker05Act)
		Attacker05Act.SetValue(REAssaultRole, 1)
		Attacker05Act.EvaluatePackage()
	EndIf

	;Initialize defenders.
	if (Defender01Act != None)
		Defender01Act.SetValue(REAssaultRole, 0)
		Defender01Act.EvaluatePackage()
	EndIf
	if (Defender02Act != None)
		Defender02Act.SetValue(REAssaultRole, 0)
		Defender02Act.EvaluatePackage()
	EndIf
	if (Defender03Act != None)
		Defender03Act.SetValue(REAssaultRole, 0)
		Defender03Act.EvaluatePackage()
	EndIf
	if (Defender04Act != None)
		Defender04Act.SetValue(REAssaultRole, 0)
		Defender04Act.EvaluatePackage()
	EndIf
	if (Defender05Act != None)
		Defender05Act.SetValue(REAssaultRole, 0)
		Defender05Act.EvaluatePackage()
	EndIf
EndFunction

;Called when the player moves in range of the trigger. Causes the attackers to begin their attack run.
Function StartAssault()
	Debug.Trace(self + "Starting assault.")

	;Remove friend faction from attackers and update their AV to start the attack run.
	if (Attacker01Act != None)
		debug.trace(self + " removing friend faction from " + Attacker01Act)
		Attacker01Act.SetValue(REAssaultRole, 2)
		Attacker01Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker01Act.EvaluatePackage()
	EndIf
	if (Attacker02Act != None)
		debug.trace(self + " removing friend faction from " + Attacker02Act)
		Attacker02Act.SetValue(REAssaultRole, 2)
		Attacker02Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker02Act.EvaluatePackage()
	EndIf
	if (Attacker03Act != None)
		debug.trace(self + " removing friend faction from " + Attacker03Act)
		Attacker03Act.SetValue(REAssaultRole, 2)
		Attacker03Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker03Act.EvaluatePackage()
	EndIf
	if (Attacker04Act != None)
		debug.trace(self + " removing friend faction from " + Attacker04Act)
		Attacker04Act.SetValue(REAssaultRole, 2)
		Attacker04Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker04Act.EvaluatePackage()
	EndIf
	if (Attacker05Act != None)
		debug.trace(self + " removing friend faction from " + Attacker05Act)
		Attacker05Act.SetValue(REAssaultRole, 2)
		Attacker05Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker05Act.EvaluatePackage()
	EndIf

	;Remove friend faction from defenders.
	if (Defender01Act != None)
		debug.trace(self + " removing friend faction from " + Defender01Act)
		Defender01Act.RemoveFromFaction(REAssaultFactionFriend)
		Defender01Act.EvaluatePackage()
	EndIf
	if (Defender02Act != None)
		debug.trace(self + " removing friend faction from " + Defender02Act)
		Defender02Act.RemoveFromFaction(REAssaultFactionFriend)
		Defender02Act.EvaluatePackage()
	EndIf
	if (Defender03Act != None)
		debug.trace(self + " removing friend faction from " + Defender03Act)
		Defender03Act.RemoveFromFaction(REAssaultFactionFriend)
		Defender03Act.EvaluatePackage()
	EndIf
	if (Defender04Act != None)
		debug.trace(self + " removing friend faction from " + Defender04Act)
		Defender04Act.RemoveFromFaction(REAssaultFactionFriend)
		Defender04Act.EvaluatePackage()
	EndIf
	if (Defender05Act != None)
		debug.trace(self + " removing friend faction from " + Defender05Act)
		Defender05Act.RemoveFromFaction(REAssaultFactionFriend)
		Defender05Act.EvaluatePackage()
	EndIf
EndFunction


;Called when all attackers or all defenders are dead. Records the assault as complete and switches the attackers to become the defenders (well, if they're alive).
Function CompleteAssault()
	Debug.Trace("Completing assault.")

	;Record the assault as complete.
	assaultComplete = True

	;Switch the attackers to become the defenders.
	if (Attacker01Act != None)
		Attacker01Act.SetValue(REAssaultRole, 0)
	EndIf
	if (Attacker02Act != None)
		Attacker02Act.SetValue(REAssaultRole, 0)
	EndIf
	if (Attacker03Act != None)
		Attacker03Act.SetValue(REAssaultRole, 0)
	EndIf
	if (Attacker04Act != None)
		Attacker04Act.SetValue(REAssaultRole, 0)
	EndIf
	if (Attacker05Act != None)
		Attacker05Act.SetValue(REAssaultRole, 0)
	EndIf

	Utility.Wait(0.5)

	if (Attacker01Act != None)
		Attacker01Act.EvaluatePackage()
	EndIf
	if (Attacker02Act != None)
		Attacker02Act.EvaluatePackage()
	EndIf
	if (Attacker03Act != None)
		Attacker03Act.EvaluatePackage()
	EndIf
	if (Attacker04Act != None)
		Attacker04Act.EvaluatePackage()
	EndIf
	if (Attacker05Act != None)
		Attacker05Act.EvaluatePackage()
	EndIf
EndFunction

Function CleanupAssault()
	Attacker01Act = None
	Attacker02Act = None
	Attacker03Act = None
	Attacker04Act = None
	Attacker05Act = None
	Defender01Act = None
	Defender02Act = None
	Defender03Act = None
	Defender04Act = None
	Defender05Act = None
EndFunction