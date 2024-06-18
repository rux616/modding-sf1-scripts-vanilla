Scriptname TestGym_FXSeq_Control extends ObjectReference 
{Runs an FX Seq on activate}

ObjectReference Property P_TestGym_FXSeq_ScriptControl Auto Const Mandatory
;String Property SeqName = "TestScriptControl" Auto 
String Property SeqName = "TestImodSeq" Auto 



Event OnActivate(ObjectReference akActionRef)
 	 Debug.Trace("Playing seq " + SeqName )

	P_TestGym_FXSeq_ScriptControl.StartSequence(SeqName, true)
	Utility.Wait(5)                                 ; wait while the sequence is playing.
	P_TestGym_FXSeq_ScriptControl.StopSequence(SeqName)
EndEvent


