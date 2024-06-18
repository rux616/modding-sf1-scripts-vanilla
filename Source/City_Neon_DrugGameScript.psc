Scriptname City_Neon_DrugGameScript extends Quest

City_Neon_Drug02_Script Property City_Neon_Drug02 Auto Const Mandatory
City_Neon_Drug03_Script Property City_Neon_Drug03 Auto Const Mandatory

ReferenceAlias Property Alias_IngredientHopper Auto Const Mandatory
ReferenceAlias Property Alias_AssemblyHopper Auto Const Mandatory
ReferenceAlias Property Alias_ConveyorBelt Auto Const Mandatory

GlobalVariable Property Neon_Drug_ManufactureCount Auto Const Mandatory
{ track current round }

GlobalVariable Property Neon_Drug_RetryCount Auto Const Mandatory
{ track number of retries }

Scene Property City_Neon_Drug_Game_120_Aurora01 Auto Const Mandatory
{ scene that tracks game progress }

Scene Property City_Neon_Drug_Game_Drug03_GameOVer Auto Const Mandatory

Message Property Neon_Drug_07_ShiftFailed Auto Const Mandatory

struct HopperItem
    MiscObject hopperIngredient
    int countGiven = 0
    int countNeeded = 0
endStruct

HopperItem[] Property HopperItems Auto Const Mandatory

struct RewardItem
    Message rewardMessage
    GlobalVariable rewardCredits
endStruct

RewardItem[] property Rewards auto const mandatory
{ array of reward levels, ordered from worst (0) to best }

MiscObject Property Credits Auto Const Mandatory

group stages
    int property StageRoundStart = 100 auto const 
    int property StageUsedHalfTime = 190 auto const 
    int property StageUsedAllTime = 200 auto const 
    int property StageUsedWrongIngredients = 280 auto Const
    { stage to set if player took the wrong ingredients from the hopper }

    int property StageRoundFail = 325 auto Const
    { stage to set if player failed completely - didn't deliver drug to assembly container }

    int property StageRoundFinish = 300 auto const 
    int property StageGameComplete = 400 auto const 
    { stage set when game is complete, whether or not player succeeded or not }

    int property City_Neon_Drug02_FinalRoundSuccessStage = 450 auto const 
    { stage to set on City_Neon_Drug02 when player succeeds in the final round }

    int property City_Neon_Drug02_FinishGameStage = 460 auto const 
    { stage to set on City_Neon_Drug02 when player finishes game }


    int property City_Neon_Drug03_FinalRoundSuccessStage = 200 auto const 
    { stage to set on City_Neon_Drug02 when player succeeds in the final round }

    int property City_Neon_Drug03_FinishGameStage = 210 auto const 
    { stage to set on City_Neon_Drug03 when player finishes game }
endGroup

group objectives 
    int property City_Neon_Drug02_ObjectiveRound1 = 440 auto const 
    int property City_Neon_Drug02_ObjectiveRound2 = 445 auto const 
    int property City_Neon_Drug02_ObjectiveRound3 = 450 auto const 

    int property City_Neon_Drug03_ObjectiveRound1 = 150 auto const 
    int property City_Neon_Drug03_ObjectiveRound2 = 155 auto const 
    int property City_Neon_Drug03_ObjectiveRound3 = 160 auto const 

endGroup

bool playerSucceeded = false ; set to true when player is rewarded for succeeding

bool playerAllowedRefill = false

int maxRefills = 2 ; set in OnQuestStarted based on which quest is running

Event OnQuestStarted()
    ; initialize game
    int currentRetryCount = Neon_Drug_RetryCount.GetValueInt()
    if City_Neon_Drug02.IsRunning()
        maxRefills = City_Neon_Drug02.maxRefills
    Else
        maxRefills = City_Neon_Drug03.maxRefills
    EndIf

    debug.trace(self + "OnQuestStarted: maxRefills=" + maxRefills + "currentRetryCount=" + currentRetryCount)
    if currentRetryCount < maxRefills
        playerAllowedRefill = true
    Else
        debug.trace(self + "  player out of refills - don't refill hopper")
    endif

    Alias_AssemblyHopper.GetRef().RemoveAllItems()

    ; Set up the round of manufacturing the player's on
    debug.trace(self + " Neon_Drug_ManufactureCount=" + Neon_Drug_ManufactureCount.GetValue())

    ; Add the right items to the hopper, if player hasn't run out of refills
    if playerAllowedRefill
        ; only clear hopper if player is getting a refill - otherwise they can use whatever remained from last round
        Alias_IngredientHopper.GetRef().RemoveAllItems()
        debug.trace(self + " refill hopper")
        ObjectReference hopperRef = Alias_IngredientHopper.GetRef()
        int i = 0
        while i < HopperItems.Length
            HopperItem theHopperItem = HopperItems[i]
            debug.trace(self + "   i=" + i + ": theHopperItem=" + theHopperItem)
            hopperRef.AddItem(theHopperItem.hopperIngredient, theHopperItem.countGiven)
            i += 1
        EndWhile
    EndIf

    SetStage(StageRoundStart)

    ; start the scene
    City_Neon_Drug_Game_120_Aurora01.Start()
EndEvent

Function ValidateItemsUsed()
    debug.trace(self + " ValidateItemsUsed START")
    debug.trace(self + "    Neon_Drug_ManufactureCount=" + Neon_Drug_ManufactureCount.GetValue())

    int manufactureCount = Neon_Drug_ManufactureCount.GetValueInt()

    ; check how many ingredients the player took from the hopper
    ObjectReference hopperRef = Alias_IngredientHopper.GetRef()

    ; End the running scene
    City_Neon_Drug_Game_120_Aurora01.Stop()

    debug.trace(self + " check if player took more ingredients than needed")

    int i = 0
    while i < HopperItems.Length && GetStageDone(StageUsedWrongIngredients) == false
        HopperItem theHopperItem = HopperItems[i]
        ; is more gone than is needed?
        int amountInHopper = hopperRef.GetItemCount(theHopperItem.hopperIngredient)
        int amountShouldBeLeft = theHopperItem.countGiven - theHopperItem.countNeeded
        debug.trace(self + "   i=" + i + ": amountInHopper=" + amountInHopper + " hopperItem=" + theHopperItem)
        if amountInHopper < amountShouldBeLeft
            debug.trace(self + "  player used wrong ingredients - set penalty stage " + StageUsedWrongIngredients)
            SetStage(StageUsedWrongIngredients)
        endif
        i += 1
    EndWhile

    SetStage(StageRoundFinish)
endFunction

; this function is only called if the player delivered the drug
function RewardPlayer()
    debug.trace(self + " RewardPlayer START")
    playerSucceeded = true

    ; Give the results
    int rewardIndex = 0

    if GetStageDone(StageUsedAllTime) || Neon_Drug_RetryCount.GetValue() > 0
        ; player either took way too long (over 60 seconds), OR has failed at least one round completely; but still gets a reward for creating drug
        debug.trace(self + " RewardPlayer: took too long")
    elseif GetStageDone(StageUsedWrongIngredients)
        ; player took wrong number of ingredients
        debug.trace(self + " RewardPlayer: took wrong ingredients")
        rewardIndex = 1
    Else
        if GetStageDone(StageUsedHalfTime) == true
            ; Player hit 30 Second Mark, but took correct ingredients
            debug.trace(self + " RewardPlayer: took correct ingredients, more than 30 seconds")
            rewardIndex = 2
        Else
            ; If none of the stages were set - perfect score
            debug.trace(self + " RewardPlayer: perfect score")
            rewardIndex = 3
        endif
    endif
    debug.trace(self + " RewardPlayer: rewardIndex=" + rewardIndex)
    RewardItem theReward = Rewards[rewardIndex]
    ; show message, give reward
    theReward.rewardMessage.Show()
    Game.GetPlayer().AddItem(Credits, theReward.rewardCredits.GetValueInt())
    
    SetStage(StageGameComplete)
endFunction

function Cleanup()
    debug.trace(self + " Cleanup START")

    ; Conveyor Belt moves the container away
    Alias_ConveyorBelt.GetRef().PlayAnimation("play02")

    Utility.Wait(3.0)

    ; Remove drug from assembly hopper
    Alias_AssemblyHopper.GetRef().RemoveAllItems()

    ; Now see if the game is over?
    int manufactureCount = Neon_Drug_ManufactureCount.GetValueInt()

    if manufactureCount == 0
        ; First round
        if playerSucceeded
            if City_Neon_Drug02.IsRunning()
                City_Neon_Drug02.SetObjectiveCompleted(City_Neon_Drug02_ObjectiveRound1)
                City_Neon_Drug02.SetObjectiveDisplayed(City_Neon_Drug02_ObjectiveRound2)
            elseif City_Neon_Drug03.IsRunning()
                City_Neon_Drug03.SetObjectiveCompleted(City_Neon_Drug03_ObjectiveRound1)
                City_Neon_Drug03.SetObjectiveDisplayed(City_Neon_Drug03_ObjectiveRound2)
            endif
        endif
    elseif manufactureCount == 1
        ; second round
        if playerSucceeded
            if City_Neon_Drug02.IsRunning()
                City_Neon_Drug02.SetObjectiveCompleted(City_Neon_Drug02_ObjectiveRound2)
                City_Neon_Drug02.SetObjectiveDisplayed(City_Neon_Drug02_ObjectiveRound3)
            elseif City_Neon_Drug03.IsRunning()
                City_Neon_Drug03.SetObjectiveCompleted(City_Neon_Drug03_ObjectiveRound2)
                City_Neon_Drug03.SetObjectiveDisplayed(City_Neon_Drug03_ObjectiveRound3)
            endif
        endif
    else
        ; final round
        if playerSucceeded
            if City_Neon_Drug02.IsRunning()
                City_Neon_Drug02.SetStage(City_Neon_Drug02_FinalRoundSuccessStage)
            elseif City_Neon_Drug03.IsRunning()
                City_Neon_Drug_Game_Drug03_GameOver.Start()  ; Shift is over
                Utility.Wait(5)
                City_Neon_Drug03.SetStage(City_Neon_Drug03_FinalRoundSuccessStage)
            endif
        endif
    endif

    if playerSucceeded
        Neon_Drug_ManufactureCount.Mod(1.0) ; increment to next round (rounds are 0-2)
        ; reset retry count
        Neon_Drug_RetryCount.SetValue(0.0)
    Else
        ; replay round
        Neon_Drug_RetryCount.Mod(1.0) ; increment retry count
        Utility.Wait(3)
        Neon_Drug_07_ShiftFailed.Show()
    EndIf

    ; get current status
    manufactureCount = Neon_Drug_ManufactureCount.GetValueInt()
    if manufactureCount < 3
        ; play another round
        debug.trace(self + " start round " + manufactureCount)
        if City_Neon_Drug02.IsRunning()
            City_Neon_Drug02.ReplayGame()
        elseif City_Neon_Drug03.IsRunning()
            City_Neon_Drug03.ReplayGame()
        endif
    Else
        ; Check to see if Robbie needs to show up
        debug.trace(self + " game finished - set finish game stage on master quest")
        if City_Neon_Drug02.IsRunning()
            City_Neon_Drug02.SetStage(City_Neon_Drug02_FinishGameStage)
        elseif City_Neon_Drug03.IsRunning()
            City_Neon_Drug03.SetStage(City_Neon_Drug03_FinishGameStage)
        endif

        ; all done - completed all 3 rounds
        ; reset round count for next quest
        Neon_Drug_ManufactureCount.SetValue(0.0)
        ; game over - stop
        Stop()
    endif
EndFunction