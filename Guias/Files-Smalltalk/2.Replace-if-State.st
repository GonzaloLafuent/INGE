!classDefinition: #Automobil category: #'2.Replace-if-State'!
Object subclass: #Automobil
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobil methodsFor: 'initialization' stamp: 'GL 9/7/2024 12:00:32'!
initialize

	state := Off new.
	speed := 0 * kilometer / hour.! !


!Automobil methodsFor: 'move' stamp: 'GL 9/5/2024 13:08:29'!
accelerate
	state := state accelerate: self.! !

!Automobil methodsFor: 'move' stamp: 'GL 9/7/2024 12:02:16'!
accelerateOffAutomobil
	self error: 'Can not accelerate when turned off'! !

!Automobil methodsFor: 'move' stamp: 'GL 9/7/2024 12:04:09'!
accelerateOnAutomobil
	speed := speed + (10 * kilometer / hour)! !

!Automobil methodsFor: 'move' stamp: 'GL 9/7/2024 12:00:47'!
turnOn

	state := On new! !


!classDefinition: #State category: #'2.Replace-if-State'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!State methodsFor: 'as yet unclassified' stamp: 'GL 9/5/2024 12:56:29'!
accelerate: automobil! !


!classDefinition: #Off category: #'2.Replace-if-State'!
State subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Off methodsFor: 'as yet unclassified' stamp: 'GL 9/7/2024 12:03:03'!
accelerate: automobil
	automobil accelerateOffAutomobil .
	! !


!classDefinition: #On category: #'2.Replace-if-State'!
State subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!On methodsFor: 'as yet unclassified' stamp: 'GL 9/7/2024 12:03:30'!
accelerate: automobil
	automobil accelerateOnAutomobil. ! !
