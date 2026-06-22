Scriptname COM_CoraBookGuard extends Quest

Group QuestProperties
	ReferenceAlias Property Cora Auto Const Mandatory
	Keyword Property BookKeyword Auto Const Mandatory
	Formlist Property BookFormList Auto Const Mandatory
	GlobalVariable Property CoraBookGlobal Auto Const Mandatory
	int Property XPperbook = 2 Auto Const Mandatory
	Scene Property CREW_EliteCrew_CoraCoe_GiveBooks Auto Const Mandatory
EndGroup

Guard CoraGuardCount
Guard CoraGuardReward
int CoraStartingBookCount RequiresGuard(CoraGuardCount)
int CoraEndingBookCount RequiresGuard(CoraGuardReward)

Function CheckCountAndOpenMenu()
	ObjectReference CoraRef = Cora.GetRef()
	LockGuard CoraGuardCount
		CoraStartingBookCount = CoraRef.GetItemCount(BookKeyword)
	EndLockGuard
	CoraRef.OpenOneWayTransferMenu(true, BookFormList)
endFunction

Function CalculateReward()
  	LockGuard CoraGuardReward, CoraGuardCount
		ObjectReference CoraRef = Cora.GetRef()
		CoraEndingBookCount = CoraRef.GetItemCount(BookKeyword)
		int BooksAdded = CoraEndingBookCount - CoraStartingBookCount 
		if BooksAdded > 0
			;Cora was not given books, kill scene, otherwise provide XP and say thank you
    		int XPAdded = BooksAdded * XPperbook
    		Game.RewardPlayerXP(XPAdded, true) 
		else
   			CREW_EliteCrew_CoraCoe_GiveBooks.Stop()
		endif
	EndLockGuard
EndFunction