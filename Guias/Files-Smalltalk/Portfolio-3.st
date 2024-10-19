!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'create-instances' stamp: 'GL 10/18/2024 16:35:27'!
createDepositeFor: anAccount withAmount: anAmountToDeposite
	
	^Deposit register: anAmountToDeposite on: anAccount.
	! !

!PortfolioTest methodsFor: 'create-instances' stamp: 'GL 10/18/2024 16:35:23'!
createWithdrawFor: anAccount withAmount: anAmountToWithdraw

	^Withdraw register: anAmountToWithdraw on: anAccount.
	! !


!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 16:10:32'!
test00
	
	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 21:41:45'!
test01	
	
	|portfolio anAccount|
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100.
	
	portfolio register: anAccount. 
	
	self assert: portfolio balance equals: 100.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 21:46:32'!
test02
	
	|portfolio anAccount anotherAccount anotherPortfolio|
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100. 
	anotherPortfolio register: anAccount. 
	
	anotherAccount := ReceptiveAccount new.
	self createWithdrawFor: anotherAccount withAmount: 50.
	
	portfolio register: anotherAccount. 
	portfolio register: anotherPortfolio. 

	self assert: portfolio balance equals: 50.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 21:18:03'!
test03
	
	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: (portfolio transactions) size equals: 0! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 21:42:06'!
test04
	
	|portfolio anAccount aTransaction |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	aTransaction := self createDepositeFor: anAccount withAmount: 100.
	
	portfolio register: anAccount. 
	
	self assert: (portfolio transactions) equals: (OrderedCollection with: aTransaction)! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 21:46:37'!
test05
	
	|anAccount anotherAccount anotherPortfolio portfolio transactions|
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	transactions := OrderedCollection new. 
	
	anAccount := ReceptiveAccount new.
	transactions add: (self createDepositeFor: anAccount withAmount: 100). 
	anotherPortfolio register: anAccount. 
	
	anotherAccount := ReceptiveAccount new.
	transactions add: (self createWithdrawFor: anotherAccount withAmount: 50).
	
	portfolio register: anotherAccount. 
	portfolio register: anotherPortfolio. 

	self assert: (portfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 21:52:18'!
test06
	
	|portfolio aTransaction anAccount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	aTransaction := 	self createDepositeFor: anAccount withAmount: 100. 

	self deny: (portfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 21:53:28'!
test07
	
	|portfolio aTransaction anAccount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	aTransaction := 	self createDepositeFor: anAccount withAmount: 100. 

	self deny: (portfolio hasRegistered: aTransaction).! !


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


!classDefinition: #BankEntity category: #'Portfolio-Ejercicio'!
Object subclass: #BankEntity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!BankEntity methodsFor: 'balance' stamp: 'GL 10/18/2024 21:39:16'!
balance

	self subclassResponsibility! !


!BankEntity methodsFor: 'testing' stamp: 'GL 10/18/2024 21:40:02'!
hasRegistered: aTransaction

	self subclassResponsibility! !

!BankEntity methodsFor: 'testing' stamp: 'GL 10/18/2024 21:39:33'!
transactions

	self subclassResponsibility! !


!BankEntity methodsFor: 'transactions' stamp: 'GL 10/18/2024 21:40:36'!
register: aTransaction

	self subclassResponsibility! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
BankEntity subclass: #Portfolio
	instanceVariableNames: 'bankingEntities'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'GL 10/18/2024 20:58:48'!
hasRegistered: aTransaction 
	
	^false.
! !

!Portfolio methodsFor: 'testing' stamp: 'GL 10/18/2024 21:44:47'!
transactions
	
	^(bankingEntities inject: (OrderedCollection new) into: [:transactions :bankEntity | 
															transactions union: bankEntity transactions ]) asOrderedCollection. 
	  ! !


!Portfolio methodsFor: 'balance' stamp: 'GL 10/18/2024 21:45:28'!
balance

	^bankingEntities sum:[:aBankEntity | aBankEntity balance ] ifEmpty: [0].! !


!Portfolio methodsFor: 'transactions' stamp: 'GL 10/18/2024 21:43:43'!
register: aBankEntity
	
	bankingEntities add: aBankEntity. ! !


!Portfolio methodsFor: 'initialization' stamp: 'GL 10/18/2024 21:45:56'!
initialize
	
	bankingEntities := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
BankEntity subclass: #ReceptiveAccount
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
