!classDefinition: #ApiInternFaceTest category: #TusLibros!
TestCase subclass: #ApiInternFaceTest
	instanceVariableNames: 'storeTestObjectFactory authUserBehaviour authCartBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ApiInternFaceTest methodsFor: 'setup' stamp: 'GL 11/8/2024 20:45:38'!
setUp
	
	storeTestObjectFactory := StoreTestObjectsFactory new. 
	
	authUserBehaviour := [:userId :passwordId |]. 
	authCartBehaviour := [:cartId| ].! !


!ApiInternFaceTest methodsFor: 'authentication processor protocol' stamp: 'GL 11/8/2024 20:46:15'!
authenticateCartWith: cartId

	authCartBehaviour value: cartId.! !

!ApiInternFaceTest methodsFor: 'authentication processor protocol' stamp: 'GL 11/8/2024 20:45:38'!
authenticateUserWith: anUserId andPassword: anUserPassword

	authUserBehaviour value: anUserId value: anUserPassword. ! !


!ApiInternFaceTest methodsFor: 'test' stamp: 'GL 11/8/2024 21:15:04'!
test00CannotCreateCartWithInvalidCredentials

	|api|	

	api := ApiInternFace withAuthentication: self.
	authUserBehaviour := [:anUserId :anUserPassword | self error: 'Invalid user credentials']. 

	self should: [api createCartFor: 'dsdsds' andPassword: 'dsdsdsds' acceptingItemsOf: storeTestObjectFactory defaultCatalog ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error| self assert: error messageText  equals: 'Invalid user credentials']. ! !

!ApiInternFaceTest methodsFor: 'test' stamp: 'GL 11/8/2024 21:15:19'!
test01NewlyCreatedCartIsEmpty

	|api cartId itemsOfCart|	

	api := ApiInternFace withAuthentication: self.
	cartId := api createCartFor: 'dsdsds' andPassword: 'dsdsdsds' acceptingItemsOf: storeTestObjectFactory defaultCatalog.
	
	itemsOfCart := api listItemsOfCart: cartId. 
	
	self assert: itemsOfCart isEmpty. ! !

!ApiInternFaceTest methodsFor: 'test' stamp: 'GL 11/8/2024 20:45:01'!
test02CannotListItemsOfAnInvalidCart

	|api|	
	
	api := ApiInternFace withAuthentication: self.
	authCartBehaviour := [:aCartId | self error: 'Invalid cart credentials'].
	
	self should: [api listItemsOfCart: 'dsdsds' ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | self assert: error messageText equals: 'Invalid cart credentials'].! !

!ApiInternFaceTest methodsFor: 'test' stamp: 'GL 11/8/2024 20:58:49'!
test03CannotAddItemToAnInvalidCart

	|api|	
	
	api := ApiInternFace withAuthentication: self.
	authCartBehaviour := [:aCartId | self error: 'Invalid cart credentials'].
	
	self should: [api addItem: 'dsdsd' withAnAmount: 45 toCart: 'dsdsd' ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | self assert: error messageText equals: 'Invalid cart credentials'].! !

!ApiInternFaceTest methodsFor: 'test' stamp: 'GL 11/8/2024 21:24:05'!
test04allItemsAddedToCartAreListed

	|api cartId cartListedItems|	
	
	api := ApiInternFace withAuthentication: self.
	
	cartId := api createCartFor: 'dsdsds' andPassword: 'dsdsds' acceptingItemsOf: storeTestObjectFactory defaultCatalog.
	api addItem: storeTestObjectFactory itemSellByTheStore withAnAmount: 1 toCart: cartId. 
	api addItem: storeTestObjectFactory itemSellByTheStore withAnAmount: 2 toCart: cartId.
	cartListedItems := api listItemsOfCart: cartId.
	
	self assert: (cartListedItems occurrencesOf: storeTestObjectFactory itemSellByTheStore) equals: 3.
 
 
	! !

!ApiInternFaceTest methodsFor: 'test' stamp: 'GL 11/8/2024 21:30:09'!
test05CannotCheckoutInvalidCart

	|api cartId |	
	
	api := ApiInternFace withAuthentication: self.
	cartId := api createCartFor: 'dsds' andPassword: 'dsds' acceptingItemsOf: storeTestObjectFactory defaultCatalog. 
	
	authCartBehaviour := [:cart| self error: 'Invalid cart credentials']. 
	
	self should: [api checkoutCart: cartId withCardNumber: '4545' expirationDate: '4545' andCardOwner: 'dsds'  ]  
		raise: Error - MessageNotUnderstood 
		withMessageText: 'Invalid cart credentials'! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HAW 11/8/2024 13:46:36'!
test05WithMock_CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard merchantProcessor mpReceivedMessages debitFromMessage |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
	merchantProcessor := Mock onlyCollecting.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: merchantProcessor
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
	mpReceivedMessages := merchantProcessor receivedMessages.
					
	self assert: 1 equals: mpReceivedMessages size.
	debitFromMessage := mpReceivedMessages first.
	self assert: debitFromMessage selector equals: #debit:from:.
	self assert: debitFromMessage arguments first equals: total.
	self assert: debitFromMessage arguments second equals: creditCard 
	! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HAW 11/8/2024 13:38:36'!
test06WithMock_CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard merchantProcessor |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	merchantProcessor := Mock whenReceives: #debit:from: do: [ :amount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage ].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: merchantProcessor
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!classDefinition: #ApiInternFace category: #TusLibros!
Object subclass: #ApiInternFace
	instanceVariableNames: 'authMethod'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ApiInternFace methodsFor: 'handlers' stamp: 'GL 11/8/2024 21:20:59'!
addItem: anItemISBN withAnAmount: anAmount toCart: anIdCart 

	authMethod authenticateCartWith: anIdCart. 	
	
	anIdCart add: anAmount of: anItemISBN . 
	
	 
	! !

!ApiInternFace methodsFor: 'handlers' stamp: 'GL 11/8/2024 21:31:10'!
checkoutCart: cartId withCardNumber: aCardNumber expirationDate: anExpirationDate andCardOwner: aCardOwner 
	
	authMethod authenticateCartWith: cartId. ! !

!ApiInternFace methodsFor: 'handlers' stamp: 'GL 11/8/2024 21:14:32'!
createCartFor: anUserId andPassword: anUserPassword acceptingItemsOf: aCatalog  
	
	authMethod authenticateUserWith: anUserId andPassword: anUserPassword. 
	
	^Cart acceptingItemsOf: aCatalog.! !

!ApiInternFace methodsFor: 'handlers' stamp: 'GL 11/8/2024 21:23:04'!
listItemsOfCart: cartId 
	
	authMethod authenticateCartWith: cartId. 
	
	^cartId list. ! !


!ApiInternFace methodsFor: 'initialization' stamp: 'GL 11/8/2024 20:25:07'!
initializeWith: anAutheticationMethod

	authMethod := anAutheticationMethod. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ApiInternFace class' category: #TusLibros!
ApiInternFace class
	instanceVariableNames: ''!

!ApiInternFace class methodsFor: 'instance creation' stamp: 'GL 11/8/2024 20:25:30'!
withAuthentication: anAuthenticationMethod

	^self new initializeWith: anAuthenticationMethod. ! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'listing' stamp: 'GL 11/8/2024 21:22:37'!
list

	^items.  
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!classDefinition: #Mock category: #TusLibros!
ProtoObject subclass: #Mock
	instanceVariableNames: 'receivedMessages blockBySelectors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Mock methodsFor: 'system primitives' stamp: 'HAW 11/8/2024 13:37:50'!
doesNotUnderstand: aMessage

	receivedMessages add: aMessage.
	
	^blockBySelectors 
		at: aMessage selector 
		ifPresent: [ :aBlock | aBlock valueWithArguments: aMessage arguments ]
		ifAbsent: [ self ]! !

!Mock methodsFor: 'system primitives' stamp: 'HAW 11/8/2024 13:32:55'!
inspectorClass
	"Answer the class of the inspector to be used on the receiver.  Called by inspect; 
	use basicInspect to get a normal (less useful) type of inspector."

	^ Inspector! !

!Mock methodsFor: 'system primitives' stamp: 'HAW 11/8/2024 13:33:06'!
instVarAt: index put: anObject
	"Primitive. Store a value into a fixed variable in an object. The numbering of the
	 variables corresponds to the named instance variables, followed by the indexed
	 instance variables. Fail if the index is not an Integer or is not the index of a fixed
	 variable. Essential. See Object documentation whatIsAPrimitive."

	<primitive: 174 error: ec>
	Object primitiveFailed! !


!Mock methodsFor: 'initialization' stamp: 'HAW 11/8/2024 13:36:36'!
initializeDoingAll: aBlocksBySelectors 

	blockBySelectors := aBlocksBySelectors.
	receivedMessages := OrderedCollection new! !


!Mock methodsFor: 'received messages' stamp: 'HAW 11/8/2024 13:46:46'!
receivedMessages

	^receivedMessages copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mock class' category: #TusLibros!
Mock class
	instanceVariableNames: ''!

!Mock class methodsFor: 'instance creation' stamp: 'HAW 11/8/2024 13:36:04'!
doingAll: aBlocksBySelectors

	^self new initializeDoingAll: aBlocksBySelectors ! !

!Mock class methodsFor: 'instance creation' stamp: 'HAW 11/8/2024 13:46:25'!
onlyCollecting

	^self doingAll: Dictionary new! !

!Mock class methodsFor: 'instance creation' stamp: 'HAW 11/8/2024 13:35:40'!
whenReceives: aSelector do: aBlock

	^self doingAll: (Dictionary new
		at: aSelector put: aBlock;
		yourself)! !
