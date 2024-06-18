Scriptname OE_AustinF_PvG_Script extends Quest

ReferenceAlias Property BoardingShip Auto const
BEScript Property BoardingScript Auto Hidden
SQ_ParentScript Property SQ_Parent Auto const

Event OnQuestInit()
    RegisterForCustomEvent(SQ_Parent, "SQ_BEStarted")
EndEvent

Event SQ_ParentScript.SQ_BEStarted(SQ_ParentScript akSource, Var[] akArgs)
     if ((akArgs[0] as SpaceshipReference) == BoardingShip.GetShipRef())
          BoardingScript = akArgs[1] as BEScript
     EndIf
EndEvent