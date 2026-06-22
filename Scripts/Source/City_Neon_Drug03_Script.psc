Scriptname City_Neon_Drug03_Script extends Quest

Quest Property City_Neon_Drug_Game Auto Const Mandatory

int property maxRefills = 1 auto Const
{ how many "refills" will player get on retries, per round }

Function ReplayGame()
; The minigame can't restart itself

    City_Neon_Drug_Game.Stop()
    City_Neon_Drug_Game.Reset()
    City_Neon_Drug_Game.Start()

EndFunction