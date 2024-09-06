!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'GL 9/4/2024 17:59:33'!
accelerate
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'GL 9/4/2024 18:00:23'!
initialize
	^super initializeWithType: self class! !


!classDefinition: #Motorcycle category: #'1.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Motorcycle methodsFor: 'move' stamp: 'GL 9/3/2024 21:18:40'!
accelerate
	speed := speed + (20 * kilometer / hour)! !


!Motorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/4/2024 18:01:20'!
initialize
	^super initializeWithType: self class! !
