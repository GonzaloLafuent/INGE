!classDefinition: #AccountSummaryTest category: #'Portfolio-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/27/2024 11:58:08'!
test00
	
	|account report|
	
	account := ReceptiveAccount new.
	report := OrderedCollection with: 'Balance = 0'. 
	
	self assert: account  accountSummary equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/27/2024 11:59:17'!
test01
	
	|account report|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Balance = 100'.
	
	self assert: account  accountSummary equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/27/2024 12:07:52'!
test02
	
	|account report|
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' with: 'Balance = 50'.
	
	self assert: account  accountSummary equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/27/2024 12:22:05'!
test03
	
	|account report anotherAccount|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
	Transfer of: 20 from: account to: anotherAccount. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' 
								with: 'Salida por transferencia de 20' with:  'Balance = 30'.
	
	self assert: account  accountSummary equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/27/2024 12:27:26'!
test04
	
	|account report anotherAccount|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
	Transfer of: 20 from: account to: anotherAccount.
	Transfer of: 30 from: anotherAccount to: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' 
								with: 'Salida por transferencia de 20' with: 'Entrada por transferencia de 30' 
								with:  'Balance = 60'.
	
	self assert: account  accountSummary equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/27/2024 12:42:46'!
test05

	|portfolio report|
	
	portfolio := Portfolio new.
	report := OrderedCollection with: 'Balance = 0'.
	 
	self assert: portfolio accountSummary equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/27/2024 13:06:02'!
test06

	|portfolio report account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account .
	
	portfolio := Portfolio with: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Balance = 100'.
	 
	self assert: portfolio accountSummary equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/27/2024 13:05:30'!
test07

	|portfolio report account anotherAccount anothgerPortfolio|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account .
	
	anotherAccount := ReceptiveAccount new.
	Withdraw register: 50 on: account. 
	
	anothgerPortfolio := Portfolio with: anotherAccount. 
	portfolio := Portfolio with: account with: anothgerPortfolio. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' with: 'Balance = 50'.
	 
	self assert: portfolio accountSummary equals: report.
	! !


!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'create-instances' stamp: 'GL 10/18/2024 16:35:27'!
createDepositeFor: anAccount withAmount: anAmountToDeposite
	
	^Deposit register: anAmountToDeposite on: anAccount.
	! !

!PortfolioTest methodsFor: 'create-instances' stamp: 'GL 10/18/2024 16:35:23'!
createWithdrawFor: anAccount withAmount: anAmountToWithdraw

	^Withdraw register: anAmountToWithdraw on: anAccount.
	! !


!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferNetTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/27/2024 13:34:05'!
test00

	|account report|
	
	account := ReceptiveAccount new.
	report := 'Transferencia neta = 0'.
	
	self assert: account transferNet equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/27/2024 13:35:25'!
test01

	|account report anotherAccount|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Transfer of: 20 from: account to: anotherAccount. 
	
	report := 'Transferencia neta = -20'.
	
	self assert: account transferNet equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/27/2024 13:40:44'!
test02

	|account report anotherAccount|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Transfer of: 20 from: account to: anotherAccount. 
	Transfer of: 30 from: anotherAccount to: account. 
	
	report := 'Transferencia neta = 10'.
	
	self assert: account transferNet equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/27/2024 13:50:15'!
test03

	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: portfolio transferNet equals: 'Transferencia neta = 0'.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/27/2024 13:48:51'!
test04

	|portfolio account anotherAccount|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount  new.
	
	Transfer of: 20 from: account to: anotherAccount.
	portfolio  := Portfolio  with: account. 
	
	self assert: portfolio transferNet equals: 'Transferencia neta = -20'.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/27/2024 16:50:36'!
test05

	|portfolio account anotherAccount otherAccount anotherPortfolio|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount  new.
	otherAccount := ReceptiveAccount new.
	
	Transfer of: 20 from: account to: anotherAccount.
	Transfer of: 30 from: anotherAccount to: otherAccount .
	
	anotherPortfolio  := Portfolio with: otherAccount . 
	portfolio  := Portfolio  with: account with: anotherPortfolio. 
	
	self assert: portfolio transferNet equals: 'Transferencia neta = 10'.! !


!classDefinition: #TransferTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'test' stamp: 'GL 10/25/2024 21:41:51'!
test00
	
	|account anotherAccount|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Transfer of: 100 from: account to: anotherAccount.
	
	self assert: account balance equals: -100. 
	self assert: anotherAccount balance equals: 100.
	
	! !

!TransferTest methodsFor: 'test' stamp: 'GL 10/26/2024 13:06:46'!
test01
	
	|account anotherAccount transfer |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	transfer := Transfer of: 100 from: account to: anotherAccount.
	
	self assert: (account hasRegistered: transfer extractionLeg) .
	self assert: ( anotherAccount hasRegistered: transfer depositLeg). 
	
	
	! !

!TransferTest methodsFor: 'test' stamp: 'GL 10/26/2024 12:36:05'!
test02
	
	|account anotherAccount transfer |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	transfer := Transfer of: 100 from: account to: anotherAccount.
	
	self assert: (transfer extractionLeg) transfer equals: transfer.
	self assert: (transfer depositLeg) transfer equals: transfer. 
	
	
	! !

!TransferTest methodsFor: 'test' stamp: 'GL 10/26/2024 13:13:42'!
test03
	
	| account |
	
	account := ReceptiveAccount new.
	
	self should: [Transfer of: 100 from: account to: account.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | self assert: 'cannot make a transfer to the same account' equals: error messageText.].! !

!TransferTest methodsFor: 'test' stamp: 'GL 10/26/2024 13:17:41'!
test04

	| account anotherAccount|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	self should: [Transfer of: 0 from: account to: anotherAccount.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | self assert: 'transfer amount should be greater than zero' equals: error messageText.].! !


!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'report' stamp: 'GL 10/27/2024 17:18:03'!
createReport: aTypeOfReport

	self subclassResponsibility! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'GL 10/22/2024 18:05:02'!
bankEntityAlreadyRegisteredInAncestor: aBankEntity 


	^(father isNil) not and: [(aBankEntity = father or: [father bankEntityAlreadyRegisteredInDescendent: aBankEntity ignoring: self]) or: [
		father bankEntityAlreadyRegisteredInAncestor: aBankEntity. 
	   ]] ! !

!Portfolio methodsFor: 'testing' stamp: 'GL 10/22/2024 17:20:45'!
bankEntityAlreadyRegisteredInDescendent: aBankEntity

	^aBankEntity = self or: [bankingEntities anySatisfy: 
								[:bankEntity| bankEntity bankEntityAlreadyRegisteredInDescendent: aBankEntity] 
						    ].
	! !

!Portfolio methodsFor: 'testing' stamp: 'GL 10/22/2024 17:51:30'!
bankEntityAlreadyRegisteredInDescendent: aBankEntity ignoring: ignoredBankEntity

	^aBankEntity = self or: [bankingEntities anySatisfy: 
								[:bankEntity| (ignoredBankEntity ~= bankEntity) 
											and:[bankEntity bankEntityAlreadyRegisteredInDescendent: aBankEntity] ] 
						    ].
	! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'error messages' stamp: 'GL 10/22/2024 16:10:08'!
alreadyRegisterBankEntityErrorText
	
	^'Bank entity already registered'.! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'report' stamp: 'GL 10/27/2024 13:14:39'!
accountSummary
	
	| report |
	
	report := OrderedCollection new.
	
	accounts do: [:anAccount | anAccount  makeAccountSumaryReport: report ]. 
	
	report add: 'Balance = ',(self balance) asString.
	
	^report.! !

!Portfolio methodsFor: 'report' stamp: 'GL 10/27/2024 16:46:31'!
calculateTransferNet
	
	^accounts sum: [:anAccount | anAccount calculateTransferNet ] ifEmpty: [0]. ! !

!Portfolio methodsFor: 'report' stamp: 'GL 10/27/2024 17:21:40'!
createReport: aTypeOfReport

	accounts do: [:anAccount | anAccount createReport: aTypeOfReport]. ! !

!Portfolio methodsFor: 'report' stamp: 'GL 10/27/2024 17:32:28'!
forEveryAccountDo: aBlockCLousere
	
	accounts do:[:anAccount| aBlockCLousere value: anAccount ]. ! !

!Portfolio methodsFor: 'report' stamp: 'GL 10/27/2024 13:11:20'!
makeAccountSumaryReport: aReport

	accounts do: [:anAccount | anAccount makeAccountSumaryReport: aReport ].! !

!Portfolio methodsFor: 'report' stamp: 'GL 10/27/2024 16:46:51'!
transferNet

	^'Transferencia neta = ', self calculateTransferNet asString.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'GL 10/22/2024 17:21:31'!
bankEntityAlreadyRegisteredInAncestor: aBankEntity

	^aBankEntity  = self.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'GL 10/22/2024 17:20:45'!
bankEntityAlreadyRegisteredInDescendent: aBankEntity
	
	^self = aBankEntity. ! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'report' stamp: 'GL 10/27/2024 13:03:40'!
accountSummary
	
	| report |
	
	report := OrderedCollection new. 
	
	self makeAccountSumaryReport: report. 
	
	report  add: ('Balance = ', (self balance ) asString).
	
	^report.! !

!ReceptiveAccount methodsFor: 'report' stamp: 'GL 10/27/2024 16:44:29'!
calculateTransferNet
	
	|net|

	net := 0.
	
	transactions do: [:aTransaction |
		(aTransaction  isKindOf: ExtractionLeg) ifTrue: [net := net - aTransaction value]. 
		(aTransaction  isKindOf: DepositLeg) ifTrue: [net := net + aTransaction value].
	].

	^net.! !

!ReceptiveAccount methodsFor: 'report' stamp: 'GL 10/27/2024 17:24:40'!
createReport: aTypeOfReport

	transactions do: [:aTransaction | aTypeOfReport createReportForATransaction: aTransaction ].! !

!ReceptiveAccount methodsFor: 'report' stamp: 'GL 10/27/2024 17:33:20'!
forEveryTransactionDo: aBlockClosure
	
	transactions do: [:aTransaction| aBlockClosure value: aTransaction].! !

!ReceptiveAccount methodsFor: 'report' stamp: 'GL 10/27/2024 13:03:40'!
makeAccountSumaryReport: aReport

	^ transactions do: [:transaction|
		(transaction  isKindOf: Deposit) ifTrue: [aReport add: 'Deposito por ', (transaction value) asString].
		(transaction  isKindOf: Withdraw) ifTrue: [aReport add: 'Extraccion por ', (transaction value) asString ].
		(transaction  isKindOf: ExtractionLeg ) ifTrue: [aReport add: 'Salida por transferencia de ', (transaction value) asString ].
		(transaction  isKindOf: DepositLeg ) ifTrue: [aReport add: 'Entrada por transferencia de ', (transaction value) asString ].
	]! !

!ReceptiveAccount methodsFor: 'report' stamp: 'GL 10/27/2024 16:44:52'!
transferNet
	
	^'Transferencia neta = ', self calculateTransferNet asString.! !


!classDefinition: #AccountTransaction category: #'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'GL 10/16/2024 18:15:33'!
updateBalance: aBalanceToBeUpdated

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'GL 10/16/2024 18:15:45'!
updateBalance: aBalanceToBeUpdated
	
	^aBalanceToBeUpdated + value. ! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'GL 10/16/2024 18:15:57'!
updateBalance: aBalanceToBeUpdated
	
	^aBalanceToBeUpdated - value ! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: #'Portfolio-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Report methodsFor: 'add' stamp: 'GL 10/27/2024 17:42:03'!
addPortfolio: aPortfolio to: aReport! !


!Report methodsFor: 'create' stamp: 'GL 10/27/2024 17:40:50'!
createReportForPortfolio: aPortfolio

	self subclassResponsibility! !

!Report methodsFor: 'create' stamp: 'GL 10/27/2024 17:41:00'!
createReportForReceptiveAccount: aReceptiveAccount

	self subclassResponsibility! !


!classDefinition: #AccountSummaryReport category: #'Portfolio-Solucion'!
Report subclass: #AccountSummaryReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryReport methodsFor: 'create' stamp: 'GL 10/27/2024 17:40:50'!
createReportForPortfolio: aPortfolio

! !

!AccountSummaryReport methodsFor: 'create' stamp: 'GL 10/27/2024 17:41:00'!
createReportForReceptiveAccount: aReceptiveAccount
! !


!classDefinition: #TransferNetReport category: #'Portfolio-Solucion'!
Report subclass: #TransferNetReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetReport methodsFor: 'create' stamp: 'GL 10/27/2024 17:40:50'!
createReportForPortfolio: aPortfolio

! !

!TransferNetReport methodsFor: 'create' stamp: 'GL 10/27/2024 17:41:00'!
createReportForReceptiveAccount: aReceptiveAccount
! !


!classDefinition: #Transfer category: #'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'amount extractionLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!


!Transfer methodsFor: 'initialization' stamp: 'GL 10/26/2024 13:22:46'!
intializeOf: anAmount from: accountToExtract to: accountToDeposit 
	
	extractionLeg := ExtractionLeg createExtractionLegFor: self on: accountToExtract. 
	depositLeg :=  DepositLeg createDepositLegFor: self on: accountToDeposit.
	amount := anAmount. ! !


!Transfer methodsFor: 'accessing' stamp: 'GL 10/26/2024 12:31:56'!
depositLeg
	
	^depositLeg. ! !

!Transfer methodsFor: 'accessing' stamp: 'GL 10/26/2024 12:28:28'!
extractionLeg
	
	^extractionLeg ! !

!Transfer methodsFor: 'accessing' stamp: 'GL 10/26/2024 13:00:10'!
value

	^amount. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'GL 10/26/2024 13:16:41'!
of: anAmount from: accountToExtract to: accountToDeposit 
	
	accountToExtract = accountToDeposit ifTrue: [self error: self cannotTransferToTheSameAccountErrorMessage ].
	anAmount <= 0 ifTrue: [self error: self transferAmountShouldBeGreaterThanZeroErrorMessage]. 
	
	
	^self new intializeOf: anAmount from: accountToExtract  to: accountToDeposit. ! !


!Transfer class methodsFor: 'error messages' stamp: 'GL 10/26/2024 13:13:25'!
cannotTransferToTheSameAccountErrorMessage
	
	^'cannot make a transfer to the same account '! !

!Transfer class methodsFor: 'error messages' stamp: 'GL 10/26/2024 13:18:19'!
transferAmountShouldBeGreaterThanZeroErrorMessage
	
	^'transfer amount should be greater than zero'! !


!classDefinition: #TransferLeg category: #'Portfolio-Solucion'!
Object subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferLeg methodsFor: 'accessing' stamp: 'GL 10/26/2024 12:38:25'!
transfer
	
	^transfer! !

!TransferLeg methodsFor: 'accessing' stamp: 'GL 10/27/2024 12:20:53'!
value

	self subclassResponsibility! !


!TransferLeg methodsFor: 'balance' stamp: 'GL 10/26/2024 13:19:44'!
affectBalance: aBalance

	self subclassResponsibility! !


!TransferLeg methodsFor: 'initialization' stamp: 'GL 10/26/2024 13:20:47'!
initializeFor: aTransfer
	
	transfer := aTransfer. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: #'Portfolio-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'GL 10/26/2024 13:20:59'!
createDepositLegFor: aTransfer on: anAccount

	|depositLeg|
	
	depositLeg := self new initializeFor: aTransfer.
	anAccount register: depositLeg. 
	
	^depositLeg. ! !

!TransferLeg class methodsFor: 'instance creation' stamp: 'GL 10/26/2024 13:21:06'!
createExtractionLegFor: aTransfer on: anAccount 

	|extractionLeg|
	
	extractionLeg := self new initializeFor: aTransfer.
	anAccount register: extractionLeg. 

	^extractionLeg. ! !


!classDefinition: #DepositLeg category: #'Portfolio-Solucion'!
TransferLeg subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!DepositLeg methodsFor: 'balance' stamp: 'GL 10/26/2024 13:19:57'!
affectBalance: aBalance
	
	^aBalance +  transfer value.
	
	
	! !


!DepositLeg methodsFor: 'accessing' stamp: 'GL 10/27/2024 12:21:14'!
value

	^transfer value. ! !


!classDefinition: #ExtractionLeg category: #'Portfolio-Solucion'!
TransferLeg subclass: #ExtractionLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ExtractionLeg methodsFor: 'balance' stamp: 'GL 10/26/2024 13:20:12'!
affectBalance: aBalance
	
	^aBalance -  transfer value.
	
	
	! !


!ExtractionLeg methodsFor: 'accessing' stamp: 'GL 10/27/2024 12:21:29'!
value

	^transfer value. 
! !
