!classDefinition: #CashierTest category: #'Ejercicio-TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!CashierTest methodsFor: 'test' stamp: 'GL 11/5/2024 20:17:54'!
test00CheckoutOfAnEmptyShopCartIsInvalid
	
	|shopCart catalog|
	
	catalog := OrderedCollection new.
	shopCart := ShopCart createShopCartWithCatalog: catalog. 
	
	self should: [Cashier for: shopCart ]  
		raise: Error 
		withMessageText: Cashier invalidShopCartErrorMessage. ! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/5/2024 20:55:30'!
test01CheckoutOfAShopCartWithOneProductChargeThatProduct
	
	|shopCart catalog cashier |
	
	catalog := Dictionary newFromPairs: #('125' 100). 
	shopCart := ShopCart createShopCartWithCatalog: catalog. 
	shopCart addToCart: '125' withAmout: 1.
	
	cashier := Cashier for: shopCart.

	self assert: (cashier checkoutWith: CreditCard new) equals: 100.! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/5/2024 20:55:21'!
test02CheckoutOfAShopCartWithSeveralProductChargeAllTheProducts
	
	|shopCart catalog cashier |
	
	catalog := Dictionary newFromPairs: #('125' 100 '113' 50). 
	shopCart := ShopCart createShopCartWithCatalog: catalog. 
	
	shopCart addToCart: '125' withAmout: 1.
	shopCart addToCart: '113' withAmout: 1.	
	
	cashier := Cashier for: shopCart.

	self assert: (cashier checkoutWith: CreditCard new) equals: 150.! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/5/2024 21:06:43'!
test03CannotCheckoutWithAnInvalidCard
	
	|shopCart catalog cashier |
	
	catalog := Dictionary newFromPairs: #('125' 100 '113' 50). 
	shopCart := ShopCart createShopCartWithCatalog: catalog. 
	
	shopCart addToCart: '125' withAmout: 1.
	shopCart addToCart: '113' withAmout: 1.	
	
	cashier := Cashier for: shopCart.

	self assert: (cashier checkoutWith: CreditCard new) equals: 150.! !


!classDefinition: #ShopCartTest category: #'Ejercicio-TusLibros'!
TestCase subclass: #ShopCartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!


!classDefinition: #Cashier category: #'Ejercicio-TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'shopCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!Cashier methodsFor: 'intialization' stamp: 'GL 11/5/2024 20:07:20'!
initializeWith: aShopCart 

	shopCart := aShopCart.! !


!Cashier methodsFor: 'checkout' stamp: 'GL 11/5/2024 21:02:04'!
checkoutWith: aCreditCard

	 ^shopCart total.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'Ejercicio-TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'GL 11/5/2024 20:09:24'!
for: aShopCart 
	
	aShopCart isEmpty ifTrue: [^self error: self invalidShopCartErrorMessage]. 
	
	^self new initializeWith: aShopCart ! !


!Cashier class methodsFor: 'error messages' stamp: 'GL 11/5/2024 20:10:04'!
invalidShopCartErrorMessage

	^'Invalid shop cart'! !


!classDefinition: #CreditCard category: #'Ejercicio-TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'Ejercicio-TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'GL 11/5/2024 21:12:23'!
of: anOwner withNumber: aNumber withExpirationDate: anExpirationDate
	
	^self new intializeWithOwner: anOwner withNumber: aNumber withExpirationDate: anExpirationDate. ! !


!classDefinition: #ShopCart category: #'Ejercicio-TusLibros'!
Object subclass: #ShopCart
	instanceVariableNames: 'books catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!ShopCart methodsFor: 'error messages' stamp: 'GL 11/5/2024 19:52:11'!
invalidAmountErrorMessage
	
	^'Invalid Amount'.! !

!ShopCart methodsFor: 'error messages' stamp: 'GL 11/5/2024 19:58:45'!
invalidBookISBNErrorMessage

	^'Invalid book ISBN'! !


!ShopCart methodsFor: 'add' stamp: 'GL 11/5/2024 19:57:58'!
addToCart: aBookISBN withAmout: anAmount
	
	self assertItsAValidAmount: anAmount.
	self assertItsAValidISBN: aBookISBN. 
	
	books add: aBookISBN withOccurrences: anAmount .
	
	! !

!ShopCart methodsFor: 'add' stamp: 'GL 11/5/2024 19:51:38'!
assertItsAValidAmount: anAmount

	(anAmount isInteger or: [anAmount > 0]) ifFalse: [^self error: self invalidAmountErrorMessage].! !

!ShopCart methodsFor: 'add' stamp: 'GL 11/5/2024 20:52:48'!
assertItsAValidISBN: aBookISBN

	(catalog keys includes: aBookISBN) ifFalse: [self error: self invalidBookISBNErrorMessage] ! !


!ShopCart methodsFor: 'initialization' stamp: 'GL 11/5/2024 19:46:10'!
initializeWithCatalog: aCatalog
	
	catalog := aCatalog.
	books := Bag new. ! !


!ShopCart methodsFor: 'testing' stamp: 'GL 11/5/2024 15:37:58'!
isEmpty

	^books isEmpty. ! !


!ShopCart methodsFor: 'accessing' stamp: 'GL 11/5/2024 21:05:24'!
total
	 
	^books inject: 0 into: [:total :aBook| total + catalog at: aBook ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShopCart class' category: #'Ejercicio-TusLibros'!
ShopCart class
	instanceVariableNames: ''!

!ShopCart class methodsFor: 'instance creation' stamp: 'GL 11/5/2024 19:46:52'!
createShopCartWithCatalog: aCatalog

	^self new initializeWithCatalog: aCatalog.! !
