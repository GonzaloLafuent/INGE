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

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 16:11:05'!
test01	
	
	|portfolio anAccount|
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100.
	
	portfolio addAccount: anAccount. 
	
	self assert: portfolio balance equals: 100.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 16:10:47'!
test02
	
	|portfolio anAccount anotherAccount|
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100. 
	
	anotherAccount := ReceptiveAccount new.
	self createWithdrawFor: anotherAccount withAmount: 50. 
	
	portfolio addAccount: anAccount. 
	portfolio addAccount: anotherAccount. 
	
	self assert: portfolio balance equals: 50.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 16:10:58'!
test04
	
	|portfolio anAccount anotherAccount anotherPortfolio|
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100. 
	anotherPortfolio addAccount: anAccount. 
	
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100.
	
	anotherAccount := ReceptiveAccount new.
	self createWithdrawFor: anotherAccount withAmount: 50.
	
	portfolio addAccount: anAccount. 
	portfolio addAccount: anotherAccount. 
	portfolio addPortfolio: anotherPortfolio. 

	self assert: portfolio balance equals: 150.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 16:13:42'!
test05
	
	|portfolio anAccount anotherAccount anotherPortfolio|
	
	portfolio := Portfolio new.
	
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100. 
	anotherPortfolio addAccount: anAccount. 
	
	portfolio addPortfolio: anotherPortfolio. 
	
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100. 
	anotherPortfolio addAccount: anAccount. 
	
	portfolio addPortfolio: anotherPortfolio. 	
	
	anAccount := ReceptiveAccount new.
	self createDepositeFor: anAccount withAmount: 100.
	
	anotherAccount := ReceptiveAccount new.
	self createWithdrawFor: anotherAccount withAmount: 50.
	
	portfolio addAccount: anAccount. 
	portfolio addAccount: anotherAccount. 
	
	self assert: portfolio balance equals: 250.! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 16:31:33'!
test06
	
	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: ((portfolio transactions) size) = 0 ! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 16:32:26'!
test07
	
	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: ((portfolio transactions) size) = 0 ! !

!PortfolioTest methodsFor: 'test' stamp: 'GL 10/18/2024 16:37:08'!
test08
	
	|portfolio anAccount deposite|
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	deposite := self createDepositeFor: anAccount withAmount: 100.
	
	portfolio addAccount: anAccount.	

	self assert: (portfolio transactions) equals: (OrderedCollection with: deposite)! !


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
	instanceVariableNames: 'portfolio accounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'GL 10/18/2024 16:20:23'!
hasRegistered: aTransaction 
	
	^false.! !

!Portfolio methodsFor: 'testing' stamp: 'GL 10/18/2024 16:40:38'!
transactions
	
	^accounts inject: (OrderedCollection new) into: [] ! !


!Portfolio methodsFor: 'balance' stamp: 'GL 10/18/2024 16:15:41'!
accountsBalance
	
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [0].! !

!Portfolio methodsFor: 'balance' stamp: 'GL 10/18/2024 16:16:19'!
balance

	^self portfoliosBalance + self accountsBalance. ! !

!Portfolio methodsFor: 'balance' stamp: 'GL 10/18/2024 16:15:53'!
portfoliosBalance
	
	^portfolios sum: [:anAccount | anAccount balance] ifEmpty: [0].
	! !


!Portfolio methodsFor: 'register' stamp: 'GL 10/18/2024 15:49:13'!
addAccount: anAccount
	
	accounts add: anAccount ! !

!Portfolio methodsFor: 'register' stamp: 'GL 10/18/2024 16:14:43'!
addPortfolio: aPortfolio
	
	portfolios add: aPortfolio. ! !


!Portfolio methodsFor: 'initialization' stamp: 'GL 10/18/2024 16:14:54'!
initialize
	
	accounts := OrderedCollection new.
	portfolios := OrderedCollection new.! !


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
