Scriptname SkillChallenges_5Ranks extends ReferenceAlias

ActorValue Property SkillActorValue Auto Const
ReferenceAlias Property PlayerRef Auto Const

Float Property Rank_1_Goal Auto Const
Float Property Rank_2_Goal Auto Const
Float Property Rank_3_Goal Auto Const
Float Property Rank_4_Goal Auto Const


Event OnKill(ObjectReference akVictim)
	if GetOwningQuest().GetStage() == 100
		
	elseif GetOwningQuest().GetStage() == 200

	elseif GetOwningQuest().GetStage() == 300

	elseif GetOwningQuest().GetStage() == 400

	endif
EndEvent


