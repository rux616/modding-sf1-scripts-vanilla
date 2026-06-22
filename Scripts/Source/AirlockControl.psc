Scriptname AirlockControl extends ObjectReference


;When the interior buttons are used, the airlock should close the other door, and then open the door of the button.

Keyword Property LinkKeyword1 auto mandatory const
Keyword Property LinkKeyword2 auto mandatory const
Keyword Property LinkPassOpenCloseEvent auto mandatory const
Message Property BusyActivatorMessage auto mandatory const

Event OnInit()
    RegisterForRemoteEvent(self.GetLinkedRef(LinkKeyword1), "OnActivate")
    RegisterForRemoteEvent(self.GetLinkedRef(LinkKeyword2), "OnActivate")
    debug.trace(self + " initialized. Button 1: " + self.GetLinkedRef(LinkKeyword1) + " and Button 2: " + self.GetLinkedRef(LinkKeyword2))
    
    ;Combine all Linked Refs in the system into an array.
    ObjectReference Link1 =  self.GetLinkedRef(LinkKeyword1)
    ObjectReference[] LinkedRefs = Link1.GetLinkedRefChain(LinkPassOpenCloseEvent)
    ObjectReference Link2 =  self.GetLinkedRef(LinkKeyword2)
    ObjectReference[] LinkedRefsToAdd = Link2.GetLinkedRefChain(LinkPassOpenCloseEvent)

    int index = 0
    While (index < LinkedRefsToAdd.Length)
        LinkedRefs.Add(LinkedRefsToAdd[index])
        index += 1
    EndWhile
    LinkedRefs.Add(Link1)
    LinkedRefs.Add(Link2)

    ;Register all the elements in the system for activation events
    index = 0
    While (index < LinkedRefs.Length)
        ObjectReference item = LinkedRefs[index]
        RegisterForRemoteEvent(item, "OnActivate")
        index += 1
    EndWhile

EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ;Do Nothing
EndEvent

auto state Idle
;In this state the airlock is ready to be used, all of the components are idle.
    Event onBeginState(string asOldState)
        Debug.Trace("Idle State Begin")
        ;Debug.Notification("All Use Interactions Enabled")
        
        ;Combine all Linked Refs in the system into an array.
        ObjectReference Link1 =  self.GetLinkedRef(LinkKeyword1)
        ObjectReference[] LinkedRefs = Link1.GetLinkedRefChain(LinkPassOpenCloseEvent)
        ObjectReference Link2 =  self.GetLinkedRef(LinkKeyword2)
        ObjectReference[] LinkedRefsToAdd = Link2.GetLinkedRefChain(LinkPassOpenCloseEvent)

        int index = 0
        While (index < LinkedRefsToAdd.Length)
            LinkedRefs.Add(LinkedRefsToAdd[index])
            index += 1
        EndWhile
        LinkedRefs.Add(Link1)
        LinkedRefs.Add(Link2)

        ;Make all activatiors unblocked
        index = 0
        While (index < LinkedRefs.Length)
            ObjectReference item = LinkedRefs[index]
            ;item.SetActivateTextOverride(None)
            item.BlockActivation(false)
            Debug.Trace(item + "unblocked")
            index += 1
        EndWhile
        Debug.Trace("Done Unblocking")
    endEvent

    Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
        ;Switch to the Busy State
        GotoState("Busy")   
        StartTimer(3) ;After this timer (later on done event from Linked Refs, check the state of all the doors)
        ;Debug.Notification("All Use Interactions Disabled")

        ObjectReference Sys1Link1 =  self.GetLinkedRef(LinkKeyword1)
        ObjectReference[] Sys1LinkedRefs = Sys1Link1.GetLinkedRefChain(LinkPassOpenCloseEvent)
        Sys1LinkedRefs.Add(Sys1Link1)

        ;ObjectReference[] System1Refs = self.GetLinkedRef(LinkKeyword1).GetLinkedRefChain(LinkPassOpenCloseEvent)
        if(Sys1LinkedRefs.Find(akSender) > -1 )
            if(self.GetLinkedRef(LinkKeyword2).GetOpenState() == 1)
                self.GetLinkedRef(LinkKeyword2).Activate(akActionRef) 
            else
                ;Get Sys2 and block all Sys2
                ObjectReference Sys2Link1 =  self.GetLinkedRef(LinkKeyword2)
                ObjectReference[] Sys2LinkedRefs = Sys2Link1.GetLinkedRefChain(LinkPassOpenCloseEvent)
                Sys2LinkedRefs.Add(Sys2Link1)
                int index = 0
                While (index < Sys2LinkedRefs.Length)
                    ObjectReference item = Sys2LinkedRefs[index]
                    item.BlockActivation(true, false)
                    Debug.Trace(item + "Blocked")
                    index += 1
                EndWhile
            endif
        else
            if(self.GetLinkedRef(LinkKeyword1).GetOpenState() == 1)
                self.GetLinkedRef(LinkKeyword1).Activate(akActionRef)
            else
                ;Block all Sys1
                int index = 0
                While (index < Sys1LinkedRefs.Length)
                    ObjectReference item = Sys1LinkedRefs[index]
                    item.BlockActivation(true, false)
                    Debug.Trace(item + "Blocked")
                    index += 1
                EndWhile

            endif
        endif
        akSender.BlockActivation(true, false)
        Debug.Trace(akSender + "Blocked")
    EndEvent
endState

state Busy
;In this state at least one component is still moving and the system is not ready to be interacted with.
    Event onBeginState(string asOldState)
            Debug.Trace("Busy State Begin")
    endEvent

    Event OnTimer(int aiTimerID)

        ;Test Activators
        ObjectReference Link1 =  self.GetLinkedRef(LinkKeyword1)
        ObjectReference[] LinkedRefs = Link1.GetLinkedRefChain(LinkPassOpenCloseEvent)
        ObjectReference Link2 =  self.GetLinkedRef(LinkKeyword2)
        ObjectReference[] LinkedRefsToAdd = Link2.GetLinkedRefChain(LinkPassOpenCloseEvent)

        ;Combine the Link Ref Chains into one array.
        int index = 0
        While (index < LinkedRefsToAdd.Length)
            LinkedRefs.Add(LinkedRefsToAdd[index])
            index += 1
        EndWhile
        LinkedRefs.Add(Link1)
        LinkedRefs.Add(Link2)
        Debug.Trace("Array of all elements is length: " + LinkedRefs.Length)
        
        bool readyToGoIdle = true

        index = 0
        While (index < LinkedRefs.Length)
            ObjectReference item = LinkedRefs[index]
            int openState = item.GetOpenState()
            if (openState == 2 || openState == 4)
                readyToGoIdle = false
                ;Can I just return out of this while loop here?
            endif
            index += 1
        EndWhile
        if(readyToGoIdle)
            GotoState("Idle")
        else
            StartTimer(1)   
        endif
    endEvent

    Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
        akSender.BlockActivation(true, false)
        Debug.Trace(akSender + "Blocked")
    EndEvent

endState


;/ Old Stuff

 ;Check if the activator is in system 1 or system 2, the close the other system.
        if(akSender == self.GetLinkedRef(LinkKeyword1) || akSender == self.GetLinkedRef(LinkKeyword2))
            if(akSender == self.GetLinkedRef(LinkKeyword1))
                ;Debug.Notification("Door 1 is setting Door 2 to close")
                self.GetLinkedRef(LinkKeyword2).SetOpen(false)
            ;elseif(akSender == self.GetLinkedRef(LinkKeyword2))
            else
                ;Debug.Notification("Door 2 is setting Door 1 to close")     
                self.GetLinkedRef(LinkKeyword1).SetOpen(false)   
            endif
        else
            ;Block activators after they are activated.
            ;item.SetActivateTextOverride(BusyActivatorMessage)
           ; akSender.BlockActivation(true, false)
            ;Debug.Trace(akSender + "Blocked")
        endif



        
;/
        ;Make all activations blocked
        Debug.Notification("Block Interaction")
        
        ; Get all the linked refs in the system.
        ObjectReference Link1 =  self.GetLinkedRef(LinkKeyword1)
        ObjectReference[] LinkedRefs = Link1.GetLinkedRefChain(LinkPassOpenCloseEvent)
        ObjectReference Link2 =  self.GetLinkedRef(LinkKeyword2)
        ObjectReference[] LinkedRefsToAdd = Link2.GetLinkedRefChain(LinkPassOpenCloseEvent)

        ; Combine the Link Ref Chains into one array.
        int index = 0
        While (index < LinkedRefsToAdd.Length)
            LinkedRefs.Add(LinkedRefsToAdd[index])
            index += 1
        EndWhile
 
        index = 0
        While (index < LinkedRefs.Length)
            ObjectReference item = LinkedRefs[index]

            ;Block Activation



            ;item.SetActivateTextOverride(BusyActivatorMessage)
            ;item.BlockActivation(true, true)
            ;item.Disable()
            index += 1
        EndWhile
    endEvent
/;