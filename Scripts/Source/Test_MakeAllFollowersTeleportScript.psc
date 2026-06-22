Scriptname Test_MakeAllFollowersTeleportScript extends ObjectReference 

SQ_FollowersScript Property SQ_Followers Mandatory Const Auto
bool Property SkipWaitingFollowersObjective = false Auto
bool Property IncludeWaitingFollowers = true Auto

bool toggle


Event OnActivate(ObjectReference akActionRef)
	
	Actor[] teleportedFollowers

	if toggle == false
	;Teleport non-waiting followers, then make them wait
		teleportedFollowers = SQ_Followers.TeleportFollowers(GetLinkedRef(), IncludeFollowingFollowers = true, IncludeWaitingFollowers = IncludeWaitingFollowers, StartFollowingAfterTeleport = false, StartWaitingAfterTeleport = true, SkipWaitingFollowersObjective = SkipWaitingFollowersObjective)
		toggle = true

	elseif toggle == true
		;Teleport them back:
		SQ_Followers.TeleportFollowers(Game.GetPlayer(), teleportedFollowers)
		toggle = false

	endif
EndEvent