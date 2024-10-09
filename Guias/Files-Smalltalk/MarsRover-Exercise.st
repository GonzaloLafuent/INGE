!classDefinition: #TestMarsRover category: #'MarsRover-Exercise'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/8/2024 20:53:48'!
test00
	
	|marsRover movementCoordenates|
	
	movementCoordenates := #(). 
	marsRover := MarsRover createAt: (0@0) lookingTo: #north.
	
	marsRover moveAccordingTo: movementCoordenates.
	
	self assert: (marsRover isAt: (0@0) lookingTo: #north).
	
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/8/2024 20:57:34'!
test01
	
	|marsRover movementSecuence|
	
	movementSecuence := #(#f ). 
	marsRover := MarsRover createAt: (0@0) lookingTo: #north.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@1) lookingTo: #north).
	
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/8/2024 21:24:44'!
test02
	
	|marsRover movementSecuence|
	
	movementSecuence := #(#b). 
	marsRover := MarsRover createAt: (0@0) lookingTo: #north.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@-1) lookingTo: #north).
	! !

!TestMarsRover methodsFor: 'test' stamp: 'GL 10/8/2024 21:26:11'!
test03
	
	|marsRover movementSecuence|
	
	movementSecuence := #(#f). 
	marsRover := MarsRover createAt: (0@0) lookingTo: #south.
	
	marsRover moveAccordingTo: movementSecuence.
	
	self assert: (marsRover isAt: (0@-1) lookingTo: #south).
	! !


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


!MarsRover methodsFor: 'moving' stamp: 'GL 10/8/2024 21:34:26'!
moveAccordingTo: aSeriesOfMovements
	
	(aSeriesOfMovements isEmpty) not ifTrue: [ 
		lookingTo = #north ifTrue:[ 
			aSeriesOfMovements first = #f ifTrue: [position :=  (0@1)].
			aSeriesOfMovements first = #b ifTrue: [position := (0@-1)]. 
		].
		lookingTo = #south ifTrue:[
			
		].
	].
	 
! !


!MarsRover methodsFor: 'testing' stamp: 'GL 10/8/2024 20:54:40'!
isAt: aPosition lookingTo: aDirection 
	
	^aPosition = position and: [aDirection = lookingTo ]. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'GL 10/8/2024 20:50:55'!
createAt: aPosition lookingTo: aCardinalPoint 

	^self new initializeAt: aPosition lookingTo: aCardinalPoint ! !
