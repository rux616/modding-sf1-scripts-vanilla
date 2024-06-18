Scriptname LC012NASAGravTrigger extends ObjectReference Const
{Set the Gravity for the cell on trigger enter}


Cell Property LC017NASA Mandatory Const Auto
float Property NewGravity Mandatory Const Auto
Quest Property MQ301 Const Auto
Int Property TutorialStage = 147 Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == game.getplayer()
        LC017NASA.setGravityScale(NewGravity)
        If ((MQ301.GetStageDone(TutorialStage) == False) && (NewGravity == 0.0))
            MQ301.SetStage(TutorialStage)
        EndIf

        ;debug.Trace("The Gravity Change Script is updated, Trigger hit")
        if(NewGravity == 0.0)   
            ObjectReference DummyMarker = self.GetLinkedRef()
            ;debug.Trace("Dummy Marker " + DummyMarker)
            ObjectReference[] LinkedRefs
            LinkedRefs = DummyMarker.GetLinkedRefChain()
            ;debug.Trace("All Havok in array " + LinkedRefs.length)
            int i = 0
            while (i < LinkedRefs.length)
                LinkedRefs[i].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), LinkedRefs[i].GetMass()*Utility.RandomInt(1, 2)*0.25)
                ;debug.Trace("Impulsing " + LinkedRefs[i])
                i += 1
            endwhile
        EndIf
    EndIf
EndEvent