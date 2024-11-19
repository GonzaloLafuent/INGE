!classDefinition: #MinefieldTest category: #'2°Parcial - 2°Cuatrimestre 2023'!
TestCase subclass: #MinefieldTest
	instanceVariableNames: 'random'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!MinefieldTest methodsFor: 'support' stamp: 'GL 11/18/2024 18:45:52'!
invalidRamdomPosition

	^(5@5).! !

!MinefieldTest methodsFor: 'support' stamp: 'GL 11/18/2024 18:46:21'!
randomPosition

	^random value.! !

!MinefieldTest methodsFor: 'support' stamp: 'GL 11/18/2024 18:45:32'!
validRamdomPosition

	^(2@2).! !


!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test01MinefieldHeightHasToBeGreaterThanTwo

	self should: [Minefield withHeight: 1 width: 2 lifes: 1 startinOn:(1@1) aColectionOfProps: Dictionary new randomizeBy: self]  
		raise: Error-MessageNotUnderstood 
		withMessageText: Minefield invalidDimentionsErrorMessage. 
	

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test02MinefieldWidthHasToBeGreaterThanTwo

	self should: [Minefield withHeight: 2 width: 1 lifes: 1 startinOn:(1@1) aColectionOfProps: Dictionary new randomizeBy: self]  
		raise: Error-MessageNotUnderstood 
		withMessageText: Minefield invalidDimentionsErrorMessage. 
	

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test03MinefieldLifesHasToBeGreaterThanZero

	self should: [Minefield withHeight: 2 width: 2 lifes: 0 startinOn:(1@1) aColectionOfProps: Dictionary new randomizeBy: self]  
		raise: Error-MessageNotUnderstood 
		withMessageText: Minefield invalidLifesAmountErrorMessage . 
	

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test04MinefieldCannotStartInPositionOutsideTheMap

	self should: [Minefield withHeight: 2 width: 2 lifes: 2 startinOn:(3@3) aColectionOfProps: Dictionary new randomizeBy: self]  
		raise: Error-MessageNotUnderstood 
		withMessageText: Minefield invalidStartingPositionErrorMessage . 
	

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test05MinefieldCannotStartInPositionNotLocatedInTheFirstRow

	self should: [Minefield withHeight: 2 width: 2 lifes: 2 startinOn:(2@2) aColectionOfProps: Dictionary new randomizeBy: self]  
		raise: Error-MessageNotUnderstood 
		withMessageText: Minefield invalidStartingPositionErrorMessage . 
	

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test06MinefieldCannotStartInPositionNotFree

	self should: [Minefield withHeight: 2 width: 2 lifes: 2 startinOn:(1@1) aColectionOfProps: (Dictionary newFromPairs:{(1@1). #Mine}) randomizeBy: self ]  
		raise: Error-MessageNotUnderstood 
		withMessageText: Minefield invalidStartingPositionErrorMessage . 
	

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test06MovePlayerBackwardsInEndOfTheMinefieldDoesntAffectPosition

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 2 startinOn:(1@1) aColectionOfProps: Dictionary new randomizeBy: self.
	
	minefield moveDown.
	
	self assert: (minefield actualPositionIs: (1@1)) 

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test07MovePlayerLeftInEndOfTheMinefieldDoesntAffectPosition

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 2 startinOn:(1@1) aColectionOfProps: Dictionary new randomizeBy: self.
	
	minefield moveLeft.
	
	self assert: (minefield actualPositionIs: (1@1)) 

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test08MovePlayerRightInEndOfTheMinefieldDoesntAffectPosition

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 2 startinOn:(2@1) aColectionOfProps: Dictionary new randomizeBy: self.
	
	minefield moveRight.
	
	self assert: (minefield actualPositionIs: (2@1)) 

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test09MovePlayerUpInEndOfTheMinefieldDoesntAffectPosition

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 2 startinOn:(1@1) aColectionOfProps: Dictionary new randomizeBy: self.
	
	minefield moveRight.
	minefield moveUp.
	minefield moveUp. 
	
	self assert: (minefield actualPositionIs: (2@2)) 

	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test10PlayerCanMoveUp

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {}) randomizeBy: self.
	
	minefield moveUp. 
	
	self assert: (minefield actualPositionIs: (1@2)).
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test11PlayerCanMoveDown

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {}) randomizeBy: self.
	
	minefield moveUp.
	minefield moveDown. 
	
	self assert: (minefield actualPositionIs: (1@1)).
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test12PlayerCanMoveRight

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {}) randomizeBy: self.
	
	minefield moveRight.
	 
	self assert: (minefield actualPositionIs: (2@1)).
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test13PlayerCanMoveLeft

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 3 startinOn:(2@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {}) randomizeBy: self.
	
	minefield moveLeft.
	 
	self assert: (minefield actualPositionIs: (1@1)).
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test14PlayerLosesOneLifeAfterStepIntoALowMine

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(2@1). LowMine new}) randomizeBy: self.
	
	minefield moveRight. 
	
	self assert: (minefield actualPositionIs: (2@1)).
	self assert: (minefield lifesLeftAre: 2) . 
	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:43:50'!
test15LowMineOnlyLiveOnceAfterBeingStep

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(2@1). LowMine new}) randomizeBy: self.
	
	minefield moveRight. 
	minefield moveLeft. 
	
	self assert: (minefield actualPositionIs: (1@1)).
	self assert: (minefield lifesLeftAre: 2) . 
	self assert: (minefield isPositionFree: (2@1) ).
	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 20:24:43'!
test16PlayerLosesTwoLifeAfterStepIntoAHighMine

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(2@1). HighMine new}) randomizeBy: self.
	
	random  := [(0@0)].
	
	minefield moveRight. 
	
	self assert: (minefield actualPositionIs: (2@1)).
	self assert: (minefield lifesLeftAre: 1) . 
	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 20:24:35'!
test17HighMineOnlyLiveOnceAfterBeingStep

	|minefield|

	minefield := Minefield withHeight: 2 width: 2 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(2@1). HighMine new}) randomizeBy: self.
	random  := [(0@0)].
	
	minefield moveRight. 
	minefield moveLeft. 
	
	self assert: (minefield actualPositionIs: (1@1)).
	self assert: (minefield lifesLeftAre: 1) . 
	self assert: (minefield isPositionFree: (2@1) ).
	
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 18:47:59'!
test18PlayFliesAwayAfterSteppingAHighMine

	|minefield|

	minefield := Minefield withHeight: 4 width: 4 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(2@1). HighMine new}) randomizeBy: self.
	
	random := [self validRamdomPosition ].
	
	minefield moveRight. 
	
	self assert: (minefield actualPositionIs: (4@3)).
	self assert: (minefield lifesLeftAre: 1) . 
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 20:23:21'!
test19PlayerDosentFliesAwayAfterSteppingAHighMineBecauseItsAPositionOutOfBounds

	|minefield|

	minefield := Minefield withHeight: 4 width: 4 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(2@1). HighMine new}) randomizeBy: self.
	
	random := [self invalidRamdomPosition ].
	
	minefield moveRight. 
	
	self assert: (minefield actualPositionIs: (2@1)).
	self assert: (minefield lifesLeftAre: 1) . 
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 20:47:05'!
test20PlayerWearinALightArmourDosentLooseLifesAfterSteppingALowMine
	
	|minefield|

	minefield := Minefield withHeight: 4 width: 4 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(3@1). LowMine new. (2@1). LightArmour new}) 
						     randomizeBy: self.
	
	minefield moveRight.
	minefield moveRight. 
	
	self assert: (minefield actualPositionIs: (3@1)).
	self assert: (minefield lifesLeftAre: 3) . 
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 20:54:39'!
test21PlayerWearinALightArmourDosentLooseLifesAfterSteppingAHighMine
	
	|minefield|

	minefield := Minefield withHeight: 4 width: 4 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(3@1). HighMine new. (2@1). LightArmour new}) 
						     randomizeBy: self.
	
	random := [self validRamdomPosition ].
	
	minefield moveRight.
	minefield moveRight. 
	
	self assert: (minefield actualPositionIs: (3@1)).
	self assert: (minefield lifesLeftAre: 3) . 
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 21:02:23'!
test22PlayerWearinALightArmourFliesHalfTheValueLifesAfterSteppingAHighMine
	
	|minefield|

	minefield := Minefield withHeight: 4 width: 4 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(3@1). HighMine new. (2@1). LightArmour new}) 
						     randomizeBy: self.
	
	random := [self validRamdomPosition ].
	
	minefield moveRight.
	minefield moveRight. 
	
	self assert: (minefield actualPositionIs: (3@1)).
	self assert: (minefield lifesLeftAre: 3) . 
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 21:11:24'!
test23PlayerWearringAHeavyArmourCanBeUseTwiceForLowMines
	
	|minefield|

	minefield := Minefield withHeight: 4 width: 4 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(3@1). LowMine new. (2@1). HeavyArmour new.
																		(4@1). LowMine new}) 
						     randomizeBy: self.

	minefield moveRight.
	minefield moveRight. 
	minefield moveRight.
	
	self assert: (minefield actualPositionIs: (4@1)).
	self assert: (minefield lifesLeftAre: 3) . 
	
	
	
	 ! !

!MinefieldTest methodsFor: 'test' stamp: 'GL 11/18/2024 21:14:01'!
test24PlayerWearringAHeavyArmourDosentLooseLifeAndFliesAwayAfterSteppingAHighMine
	
	|minefield|

	minefield := Minefield withHeight: 4 width: 4 lifes: 3 startinOn:(1@1) 
	                                       aColectionOfProps: (Dictionary newFromPairs: {(3@1). LowMine new. (2@1). HeavyArmour new.}) 
						     randomizeBy: self.
	minefield moveRight.
	minefield moveRight. 
	
	self assert: (minefield actualPositionIs: (3@1)).
	self assert: (minefield lifesLeftAre: 3) . 
	
	
	
	 ! !


!classDefinition: #Minefield category: #'2°Parcial - 2°Cuatrimestre 2023'!
Object subclass: #Minefield
	instanceVariableNames: 'height width lifes position props armour ramdom'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!Minefield methodsFor: 'testing' stamp: 'GL 11/18/2024 16:17:38'!
actualPositionIs: aPosition

	^position = aPosition. ! !

!Minefield methodsFor: 'testing' stamp: 'GL 11/18/2024 17:14:23'!
isPositionFree: aPosition

	^(props keys includes: aPosition) not.! !

!Minefield methodsFor: 'testing' stamp: 'GL 11/18/2024 17:02:57'!
playerLoss

	^lifes = 0.! !

!Minefield methodsFor: 'testing' stamp: 'GL 11/18/2024 17:02:46'!
playerWins
! !


!Minefield methodsFor: 'initialization' stamp: 'GL 11/18/2024 18:44:58'!
initializeWithHeight: aHeightValue width: aWidthValue lifes: anAmountOfLifes startinOn: aStartingPosition withProps: collectionOfProps aRamdomSystem: ramdomizeBy   
	
	height := aHeightValue.
	width := aWidthValue.
	lifes := anAmountOfLifes.
	position := aStartingPosition.
	props := collectionOfProps.
	armour := NullArmour new.
	ramdom :=  ramdomizeBy. ! !


!Minefield methodsFor: 'lifes' stamp: 'GL 11/18/2024 17:45:24'!
deacresePlayerLifesBy: aNumberOfLifes

	lifes := lifes - aNumberOfLifes. ! !

!Minefield methodsFor: 'lifes' stamp: 'GL 11/18/2024 17:41:40'!
lifesLeftAre: aNumberOfLifes

	^lifes = aNumberOfLifes. ! !


!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 17:50:48'!
assertItsBettwenLimits: aPositionValue

	^ aPositionValue between: (1@1) and: (height@width)! !

!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 17:50:40'!
changePosition: aPositionValue

	(self assertItsBettwenLimits: aPositionValue + position) ifTrue: [position := position + aPositionValue]! !

!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 17:49:37'!
changePositionBy: aPositionValue

	self changePosition: aPositionValue.
	
	self playerGetsAffectedBy ! !

!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 16:43:54'!
moveDown
	
	self changePositionBy: (0@-1).! !

!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 16:44:10'!
moveLeft

	self changePositionBy: (-1@0).! !

!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 17:49:55'!
moveRight

	self changePositionBy: (1@0). ! !

!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 16:44:45'!
moveUp

	self changePositionBy: (0@1).! !

!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 18:31:17'!
playerGetsAffectedBy

	(self isPositionFree: position) ifFalse:[(props at: position) affectsPlayerIn: self ]! !

!Minefield methodsFor: 'moving' stamp: 'GL 11/18/2024 20:55:41'!
ramdomPosition
	
	^ramdom randomPosition.! !


!Minefield methodsFor: 'effects' stamp: 'GL 11/18/2024 20:41:41'!
destroyArmour

	armour := NullArmour new. ! !

!Minefield methodsFor: 'effects' stamp: 'GL 11/18/2024 20:33:35'!
equipArmour: anArmour 
	
	armour := anArmour. ! !

!Minefield methodsFor: 'effects' stamp: 'GL 11/18/2024 18:35:05'!
erasePropAt: aPosition

	props removeKey: aPosition. ! !

!Minefield methodsFor: 'effects' stamp: 'GL 11/18/2024 20:48:44'!
playerGetsAffectedByHighMine

	armour playerGetsAffectedByHighMineAt: position inAMinefield: self.! !

!Minefield methodsFor: 'effects' stamp: 'GL 11/18/2024 20:42:28'!
playerGetsAffectedByLowMine

	armour playerGetsAffectedByLowMineAt: position inAMinefield: self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Minefield class' category: #'2°Parcial - 2°Cuatrimestre 2023'!
Minefield class
	instanceVariableNames: ''!

!Minefield class methodsFor: 'instance creation' stamp: 'GL 11/18/2024 18:44:46'!
withHeight: aHeightValue width: aWidthValue lifes: anAmountOfLifes startinOn: aStartingPosition aColectionOfProps: collectionOfProps randomizeBy: aRamdomSystem   

	self assertValidHeight: aHeightValue andWidth: aWidthValue. 
	self assertLifesAreGreaterOrEqualToOne: anAmountOfLifes. 
	self assertValidStartingPosition: aStartingPosition forHeight: aHeightValue andWidth: aWidthValue.
	self assertStartingPosition: aStartingPosition doesntCollideWith: collectionOfProps. 	 

	^self new initializeWithHeight: aHeightValue width: aWidthValue lifes: anAmountOfLifes startinOn: aStartingPosition withProps: collectionOfProps aRamdomSystem: aRamdomSystem ! !


!Minefield class methodsFor: 'error messages' stamp: 'GL 11/18/2024 15:47:34'!
invalidDimentionsErrorMessage
	
	^'Invalid dimentions'.! !

!Minefield class methodsFor: 'error messages' stamp: 'GL 11/18/2024 15:58:48'!
invalidLifesAmountErrorMessage

	^'Invalid lifes amount'.! !

!Minefield class methodsFor: 'error messages' stamp: 'GL 11/18/2024 16:07:57'!
invalidStartingPositionErrorMessage

	^'Invalid starting position'! !


!Minefield class methodsFor: 'asserting' stamp: 'GL 11/18/2024 16:02:51'!
assert: aValueToCompare isGreaterOrEqualThan: aValueToBeCompare ifNot: aBlockToExecute 

	^ aValueToBeCompare  <= aValueToCompare ifFalse: [aBlockToExecute value ]! !

!Minefield class methodsFor: 'asserting' stamp: 'GL 11/18/2024 16:02:51'!
assertDimentionIsGreaterThanTwo: aDimentionValue

	self assert: aDimentionValue isGreaterOrEqualThan: 2 ifNot: [self error: self invalidDimentionsErrorMessage ].! !

!Minefield class methodsFor: 'asserting' stamp: 'GL 11/18/2024 16:04:03'!
assertLifesAreGreaterOrEqualToOne: anAmountOfLifes

	self assert: anAmountOfLifes isGreaterOrEqualThan: 1 ifNot: [self error: self invalidLifesAmountErrorMessage ].! !

!Minefield class methodsFor: 'asserting' stamp: 'GL 11/18/2024 16:57:05'!
assertStartingPosition: aStartingPosition doesntCollideWith: aCollectionOfProps

	(aCollectionOfProps keys includes: aStartingPosition) ifTrue: [self error: self invalidStartingPositionErrorMessage ].! !

!Minefield class methodsFor: 'asserting' stamp: 'GL 11/18/2024 15:49:33'!
assertValidHeight: aHeightValue andWidth: aWidthValue

	self assertDimentionIsGreaterThanTwo: aHeightValue. 
	self assertDimentionIsGreaterThanTwo: aWidthValue! !

!Minefield class methodsFor: 'asserting' stamp: 'GL 11/18/2024 16:08:44'!
assertValidStartingPosition: aStartingPosition
! !

!Minefield class methodsFor: 'asserting' stamp: 'GL 11/18/2024 16:55:46'!
assertValidStartingPosition: aStartingPosition forHeight: aHeightValue andWidth: aWidthValue	


	(aStartingPosition between: (1@1) and: (aWidthValue @ 1)) ifFalse: [ self error: self invalidStartingPositionErrorMessage ].! !



!classDefinition: #Prop category: #'2°Parcial - 2°Cuatrimestre 2023'!
Object subclass: #Prop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!Prop methodsFor: 'effects' stamp: 'GL 11/18/2024 18:31:16'!
affectsPlayerIn: aMinefield

	self subclassResponsibility! !


!classDefinition: #HeavyArmour category: #'2°Parcial - 2°Cuatrimestre 2023'!
Prop subclass: #HeavyArmour
	instanceVariableNames: 'lifes'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!HeavyArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 21:10:56'!
affectsPlayerIn: aMinefield

	aMinefield equipArmour: self. ! !

!HeavyArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 21:08:56'!
assertArmourItsALiveForPlayerIn: aMinefield. 

	lifes = 0 ifTrue: [aMinefield destroyArmour ].! !

!HeavyArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 21:12:17'!
decreaseArmourLifeBy: anAmount

	lifes := lifes - anAmount.! !

!HeavyArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 21:12:30'!
playerGetsAffectedByHighMineAt: aPosition inAMinefield: aMinefield 

	self decreaseArmourLifeBy: 2.
	self assertArmourItsALiveForPlayerIn: aMinefield. ! !

!HeavyArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 21:12:35'!
playerGetsAffectedByLowMineAt: aPosition inAMinefield: aMinefield

	self decreaseArmourLifeBy: 1.
	self assertArmourItsALiveForPlayerIn: aMinefield. ! !


!HeavyArmour methodsFor: 'intialization' stamp: 'GL 11/18/2024 21:06:05'!
initialize
	
	lifes := 2.! !


!classDefinition: #HighMine category: #'2°Parcial - 2°Cuatrimestre 2023'!
Prop subclass: #HighMine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!HighMine methodsFor: 'effects' stamp: 'GL 11/18/2024 18:39:44'!
affectsPlayerIn: aMinefield
 
	aMinefield playerGetsAffectedByHighMine.! !


!classDefinition: #LightArmour category: #'2°Parcial - 2°Cuatrimestre 2023'!
Prop subclass: #LightArmour
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!LightArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 20:33:15'!
affectsPlayerIn: aMinefield

	aMinefield equipArmour: self. ! !

!LightArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 20:53:49'!
playerGetsAffectedByHighMineAt: aPosition inAMinefield: aMinefield 
	
	aMinefield destroyArmour. 
	aMinefield erasePropAt: aPosition. 
	aMinefield changePosition: aMinefield ramdomPosition. 
	! !

!LightArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 20:57:25'!
playerGetsAffectedByLowMineAt: aPosition inAMinefield: aMinefield

	aMinefield destroyArmour. 
	aMinefield erasePropAt: aPosition.! !


!classDefinition: #LowMine category: #'2°Parcial - 2°Cuatrimestre 2023'!
Prop subclass: #LowMine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!LowMine methodsFor: 'effects' stamp: 'GL 11/18/2024 18:31:35'!
affectsPlayerIn: aMinefield

	aMinefield playerGetsAffectedByLowMine.! !


!classDefinition: #NullArmour category: #'2°Parcial - 2°Cuatrimestre 2023'!
Prop subclass: #NullArmour
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!NullArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 18:31:17'!
affectsPlayerIn: aMinefield

	self subclassResponsibility! !

!NullArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 20:58:52'!
playerGetsAffectedByHighMineAt: aPosition inAMinefield: aMinefield
	
	aMinefield deacresePlayerLifesBy: 2.
	aMinefield erasePropAt: aPosition.  
	aMinefield changePosition: aMinefield ramdomPosition. ! !

!NullArmour methodsFor: 'effects' stamp: 'GL 11/18/2024 20:58:23'!
playerGetsAffectedByLowMineAt: aPosition inAMinefield: aMinefield
	
	aMinefield deacresePlayerLifesBy: 1.
	aMinefield erasePropAt: aPosition. ! !


!classDefinition: #Tunnel category: #'2°Parcial - 2°Cuatrimestre 2023'!
Prop subclass: #Tunnel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 2°Cuatrimestre 2023'!

!Tunnel methodsFor: 'effects' stamp: 'GL 11/18/2024 18:31:17'!
affectsPlayerIn: aMinefield

	self subclassResponsibility! !
