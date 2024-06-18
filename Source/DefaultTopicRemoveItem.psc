Scriptname DefaultTopicRemoveItem extends TopicInfo const default

bool Property RemoveItemOnBegin = false const auto
{Default: false; should we remove the item when the topic starts playing?}
bool Property RemoveItemOnEnd = true const auto
{Default: true; should we remove the item when the topic finishes playing?}

MiscObject property MiscItemToRemove const auto
{ Which item should we remove from player? }

int property ItemCountToRemove = 1 const auto
{how many items should we remove?}

GlobalVariable property ItemCountToRemoveGlobal const auto
{ OPTIONAL - if this is provided, it will be used instead of ItemCountToRemove }

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if RemoveItemOnBegin
 		debug.trace(self + "OnBegin() will removeItem " + MiscItemToRemove)
 		RemoveItem()
  	endif
endEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if RemoveItemOnEnd
		debug.trace(self + "OnEnd() will removeItem " + MiscItemToRemove)
		RemoveItem()
	endif
endEvent

function RemoveItem()
	int countToRemove = ItemCountToRemove
	if ItemCountToRemoveGlobal
		countToRemove = ItemCountToRemoveGlobal.GetValueInt()
	EndIf
	Game.GetPlayer().RemoveItem(MiscItemToRemove, countToRemove)
endFunction
