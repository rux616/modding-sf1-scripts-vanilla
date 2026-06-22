Scriptname COM_Andreja_Q01_VaruunShipScript extends ReferenceAlias

ActorValue Property pDockingPermission Auto Const Mandatory


Event OnLoad()

Self.GetReference().SetValue(pDockingPermission, 4)

EndEvent