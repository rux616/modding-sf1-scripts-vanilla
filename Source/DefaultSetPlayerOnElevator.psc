Scriptname DefaultSetPlayerOnElevator extends ObjectReference Hidden Const

GlobalVariable Property IsPlayerInElevator Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
		; Set the player as being IN the elevator, and evp all current followers.
		

  Debug.Trace(self + " OnTriggerEnter()")
  IsPlayerInElevator.SetValue(1)

  Actor[] PlayerFollowers = Game.GetPlayerFollowers()
  int CurrentFollowerIndex = 0
  while (CurrentFollowerIndex < PlayerFollowers.Length)
    PlayerFollowers[CurrentFollowerIndex].EvaluatePackage()
    Debug.Trace(self + "OnTriggerEnter()| " + CurrentFollowerIndex + ": " + PlayerFollowers[CurrentFollowerIndex] + " follow player CLOSELY.")
    CurrentFollowerIndex += 1
  endWhile

  EndEvent



Event OnTriggerLeave(ObjectReference akActionRef)
    ; Set the player as being OUT of the elevator, and evp all current followers.
  Debug.Trace(self + " OnTriggerLeave()")
  IsPlayerInElevator.SetValue(0)

  Actor[] PlayerFollowers = Game.GetPlayerFollowers()
  int CurrentFollowerIndex = 0
  while (CurrentFollowerIndex < PlayerFollowers.Length)
    PlayerFollowers[CurrentFollowerIndex].EvaluatePackage()
    Debug.Trace(self + " OnTriggerLeave()| " + CurrentFollowerIndex + ": " + PlayerFollowers[CurrentFollowerIndex] + " follow player NORMALLY")
    CurrentFollowerIndex += 1
  endWhile

EndEvent
