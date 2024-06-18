Scriptname TestSendStoryEventScript extends ObjectReference Const
{testing if a ref is being initialized or loaded}

Keyword property TestKurtPCMKeyword auto Const

Event OnCellLoad()
     debug.trace(self + " OnCellLoad")
     TestKurtPCMKeyword.SendStoryEvent()
EndEvent

Event OnLoad()
     debug.trace(self + " OnLoad")
     TestKurtPCMKeyword.SendStoryEvent()
endEvent