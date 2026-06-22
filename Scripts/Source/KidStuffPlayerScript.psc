Scriptname KidStuffPlayerScript extends ReferenceAlias

Keyword Property LinkCustom01 Auto Const Mandatory
Keyword Property LinkCustom02 Auto Const Mandatory

Location Property CityNewAtlantisKidStuffHomeLocation Auto Const Mandatory
Location Property CityAkilaCityLocation Auto Const Mandatory
Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const Mandatory

ReferenceAlias Property Dad Auto Const
ReferenceAlias Property Mom Auto Const
ReferenceAlias Property LodgeMarker Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

    ; This script is in charge of getting Mom and Dad to the locations they need to be in
    Quest MyQuest = GetOwningQuest()
    ObjectReference oDad = Dad.GetRef()
    ObjectReference oMom = Mom.GetRef()    

    Debug.Trace("KidStuffPlayerScript: Player has arrived at " + akNewLoc)

    ; if Mom and Dad were blocked from going to the Lodge during MQ204, move them over once Lodge is restored
    if ( !MyQuest.GetStageDone(300) && MyQuest.GetStageDone(30) && LodgeMarker.GetRef().IsDisabled())
        MyQuest.SetStage(40)
    endif

    ; Only run these scripts if the player has already met Mom and Dad at the Lodge
    if ( MyQuest.GetStageDone(300) )
	    ; This is if the player has entered their home
        if akNewLoc == CityNewAtlantisKidStuffHomeLocation
		    ; If you are going home, the parents always show up` here
            oDad.MoveTo(oDad.GetLinkedRef())
            oMom.MoveTo(oDad.GetLinkedRef())
	    EndIf

        ; This is if the player is in the Astral Lounge (Neon)
        if akNewLoc == CityNeonTradeTowerAstralLoungeLocation && !MyQuest.GetStageDone(2000)
            oDad.MoveTo(oDad.GetLinkedRef(LinkCustom01))
            (oDad as Actor).EvaluatePackage()
            oMom.MoveTo(oDad.GetLinkedRef(LinkCustom01))
            (oMom as Actor).EvaluatePackage()
        EndIf

        ; This is if the player is in Akila City
        if akNewLoc == CityAkilaCityLocation && !MyQuest.GetStageDone(2100)
		    ; Move your parents to Honest Earl's
            oDad.MoveTo(oDad.GetLinkedRef(LinkCustom02))
            (oDad as Actor).EvaluatePackage()
            oMom.MoveTo(oDad.GetLinkedRef(LinkCustom02))
            (oMom as Actor).EvaluatePackage()
        EndIf

    EndIf
EndEvent

