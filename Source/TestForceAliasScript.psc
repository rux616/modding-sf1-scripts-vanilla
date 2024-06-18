Scriptname TestForceAliasScript extends Quest

ReferenceAlias property AliasToForce auto Const

function ForceIntoAlias(Form myForm)
    ObjectReference myRef = myForm as ObjectReference
    if myRef
        AliasToForce.ForceRefTo(myref)
    else
        SpaceshipReference myShip = myForm as SpaceshipReference
        if myShip
            AliasToForce.ForceRefTo(myship)
        else
            debug.trace(self + " invalid form " + myForm)
        EndIf
    endif
EndFunction