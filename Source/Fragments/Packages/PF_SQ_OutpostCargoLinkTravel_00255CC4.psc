;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_SQ_OutpostCargoLinkTravel_00255CC4 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
debug.trace(self + " OnEnd akActor=" + akActor)
SQ_OutpostCargoLinkShipScript myShip = akActor.GetSpaceship() as SQ_OutpostCargoLinkShipScript
if myShip
    myShip.ArriveAtOutpost()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
