!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'GL 9/7/2024 11:54:47'!
initialize

	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !

!Vehicle methodsFor: 'initialization' stamp: 'GL 9/7/2024 11:54:37'!
initializeWithType: typeToTake

	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!Vehicle methodsFor: 'move' stamp: 'GL 9/7/2024 11:57:12'!
accelerate
	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'1.Replace-if-Type'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
motorcycle

	^self new initializeWithType: #Motorcycle! !


!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'GL 9/7/2024 11:56:39'!
accelerate
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'GL 9/7/2024 11:55:22'!
initialize
	super initialize.! !


!classDefinition: #Motorcycle category: #'1.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/7/2024 11:57:54'!
accelerate
	speed := speed + (20 * kilometer / hour).! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/7/2024 11:57:44'!
initialize
	super initialize.! !
