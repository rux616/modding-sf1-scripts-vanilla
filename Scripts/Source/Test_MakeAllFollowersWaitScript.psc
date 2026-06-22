Scriptname Test_MakeAllFollowersWaitScript extends ObjectReference Const

SQ_FollowersScript Property SQ_Followers Mandatory Const Auto

Event OnActivate(ObjectReference akActionRef)
	SQ_Followers.AllFollowersWait(GetLinkedRef())
EndEvent