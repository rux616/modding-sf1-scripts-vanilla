Scriptname DLC03:SFBGS003InevitableFurnitureScript extends ReferenceAlias

ActorBase Property SFBGS003_Inevitable Mandatory Const Auto

Event OnAliasInit()
    GetRef().SetActorOwner(SFBGS003_Inevitable, True)
EndEvent
