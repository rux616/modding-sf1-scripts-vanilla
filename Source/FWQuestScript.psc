ScriptName FWQuestScript extends Quest
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

ReferenceAlias Property Attacker01 auto
ReferenceAlias Property Attacker02 auto
ReferenceAlias Property Attacker03 auto
ReferenceAlias Property Attacker04 auto
ReferenceAlias Property Attacker05 auto

ReferenceAlias Property Defender01 Auto
ReferenceAlias Property Defender02 Auto
ReferenceAlias Property Defender03 Auto
ReferenceAlias Property Defender04 Auto
ReferenceAlias Property Defender05 Auto

ReferenceAlias property Attacker01Marker auto
ReferenceAlias property Attacker02Marker auto
ReferenceAlias property Attacker03Marker auto
ReferenceAlias property Attacker04Marker auto
ReferenceAlias property Attacker05Marker auto

ReferenceAlias property Defender01Marker auto
ReferenceAlias property Defender02Marker auto
ReferenceAlias property Defender03Marker auto
ReferenceAlias property Defender04Marker auto
ReferenceAlias property Defender05Marker auto

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

ActorBase Property TestFWEncMinutemen Auto
ActorBase Property TestFWEncBoS Auto
ActorBase Property TestFWEncRR Auto
ActorBase Property TestFWEncInstitute Auto
ActorBase Property TestFWEncRaider Auto
ActorBase Property TestFWEncSuperMutant Auto
ActorBase Property TestFWEncGunner Auto

Keyword property FWOwner auto
{This tracks which faction own this location
0 = no one
1 = Minutemen
2 = Brotherhood of Steel
3 = Railroad
4 = Institute
5 = Raiders
6 = Supermutants
7 = Gunners}
Keyword property FWAttacker auto
{This tracks which faction is attacking this location
0 = no one
1 = Minutemen
2 = Brotherhood of Steel
3 = Railroad
4 = Institute
5 = Raiders
6 = Supermutants
7 = Gunners}

Float Property Attacker Auto Hidden
Float Property Defender Auto Hidden

LocationAlias Property MyLocation Auto

;Has this assault been completed?
bool assaultComplete = False

int Property _DefenderOverride = 0 auto
int Property _AttackerOverride = 0 auto

ActorValue Property FWIsAttacker auto

;Called as part of the REAssault Stage 10 setup. Can optionally be called later to change the attack and defense radii.
Function InitAssault()
	Debug.Trace("Initializing assault.")

	;Safety check: Ignore calls to InitAssault once the assault has been completed (all attackers or defenders dead).
	if (assaultComplete)
		return
	EndIf

	if _AttackerOverride >= 0 || _DefenderOverride >= 0 
		SetFactionOverrrides()
	endif

	SpawnDefenders()
	SpawnAttackers()	


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
		Attacker01Act.SetValue(FWIsAttacker, 1)
		Attacker01Act.EvaluatePackage()
	EndIf
	if (Attacker02Act != None)
		Attacker02Act.SetValue(FWIsAttacker, 1)
		Attacker02Act.EvaluatePackage()
	EndIf
	if (Attacker03Act != None)
		Attacker03Act.SetValue(FWIsAttacker, 1)
		Attacker03Act.EvaluatePackage()
	EndIf
	if (Attacker04Act != None)
		Attacker04Act.SetValue(FWIsAttacker, 1)
		Attacker04Act.EvaluatePackage()
	EndIf
	if (Attacker05Act != None)
		Attacker05Act.SetValue(FWIsAttacker, 1)
		Attacker05Act.EvaluatePackage()
	EndIf

	;Initialize defenders.
	if (Defender01Act != None)
		Defender01Act.SetValue(FWIsAttacker, 0)
		Defender01Act.EvaluatePackage()
	EndIf
	if (Defender02Act != None)
		Defender02Act.SetValue(FWIsAttacker, 0)
		Defender02Act.EvaluatePackage()
	EndIf
	if (Defender03Act != None)
		Defender03Act.SetValue(FWIsAttacker, 0)
		Defender03Act.EvaluatePackage()
	EndIf
	if (Defender04Act != None)
		Defender04Act.SetValue(FWIsAttacker, 0)
		Defender04Act.EvaluatePackage()
	EndIf
	if (Defender05Act != None)
		Defender05Act.SetValue(FWIsAttacker, 0)
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
		Attacker01Act.SetValue(FWIsAttacker, 0)
	EndIf
	if (Attacker02Act != None)
		Attacker02Act.SetValue(FWIsAttacker, 0)
	EndIf
	if (Attacker03Act != None)
		Attacker03Act.SetValue(FWIsAttacker, 0)
	EndIf
	if (Attacker04Act != None)
		Attacker04Act.SetValue(FWIsAttacker, 0)
	EndIf
	if (Attacker05Act != None)
		Attacker05Act.SetValue(FWIsAttacker, 0)
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

Function SpawnDefenders()
	if (MyLocation.getLocation()).GetKeywordData(FWOwner) != 0
		Defender = (MyLocation.getLocation()).GetKeywordData(FWOwner)
	else
		Defender = utility.RandomInt (1, 4)
	endif

	Debug.Trace("Defender = " + Defender)

	ActorBase DefenderBase
	DefenderBase = SetupFactionActorBase(Defender)
	;/If Defender == 1.0
		DefenderBase = TestFWEncMinutemen
	elseif Defender == 2.0
		DefenderBase = TestFWEncBoS
	elseif Defender == 3.0
		DefenderBase = TestFWEncRR
	elseif Defender == 4.0
		DefenderBase = TestFWEncInstitute
	elseif Defender == 5.0
		DefenderBase = TestFWEncRaider
	elseif Defender == 6.0
		DefenderBase = TestFWEncSuperMutant
	elseif Defender == 7.0
		DefenderBase = TestFWEncGunner
	endif/;

	int numToSpawn = 5
	
	Defender01.ForceRefTo(Defender01Marker.GetReference().PlaceActorAtMe(DefenderBase, 0))
	Defender02.ForceRefTo(Defender02Marker.GetReference().PlaceActorAtMe(DefenderBase, 0))
	Defender03.ForceRefTo(Defender03Marker.GetReference().PlaceActorAtMe(DefenderBase, 0))
	Defender04.ForceRefTo(Defender04Marker.GetReference().PlaceActorAtMe(DefenderBase, 0))
	Defender05.ForceRefTo(Defender05Marker.GetReference().PlaceActorAtMe(DefenderBase, 0))

EndFunction

Function SpawnAttackers()
	if (MyLocation.getLocation()).GetKeywordData(FWAttacker) != 0
		Attacker = (MyLocation.getLocation()).GetKeywordData(FWAttacker)
	else
		Attacker = utility.RandomInt (1, 4)

		;if the attacker is the same as the defender roll till it isn't
		while Attacker == Defender
			Attacker = utility.RandomInt (1, 4)
		endwhile
		Debug.Trace("Attacker = " + Attacker)
	endif

	ActorBase AttackerBase
	AttackerBase = SetupFactionActorBase(Attacker)

	Attacker01.ForceRefTo(Attacker01Marker.GetReference().PlaceActorAtMe(AttackerBase, 0))
	Attacker02.ForceRefTo(Attacker02Marker.GetReference().PlaceActorAtMe(AttackerBase, 0))
	Attacker03.ForceRefTo(Attacker03Marker.GetReference().PlaceActorAtMe(AttackerBase, 0))
	Attacker04.ForceRefTo(Attacker04Marker.GetReference().PlaceActorAtMe(AttackerBase, 0))
	Attacker05.ForceRefTo(Attacker05Marker.GetReference().PlaceActorAtMe(AttackerBase, 0))

EndFunction

ActorBase Function SetupFactionActorBase(Float FactionNumber)
	If FactionNumber == 1.0
		Return TestFWEncMinutemen
	elseif FactionNumber == 2.0
		Return TestFWEncBoS
	elseif FactionNumber == 3.0
		Return TestFWEncRR
	elseif FactionNumber == 4.0
		Return TestFWEncInstitute
	elseif FactionNumber == 5.0
		Return TestFWEncRaider
	elseif FactionNumber == 6.0
		Return TestFWEncSuperMutant
	elseif FactionNumber == 7.0
		Return TestFWEncGunner
	endif
EndFunction

Function SetFactionOverrrides()
	if _AttackerOverride >= 0
		MyLocation.getLocation().SetKeywordData(FWAttacker, _AttackerOverride)
	endif
	if _DefenderOverride >= 0 
		MyLocation.getLocation().SetKeywordData(FWOwner, _DefenderOverride)
	endif
EndFunction