Scriptname RL036MusicControl extends ObjectReference Const

ObjectReference Property RL036_EnableMusic Auto Const
Keyword Property LinkedRefKeywordMusic Auto Const
Keyword Property LinkedRefKeywordEnemies Auto Const

Event OnActivate(ObjectReference akActionRef)

	if (GetLinkedRef(LinkedRefKeywordEnemies).IsDisabled())
		GetLinkedRef(LinkedRefKeywordEnemies).Enable()
	endIf

	if (GetLinkedRef(LinkedRefKeywordMusic).IsDisabled())
		GetLinkedRef(LinkedRefKeywordMusic).Enable()
	else
		GetLinkedRef(LinkedRefKeywordMusic).Disable()
	endIf

 endEvent
