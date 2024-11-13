!classDefinition: #MarsRoverLogTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLogTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 19:53:23'!
test01positionLogOfAMarsRoverWithNoPositionChangeIsEmpty

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	positionLog := OrderedCollection new.

	marsRover attachPositionLog: positionLog. 
	
	self assert: positionLog isEmpty.! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:13:32'!
test02positionLogOfMarsRoverMovingForwardInVerticalAxisShowsOnePositionChange

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	positionLog := OrderedCollection new.
	
	marsRover attachPositionLog: positionLog. 
	marsRover process: 'f'. 
	
	self assert: (positionLog includes: (0@1))! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:36:16'!
test03allPositionChangesOfAMarsRoverInVerticalAxisAreDisplayInPositionLog

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	positionLog := OrderedCollection new.
	
	marsRover attachPositionLog: positionLog. 
	marsRover process: 'bf'. 
	
	self assert: (positionLog includes: (0@-1)).
	self assert: (positionLog includes: (0@0)).! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:14:04'!
test04positionLogOfMarsRoverMovingForwardInHorizontalAxisShowsOnePositionChange

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingEast.
	positionLog := OrderedCollection new.
	
	marsRover attachPositionLog: positionLog. 
	marsRover process: 'f'. 
	
	self assert: (positionLog includes: (1@0))! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:15:50'!
test05allPositionChangesOfAMarsRoverInHorizontalAxisAreDisplayInPositionLog

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingEast.
	positionLog := OrderedCollection new.
	
	marsRover attachPositionLog: positionLog. 
	marsRover process: 'fb'. 
	
	self assert: (positionLog includes: (1@0)).
	self assert: (positionLog includes: (0@0)).! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:30:46'!
test06movementLogOfAMarsRoverWithNoPositionChangeIsEmpty

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := OrderedCollection new.

	marsRover attachMovementLog: movementLog. 
	
	self assert: movementLog isEmpty.! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:34:26'!
test07movementLogOfMarsRoverMovingForwardInVerticalAxisShowsOnePositionChange

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := OrderedCollection new.
	
	marsRover attachMovementLog: movementLog. 
	marsRover process: 'f'. 
	
	self assert: (movementLog includes: (0@1))! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:35:55'!
test08allPositionChangesOfAMarsRoverInVerticalAxisAreDisplayInMovementLog

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := OrderedCollection new.
	
	marsRover attachMovementLog: movementLog. 
	marsRover process: 'bf'. 
	
	self assert: (movementLog includes: (0@-1)).
	self assert: (movementLog includes: (0@0)).! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:46:50'!
test09movementLogOfMarsRoverMovingForwardInHorizontalAxisShowsOnePositionChange

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingEast.
	movementLog := OrderedCollection new.
	
	marsRover attachMovementLog: movementLog. 
	marsRover process: 'f'. 
	
	self assert: (movementLog includes: (1@0))! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:47:55'!
test10allPositionChangesOfAMarsRoverInHorizontalAxisAreDisplayInMovementLog

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingEast.
	positionLog := OrderedCollection new.
	
	marsRover attachMovementLog: positionLog. 
	marsRover process: 'fb'. 
	
	self assert: (positionLog includes: (1@0)).
	self assert: (positionLog includes: (0@0)).! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:51:46'!
test11marsRoverRightRotationIsDisplayIn

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := OrderedCollection new.
	
	marsRover attachMovementLog: movementLog. 
	marsRover process: 'r'. 
	
	self assert: (movementLog includes: 'a MarsRoverHeadingEast' ).
! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/12/2024 20:52:45'!
test12marsRoverRightRotationIsDisplayIn

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := OrderedCollection new.
	
	marsRover attachMovementLog: movementLog. 
	marsRover process: 'rl'. 
	
	self assert: (movementLog includes: 'a MarsRoverHeadingEast' ).
	self assert: (movementLog includes: 'a MarsRoverHeadingNorth' )! !


!classDefinition: #MarsRoverTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRover category: #'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head positionLog movementLog subject'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'GL 11/12/2024 20:56:23'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self. 
	subject := Subject new.! !


!MarsRover methodsFor: 'heading' stamp: 'GL 11/12/2024 20:42:10'!
headEast
	
	^head := MarsRoverHeadingEast for: self! !

!MarsRover methodsFor: 'heading' stamp: 'GL 11/12/2024 20:43:14'!
headNorth
	
	^head := MarsRoverHeadingNorth for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'GL 11/12/2024 20:54:12'!
headSouth
	
	^head := MarsRoverHeadingSouth for: self! !

!MarsRover methodsFor: 'heading' stamp: 'GL 11/12/2024 20:53:30'!
headWest
	
	^head := MarsRoverHeadingWest for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'GL 11/12/2024 20:54:19'!
rotateLeft
	
	^movementLog add: head rotateLeft asString.! !

!MarsRover methodsFor: 'heading' stamp: 'GL 11/12/2024 20:54:23'!
rotateRight
	
	^movementLog add: head rotateRight asString.! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'GL 11/12/2024 20:37:27'!
moveBackward
	
	|positionChange|
	
	positionChange := head moveBackward. 
	positionLog ifNotNil: [positionLog add: positionChange ].
	movementLog ifNotNil: [movementLog add: positionChange ].
! !

!MarsRover methodsFor: 'moving' stamp: 'GL 11/12/2024 20:27:53'!
moveEast
	
	^position := position + (1@0).
	! !

!MarsRover methodsFor: 'moving' stamp: 'GL 11/12/2024 20:33:48'!
moveForward
	
	|positionChange|
	
	positionChange := head  moveForward. 
	positionLog ifNotNil: [positionLog add: positionChange] .
	movementLog ifNotNil: [movementLog add: positionChange ] ! !

!MarsRover methodsFor: 'moving' stamp: 'GL 11/12/2024 20:28:02'!
moveNorth
	
	^position := position + (0@1).! !

!MarsRover methodsFor: 'moving' stamp: 'GL 11/12/2024 20:28:09'!
moveSouth
	
	^position := position + (0@-1).
! !

!MarsRover methodsFor: 'moving' stamp: 'GL 11/12/2024 20:28:15'!
moveWest
	
	^position := position + (-1@0).! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'loggers' stamp: 'GL 11/12/2024 20:57:03'!
attach: anObserver

	subject attach: anObserver. ! !

!MarsRover methodsFor: 'loggers' stamp: 'GL 11/12/2024 19:56:40'!
attachMovementLog: aMovementLog 

	movementLog := aMovementLog. 	
! !

!MarsRover methodsFor: 'loggers' stamp: 'GL 11/12/2024 19:36:17'!
attachPositionLog: aPositionLog 
	
	positionLog := aPositionLog.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: #'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!classDefinition: #MarsRoverHeadingNorth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!classDefinition: #MarsRoverHeadingSouth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!classDefinition: #MarsRoverHeadingWest category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!classDefinition: #Observer category: #'MarsRover-WithHeading'!
Object subclass: #Observer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!


!classDefinition: #MovementLog category: #'MarsRover-WithHeading'!
Observer subclass: #MovementLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MovementLog methodsFor: 'accessing' stamp: 'GL 11/12/2024 20:58:43'!
display! !


!MovementLog methodsFor: 'intialization' stamp: 'GL 11/12/2024 20:59:53'!
initialize 
	! !


!classDefinition: #PositionLog category: #'MarsRover-WithHeading'!
Observer subclass: #PositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!PositionLog methodsFor: 'accesing' stamp: 'GL 11/12/2024 21:00:12'!
display
! !


!PositionLog methodsFor: 'initialization' stamp: 'GL 11/12/2024 21:00:38'!
initialize
	! !


!classDefinition: #Subject category: #'MarsRover-WithHeading'!
Object subclass: #Subject
	instanceVariableNames: 'observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Subject methodsFor: 'attach' stamp: 'GL 11/12/2024 20:57:43'!
attach: anObserver
	
	observers add: anObserver. ! !



!Subject methodsFor: 'as yet unclassified' stamp: 'GL 11/12/2024 20:58:05'!
initialize

	observers := OrderedCollection new. ! !
