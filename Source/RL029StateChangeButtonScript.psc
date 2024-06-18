Scriptname RL029StateChangeButtonScript extends ObjectReference
{Script for the tree state change in RL029.}

ObjectReference Property EnableMarkerRef1 Auto Const Mandatory
ObjectReference Property EnableMarkerRef2 Auto Const Mandatory
ObjectReference Property EnableMarkerRef3 Auto Const Mandatory
ObjectReference Property PipeRef Auto Const Mandatory
ObjectReference Property SoundLocPump Auto Const Mandatory
ObjectReference Property SoundLocBig1 Auto Const Mandatory
ObjectReference Property SoundLocBig2 Auto Const Mandatory
ObjectReference Property SoundLocSmall1 Auto Const Mandatory
ObjectReference Property SoundLocSmall2 Auto Const Mandatory

WwiseEvent Property WiseEventWaterPump Auto Const Mandatory
WwiseEvent Property WiseEventBigTree1 Auto Const Mandatory
WwiseEvent Property WiseEventBigTree2 Auto Const Mandatory
WwiseEvent Property WiseEventSmallTree1 Auto Const Mandatory
WwiseEvent Property WiseEventSmallTree2 Auto Const Mandatory

Auto State Waiting
    Event OnActivate(ObjectReference akActionRef)
        GoToState("Done")
        
        PipeRef.DamageObject(2000.0)

        utility.wait(1)
        WiseEventWaterPump.Play(SoundLocPump) 
        EnableMarkerRef1.Enable()
        EnableMarkerRef3.Enable()

        utility.wait(2)
        EnableMarkerRef2.Enable()
        
        utility.wait(3)
        WiseEventBigTree1.Play(SoundLocBig1) 
        Game.ShakeCamera()

        utility.wait(2)
        Game.ShakeCamera()

        utility.wait(4)
        WiseEventBigTree2.Play(SoundLocBig2) 
        Game.ShakeCamera()

        utility.wait(10)
        WiseEventSmallTree1.Play(SoundLocSmall1) 
    
        utility.wait(7)
        WiseEventSmallTree2.Play(SoundLocSmall2)
    EndEvent
EndState

State Done
EndState