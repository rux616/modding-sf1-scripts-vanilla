Scriptname LC012_VaultLockdown extends ObjectReference Const
{Lock Down the Vault in LC012 when activated.}

Keyword Property LinkCustom01 Const Auto
{Reference to the vault door}
Keyword Property LinkCustom02 Const Auto
{Reference to Guards who should have UseCombatTravel AV set to 1.}
Keyword Property LinkCustom03 Const Auto
{Link to collision volume to enable}
ActorValue Property UseCombatTravel Const Auto
{AV that the linked guards will check in their custom package}


Event OnActivate(ObjectReference akActionRef)
    ObjectReference LockDownDoor = GetLinkedRef()
    ObjectReference VaultDoor = GetLinkedRef(LinkCustom01)

    ;Enable Collision to prevent player from entering space between doors
    GetLinkedRef(LinkCustom03).Enable()

    ;Close the Doors
    LockDownDoor.SetLockLevel(254)
    LockDownDoor.SetOpen(false)
    VaultDoor.SetLockLevel(254)
    VaultDoor.SetOpen(false)
    
    ;Set the AV used by package on linked guards.
    ObjectReference[] Guards = GetLinkedRefChain(LinkCustom02)
    int i = 0
    while (i < Guards.length)
        Guards[i].SetValue(UseCombatTravel, 1)
        (Guards[i] as Actor).EvaluatePackage()
        i += 1
    endwhile

    ;Try to lock the doors after they close.
    int j = 0
    while (j <= 9)
        ;If the doors were unable to lock before, lock them now.
        if(LockDownDoor.GetOpenState() == 3)
                LockDownDoor.Lock(true)
        EndIf
        if(VaultDoor.GetOpenState()== 3)
                VaultDoor.Lock(true)
        EndIf
        Utility.Wait(0.3)
        j = j + 1
    EndWhile
    ;If the doors are somehow still open, just lock them which will auto close them.
    VaultDoor.Lock(true)
    LockDownDoor.Lock(true)
EndEvent