Scriptname SE_DerelictScript extends Quest
{ spawn a random derelict ship }

Formlist Property DerelictShipList Auto Const Mandatory
{ list of ships to randomly pick from }

ReferenceAlias property Alias_GeneralMarker01 Auto Const Mandatory
{ marker to place derelict ship at 
}
ReferenceAlias property Alias_DerelictShip Auto Const Mandatory
{ put ship into this alias }

SQ_ParentScript property SQ_Parent Auto Const Mandatory
{ SQ_Parent script, for applying damage to the derelict ship. }

Group AutofillProperties
	ActorValue property SpaceshipCrew Auto Const Mandatory
	ActorValue property SpaceshipExternalLightsDisabledValue Auto Const Mandatory
EndGroup

Event OnQuestInit()
    SpawnShips(DerelictShipList, Alias_DerelictShip, Alias_GeneralMarker01)
EndEvent

Function SpawnShips(FormList akCurrentGroup, ReferenceAlias akRefColToAddTo, ReferenceAlias akSpawnMarker)
    int indnum = Utility.RandomInt(0,(akCurrentGroup.GetSize()-1))

    ObjectReference ADMarker = akSpawnMarker.GetRef()
    SpaceshipReference newShip = ADMarker.PlaceShipAtMe(akCurrentGroup.GetAt(indnum))
    newShip.DamageValue(SpaceshipCrew, newShip.GetValue(SpaceshipCrew))
    newShip.SetValue(SpaceshipExternalLightsDisabledValue, 1)
    SQ_Parent.SetupDamagedShip(newShip)
    akRefColToAddTo.ForceRefTo(newShip)
EndFunction