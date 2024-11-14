!classDefinition: #MarsRoverLogTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLogTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 17:13:51'!
test01positionLogOfAMarsRoverWithNoPositionChangeIsEmpty

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	positionLog := PositionLog new. 

	marsRover attach: positionLog. 
	
	self assert: positionLog display isEmpty.! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 17:52:29'!
test02forwardMovementOfMarsRoverIsDisplayOnPositionLog

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	positionLog := PositionLog new.
	
	marsRover attach: positionLog. 
	marsRover process: 'f'. 
	
	self assert: (positionLog display includes: (0@1))! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 18:04:17'!
test03backwardMovementOfAMarsRoverIsShownInPositionLog

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	positionLog := PositionLog new.
	
	marsRover attach: positionLog. 
	marsRover process: 'b'. 
	
	self assert: (positionLog display includes: (0@-1)).! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 18:04:36'!
test04allPositionMovementsAreShownInPositionLog

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingEast.
	positionLog := PositionLog new.
	
	marsRover attach: positionLog. 
	marsRover process: 'fbbf'. 
	
	self assert: (positionLog display includes: (1@0)).
	self assert: (positionLog display includes: (0@0)).
	self assert: (positionLog display includes: (-1@0)).
	self assert: (positionLog display includes: (0@0))! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 17:41:36'!
test05movementLogOfAMarsRoverWithNoPositionChangeIsEmpty

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := MovementLog new.

	marsRover attach: movementLog. 
	
	self assert: movementLog display isEmpty.! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 17:43:40'!
test06forwardMovemenOfMarsRoverIsShownInMovementLog

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := MovementLog new.
	
	marsRover attach: movementLog. 
	marsRover process: 'f'. 
	
	self assert: (movementLog display includes: (0@1))! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 17:44:40'!
test07backwardMovementOfMarsRoverIsShownInMovementLog

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := MovementLog new.
	
	marsRover attach: movementLog. 
	marsRover process: 'b'. 
	
	self assert: (movementLog display includes: (0@-1)).! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 17:46:09'!
test08rightRotationMovementIsOfMarsRoverIsDisplayOnMovementLog

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := MovementLog new.
	
	marsRover attach: movementLog. 
	marsRover process: 'r'. 
	
	self assert: (movementLog display includes: 'a MarsRoverHeadingEast' ).
! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 17:47:19'!
test09leftRotationOfMarsRoverIsDisplayOnMovementLog

	|marsRover movementLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	movementLog := MovementLog new.
	
	marsRover attach: movementLog. 
	marsRover process: 'l'. 
	
	self assert: (movementLog display includes: 'a MarsRoverHeadingWest' )! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'GL 11/13/2024 17:51:44'!
test10allPositionMovementAndRotationOfAMarsRoverAreDisplayInMovementLog

	|marsRover positionLog|

	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth.
	positionLog := MovementLog new.
	
	marsRover attach: positionLog. 
	marsRover process: 'flbr'. 
	
	self assert: (positionLog display includes: (0@1)).
	self assert: (positionLog display includes: 'a MarsRoverHeadingWest').
	self assert: (positionLog display includes: (1@1)).
	self assert: (positionLog display includes: 'a MarsRoverHeadingNorth').
	! !


!classDefinition: #MarsRoverLogWindow category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLogWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:17:31'!
test00

	|positionWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	positionWindow := PositionWindow new.
	
	marsRover attach: positionWindow.
	
	self assert: positionWindow position equals: ''. 
	! !

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:27:08'!
test01

	|positionWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	positionWindow := PositionWindow new.
	
	marsRover attach: positionWindow.
	marsRover process: 'f'.
	
	self assert: positionWindow position equals: '0@1'. 
	! !

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:28:46'!
test02

	|positionWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	positionWindow := PositionWindow new.
	
	marsRover attach: positionWindow.
	marsRover process: 'b'.
	
	self assert: positionWindow position equals: '0@ -1'. 
	! !

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:28:09'!
test03

	|positionWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	positionWindow := PositionWindow new.
	
	marsRover attach: positionWindow.
	marsRover process: 'ffbf'.
	
	self assert: positionWindow position equals: '0@2'. 
	! !

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:39:11'!
test04

	|movementWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	movementWindow := MovementWindow new.
	
	marsRover attach: movementWindow.
	marsRover process: 'f'.
	
	self assert: movementWindow position equals: '0@1'.
	self assert: movementWindow head equals: ''. ! !

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:45:34'!
test05

	|movementWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	movementWindow := MovementWindow new.
	
	marsRover attach: movementWindow.
	marsRover process: 'b'.
	
	self assert: movementWindow position equals: '0@ -1'.
	self assert: movementWindow head equals: ''. ! !

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:39:53'!
test06

	|movementWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	movementWindow := MovementWindow new.
	
	marsRover attach: movementWindow.
	marsRover process: 'r'.
	
	self assert: movementWindow position equals: ''.
	self assert: movementWindow head equals: 'a MarsRoverHeadingEast'. ! !

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:41:52'!
test07

	|movementWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	movementWindow := MovementWindow new.
	
	marsRover attach: movementWindow.
	marsRover process: 'l'.
	
	self assert: movementWindow position equals: ''.
	self assert: movementWindow head equals: 'a MarsRoverHeadingWest'. ! !

!MarsRoverLogWindow methodsFor: 'Test' stamp: 'GL 11/13/2024 18:45:03'!
test08

	|movementWindow marsRover|
	
	marsRover := MarsRover at: (0@0) heading: MarsRoverHeadingNorth. 
	movementWindow := MovementWindow new.
	
	marsRover attach: movementWindow.
	marsRover process: 'fflbr'.
	
	self assert: movementWindow position equals: '1@2'.
	self assert: movementWindow head equals: 'a MarsRoverHeadingNorth'. ! !


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

!MarsRover methodsFor: 'heading' stamp: 'GL 11/13/2024 17:10:22'!
rotateLeft
	
	head rotateLeft.
	subject notifyStateChange: (RotationVisitor with: head). ! !

!MarsRover methodsFor: 'heading' stamp: 'GL 11/13/2024 17:10:28'!
rotateRight
	
	head rotateRight.
	subject notifyStateChange: (RotationVisitor with: head).! !


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


!MarsRover methodsFor: 'moving' stamp: 'GL 11/13/2024 17:10:57'!
moveBackward
	
	head moveBackward. 
	subject  notifyStateChange: (PositionVisitor with: position).! !

!MarsRover methodsFor: 'moving' stamp: 'GL 11/12/2024 20:27:53'!
moveEast
	
	^position := position + (1@0).
	! !

!MarsRover methodsFor: 'moving' stamp: 'GL 11/13/2024 17:11:20'!
moveForward
	
	head  moveForward. 
	subject notifyStateChange: (PositionVisitor with: position).! !

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

!Observer methodsFor: 'visit' stamp: 'GL 11/13/2024 16:47:05'!
accept: aVisitor

	self subclassResponsibility! !


!classDefinition: #MovementLog category: #'MarsRover-WithHeading'!
Observer subclass: #MovementLog
	instanceVariableNames: 'displayLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MovementLog methodsFor: 'accessing' stamp: 'GL 11/13/2024 16:49:36'!
addToLog: aMovement

	displayLog add: aMovement. ! !

!MovementLog methodsFor: 'accessing' stamp: 'GL 11/13/2024 16:45:24'!
display

	^displayLog.! !


!MovementLog methodsFor: 'intialization' stamp: 'GL 11/13/2024 16:45:37'!
initialize 
	
	displayLog := OrderedCollection new. ! !


!MovementLog methodsFor: 'visit' stamp: 'GL 11/13/2024 17:22:50'!
accept: aVisitor

	aVisitor visitMovementLog: self.! !


!classDefinition: #MovementWindow category: #'MarsRover-WithHeading'!
Observer subclass: #MovementWindow
	instanceVariableNames: 'actualPosition actualHeading position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MovementWindow methodsFor: 'accessing' stamp: 'GL 11/13/2024 18:36:27'!
head
	
	^head.! !

!MovementWindow methodsFor: 'accessing' stamp: 'GL 11/13/2024 18:35:34'!
position
	
	^position.! !

!MovementWindow methodsFor: 'accessing' stamp: 'GL 11/13/2024 18:41:11'!
updateHead: aHeadRotation 

	head := aHeadRotation asString. 	! !

!MovementWindow methodsFor: 'accessing' stamp: 'GL 11/13/2024 18:38:33'!
updatePosition: aPosition 
	
	position := aPosition asString. ! !


!MovementWindow methodsFor: 'initialization' stamp: 'GL 11/13/2024 18:36:06'!
initialize
	
	position := ''.
	head := ''.! !


!MovementWindow methodsFor: 'visit' stamp: 'GL 11/13/2024 18:37:51'!
accept: aVisitor
	
	aVisitor visitMovementWindow: self.! !


!classDefinition: #PositionLog category: #'MarsRover-WithHeading'!
Observer subclass: #PositionLog
	instanceVariableNames: 'displayLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!PositionLog methodsFor: 'accesing' stamp: 'GL 11/13/2024 16:49:52'!
addToLog: aPosition

	displayLog add: aPosition. ! !

!PositionLog methodsFor: 'accesing' stamp: 'GL 11/13/2024 16:45:16'!
display

	^displayLog. ! !


!PositionLog methodsFor: 'initialization' stamp: 'GL 11/13/2024 16:46:21'!
initialize
	
	displayLog := OrderedCollection new. ! !


!PositionLog methodsFor: 'visit' stamp: 'GL 11/13/2024 17:15:17'!
accept: aVisitor

	aVisitor visitPositionLog: self.
! !


!classDefinition: #PositionWindow category: #'MarsRover-WithHeading'!
Observer subclass: #PositionWindow
	instanceVariableNames: 'actualPosition position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!PositionWindow methodsFor: 'accessing' stamp: 'GL 11/13/2024 18:18:02'!
position
	
	^position.! !

!PositionWindow methodsFor: 'accessing' stamp: 'GL 11/13/2024 18:26:50'!
updatePosition: aPosition

	position := aPosition asString.! !


!PositionWindow methodsFor: 'initialization' stamp: 'GL 11/13/2024 18:21:45'!
initialize

	position := ''.! !


!PositionWindow methodsFor: 'visit' stamp: 'GL 11/13/2024 18:25:50'!
accept: aVisitor

	aVisitor visitPositionWindow: self.! !


!classDefinition: #Subject category: #'MarsRover-WithHeading'!
Object subclass: #Subject
	instanceVariableNames: 'observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Subject methodsFor: 'attach' stamp: 'GL 11/12/2024 20:57:43'!
attach: anObserver
	
	observers add: anObserver. ! !


!Subject methodsFor: 'initialization' stamp: 'GL 11/12/2024 20:58:05'!
initialize

	observers := OrderedCollection new. ! !

!Subject methodsFor: 'initialization' stamp: 'GL 11/13/2024 16:53:25'!
notifyStateChange: aStateChange

	observers do: [:aObserver | aObserver accept: aStateChange ].  ! !


!classDefinition: #Visitor category: #'MarsRover-WithHeading'!
Object subclass: #Visitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Visitor methodsFor: 'operation' stamp: 'GL 11/13/2024 17:00:43'!
visitMovementLog: aMovementLog

	self subclassResponsibility! !

!Visitor methodsFor: 'operation' stamp: 'GL 11/13/2024 17:00:47'!
visitPositionLog: aPositionLog

	self subclassResponsibility! !


!Visitor methodsFor: 'initialization' stamp: 'GL 11/13/2024 17:09:09'!
initializeWith: aPosition

	self subclassResponsibility! !


!classDefinition: #PositionVisitor category: #'MarsRover-WithHeading'!
Visitor subclass: #PositionVisitor
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!PositionVisitor methodsFor: 'operation' stamp: 'GL 11/13/2024 17:02:18'!
visitMovementLog: aMovementLog

	aMovementLog  addToLog: position. ! !

!PositionVisitor methodsFor: 'operation' stamp: 'GL 11/13/2024 18:38:16'!
visitMovementWindow: aMovementWindow 
	
	aMovementWindow updatePosition: position.! !

!PositionVisitor methodsFor: 'operation' stamp: 'GL 11/13/2024 17:02:31'!
visitPositionLog: aPositionLog

	aPositionLog addToLog: position. ! !

!PositionVisitor methodsFor: 'operation' stamp: 'GL 11/13/2024 18:26:22'!
visitPositionWindow: aPositionWindow

	aPositionWindow updatePosition: position. ! !


!PositionVisitor methodsFor: 'initialization' stamp: 'GL 11/13/2024 17:09:43'!
initializeWith: aPosition

	position := aPosition. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositionVisitor class' category: #'MarsRover-WithHeading'!
PositionVisitor class
	instanceVariableNames: ''!

!PositionVisitor class methodsFor: 'instance creation' stamp: 'GL 11/13/2024 17:07:25'!
with: aPosition

	^self new initializeWith: aPosition.! !


!classDefinition: #RotationVisitor category: #'MarsRover-WithHeading'!
Visitor subclass: #RotationVisitor
	instanceVariableNames: 'rotation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!RotationVisitor methodsFor: 'operation' stamp: 'GL 11/13/2024 17:02:44'!
visitMovementLog: aMovementLog

	aMovementLog addToLog: rotation asString. ! !

!RotationVisitor methodsFor: 'operation' stamp: 'GL 11/13/2024 18:40:46'!
visitMovementWindow: aMovementWindow 
	
	aMovementWindow updateHead: rotation. ! !

!RotationVisitor methodsFor: 'operation' stamp: 'GL 11/13/2024 17:00:47'!
visitPositionLog: aPositionLog! !


!RotationVisitor methodsFor: 'initialization' stamp: 'GL 11/13/2024 17:09:27'!
initializeWith: aRotation

	rotation := aRotation. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotationVisitor class' category: #'MarsRover-WithHeading'!
RotationVisitor class
	instanceVariableNames: ''!

!RotationVisitor class methodsFor: 'instance creation' stamp: 'GL 11/13/2024 17:08:31'!
with: aRotation

	^self new initializeWith: aRotation. ! !
