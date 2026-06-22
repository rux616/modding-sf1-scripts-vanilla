scriptname VendingMachineScript extends ObjectReference
{ Handles Vending Machine activation behavior. }

Group DefaultProperties
    int property minActivations = 4 auto const
    { The minimum number of times this vending machine can be activated. }

    int property maxActivations = 7 auto const
    { The maximum number of times this vending machine can be activated. }

    float property doubleVendChance = 1.0 auto const
    { The chance (0.0 - 100.0) of the machine giving you an extra item. }
endGroup

Group RequiredProperties
    LeveledItem property itemsToVend auto const mandatory
    { The list of items to vend. }

    GlobalVariable property cost auto const mandatory
    { The cost to despense an item. The cost is displayed in the Activator's activation display text. }

    WwiseEvent property WwiseEvent_VendingMachineActivate auto const mandatory
    { The sound to player when the vending machine successfully dispenses an item. }

    WwiseEvent property WwiseEvent_VendingMachineActivateError auto const mandatory
    { The sound to play if the player attempts to activate it after all of its items have been dispensed. }

    Message property notEnoughCreditsMessage auto const mandatory
    { The message notification to display if the player doesn't have enough credits. }

    ActorValue property VendingMachineResetGameTimeAV auto const mandatory
endGroup

Group OptionalProperties
    LeveledItem property rareItemsToVend auto const
    { An optional set of very rare items to vend. }

    float property rareItemChance = 0.0 auto const
    { The chance (0.0 - 100.0) of spawning a rare item, if rareItemsToVend is set. }

    int property daysUntilReset = 0 auto const
    { Optionally specify the days until this machine can begin vending again. By default, it stops vending until the cell is reset. }
endGroup

int usedActivations
int allowedActivations

;/
 / Functions
 /;
function ResetVendingMachine() private
    usedActivations = 0
    allowedActivations = Utility.RandomInt(minActivations, maxActivations)
endFunction

function TryToVendItem() private
    Actor playerRef = Game.GetPlayer()
    MiscObject credits = Game.GetCredits()
    int costValue = cost.GetValueInt()

    ; If the Player doesn't have enough money, display an error and return.
    if playerRef.GetItemCount(credits) < costValue
        PlayErrorSound()
        notEnoughCreditsMessage.Show()
        return
    endif

    ; Take the Player's money and dispense the item
    playerRef.RemoveItem(credits, costValue)
    usedActivations += 1

    HandleVendingItem()
endFunction

function HandleVendingItem() private
    DispenseItem()

    ; Check if this machine will dispense a second item.
    bool doubleSuccess = Utility.RandomFloat(afMax = 100.0) <= doubleVendChance
    if doubleSuccess
        DispenseItem()
    endif
endFunction

function DispenseItem() private
    PlayDispenseSound()
    Game.GetPlayer().AddItem(GetItemToVend())
endFunction

LeveledItem function GetItemToVend() private
    if rareItemsToVend && rareItemChance > 0
        ; Roll for a rare result.

        bool rareSuccess = Utility.RandomFloat(afMax = 100.0) <= rareItemChance
        if rareSuccess
            ; Dispense a rare item!
           return rareItemsToVend
        else
            ; Dispense a normal item.    
            return itemsToVend
        endif
    else
        ; Dispense a normal item.    
        return itemsToVend
    endif
endFunction

function PlayErrorSound() private
    int s = WwiseEvent_VendingMachineActivateError.Play(self)
endFunction

function PlayDispenseSound() private
    bool s = WwiseEvent_VendingMachineActivate.PlayAndWait(self)
endFunction

;/
 / States
 /;
auto state Initial
    Event OnLoad()
        ResetVendingMachine()
        GoToState("Ready")
    endEvent
endState

state Ready
    Event OnActivate(ObjectReference akActivator)
        GoToState("Working")
        if akActivator == Game.GetPlayer()
            TryToVendItem()
        endif

        ; If we have spent all of our activations, prevent further activation.
        ; Otherwise, we are ready to be activated again.
        if usedActivations >= allowedActivations
            GoToState("SoldOut")
        else
            GoToState("Ready")
        endif
    endEvent
endState

state Working
    Event OnActivate(ObjectReference akActivator)
        ; Do nothing
    endEvent
endState

state SoldOut
    Event OnBeginState(string asOldState)
        if daysUntilReset > 0
            SetValue(VendingMachineResetGameTimeAV, Utility.GetCurrentGameTime() + daysUntilReset)
        Else
            GoToState("Done")
        endif
    EndEvent

    Event OnActivate(ObjectReference akActivator)
        PlayErrorSound()
    endEvent

    Event OnLoad()
        if Utility.GetCurrentGameTime() >= GetValue(VendingMachineResetGameTimeAV)
            ResetVendingMachine()
            GoToState("Ready")
        endif
    endEvent
endState

State Done
    Event OnActivate(ObjectReference akActivator)
        PlayErrorSound()
    endEvent
endState