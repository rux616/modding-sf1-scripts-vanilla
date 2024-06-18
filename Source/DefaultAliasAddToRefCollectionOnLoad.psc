Scriptname DefaultAliasAddToRefCollectionOnLoad extends ReferenceAlias
{When this Ref loads, add it to the specified Ref Collection}

RefCollectionAlias Property RefCollectionToFill Auto Const Mandatory

Event OnLoad()
    RefCollectionToFill.AddRef(Self.GetRef())
EndEvent