Scriptname RI_CrimeTrackingQuestScript extends Quest Conditional

GlobalVariable Property RI_TotalArrestCount Auto Const Mandatory
GlobalVariable Property RI_TotalBodyCount Auto Const Mandatory
GlobalVariable Property RI_TotalBountiesCount Auto Const Mandatory

; These globals are the % deducted from the designated quest reward global.
GlobalVariable Property RI_CreditsRewardDeductionSmall Auto Const Mandatory
GlobalVariable Property RI_CreditsRewardDeductionMedium Auto Const Mandatory
GlobalVariable Property RI_CreditsRewardDeductionLarge Auto Const Mandatory

; These are the total amount of crimes that designate which deduction to use.
GlobalVariable Property RI_CrimeCountSmall Auto Const Mandatory
GlobalVariable Property RI_CrimeCountMedium Auto Const Mandatory
GlobalVariable Property RI_CrimeCountLarge Auto Const Mandatory

; The quest reward global that the quest should use as a base to calculate off of.
GlobalVariable Property RewardGlobal Auto Const Mandatory

; The actual quest reward global. This is the global that will hold the 
; final credit reward amount.
GlobalVariable Property RI_CreditsReward Auto Mandatory

; If Masako is CEO. If False, no credits are deducted.
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const Mandatory

Int Property iCompletionStage Auto Const Mandatory

; Quest variables to track player crime during the quest in the location
; chosen by the quest.
; Values set via the RI_CrimeTrackingPlayerAliasScript on the Player alias.
Int Property iTimesArrested Auto Conditional
Int Property iBodyCount Auto Conditional
Int Property iBountiesGained Auto Conditional

Int Property iTheftArrest Auto Conditional
Int Property iAttemptedMurderArrest Auto Conditional
Int Property iMurderArrest Auto Conditional

; For Mission Board quests only
Function SetRewardValues()

    RI_CreditsReward.SetValue(RewardGlobal.GetValue())
    Debug.Trace(Self + "RI_CRIME: SetRewardValue function called. Starting Reward: " + RI_CreditsReward.GetValue())
EndFunction

Function AddFinalValues()

    Float fCurrentArrestTotal = RI_TotalArrestCount.GetValue()
    Float fCurrentBodyTotal = RI_TotalBodyCount.GetValue()
    Float fCurrentBountyTotal = RI_TotalBountiesCount.GetValue()

    Debug.Trace(Self + "RI_CRIME: AddFinalValues function called. Initial Values: RI_TotalArrestCount: " + RI_TotalArrestCount.GetValue() + " RI_TotalBodyCount: " + RI_TotalBodyCount.GetValue() + " RI_TotalBountiesCount: " + RI_TotalBountiesCount.GetValue())

    RI_TotalArrestCount.SetValue(fCurrentArrestTotal + iTimesArrested)
    RI_TotalBodyCount.SetValue(fCurrentBodyTotal + iBodyCount)
    RI_TotalBountiesCount.SetValue(fCurrentBountyTotal + iBountiesGained)

    Debug.Trace(Self + "RI_CRIME: AddFinalValues function called. Final Values: RI_TotalArrestCount: " + RI_TotalArrestCount.GetValue() + " RI_TotalBodyCount: " + RI_TotalBodyCount.GetValue() + " RI_TotalBountiesCount: " + RI_TotalBountiesCount.GetValue())

    CalculateRewards()

EndFunction

Function CalculateRewards()
Debug.Trace(Self + "RI_CRIME: CalculateRewards function called.")

    If RI08_MasakoRemainedCEO.GetValue() != 0
    Debug.Trace(Self + "RI_CRIME: Conditions pass for Masako remaining CEO - Calculate penalties.")
        Float fTotalOffenses = (iTimesArrested + iBodyCount + iBountiesGained)
        Debug.Trace(Self + "RI_CRIME: Total offenses: " + fTotalOffenses + " = Arrests: " + iTimesArrested + " + Bodies: " + iBodyCount + " + Bounties: " + iBountiesGained)
        Float fCurrentReward = RewardGlobal.GetValue()
        Float fCrimeCountSmall = RI_CrimeCountSmall.GetValue()
        Float fCrimeCountMedium = RI_CrimeCountMedium.GetValue()
        Float fCrimeCountLarge = RI_CrimeCountLarge.GetValue()


        If fTotalOffenses == 0
        Debug.Trace(Self + "RI_CRIME: No offenses passed.")
            RI_CreditsReward.SetValue(fCurrentReward)       
        ElseIf (fTotalOffenses >= fCrimeCountSmall) && (fTotalOffenses < fCrimeCountMedium)
        Debug.Trace(Self + "RI_CRIME: " + fTotalOffenses + " is greater than or equal to " + fCrimeCountSmall + " AND " + fTotalOffenses + " is less than " + fCrimeCountMedium)
            RI_CreditsReward.SetValue(fCurrentReward - (fCurrentReward * RI_CreditsRewardDeductionSmall.GetValue()))
        ElseIf (fTotalOffenses >= fCrimeCountMedium) && (fTotalOffenses < fCrimeCountLarge)
        Debug.Trace(Self + "RI_CRIME: " + fTotalOffenses + " is greater than or equal to " + fCrimeCountMedium + " AND " + fTotalOffenses + " is less than " + fCrimeCountLarge)
            RI_CreditsReward.SetValue(fCurrentReward - (fCurrentReward * RI_CreditsRewardDeductionMedium.GetValue()))    
        ElseIf fTotalOffenses >= fCrimeCountLarge
        Debug.Trace(Self + "RI_CRIME: " + fTotalOffenses + " is greater than or equal to " + fCrimeCountLarge)
            RI_CreditsReward.SetValue(fCurrentReward - (fCurrentReward * RI_CreditsRewardDeductionLarge.GetValue()))
        EndIf
    EndIf

    If RI08_MasakoRemainedCEO.GetValue() == 0
    Debug.Trace(Self + "RI_CRIME: Conditions pass for Ularu being CEO - No penalties.")
        RI_CreditsReward.SetValue(RewardGlobal.GetValue())
    EndIf

    Debug.Trace(Self + "RI_CRIME: Final Credits Reward: " + RI_CreditsReward.GetValue())

    SetStage(iCompletionStage)

EndFunction