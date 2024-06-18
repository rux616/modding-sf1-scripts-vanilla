Scriptname Utility_FAB_Script extends Quest

Faction Property PlayerEnemyFaction Auto Const Mandatory
ActorValue Property Aggression Auto Const Mandatory

Function AttackPlayer(Actor aHostile)
    ; Make the Actor go hostile
    aHostile.RemoveFromAllFactions()
    aHostile.SetValue(Aggression, 1)
    aHostile.AddtoFaction(PlayerEnemyFaction)
    aHostile.StartCombat(Game.GetPlayer())    
    aHostile.SetEssential(FALSE)
    aHostile.EvaluatePackage()
EndFunction

Function ShipAttackPlayer(SpaceshipReference sHostile)
    ; Make the Spaceship go hostile
    sHostile.RemoveFromAllFactions()
    sHostile.SetValue(Aggression, 1)
    sHostile.AddtoFaction(PlayerEnemyFaction)
    sHostile.StartCombat(Game.GetPlayer().GetCurrentShipRef())    
    sHostile.SetEssential(FALSE)
    sHostile.EvaluatePackage()
EndFunction

