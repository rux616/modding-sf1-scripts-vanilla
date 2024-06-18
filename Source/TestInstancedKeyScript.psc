Scriptname TestInstancedKeyScript extends ObjectReference Const

function AddKey()
    Game.GetPlayer().AddKeyIfNeeded(self)
endFunction