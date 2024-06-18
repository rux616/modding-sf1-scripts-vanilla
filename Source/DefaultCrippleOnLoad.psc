Scriptname DefaultCrippleOnLoad extends ObjectReference Const
{Cripples both left and right mobility of a reference OnLoad()}

Group Autofill_Properties
ActorValue Property LeftMobilityCondition Auto Const
ActorValue Property RightMobilityCondition Auto Const
ActorValue Property LeftAttackCondition Auto Const
ActorValue Property RightAttackCondition Auto Const
EndGroup

Group CrippleData
bool property LeftLeg = TRUE auto const
bool property RightLeg = TRUE auto const
bool property LeftArm= FALSE auto const
bool property RightArm = FALSE auto const
EndGroup

Event OnLoad()
	if LeftLeg
		self.DamageValue(LeftMobilityCondition, 100)
	endif
	if RightLeg
		self.DamageValue(RightMobilityCondition, 100)
	endif
	if LeftArm
		self.DamageValue(LeftAttackCondition, 100)
	endif
	if RightArm
		self.DamageValue(LeftAttackCondition, 100)
	endif
EndEvent