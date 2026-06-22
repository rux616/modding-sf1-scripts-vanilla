Scriptname SE_FAB08_TraderScript extends ReferenceAlias
{ Handles setting globals that prevent the respawn of Legendary Weapons from the Starborn Trader Ship Vendor. }

Group required
    FormList property SE_FAB08_LegendaryWeaponTypes auto const mandatory
    { Formlist of weapon types to filter by. }

    Keyword[] property LegendaryWeaponKeywords auto const mandatory
    { An array of keywords attached to Legendary weapons that we wish to handle. }

    GlobalVariable[] property LegendaryWeaponGlobals auto const mandatory
    { An array of globals that prevent the corresponding weapon from spawning again. }
endGroup

Event OnAliasInit()
    debug.trace("SE_FAB08_TraderScript: OnAliasInit")
    AddInventoryEventFilter(SE_FAB08_LegendaryWeaponTypes)
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
    debug.trace("SE_FAB08_TraderScript: OnItemRemoved akItemReference: " + akItemReference)
    ; Does the weapon that was sold, or removed (in the case of destroying the ship) have a Legendary Weapon keyword we're tracking?
    int i = 0
    bool keywordFound = false
    while i < LegendaryWeaponKeywords.Length && !keywordFound
        Keyword myKeyword = LegendaryWeaponKeywords[i]
        GlobalVariable myGlobal = LegendaryWeaponGlobals[i]

        if akItemReference.HasKeyword(myKeyword)
            debug.trace("We sold Legendary Weapon with keyword " + myKeyword + ", setting corresponding Chance None global " + myGlobal + " to 100.")
            myGlobal.SetValueInt(100)
            keywordFound = True
        endif

        i += 1
    endWhile
EndEvent