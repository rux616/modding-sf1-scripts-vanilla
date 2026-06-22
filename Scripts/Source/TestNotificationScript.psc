Scriptname TestNotificationScript extends ObjectReference Const

Message Property TestNotification Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
  TestNotification.Show()
EndEvent