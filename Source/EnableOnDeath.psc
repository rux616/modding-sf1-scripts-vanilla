Scriptname EnableOnDeath extends Actor Const
{When Parent Dying, enable property ref}

ObjectReference Property ObjToEnable Auto Const
{Set ref to be enabled}

Event OnDying(ObjectReference akKiller)
    ObjToEnable.Enable()
endEvent