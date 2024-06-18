;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQMisc02_001560EE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef()
ObjectReference ContainerREF = Alias_Container.GetRef()

ContainerREF.Enable()
DeadCompanionREF.RemoveAllItems(akTransferTo = ContainerREF)

MQMisc02MSG.Show()

Utility.Wait(0.1)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()

If MQ206B.IsRunning()
  MQ206B.SetActive()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property MQMisc02MSG Auto Const Mandatory

ReferenceAlias Property Alias_CompanionWhoDies Auto Const Mandatory

ReferenceAlias Property Alias_Container Auto Const Mandatory

Quest Property MQ206B Auto Const Mandatory
