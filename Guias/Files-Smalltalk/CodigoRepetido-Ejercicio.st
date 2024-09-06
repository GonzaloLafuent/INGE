!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 17:09:11'!
action: anAction shouldFailOn: typeOfError do: aCatchBlock 

	[ anAction value.
	self fail ]
		on: typeOfError 
		do: aCatchBlock! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 13:08:16'!
action: anAction shouldTakeLessThan: aTimeMeasureInMilliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	anAction value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aTimeMeasureInMilliseconds)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 17:28:09'!
createACostumerBookWith: aPerson
	|customerBook|
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aPerson.
	^customerBook
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 9/3/2024 21:05:37'!
in: customerBook costumersShouldBe: numberOfCostumers includes: person
			self assert: customerBook numberOfCustomers = numberOfCostumers.
			self assert: (customerBook includesCustomerNamed: person). ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 18:07:34'!
in: customerBook shouldBeThisAmountOfCostumers: total active: active suspendend: suspended  
	self assert: active equals: customerBook numberOfActiveCustomers.
	self assert: suspended equals: customerBook numberOfSuspendedCustomers.
	self assert: total equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 13:05:49'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	|customerBook|

	customerBook := CustomerBook new.		

	self action: [customerBook addCustomerNamed: 'John Lennon'.] shouldTakeLessThan: (50 * millisecond).	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 17:29:18'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self createACostumerBookWith: paulMcCartney.

	self action: [customerBook removeCustomerNamed: paulMcCartney.] shouldTakeLessThan: (100*millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 17:16:22'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self action: [customerBook addCustomerNamed: ''.] 
		shouldFailOn: Error 
		do: [ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
					    self assert: customerBook isEmpty ].
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 9/3/2024 21:07:39'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.		
	customerBook := self createACostumerBookWith: johnLennon.
	
	self action: [customerBook removeCustomerNamed: 'Paul McCartney'] shouldFailOn: NotFound 
		do: [ :anError | self in: customerBook costumersShouldBe: 1 includes: johnLennon ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 18:09:49'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createACostumerBookWith: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self in: customerBook shouldBeThisAmountOfCostumers: 1 
													active: 0
													suspendend: 1.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney ).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 8/31/2024 18:08:13'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createACostumerBookWith: paulMcCartney. 
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
		
	self in: customerBook shouldBeThisAmountOfCostumers: 0 
								  active: 0 
								  suspendend: 0.
								
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 9/3/2024 21:07:03'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.		
	customerBook := self createACostumerBookWith: johnLennon.
	
	self action: [customerBook suspendCustomerNamed: 'George Harrison'] 
		shouldFailOn: CantSuspend 
		do: [ :anError | self in: customerBook costumersShouldBe: 1 includes: johnLennon ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GL 9/3/2024 21:05:55'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := self createACostumerBookWith: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self action:[customerBook suspendCustomerNamed: johnLennon.]  
		shouldFailOn: CantSuspend 
		do: [ :anError | self in: customerBook costumersShouldBe: 1 includes: johnLennon]
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
