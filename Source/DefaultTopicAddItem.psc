Scriptname DefaultTopicAddItem extends TopicInfo const default

bool Property AddItemOnBegin = false const auto
{Default: false; should we add the item when the topic starts playing?}
bool Property AddItemOnEnd = true const auto
{Default: true; should we add the item when the topic finishes playing?}

Form Property ItemToAdd const auto
{Which item should we add to player?}

Int Property AmountToAdd = 1 Const Auto
{How many of the item(s) to add.}

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if AddItemOnBegin
 		debug.trace(self + "OnBegin() will addItem " + ItemToAdd)
 		Game.GetPlayer().AddItem(ItemToAdd)

  	endif

endEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if AddItemOnEnd
		debug.trace(self + "OnEnd() will addItem " + ItemToAdd)
		Game.GetPlayer().AddItem(ItemToAdd, AmountToAdd)
	endif

endEvent

