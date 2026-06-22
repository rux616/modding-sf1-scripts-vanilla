Scriptname TestKenCellSpawn extends ObjectReference Const

function SpawnCell()
	Form ObjectBase = Game.GetForm(0x0029d680)
	Cell ObjectCell = ObjectBase as Cell
	float[] offsetValues = new float[3]
	offsetValues[0] = 0.0
	offsetValues[1] = 0.0
	offsetValues[2] = 0.0
	Cell newCell = PlaceCellAtMe(ObjectCell, None, false, true, false, offsetValues)
endFunction
