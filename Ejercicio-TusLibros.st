!classDefinition: #CashierTest category: #'Ejercicio-TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 18:16:26'!
cashier

	|merchantProcessor|

	merchantProcessor := MerchantProcessorSimulator createWithStolesCards: self stolenCreditCard 
														andDebtCards: self inDebtCreditCard.
															
	^Cashier with: merchantProcessor. 
	
	! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 17:46:10'!
expiredCreditCard

	|owner expiredDate number|
	
	owner := 'anOwner'.
	number := 'creditCardNumber'.
	expiredDate := GregorianMonthOfYear year: (GregorianMonthOfYear current year) 
										     month: (GregorianMonthOfYear current month previous).
	
	^CreditCard of: owner withNumber: number withExpirationDate: expiredDate. 
! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:52:57'!
firstPosibleItem

	^'firstPosibleItem'
	! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 18:28:04'!
inDebtCreditCard

	|owner expiredDate number|
	
	owner := 'anOwner'.
	number := 'inDebtCardNumber'.
	expiredDate := GregorianMonthOfYear current.
	
	^CreditCard of: owner withNumber: number withExpirationDate: expiredDate. 

	! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:53:31'!
priceOfFirstItem

	^100.! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:53:40'!
priceOfSecondItem

	^50.! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:53:10'!
secondPosibleItem
	
	^'secondPosibleItem'
	! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:52:14'!
shopCart
	
	|catalog|

	catalog := Dictionary newFromPairs: #('firstPosibleItem' 100 'secondPosibleItem' 50). 

	^ShopCart createShopCartWithCatalog: catalog.! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 18:22:55'!
stolenCreditCard

	|owner expiredDate number|
	
	owner := 'anOwner'.
	number := 'stolenCreditCardNumber'.
	expiredDate := GregorianMonthOfYear current.
	
	^CreditCard of: owner withNumber: number withExpirationDate: expiredDate. 

	! !

!CashierTest methodsFor: 'support' stamp: 'GL 11/6/2024 17:47:55'!
validCreditCard

	|owner expiredDate number|
	
	owner := 'anOwner'.
	number := 'creditCardNumber'.
	expiredDate := GregorianMonthOfYear current.
	
	^CreditCard of: owner withNumber: number withExpirationDate: expiredDate. 
! !


!CashierTest methodsFor: 'test' stamp: 'GL 11/6/2024 18:19:34'!
test00CheckoutOfAnEmptyShopCartIsInvalid
	
	|cashier|
	
	cashier := self cashier. 
	
	self should: [cashier checkout: self shopCart with: self validCreditCard ]  
		raise: Error 
		withMessageText:  cashier invalidShopCartErrorMessage. ! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/6/2024 18:20:09'!
test01CheckoutOfAShopCartWithOneProductChargeThatProduct
	
	|shopCart cashier|
	
	shopCart := self shopCart.
	shopCart addToCart: self firstPosibleItem withAmout: 1.
	cashier := self cashier. 

	self assert: (cashier checkout: shopCart with: self validCreditCard) equals: self priceOfFirstItem.! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/6/2024 18:21:13'!
test02CheckoutOfAShopCartWithSeveralProductChargeAllTheProducts
	
	|shopCart cashier |
	
	shopCart := self shopCart. 
	cashier := self cashier.
	
	shopCart addToCart: self firstPosibleItem withAmout: 1.
	shopCart addToCart: self secondPosibleItem withAmout: 1.
	

	self assert: (cashier checkout: shopCart with: self validCreditCard) equals: 150.! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/6/2024 18:21:41'!
test03CannotCheckoutWithAnExpiredCard
	
	|shopCart |
	
	shopCart := self shopCart. 
	shopCart addToCart: self firstPosibleItem withAmout: 1.
	
	self should: [self cashier checkout: shopCart with: self expiredCreditCard] 
		raise: Error 
		withMessageText: 'Expired credit card'.! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/6/2024 18:25:18'!
test04CannotCheckoutWithAnStolenCard
	
	|shopCart |
	
	shopCart := self shopCart. 
	shopCart addToCart: self firstPosibleItem withAmout: 1.

	self should: [self cashier checkout: shopCart with:self stolenCreditCard ] 
		raise: Error 
		withMessageText: 'Cannot charge an stolen card'.! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/6/2024 18:26:13'!
test05CannotCheckoutWithAnInDebtCard
	
	|shopCart |
	
	shopCart := self shopCart. 
	shopCart addToCart: self firstPosibleItem withAmout: 1.

	self should: [self cashier checkout: shopCart with:self inDebtCreditCard ] 
		raise: Error 
		withMessageText: 'Cannot charge an in debt card'.! !

!CashierTest methodsFor: 'test' stamp: 'GL 11/7/2024 16:34:38'!
test06CannotCheckoutWithAnInDebtCard
	
	|shopCart |
	
	shopCart := self shopCart. 
	shopCart addToCart: self firstPosibleItem withAmout: 1.

	self should: [self cashier checkout: shopCart with:self inDebtCreditCard ] 
		raise: Error 
		withMessageText: 'Cannot charge an in debt card'.! !


!classDefinition: #ShopCartTest category: #'Ejercicio-TusLibros'!
TestCase subclass: #ShopCartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!ShopCartTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:31:09'!
firstPosibleItem
	
	^'FirsPossibleItem'.! !

!ShopCartTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:31:42'!
itemNotInCatalog

	^'ItemNotInCatalog'! !

!ShopCartTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:31:19'!
secondPosibleItem
	
	^'SecondPosibleItem'.! !

!ShopCartTest methodsFor: 'support' stamp: 'GL 11/6/2024 16:30:36'!
shopCart

	|  catalog |
	
	catalog := Dictionary newFromPairs: #('FirsPossibleItem' 100 'SecondPosibleItem' 50).

	^ShopCart createShopCartWithCatalog:  catalog.! !


!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:32:02'!
test00NewlyCreatedShopCartIsEmpty
	
	self assert: self shopCart isEmpty. ! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:33:36'!
test01ShopCartWithOneBookIsNonEmpty
	
	|shopCart|
	
	shopCart := self shopCart.
	shopCart addToCart: self firstPosibleItem withAmout: 1. 
	
	self deny: shopCart isEmpty. ! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:34:11'!
test02ShopCartWithManyBooksIsNonEmpty
	
	|shopCart|
	
	shopCart := self shopCart.
	shopCart addToCart: self firstPosibleItem withAmout: 1.	
	shopCart addToCart: self secondPosibleItem withAmout: 1. 
	
	self deny: shopCart isEmpty. ! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:34:45'!
test03TotalOfAnEmptyCartIsZero
	
	self assert: self shopCart total equals: 0. ! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:36:06'!
test04TotalOfACartWithOneItemIsThePriceOfThatItem
	
	|shopCart|
	
	shopCart := self shopCart.
	shopCart addToCart: self firstPosibleItem withAmout: 1.
	
	self assert: shopCart total equals: 100.! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:36:40'!
test05TotalOfACartWithManyItemIsTheSumOfPricesOfAllItems

	|shopCart|
	
	shopCart := self shopCart.
	shopCart addToCart: self firstPosibleItem withAmout: 1.
	shopCart addToCart: self secondPosibleItem withAmout: 1.
	
	self assert: shopCart total equals: 150.
	! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:40:12'!
test06CanotAddToShopCartItemsThatDontBelogToTheStore
	
	|shopCart|
	
	shopCart := self shopCart.
	
	self should: [shopCart addToCart: self itemNotInCatalog withAmout: 1] 
		raise: Error  
		withExceptionDo: [:error|
			self assert: error messageText equals: shopCart invalidBookISBNErrorMessage.
			self deny: (shopCart includes: self itemNotInCatalog).
		]
	
	! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:42:15'!
test07CanotAddToShopCartItemsThatHasAnNotIntegerQuantity
	
	|shopCart|
	
	shopCart := self shopCart.
	
	self should: [shopCart addToCart: self firstPosibleItem withAmout: 0.5] 
		raise: Error  
		withExceptionDo: [:error|
			self assert: error messageText equals: shopCart invalidAmountErrorMessage.
			self deny: (shopCart includes: self itemNotInCatalog).
		]

	! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:44:51'!
test08CanotAddToShopCartItemsThatHasAnNotPositiveQuantity
	
	|shopCart|
	
	shopCart := self shopCart.
	
	self should: [shopCart addToCart: self firstPosibleItem withAmout: -1] 
		raise: Error  
		withExceptionDo: [:error|
			self assert: error messageText equals: shopCart invalidAmountErrorMessage.
			self deny: (shopCart includes: self itemNotInCatalog).
		]

	
	! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:45:15'!
test09CartNotIncludeNotAddedItems	
	
	self deny: (self shopCart includes: self firstPosibleItem) ! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:46:25'!
test10CartIncludeAddedItem	
	
	|shopCart|
	
	shopCart := self shopCart.
	shopCart addToCart: self firstPosibleItem withAmout: 1.
	
	self assert: (shopCart includes: self firstPosibleItem). 
	! !

!ShopCartTest methodsFor: 'test' stamp: 'GL 11/6/2024 16:46:59'!
test11CartIncludeAllAddedItem	
	
	|shopCart|
	
	shopCart := self shopCart.
	shopCart addToCart: self firstPosibleItem withAmout: 1.
	shopCart addToCart: self secondPosibleItem withAmout: 2.
	
	self assert: (shopCart includes: self secondPosibleItem ). 
	! !


!classDefinition: #Cashier category: #'Ejercicio-TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'shopCart merchantSimulator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!Cashier methodsFor: 'intialization' stamp: 'GL 11/6/2024 18:14:38'!
initializeWith: aMerchantSimulator

	merchantSimulator := aMerchantSimulator. ! !


!Cashier methodsFor: 'error messages' stamp: 'GL 11/6/2024 17:43:03'!
expiredCreditCardErrorMessage
	
	^'Expired credit card'! !

!Cashier methodsFor: 'error messages' stamp: 'GL 11/6/2024 18:12:04'!
invalidShopCartErrorMessage

	^'Invalid shop cart'.
! !


!Cashier methodsFor: 'checkout' stamp: 'GL 11/6/2024 17:42:49'!
assertCardIsNotExpired: aCreditCard

	aCreditCard expirationDate < GregorianMonthOfYear current ifTrue: [self error: self expiredCreditCardErrorMessage] ! !

!Cashier methodsFor: 'checkout' stamp: 'GL 11/6/2024 18:12:57'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [self error: self invalidShopCartErrorMessage]! !

!Cashier methodsFor: 'checkout' stamp: 'GL 11/6/2024 18:23:47'!
checkout: aCart with: aCreditCard

	self assertCartIsNotEmpty: aCart. 
	self assertCardIsNotExpired: aCreditCard.
	
	merchantSimulator charge: aCart total with: aCreditCard. 

	 ^aCart total.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'Ejercicio-TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'GL 11/5/2024 20:09:24'!
for: aShopCart 
	
	aShopCart isEmpty ifTrue: [^self error: self invalidShopCartErrorMessage]. 
	
	^self new initializeWith: aShopCart ! !

!Cashier class methodsFor: 'instance creation' stamp: 'GL 11/6/2024 18:14:11'!
with: aMerchantSimulator 
		
	^self new initializeWith: aMerchantSimulator. ! !


!classDefinition: #CreditCard category: #'Ejercicio-TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'cardNumber expirationDate owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!CreditCard methodsFor: 'accessing' stamp: 'GL 11/6/2024 17:02:37'!
cardNumber

	^cardNumber.! !

!CreditCard methodsFor: 'accessing' stamp: 'GL 11/6/2024 17:02:59'!
expirationDate

	^expirationDate.! !

!CreditCard methodsFor: 'accessing' stamp: 'GL 11/6/2024 17:03:22'!
owner

	^owner.! !


!CreditCard methodsFor: 'initialization' stamp: 'GL 11/6/2024 17:04:47'!
intializeWithOwner: anOwner Number: aNumber andExpirationDate: anExpirationDate

	owner := anOwner.	
	cardNumber := aNumber. 
	expirationDate := anExpirationDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'Ejercicio-TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'GL 11/6/2024 17:03:43'!
of: anOwner withNumber: aNumber withExpirationDate: anExpirationDate
	
	^self new intializeWithOwner: anOwner Number: aNumber andExpirationDate: anExpirationDate. ! !


!classDefinition: #MerchantProcessorSimulator category: #'Ejercicio-TusLibros'!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'debtCards stolenCards'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-TusLibros'!

!MerchantProcessorSimulator methodsFor: 'charge' stamp: 'GL 11/6/2024 18:29:25'!
charge: anAmount with: aCreditCard

	aCreditCard cardNumber = stolenCards cardNumber ifTrue: [self error: 'Cannot charge an stolen card'].
	
	aCreditCard cardNumber = debtCards cardNumber ifTrue: [self error: 'Cannot charge an in debt card'].! !


!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'GL 11/6/2024 18:05:54'!
with: anArrayOfStolenCards with: anArrayOfInDebtCards

	debtCards := anArrayOfInDebtCards.
	stolenCards := anArrayOfStolenCards. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #'Ejercicio-TusLibros'!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'instance creation' stamp: 'GL 11/6/2024 18:04:17'!
createWithStolesCards: anArrayOfStolenCards andDebtCards: anArrayOfInDebtCards

	^self new initialize with: anArrayOfStolenCards with: anArrayOfInDebtCards. ! !


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

!ShopCart methodsFor: 'add' stamp: 'GL 11/6/2024 16:44:25'!
assertItsAValidAmount: anAmount

	(anAmount isInteger not or: [anAmount <= 0]) ifTrue: [^self error: self invalidAmountErrorMessage].! !

!ShopCart methodsFor: 'add' stamp: 'GL 11/5/2024 20:52:48'!
assertItsAValidISBN: aBookISBN

	(catalog keys includes: aBookISBN) ifFalse: [self error: self invalidBookISBNErrorMessage] ! !


!ShopCart methodsFor: 'initialization' stamp: 'GL 11/5/2024 19:46:10'!
initializeWithCatalog: aCatalog
	
	catalog := aCatalog.
	books := Bag new. ! !


!ShopCart methodsFor: 'testing' stamp: 'GL 11/6/2024 16:40:40'!
includes: anItem

	^books includes: anItem. ! !

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
