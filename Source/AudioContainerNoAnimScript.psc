Scriptname AudioContainerNoAnimScript extends ObjectReference Conditional
{plays a sound on menu open/close}

WwiseEvent Property OpenSound Auto Const
WwiseEvent Property CloseSound Auto Const

;************************************

Event OnLoad()
    RegisterForMenuOpenCloseEvent("ContainerMenu")
EndEvent

;************************************

Event OnUnload()
	UnregisterForMenuOpenCloseEvent("ContainerMenu")   
EndEvent

;************************************

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    if (asMenuName== "ContainerMenu")
        if (abOpening == FALSE)
        	CloseSound.PlayAndWait(self)
        else
        	OpenSound.PlayAndWait(self)
        endif
    endif
EndEvent

;************************************