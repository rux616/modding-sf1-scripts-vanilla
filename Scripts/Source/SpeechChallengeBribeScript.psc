Scriptname SpeechChallengeBribeScript extends Scene const
{incremement BribeCount on player}

ActorValue property BribeCount auto const mandatory

Event OnBegin()
    debug.trace(self + " OnBegin")
    Game.GetPlayer().ModValue(BribeCount, 1.0)
    debug.trace(self + " incremented BribeCount to " + Game.GetPlayer().GetValue(BribeCount))
EndEvent