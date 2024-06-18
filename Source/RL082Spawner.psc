Scriptname RL082Spawner extends TerminalMenu
{Spawns shoots clutter and loot out of conveyor opening in Zero G}

ObjectReference Property PackageSpawnMarker Auto 
MovableStatic[] Property packageArray Auto Const
GlobalVariable Property RL082StorageTerminal Auto
LeveledItem[] Property LootItems Auto Const

;enums
int property menuItemID_01 = 1 auto const


Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
        HandleMenuItem(auiMenuItemID)
EndEvent

function HandleMenuItem(int auiMenuItemID)
    if auiMenuItemID == menuItemID_01
        RL082StorageTerminal.SetValue(1)
        StartTimer(0.1)
    endif
EndFunction

Event OnTimer(int aiTimerID)
        ;Spawn and aplly havok to random clutter from the array assigned in properties
        int i = 0
        while (i < packageArray.Length)
            utility.wait(Utility.RandomFloat(0.1, 0.15))
            ObjectReference newPackage = PackageSpawnMarker.PlaceAtMe(packageArray[i])
            newPackage.SetAngle(Utility.RandomFloat(0, 180), Utility.RandomFloat(0, 180), Utility.RandomFloat(0, 180))
            newPackage.ApplyHavokImpulse(-1.0, 0.0, 0.0, Utility.RandomFloat(15.0, 17.0))
            i += 1
        endwhile

        ;Spawn and aplly havok to loot from the array assigned in properties
        i = 0
        while (i < LootItems.Length)
            utility.wait(Utility.RandomFloat(0.1, 0.15))
            ObjectReference newLoot = PackageSpawnMarker.PlaceAtMe(LootItems[i])
            newLoot.SetAngle(Utility.RandomFloat(0, 180), Utility.RandomFloat(0, 180), Utility.RandomFloat(0, 180))
            newLoot.ApplyHavokImpulse(-1.0, 0.0, 0.0, Utility.RandomFloat(5.0, 7.0))
            i += 1
        endwhile
EndEvent

