Scriptname DefaultForceRefToLinkOnEnterScript extends ObjectReference Const Default
{Used Primarily for Quest Target breadcrumbing. Force the QT RefAlias to this trigger's LinkedRef when the Player enters this Trigger.}

ReferenceAlias Property RefAliasToFill Auto Mandatory Const

Event OnTriggerEnter(ObjectReference akActionRef)
    ObjectReference MyLink = Self.GetLinkedRef()
    Debug.Trace(Self + " Player has entered the trigger. Setting: " + MyLink + "to be the new Ref for: " + RefAliasToFill)
    RefAliasToFill.ForceRefTo(MyLink)
EndEvent