!classDefinition: #ShopCartTest category: #'Ejercicio-TusLibros'!
TestCase subclass: #ShopCartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!


!classDefinition: #ShopCart category: #'Ejercicio-TusLibros'!
Object subclass: #ShopCart
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!ShopCart methodsFor: 'add' stamp: 'GL 11/5/2024 15:41:35'!
addToCart: aBookISBN withAmout: anAmount
	
	self assertItsAValidAmount: anAmount.
	
	books at: aBookISBN  ifPresent: [books at: aBookISBN put: (books at: aBookISBN + anAmount) ]
						ifAbsent: [books at: aBookISBN put: anAmount]! !

!ShopCart methodsFor: 'add' stamp: 'GL 11/5/2024 15:42:04'!
assertAmountIsInteger: anAmount

	^ anAmount isInteger ifFalse: [self error: 'Cannot add a not Integer books amount']! !

!ShopCart methodsFor: 'add' stamp: 'GL 11/5/2024 15:41:52'!
assertAmountIsPositive: anAmount

	^ anAmount <= 0 ifTrue: [self error: 'Amount of books should be greater than zero']! !

!ShopCart methodsFor: 'add' stamp: 'GL 11/5/2024 15:42:04'!
assertItsAValidAmount: anAmount

	self assertAmountIsPositive: anAmount.
	self assertAmountIsInteger: anAmount! !


!ShopCart methodsFor: 'list' stamp: 'GL 11/5/2024 15:39:19'!
productsList

	^books keys.! !


!ShopCart methodsFor: 'initialization' stamp: 'GL 11/5/2024 15:33:27'!
initialize
	
	books := Dictionary new. ! !


!ShopCart methodsFor: 'testing' stamp: 'GL 11/5/2024 15:37:58'!
isEmpty

	^books isEmpty. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShopCart class' category: #'Ejercicio-TusLibros'!
ShopCart class
	instanceVariableNames: ''!

!ShopCart class methodsFor: 'instance creation' stamp: 'GL 11/5/2024 15:32:03'!
createShopCar

	^self new.! !
