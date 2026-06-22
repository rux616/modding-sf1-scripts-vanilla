Scriptname TestAffinityActorScript extends Actor Const

AffinityEvent Property TestAENoel2 const Auto

Event OnAffinityEvent(AffinityEvent MyAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  ;testSoundEvent.Play(self)
  debug.notification( "Affinity event hit" )
  debug.trace(self + "AFFINITY EVENT RECEIVED" + MyAffinityEvent)
  TestAENoel2.Send()
EndEvent
WwiseEvent Property testSoundEvent Auto Const
