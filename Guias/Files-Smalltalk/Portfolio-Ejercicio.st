!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/17/2024 16:53:59'!
balanceOfAPortfolioWithOneAccountShouldHaveTheBalanceOfTheAccount
	
	|portfolio account |

	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.

	portfolio := Portfolio new.	
	portfolio register: account.

	self assert: portfolio balance equals: 100.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/17/2024 16:53:05'!
balanceOfAnEmptyPortfolioShouldBeZero
	
	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/17/2024 16:54:47'!
balanceOfAportfolioWithAccountsAndPortfoliosShouldBeTheSumOfAllTheBalances
	
	|portfolio anotherPortfolio account anotherAccount|

	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.

	anotherAccount := ReceptiveAccount new.
	Withdraw register: 50 on: anotherAccount.
	
	anotherPortfolio := Portfolio new.
	anotherPortfolio register: anotherAccount. 

	portfolio := Portfolio new.	
	portfolio register: account.
	portfolio register: anotherPortfolio. 

	self assert: portfolio balance equals: 50.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/17/2024 17:16:34'!
hasRegisteredForAnEmptyPortfolioShouldBeFalse	
	
	|portfolio aTransaction anAccount|
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 100 on: anAccount.
	
	self deny:(portfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/17/2024 17:14:40'!
test01	
	
	|portfolio aTransaction anAccount|
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 100 on: anAccount.
	
	portfolio register: anAccount. 
	
	self assert:(portfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/17/2024 17:16:00'!
test02
	
	|portfolio anotherPortfolio account anotherAccount deposit withdraw |

	account := ReceptiveAccount  new.
	deposit := Deposit register: 100 on: account.

	anotherAccount := ReceptiveAccount new.
	withdraw := Withdraw register: 50 on: anotherAccount.
	
	anotherPortfolio := Portfolio new.
	anotherPortfolio register: anotherAccount. 

	portfolio := Portfolio new.	
	portfolio register: account.
	portfolio register: anotherPortfolio. 

	self assert: (portfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/17/2024 17:42:48'!
test03
	
	|portfolio anAccount|
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	Deposit register: 100 on: anAccount.
	
	portfolio register: anAccount. 
	
	self should: [portfolio register: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:unError |
			self assert: 'Cannot register the same account' equals: unError messageText.].! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/17/2024 17:49:34'!
test04
	
	|portfolio anotherPortfolio account anotherAccount|

	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.

	anotherAccount := ReceptiveAccount new.
	Withdraw register: 50 on: anotherAccount.
	
	anotherPortfolio := Portfolio new.
	anotherPortfolio register: anotherAccount. 

	portfolio := Portfolio new.	
	portfolio register: account.
	portfolio register: anotherPortfolio. 
	
	self should: [portfolio register: anotherAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:unError |
			self assert: 'Cannot register the same account' equals: unError messageText.].! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'GL 10/16/2024 18:15:33'!
updateBalance: aBalanceToBeUpdated

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'GL 10/16/2024 18:15:45'!
updateBalance: aBalanceToBeUpdated
	
	^aBalanceToBeUpdated + value. ! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'GL 10/16/2024 18:15:57'!
updateBalance: aBalanceToBeUpdated
	
	^aBalanceToBeUpdated - value ! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'GL 10/17/2024 17:53:13'!
assertAccountIsAlreadyRegister: anAccount
	
	! !

!Portfolio methodsFor: 'testing' stamp: 'GL 10/17/2024 17:14:40'!
hasRegistered: aTransaction 
	
	^portfolio anySatisfy: [:anAccountOrPortfolio| anAccountOrPortfolio hasRegistered: aTransaction ].! !


!Portfolio methodsFor: 'balance' stamp: 'GL 10/17/2024 16:44:46'!
balance

	^portfolio sum: [:anAccountOrPortfolio| anAccountOrPortfolio balance] ifEmpty: [0].  ! !


!Portfolio methodsFor: 'register' stamp: 'GL 10/17/2024 17:52:57'!
register: anAccountOrPortfolio 
	
	(portfolio anySatisfy: [:registerElementInPortfolio | self assertAccountIsAlreadyRegister: anAccountOrPortfolio] )
			ifTrue: [self error: ''].
	
	portfolio add: anAccountOrPortfolio. ! !


!Portfolio methodsFor: 'initialization' stamp: 'GL 10/17/2024 16:45:22'!
initialize
	
	portfolio := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'GL 10/16/2024 18:17:10'!
balance

	^transactions inject: 0 into: [:balance :aTransaction | aTransaction updateBalance: balance]. ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
