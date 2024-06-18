Scriptname RI07_NeurosurgeryTableScript extends ObjectReference Const

Quest Property RI07 Auto Const Mandatory

Event OnLoad()
Debug.Trace(Self + " RI07_NeurosurgeryTable: OnLoad event fired")
    If !RI07.GetStageDone(700) || RI07.GetStageDone(800)
        Debug.Trace(Self + " RI07_NeurosurgeryTable: BlockActivation conditions passed")
        BlockActivation(True, True)
    EndIf
EndEvent

