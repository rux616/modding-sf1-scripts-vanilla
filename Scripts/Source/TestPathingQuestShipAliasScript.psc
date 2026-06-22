Scriptname TestPathingQuestShipAliasScript extends ReferenceAlias

Event OnAliasInit()

	Self.GetShipRef().SetExteriorLoadDoorInaccessible(False)

EndEvent