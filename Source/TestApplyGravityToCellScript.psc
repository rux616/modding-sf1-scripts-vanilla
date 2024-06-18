Scriptname TestApplyGravityToCellScript extends ObjectReference Const

Group RequiredProperties
	float Property targetGravity Auto Const
	{the gravity you want to set on the cell}
EndGroup

;**********************************************

Event OnCellLoad()
    Cell currentCell = getParentCell()

    currentCell.setGravityScale(targetGravity)
EndEvent