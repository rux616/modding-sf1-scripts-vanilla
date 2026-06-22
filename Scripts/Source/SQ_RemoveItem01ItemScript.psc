Scriptname SQ_RemoveItem01ItemScript extends ReferenceAlias Const
{ Handles the item being picked up before the bot arrives. }

ReferenceAlias property Bot auto const mandatory

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akNewContainer != Bot.GetRef()
        GetOwningQuest().Stop()
    endif
endEvent