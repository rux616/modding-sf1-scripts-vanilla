Scriptname COM_Quest_AndrejaAliasScript extends ReferenceAlias

ReferenceAlias Property SecretPanelAlias Auto Const

Quest Property COM_Quest_Andreja_Q01 Auto Const Mandatory


;Function PanelAnimRegister()
;  RegisterForAnimationEvent(SecretPanelAlias.GetReference(), "DoneQ01") 
;	Debug.Trace("COM_Quest_Andreja_Q01 registered for panel anim event")
;EndFunction
 
;Event OnAnimationEvent(ObjectReference akSource, string asEventName)
;  if (akSource == SecretPanelAlias.GetReference()) && (asEventName == "DoneQ01")
;    Debug.Trace("COM_Quest_Andreja_Q01 Secret Panel sent anim event DoneQ01")
;	COM_Quest_Andreja_Q01.SetStage(340)
;
 ; endIf
;endEvent