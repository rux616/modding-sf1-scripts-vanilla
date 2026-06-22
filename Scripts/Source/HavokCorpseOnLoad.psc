Scriptname HavokCorpseOnLoad extends Actor

Bool Property DoOnce = False Auto

Event OnLoad()

    If (DoOnce == 0)
        DoOnce = 1
        self.ApplyHavokImpulse(1, 1, 1, 1)
    EndIf

EndEvent