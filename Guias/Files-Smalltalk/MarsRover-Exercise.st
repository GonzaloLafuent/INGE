!classDefinition: #TestMarsRover category: #'MarsRover-Exercise'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:01'!
test01
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'f'. 
	pointingTo  := North new.
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@1) lookingTo: pointingTo).
	
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:07'!
test02
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'b'. 
	pointingTo := North new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo .
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@-1) lookingTo: pointingTo).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:12'!
test03
	
	|marsRover movementSecuence pointingTo |
	
	movementSecuence := 'f'. 
	pointingTo := South new.
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@-1) lookingTo: pointingTo).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:18'!
test04
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'b'. 
	pointingTo := South new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo .
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@1) lookingTo: pointingTo).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:24'!
test05
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'f'. 
	pointingTo := East new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (1@0) lookingTo:pointingTo ).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:29'!
test06
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'b'. 
	pointingTo := East new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (-1@0) lookingTo:pointingTo ).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:35'!
test07
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'f'. 
	pointingTo := West new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (-1@0) lookingTo:pointingTo ).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:40'!
test08
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'b'. 
	pointingTo := West new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (1@0) lookingTo:pointingTo ).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:46'!
test09
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'bfffbf'. 
	pointingTo := North new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@2) lookingTo:pointingTo ).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:52'!
test10
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'l'. 
	pointingTo := North new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@0) lookingTo: West new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:17:57'!
test11
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'r'. 
	pointingTo := North new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@0) lookingTo: East new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:18:03'!
test12
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'l'. 
	pointingTo := South new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@0) lookingTo: East new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:18:07'!
test13
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'r'. 
	pointingTo := South new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@0) lookingTo: West new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:18:13'!
test14
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'l'. 
	pointingTo := East new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@0) lookingTo: North new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:18:18'!
test15
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'r'. 
	pointingTo := East new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@0) lookingTo: South new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:18:23'!
test16
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'l'. 
	pointingTo := West new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@0) lookingTo: South new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:18:27'!
test17
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'r'. 
	pointingTo := West new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@0) lookingTo: North new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:18:33'!
test18
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'fflbrf'. 
	pointingTo := North new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (1@3) lookingTo: North new).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:18:41'!
test19
	
	|marsRover movementSecuence pointingTo|
	
	movementSecuence := 'fjlbrf'. 
	pointingTo := North new. 
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	self should: [marsRover moveAccordingTo: movementSecuence. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
			self assert: 'Comando de movimiento incorrecto' equals: error messageText.
			self assert: (marsRover isAt: (0@1) lookingTo: North new).
		].	
! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/9/2024 21:27:15'!
testMarsRoversReceivesAnEmptySecuenceOfMovements
	
	|marsRover movementCoordenates pointingTo|
	
	movementCoordenates := ''. 
	pointingTo := North new.
	
	marsRover := MarsRover createAt: (0@0) lookingTo: pointingTo.
	
	marsRover moveAccordingTo: movementCoordenates.
	
	self assert: (marsRover isAt: (0@0) lookingTo: pointingTo).
	
	! !


!classDefinition: #CardinalPoints category: #'MarsRover-Exercise'!
Object subclass: #CardinalPoints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!CardinalPoints methodsFor: 'moving' stamp: 'GL 10/9/2024 17:36:56'!
= aCardinalPoint
	
	^((self class) name) = ((aCardinalPoint class) name).! !

!CardinalPoints methodsFor: 'moving' stamp: 'GL 10/9/2024 16:45:06'!
moveBackwards: aMarsRover

	self subclassResponsibility! !

!CardinalPoints methodsFor: 'moving' stamp: 'GL 10/9/2024 16:45:10'!
moveForward: aMarsRover

	self subclassResponsibility! !

!CardinalPoints methodsFor: 'moving' stamp: 'GL 10/9/2024 18:24:50'!
rotateLeft: aMarsRover

	self subclassResponsibility! !

!CardinalPoints methodsFor: 'moving' stamp: 'GL 10/9/2024 18:24:53'!
rotateRight: aMarsRover

	self subclassResponsibility! !


!classDefinition: #East category: #'MarsRover-Exercise'!
CardinalPoints subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!East methodsFor: 'moving' stamp: 'GL 10/9/2024 21:03:07'!
moveBackwards: aMarsRover
	
	aMarsRover decrementXCoordenate. ! !

!East methodsFor: 'moving' stamp: 'GL 10/9/2024 21:03:34'!
moveForward: aMarsRover
	
	aMarsRover incrementXCoordenate. ! !

!East methodsFor: 'moving' stamp: 'GL 10/9/2024 18:28:54'!
rotateLeft: aMarsRover
	
	aMarsRover changeDirectionToNorth. ! !

!East methodsFor: 'moving' stamp: 'GL 10/9/2024 18:30:35'!
rotateRight: aMarsRover
	
	aMarsRover changeDirectionToSouth. ! !


!classDefinition: #North category: #'MarsRover-Exercise'!
CardinalPoints subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!North methodsFor: 'moving' stamp: 'GL 10/9/2024 21:04:36'!
moveBackwards: aMarsRover
	
	aMarsRover decrementYCoordenate. 
	! !

!North methodsFor: 'moving' stamp: 'GL 10/9/2024 21:04:50'!
moveForward: aMarsRover
	
	aMarsRover incrementYCoordenate. ! !

!North methodsFor: 'moving' stamp: 'GL 10/9/2024 18:29:14'!
rotateLeft: aMarsRover
	
	aMarsRover changeDirectionToWest. ! !

!North methodsFor: 'moving' stamp: 'GL 10/9/2024 18:30:54'!
rotateRight: aMarsRover
	
	aMarsRover changeDirectionToEast. ! !


!classDefinition: #South category: #'MarsRover-Exercise'!
CardinalPoints subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!South methodsFor: 'moving' stamp: 'GL 10/9/2024 21:05:20'!
moveBackwards: aMarsRover
	
	aMarsRover incrementYCoordenate. ! !

!South methodsFor: 'moving' stamp: 'GL 10/9/2024 21:05:10'!
moveForward: aMarsRover
	
	aMarsRover decrementYCoordenate. ! !

!South methodsFor: 'moving' stamp: 'GL 10/9/2024 18:29:33'!
rotateLeft: aMarsRover
	
	aMarsRover changeDirectionToEast. ! !

!South methodsFor: 'moving' stamp: 'GL 10/9/2024 18:31:11'!
rotateRight: aMarsRover
	
	aMarsRover changeDirectionToWest. ! !


!classDefinition: #West category: #'MarsRover-Exercise'!
CardinalPoints subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!West methodsFor: 'moving' stamp: 'GL 10/9/2024 21:05:42'!
moveBackwards: aMarsRover
	
	aMarsRover incrementXCoordenate. ! !

!West methodsFor: 'moving' stamp: 'GL 10/9/2024 21:05:50'!
moveForward: aMarsRover
	
	aMarsRover decrementXCoordenate. ! !

!West methodsFor: 'moving' stamp: 'GL 10/9/2024 18:29:52'!
rotateLeft: aMarsRover
	
	aMarsRover changeDirectionToSouth. ! !

!West methodsFor: 'moving' stamp: 'GL 10/9/2024 18:31:30'!
rotateRight: aMarsRover
	
	aMarsRover changeDirectionToNorth. ! !


!classDefinition: #MarsRover category: #'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint lookingTo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'initialization' stamp: 'GL 10/8/2024 20:51:28'!
initializeAt: aPosition lookingTo: aCardinalPoint 
	
	position := aPosition.
	lookingTo := aCardinalPoint.! !


!MarsRover methodsFor: 'moving' stamp: 'GL 10/9/2024 21:01:58'!
decrementXCoordenate

	position := position + (-1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'GL 10/9/2024 21:01:53'!
decrementYCoordenate

	 position := position + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'GL 10/9/2024 21:02:08'!
incrementXCoordenate

	position := position + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'GL 10/9/2024 21:02:18'!
incrementYCoordenate

	position :=  position + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'GL 10/9/2024 21:14:09'!
itsABackwardsMovement: aMovement

	^ aMovement = $b ifTrue: [lookingTo moveBackwards: self.]! !

!MarsRover methodsFor: 'moving' stamp: 'GL 10/9/2024 21:14:15'!
itsAForwardMovement: aMovement

	^ aMovement = $f ifTrue: [lookingTo moveForward: self.]! !

!MarsRover methodsFor: 'moving' stamp: 'GL 10/9/2024 18:42:58'!
moveAccordingTo: aSeriesOfMovements
	
	aSeriesOfMovements do: [:aMovement| 
		self assertItsAValidCommand: aMovement. 
		self itsAForwardMovement: aMovement.
		self itsABackwardsMovement: aMovement.  
		self itsARotationToLeft: aMovement.
		self itsARotationToRight: aMovement. 
	].
	 
! !


!MarsRover methodsFor: 'testing' stamp: 'GL 10/9/2024 21:14:35'!
assertItsAValidCommand: aMovement
	
	(aMovement = $l or: [aMovement = $r  or: [aMovement = $b or: [aMovement = $f ]]]) ifFalse:[ (self error: 'Comando de movimiento incorrecto')]. 	! !

!MarsRover methodsFor: 'testing' stamp: 'GL 10/8/2024 20:54:40'!
isAt: aPosition lookingTo: aDirection 
	
	^aPosition = position and: [aDirection = lookingTo ]. ! !


!MarsRover methodsFor: 'direction' stamp: 'GL 10/9/2024 18:27:19'!
changeDirectionToEast
	
	lookingTo := East new.! !

!MarsRover methodsFor: 'direction' stamp: 'GL 10/9/2024 18:27:27'!
changeDirectionToNorth
	
	lookingTo := North new.! !

!MarsRover methodsFor: 'direction' stamp: 'GL 10/9/2024 18:27:36'!
changeDirectionToSouth
	
	lookingTo := South new.! !

!MarsRover methodsFor: 'direction' stamp: 'GL 10/9/2024 18:27:09'!
changeDirectionToWest
	
	lookingTo := West new.! !

!MarsRover methodsFor: 'direction' stamp: 'GL 10/9/2024 21:14:47'!
itsARotationToLeft: aMovement

	^ aMovement = $l ifTrue: [lookingTo rotateLeft: self. ]! !

!MarsRover methodsFor: 'direction' stamp: 'GL 10/9/2024 21:14:52'!
itsARotationToRight: aMovement

	^ aMovement = $r ifTrue: [ lookingTo rotateRight: self.]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'GL 10/8/2024 20:50:55'!
createAt: aPosition lookingTo: aCardinalPoint 

	^self new initializeAt: aPosition lookingTo: aCardinalPoint ! !
