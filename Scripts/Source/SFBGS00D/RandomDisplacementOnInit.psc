Scriptname SFBGS00D:RandomDisplacementOnInit extends ReferenceAlias const
{Displaces Alias at random within a given range on X, Y, and Z axes.}

Float Property MaxDisplacement=0.0 Auto Const ;Reference will be displaced at random by a number indicated by this value on each axis

Event OnAliasStarted()

    ObjectReference myRef = GetRef()
    float refXPos = myRef.GetPositionX()
    float refYPos = myRef.GetPositionY()
    float refZPos = myRef.GetPositionZ()
    ;Debug.Trace("Initial position of" + myRef + " is: (" + refXPos + "," + refYPos + "," + refZPos + ")" )
    
    refXPos = refXPos + Utility.RandomFloat(-MaxDisplacement,MaxDisplacement)
    refYPos = refYPos + Utility.RandomFloat(-MaxDisplacement,MaxDisplacement)
    refZPos = refZPos + Utility.RandomFloat(-MaxDisplacement,MaxDisplacement)

    myRef.SetPosition(refXPos,refYPos,refZPos)
    ;Debug.Trace("New position of" + myRef + " is: (" + refXPos + "," + refYPos + "," + refZPos + ")" )

EndEvent
