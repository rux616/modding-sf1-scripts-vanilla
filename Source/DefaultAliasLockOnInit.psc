Scriptname DefaultAliasLockOnInit extends ReferenceAlias Const Default
{Default script used for checking if an alias has been locked/unlocked}

Int Property LockLevel =-1 Auto Const
{Optional: The Lock Level for the door. By default, the lock will be Very Easy}

Event OnAliasInit()
    ObjectReference myRef = Self.GetRef()
    myRef.Lock()
    If LockLevel > 0
        myRef.SetLockLevel(LockLevel)
    EndIf
EndEvent