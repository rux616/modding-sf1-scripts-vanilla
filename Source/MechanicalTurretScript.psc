Scriptname MechanicalTurretScript extends ObjectReference
{Script to handle mechanical turret moving up and down based on player position}

Int Property TurretType = 4 Auto Const
{0=vertical only, 1=horizontal only, 2=horizontal and vertical (default), 3=all three axis, 4=random}
Keyword Property LinkCustom01 Auto Const Mandatory
{z platform helper}
Keyword Property LinkCustom02 Auto Const Mandatory
{horizontalY platform helper}
Keyword Property LinkCustom03 Auto Const Mandatory
{horizontalX platform helper}
Keyword Property LinkCustom04 Auto Const Mandatory
{turret fire node}
Keyword Property LinkCustom05 Auto Const Mandatory
{ref for root marker}
Keyword Property LinkCustom06 Auto Const Mandatory
{ref for ceiling of z bound}
Keyword Property LinkCustom07 Auto Const Mandatory
{ref for horizontalY bound}
Keyword Property LinkCustom08 Auto Const Mandatory
{ref for horizontalX bound}

Float Property fTimeTakenToMove = 2.0 Auto Const
{how fast the turret moves from point A to B}

Weapon Property turretWeapon Auto Const
{weapon turret uses}

Ammo Property turretAmmo Auto Const
{ammo that turret fires}


;***********************************************************

ObjectReference verticalMoverRef 	;LinkCustom01
ObjectReference horizontalYMoverRef ;LinkCustom02
ObjectReference horizontalXMoverRef ;LinkCustom03
ObjectReference fireNodeRef 		;LinkCustom04
ObjectReference rootRef 	        ;LinkCustom05
ObjectReference zRef 		        ;LinkCustom06
ObjectReference horizontalYRef      ;LinkCustom07
ObjectReference horizontalXRef 		;LinkCustom08
ObjectReference playerRef
Float fAnimRate
Float zRootPosition
Float fRootRefDistanceToPlayer
Float fVerticalLength
Float fHorizontalYLength
Float fHorizontalXLength
Float fVerticalMoverVar
Float fHorizontalYMoverVar
Float fHorizontalXMoverVar
Float fplayerDistanceToZFloor
Float fTargetMin = 1.25             ;1.0 is around player chest
Float myTimerMax = 0.1
Float myTimerMin = 0.1
Float myTimer = 0.1
Float xAngle
int myTimerID = 0
bool doOnce = FALSE
bool bUseVertical
bool bUseHorizontalY
bool bUseHorizontalX

;***********************************************************

Event OnLoad()
	playerRef = game.GetPlayer()
    verticalMoverRef = GetLinkedRef(LinkCustom01)
    horizontalYMoverRef = GetLinkedRef(LinkCustom02)
    horizontalXMoverRef = GetLinkedRef(LinkCustom03)
    fireNodeRef = GetLinkedRef(LinkCustom04)
    rootRef = GetLinkedRef(LinkCustom05)
    zRef = GetLinkedRef(LinkCustom06)
    horizontalYRef = GetLinkedRef(LinkCustom07)
    horizontalXRef = GetLinkedRef(LinkCustom08)

    zRootPosition = rootRef.GetPositionZ()

    fAnimRate = 1.0 / fTimeTakenToMove

    verticalMoverRef.SetAnimationVariableFloat("Speed", fAnimRate)
    horizontalYMoverRef.SetAnimationVariableFloat("Speed", fAnimRate)
    horizontalXMoverRef.SetAnimationVariableFloat("Speed", fAnimRate)

    fVerticalLength = zRef.GetPositionZ() - zRootPosition
    fHorizontalYLength = rootRef.GetDistance(horizontalYRef)
    fHorizontalXLength = rootRef.GetDistance(horizontalXRef)

    if(TurretType == 1)
        bUseVertical = FALSE
    else
        bUseVertical = TRUE
    EndIf

    if(TurretType == 0)
        bUseHorizontalY = FALSE
    else
        bUseHorizontalY = TRUE
    EndIf

    if(TurretType == 3 || TurretType == 4)
        bUseHorizontalX = TRUE
    else
        bUseHorizontalX = FALSE
    EndIf

EndEvent

;***********************************************************

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == game.GetPlayer() && doOnce == FALSE)
    	doOnce = TRUE
        StartTimer(myTimer, myTimerID)
    EndIf
EndEvent

;***********************************************************

Event OnTimer(int aiTimerID)
    if(aiTimerID == myTimerID)
        Float fHorizontalYShortLength
        Float fHorizontalXShortLength

        fplayerDistanceToZFloor = (playerRef.GetPositionZ() - zRootPosition) + fTargetMin
    	fRootRefDistanceToPlayer = playerRef.GetDistance(rootRef)

    	if(TurretType == 1 || TurretType == 2 || TurretType == 3)
            fHorizontalYShortLength = FindTriangleBase(fRootRefDistanceToPlayer, fHorizontalYLength, playerRef.GetDistance(horizontalYRef))
        EndIf

        if(TurretType == 3)
            fHorizontalXShortLength = FindTriangleBase(fRootRefDistanceToPlayer, fHorizontalXLength, playerRef.GetDistance(horizontalXRef))
        EndIf
    	
    	MoveTurret(fHorizontalYShortLength, fHorizontalXShortLength)
    EndIf
EndEvent

;***********************************************************

Float Function FindTriangleBase(Float SideA, Float SideB, Float SideC)
    {takes four sides of a triangle, finds the height of the triangle, then finds the short length of that new triangle}
   
    Float fHeronPart1
    Float fHeronPart2
    Float fTriangleHeight
    Float fTriangleBase

    ;Hernon's formula Part I
    ;S=(a+b+c)/2
    fHeronPart1 = (SideA + SideB + SideC) / 2

    ;Hernon's formula Part II
    fHeronPart2 = Math.sqrt(fHeronPart1 * (fHeronPart1 - SideA) * (fHeronPart1 - SideB) * (fHeronPart1 - SideC))

    ;now to find the height of the triangle
    ;Area = 1/2bh (trying to find h)
    ;fHeronPart2 = 1/2(SideB)(h)
    ;(2*fHeronPart2)/SideB = h
    fTriangleHeight = (2*fHeronPart2) / SideB

    ;now to find short base (Pythagorean)
    ;C^2 = A^2 + B^2
    ;Trying to find A
    ;(SideA * SideA) - (fTriangleHeight * fTriangleHeight) = ShortBase^2
    fTriangleBase = Math.sqrt(Math.pow(SideA, 2) - Math.pow(fTriangleHeight, 2))

    return fTriangleBase
EndFunction

;***********************************************************

Function MoveTurret(Float fHorizontalY, Float fHorizontalX)
	CancelTimer(myTimerID)

    if(TurretType != 4)
       fVerticalMoverVar = fplayerDistanceToZFloor / fVerticalLength
       fHorizontalYMoverVar = (fHorizontalY / fHorizontalYLength)
       fHorizontalXMoverVar = (fHorizontalX / fHorizontalXLength)
    else
        fVerticalMoverVar = (Utility.RandomFloat(0.0, 1.0))
        fHorizontalYMoverVar = (Utility.RandomFloat(0.0, 1.0))
        fHorizontalXMoverVar = (Utility.RandomFloat(0.0, 1.0))
    EndIf

	verticalMoverRef.SetAnimationVariableFloat("Position", fVerticalMoverVar)
    horizontalYMoverRef.SetAnimationVariableFloat("Position", fHorizontalYMoverVar)
	horizontalXMoverRef.SetAnimationVariableFloat("Position", fHorizontalXMoverVar)

    if(bUseHorizontalX == TRUE)
        horizontalXMoverRef.PlayAnimationAndWait("Play01", "done")
        FireTurret()
        Utility.Wait(0.25)
    EndIf

    if(bUseVertical == TRUE)
        verticalMoverRef.PlayAnimationAndWait("Play01", "done")
        FireTurret()
        Utility.Wait(0.25)
    EndIf

    if(bUseHorizontalY == TRUE)
        horizontalYMoverRef.PlayAnimationAndWait("Play01", "done")
        FireTurret()
        Utility.Wait(0.25)
    EndIf
	
    if(TurretType == 4)
        StartTimer(Utility.RandomFloat(myTimerMin, myTimerMax))
    else
        StartTimer(myTimer, myTimerID)
    EndIf
EndFunction

;***********************************************************

Function FireTurret()
    Float fPlayerZ = playerRef.GetPositionZ() + fTargetMin    ;so it doesn't shoot at feet
    Float fFireNodeRefZ = fireNodeRef.GetPositionZ()
    Float fZDifferencePlayerFireNode = fPlayerZ - fFireNodeRefZ
    Float fDistanceFireNodeToPlayer = fireNodeRef.GetDistance(playerRef)
    Float zOffset = fireNodeRef.GetHeadingAngle(playerRef)

    if(fPlayerZ >= fFireNodeRefZ)
        ;player is higher than fire node
        xAngle = (Math.asin(fZDifferencePlayerFireNode / fDistanceFireNodeToPlayer)) * -1
    else
        ;player is lower than fire node
        xAngle = 90 - (Math.acos((fZDifferencePlayerFireNode * -1) / fDistanceFireNodeToPlayer))
    EndIf

    fireNodeRef.setAngle(xAngle, fireNodeRef.GetAngleY(), fireNodeRef.GetAngleZ() + zOffset)
    turretWeapon.Fire(fireNodeRef, turretAmmo)


EndFunction
;***********************************************************

