!classDefinition: #Automobil category: #'2.Replace-if-State'!
Object subclass: #Automobil
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobil methodsFor: 'initialization' stamp: 'GL 9/5/2024 12:53:08'!
initialize

	state := Apagado new.
	speed := 0 * kilometer / hour.! !


!Automobil methodsFor: 'move' stamp: 'GL 9/5/2024 13:08:29'!
accelerate
	state := state accelerate: self.! !

!Automobil methodsFor: 'move' stamp: 'GL 9/5/2024 13:07:59'!
changeSpeed
	speed := speed + (10 * kilometer / hour)! !

!Automobil methodsFor: 'move' stamp: 'GL 9/5/2024 12:55:21'!
turnOn

	state := Prendido new! !


!classDefinition: #Estado category: #'2.Replace-if-State'!
Object subclass: #Estado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Estado methodsFor: 'as yet unclassified' stamp: 'GL 9/5/2024 12:56:29'!
accelerate: automobil! !


!classDefinition: #Apagado category: #'2.Replace-if-State'!
Estado subclass: #Apagado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Apagado methodsFor: 'as yet unclassified' stamp: 'GL 9/5/2024 12:57:52'!
accelerate: automobil
	self error: 'Can not accelerate when turned off'
	! !


!classDefinition: #Prendido category: #'2.Replace-if-State'!
Estado subclass: #Prendido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Prendido methodsFor: 'as yet unclassified' stamp: 'GL 9/5/2024 13:08:48'!
accelerate: automobil
	automobil changeSpeed. ! !
