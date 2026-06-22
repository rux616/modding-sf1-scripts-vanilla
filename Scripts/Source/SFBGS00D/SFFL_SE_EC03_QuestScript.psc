Scriptname SFBGS00D:SFFL_SE_EC03_QuestScript extends Quest
{Quest script for SFFL_SE_EC03, sets Vendor Containers depending on Vendor Trust value}

ReferenceAlias Property BobbyContainer0 Auto Const Mandatory

ReferenceAlias Property BobbyContainer1 Auto Const Mandatory

ReferenceAlias Property BobbyContainer2 Auto Const Mandatory

ReferenceAlias Property BobbyContainer3 Auto Const Mandatory

ReferenceAlias Property BobbyContainer4 Auto Const Mandatory

ReferenceAlias Property FanishaContainer0 Auto Const Mandatory

ReferenceAlias Property FanishaContainer1 Auto Const Mandatory

ReferenceAlias Property FanishaContainer2 Auto Const Mandatory

ReferenceAlias Property FanishaContainer3 Auto Const Mandatory

ReferenceAlias Property FanishaContainer4 Auto Const Mandatory

ReferenceAlias Property Alias_Bobby Auto Const Mandatory

ReferenceAlias Property Alias_Fanisha Auto Const Mandatory

ActorValue Property VendorTrust Auto Conditional Mandatory

LeveledItem Property LL_VendorTrustThreshold Auto Const Mandatory

GlobalVariable Property VendorTrustIncreased Auto Const Mandatory

Int Property TotalCredits=0 Auto Conditional        ;This is used to calculate how much credits was spent by the player with Vendors
Int Property MaxVendorTrust=4 Auto Const            ;This sets the highest "Trust Level" a Vendor has with player, with a minimum value of 1
Int Property BaseCreditThreshold=1000 Auto Const   ;This is used to determine how much credits the player must spend with Vendors in order for the Trust Level to increase (up to the maximum value)
GlobalVariable Property TotalCreditsSpent Auto Conditional Mandatory

Event OnQuestInit()
    ;This Event may be removed if I don't need to keep it
    Debug.Trace("SFFL_SE_EC03: Total credits spent at current Trust Level: " + TotalCreditsSpent.GetValue())
EndEvent

Function CalculateInitialVendorCredits()
    ;This calculates Bobby and Fanisha's starting Credits (before purchases). It seems to start at zero on a first play, but we'll still retrieve the value just in case.
    Actor Bobby = Alias_Bobby.GetActorRef()
    Actor Fanisha = Alias_Fanisha.GetActorRef()
    TotalCredits = Bobby.GetGoldAmount() + Fanisha.GetGoldAmount() as int
EndFunction

Function CalculateFinalVendorCredits()
    Actor Bobby = Alias_Bobby.GetActorRef()
    Actor Fanisha = Alias_Fanisha.GetActorRef()
    int BobbyTrust = Bobby.GetValue(VendorTrust) as int

    if (!IsStageDone(360) && BobbyTrust < MaxVendorTrust)
        ;Figure out how much money players have given to Bobby and Fanisha this time and adjust total balance
        float TransactionAmount = Math.Max((Bobby.GetGoldAmount() + Fanisha.GetGoldAmount() - TotalCredits),0) as float
        ;Debug.Trace("SFFL_SE_EC03: Total transaction amount: " + TransactionAmount)
        float newTotalCreditsSpent = TotalCreditsSpent.Mod(TransactionAmount)

        ;Determine threshold for next Vendor Trust level
        int nextTrustLevelAt = (BobbyTrust + 1) * BaseCreditThreshold ; right now this is linear, but I may use a Leveled List to set a multiplier by player level
        ;Debug.Trace("Next Vendor Trust Level at " + nextTrustLevelAt + " credits spent.")
        if (newTotalCreditsSpent > nextTrustLevelAt)
            Bobby.ModValue(VendorTrust,1)
            ;Reset total credits spent
            TotalCreditsSpent.SetValue(0.0)
            Debug.Trace("SFFL_SE_EC03: Vendor Trust increased to " + Bobby.GetValue(VendorTrust))
            ;Set variable to tell player there are new wares next time they meet
            VendorTrustIncreased.SetValue(1.0)
        endif
        Debug.Trace("SFFL_SE_EC03: new Total Credits Spent: " + TotalCreditsSpent.GetValue())
    endif
EndFunction

Function SetContainers(int currentVendorTrust)
    if (currentVendorTrust > 0)
        BobbyContainer0.Clear()
        FanishaContainer0.Clear()
    endif

    if (currentVendorTrust != 1)
        BobbyContainer1.Clear()
        FanishaContainer1.Clear()
    endif

    if (currentVendorTrust != 2)
        BobbyContainer2.Clear()
        FanishaContainer2.Clear()
    endif

    if (currentVendorTrust != 3)
        BobbyContainer3.Clear()
        FanishaContainer3.Clear()
    endif

    if (currentVendorTrust < 4)
        BobbyContainer4.Clear()
        FanishaContainer4.Clear()
    endif
EndFunction
