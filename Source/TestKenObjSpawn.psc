Scriptname TestKenObjSpawn extends ObjectReference Const

function SpawnObject()
	Form ObjectBase = Game.GetForm(0x001a9b01)
	float[] offsetValues = new float[3]
	offsetValues[0] = 100.0
	offsetValues[1] = 100.0
	offsetValues[2] = 0.0
	ObjectReference newObj = PlaceAtMe(ObjectBase, 1, false, false, true, offsetValues)
endFunction
