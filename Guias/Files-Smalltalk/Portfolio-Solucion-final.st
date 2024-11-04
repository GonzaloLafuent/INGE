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


!classDefinition: #ReportTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!


!classDefinition: #AccountSummaryTest category: #'Portfolio-Solucion'!
ReportTest subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:10:50'!
test00AccountSummaryForAnEmptyReceptiveAccountOnlyContainsALineForTheBalance
	
	|account report accountSummaryCreator|
	
	account := ReceptiveAccount new.
	report := OrderedCollection with: 'Balance = 0'. 
	
	accountSummaryCreator := AccountSummary for: account.
	
	self assert: accountSummaryCreator lines equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:06:59'!
test01
	
	|account report accountSummaryCreator|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Balance = 100'.
	accountSummaryCreator := AccountSummary for: account. 
	
	self assert: accountSummaryCreator lines equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:07:25'!
test02
	
	|account report accountSummaryCreator|
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' with: 'Balance = 50'.
	accountSummaryCreator  := AccountSummary for: account. 
	
	self assert: accountSummaryCreator lines equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:07:53'!
test03
	
	|account report anotherAccount accountSummaryCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
	Transfer of: 20 from: account to: anotherAccount. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' 
								with: 'Salida por transferencia de 20' with:  'Balance = 30'.
	
	accountSummaryCreator := AccountSummary for: account.
	
	self assert: accountSummaryCreator lines equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:08:24'!
test04
	
	|account report anotherAccount accountSummaryCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
	Transfer of: 20 from: account to: anotherAccount.
	Transfer of: 30 from: anotherAccount to: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' 
								with: 'Salida por transferencia de 20' with: 'Entrada por transferencia de 30' 
								with:  'Balance = 60'.
	
	accountSummaryCreator := AccountSummary for: account.
	
	self assert: accountSummaryCreator lines equals: report.
	! !


!classDefinition: #SpecialAccountSummaryTest category: #'Portfolio-Solucion'!
ReportTest subclass: #SpecialAccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!SpecialAccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:26:29'!
test00
	
	|report portfolio specialAccountSummaryCreator|
	
	report := WriteStream on: String new.
	
	portfolio := Portfolio new.
	specialAccountSummaryCreator := SpecialAccountSummary for: portfolio.
	
	report := report nextPutAll: 'Portfolio'; nextPut: Character cr; nextPut: Character space; nextPutAll: 'Balance = 0'; contents.
	
	self assert: specialAccountSummaryCreator report equals: report. ! !

!SpecialAccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:27:36'!
test01
	
	|report portfolio specialAccountSummaryCreator account|
	
	report := WriteStream on: String new.
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account. 
	
	Deposit register: 100 on: account. 
	
	specialAccountSummaryCreator := SpecialAccountSummary for: portfolio.
	
	report := report nextPutAll: 'Portfolio'; nextPut: Character cr; nextPut: Character space;				 nextPutAll: 'Account';
			  nextPut: Character cr; nextPut: Character space; nextPut: Character space; nextPutAll: 'Deposito por 100';
		         nextPut: Character cr; nextPut: Character space; nextPutAll: 'Balance = 100';
			  nextPut: Character cr; nextPut: Character space;nextPutAll: 'Balance = 100'; contents. 
	
	self assert: specialAccountSummaryCreator report equals: report. ! !

!SpecialAccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:31:05'!
test02
	
	|report portfolio specialAccountSummaryCreator|
	
	report := WriteStream on: String new.
	
	portfolio := Portfolio new.
	specialAccountSummaryCreator := SpecialAccountSummary for: portfolio.
	
	report := report nextPutAll: 'portfolio'; nextPut: Character cr; nextPutAll: 'Balance = 0'; contents.
	
	self assert: specialAccountSummaryCreator report equals: report. ! !

!SpecialAccountSummaryTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:30:56'!
test03
	
	|report portfolio anotherPortfolio account anotherAccount specialAccountSummaryCreator|
	
	report := WriteStream on: String new.
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new. 
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	 
	Deposit register: 100 on: account.
	Withdraw register: 50 on: anotherAccount. 
	
	portfolio add: account.
	anotherPortfolio add: anotherAccount.
	portfolio add: anotherPortfolio. 
	
	specialAccountSummaryCreator := SpecialAccountSummary for: portfolio.
	
	report := report nextPutAll: 'Portfolio'; nextPut: Character cr; nextPut: Character space;				 nextPutAll: 'Account';
			  nextPut: Character cr; nextPut: Character space; nextPut: Character space; nextPutAll: 'Deposito por 100';
		         nextPut: Character cr; nextPut: Character space; nextPutAll: 'Balance = 100';
			  nextPut: Character cr; nextPut: Character space;				 nextPutAll: 'Portfolio';
			  nextPutAll: 'Portfolio'; nextPut: Character cr; nextPut: Character space;		 nextPut: Character space;		 nextPutAll: 'Account';	
			  nextPut: Character cr; nextPut: Character space; nextPut: Character space; nextPut: Character space; nextPutAll: 'Extraccion por 50';
		         nextPut: Character cr; nextPut: Character space; nextPut: Character space; nextPutAll: 'Balance = 50';
			  
			  nextPut: Character cr;nextPutAll: 'Balance = 50'; contents. 
	
	self assert: specialAccountSummaryCreator report equals: report. ! !


!classDefinition: #StructureCreatorReportTest category: #'Portfolio-Solucion'!
ReportTest subclass: #StructureCreatorReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!StructureCreatorReportTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:21:16'!
test00

	|portfolio structureCreatorReport|
	
	portfolio := Portfolio new.
	structureCreatorReport := TreeStructureReport for: portfolio.
	
	self assert: structureCreatorReport report equals: 'portfolio', Character cr asString.! !

!StructureCreatorReportTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:22:03'!
test01

	|portfolio account structureCreatorReport report|
	
	report := WriteStream on: String new.
	report := report nextPutAll: 'portfolio'; nextPut: Character cr; nextPut: Character space; nextPutAll: 'account'; contents. 
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	structureCreatorReport := TreeStructureReport for: portfolio.
	
	portfolio add: account. 
	
	self assert: structureCreatorReport report equals: report.! !

!StructureCreatorReportTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:23:01'!
test02

	|portfolio account anotherPortfolio anotherAccount structureCreatorReport report|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	anotherPortfolio := Portfolio new.
	
	report := WriteStream on: String new.
	report := report nextPutAll: 'portfolio'; nextPut: Character cr; nextPut: Character space; nextPutAll: 'account';
				      nextPut: Character cr; nextPut: Character space; nextPutAll: 'portfolio';	
					nextPut: Character cr; nextPut: Character space; nextPut: Character space; nextPutAll: 'account';contents.
	
	 
	structureCreatorReport := TreeStructureReport for: portfolio.
	
	anotherPortfolio add: anotherAccount. 
	portfolio add: account. 
	portfolio add: anotherPortfolio. 
	
	self assert: structureCreatorReport report equals: report.! !

!StructureCreatorReportTest methodsFor: 'test' stamp: 'GL 11/4/2024 16:24:18'!
test03

	|account|
	
	account := ReceptiveAccount new.
	
	self should: [TreeStructureReport for: account] 
		raise: Error 
		withMessageText: 'Invalid report for this type of account'.
	
	! !


!classDefinition: #TransferNetTest category: #'Portfolio-Solucion'!
ReportTest subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetTest methodsFor: 'tests' stamp: 'GL 11/4/2024 16:12:43'!
test00

	|account report transferNetCreator|
	
	account := ReceptiveAccount new.
	report := 'Transferencia neta = 0'.
	
	transferNetCreator := TransferNet for: account. 
	
	self assert: transferNetCreator net equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 11/4/2024 16:13:55'!
test01

	|account report anotherAccount transferNetCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Transfer of: 20 from: account to: anotherAccount. 
	transferNetCreator := TransferNet for: account.
	
	report := 'Transferencia neta = -20'.
	
	self assert: transferNetCreator net equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 11/4/2024 16:14:19'!
test02

	|account report anotherAccount transferNetCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Transfer of: 20 from: account to: anotherAccount. 
	Transfer of: 30 from: anotherAccount to: account. 
		
	report := 'Transferencia neta = 10'.
	transferNetCreator := TransferNet for: account. 
	
	self assert: transferNetCreator net equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 11/4/2024 16:15:05'!
test03

	|account report anotherAccount transferNetCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Transfer of: 20 from: account to: anotherAccount. 
	Transfer of: 30 from: anotherAccount to: account. 
	Deposit register: 100 on: account.
		
	report := 'Transferencia neta = 10'.
	transferNetCreator := TransferNet for: account. 
	
	self assert: transferNetCreator net equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 11/4/2024 16:15:27'!
test04

	|account report anotherAccount transferNetCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Transfer of: 20 from: account to: anotherAccount. 
	Transfer of: 30 from: anotherAccount to: account. 
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
		
	report := 'Transferencia neta = 10'.
	transferNetCreator := TransferNet for: account. 
	
	self assert: transferNetCreator net equals: report.! !


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


!Account methodsFor: 'enumerating' stamp: 'GL 10/30/2024 20:16:42'!
do: aBlockToExecute

	self subclassResponsibility! !


!Account methodsFor: 'operation' stamp: 'GL 10/30/2024 20:18:47'!
operateWith: aTypeOfOperation

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


!Portfolio methodsFor: 'enumerating' stamp: 'GL 10/30/2024 20:17:42'!
do: aBlockToExecute


	accounts do:[:anAccount | aBlockToExecute value: anAccount ].
	! !


!Portfolio methodsFor: 'operation' stamp: 'GL 11/4/2024 15:42:55'!
accept: aTypeOfOperation

	aTypeOfOperation visitPortfolio: self. ! !

!Portfolio methodsFor: 'operation' stamp: 'GL 11/4/2024 15:42:11'!
visitAllAccountsWith: aTypeOfOperation

	accounts do: [:anAccount | anAccount accept: aTypeOfOperation ]. ! !

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


!ReceptiveAccount methodsFor: 'enumerating' stamp: 'GL 10/30/2024 20:17:10'!
do: aBlockToExecute

	transactions do:[:aTransaction | aBlockToExecute value: aTransaction ].! !


!ReceptiveAccount methodsFor: 'operation' stamp: 'GL 11/4/2024 15:43:17'!
accept: aTypeOfVisitor
	
	aTypeOfVisitor visitReceptiveAccount: self.	! !

!ReceptiveAccount methodsFor: 'operation' stamp: 'GL 11/4/2024 15:31:35'!
visitAllTransactionsWith: aTypeOfVisitor
	
	transactions do: [:aTransaction | aTransaction accept: aTypeOfVisitor ]. 	
	! !


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


!Deposit methodsFor: 'report' stamp: 'GL 11/4/2024 15:32:00'!
accept: aTypeOfVisitor

	aTypeOfVisitor visitDeposit:  self.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: #'Portfolio-Solucion'!
AccountTransaction subclass: #TransferLeg
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


!DepositLeg methodsFor: 'report' stamp: 'GL 11/4/2024 15:32:39'!
accept: aTypeOfVisitor

	aTypeOfVisitor visitDepositLeg: self.	! !



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


!ExtractionLeg methodsFor: 'report' stamp: 'GL 11/4/2024 15:33:05'!
accept: aTypeOfVisitor
	
	aTypeOfVisitor visitExtractionLeg: self.	! !



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


!Withdraw methodsFor: 'report' stamp: 'GL 11/4/2024 15:33:20'!
accept: aTypeOfVisitor
	
	aTypeOfVisitor visitWithdraw: self. ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountVisitor category: #'Portfolio-Solucion'!
Object subclass: #AccountVisitor
	instanceVariableNames: 'report portfolio spaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountVisitor methodsFor: 'visit' stamp: 'GL 11/4/2024 15:40:10'!
visitPortfolio: aPortfolio

	self subclassResponsibility! !

!AccountVisitor methodsFor: 'visit' stamp: 'GL 11/4/2024 15:40:13'!
visitReceptiveAccount: aReceptiveAccount

	self subclassResponsibility! !


!AccountVisitor methodsFor: 'intialization' stamp: 'GL 11/4/2024 16:17:21'!
initializeWith: aPortfolio

	portfolio := aPortfolio.
	report := WriteStream on: String new. 
	spaces := ''.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountVisitor class' category: #'Portfolio-Solucion'!
AccountVisitor class
	instanceVariableNames: ''!

!AccountVisitor class methodsFor: 'instance creation' stamp: 'GL 11/4/2024 16:24:30'!
for: aPortfolio

	(aPortfolio isKindOf: Portfolio) ifFalse: [^self error: 'Invalid report for this type of account'].
	
	^self new initializeWith: aPortfolio.! !


!classDefinition: #SpecialAccountSummary category: #'Portfolio-Solucion'!
AccountVisitor subclass: #SpecialAccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!SpecialAccountSummary methodsFor: 'visit' stamp: 'GL 11/4/2024 16:29:08'!
visitPortfolio: aPortfolio

	report  nextPutAll:  spaces ,'portfolio'. 
	
	spaces := spaces , ' '. 
	report nextPut: Character cr. 
		
	aPortfolio visitAllAccountsWith: self. 
	
	report nextPut: Character cr.
	report nextPutAll: spaces, 'Balance = ', aPortfolio balance asString.	
	
	spaces := spaces copyFrom: 1 to: (spaces size -1).! !

!SpecialAccountSummary methodsFor: 'visit' stamp: 'GL 11/4/2024 16:01:03'!
visitReceptiveAccount: aReceptiveAccount

	|summaryReport|
	
	report nextPutAll: 'Account'.
	spaces := spaces, ' '.
	
	summaryReport := (AccountSummary for: aReceptiveAccount) lines.
	
	summaryReport do:[:aLine | 
		report nextPut: Character cr.
		report nextPutAll: spaces, aLine.
	].

	report nextPutAll: spaces, 'Balance = ',aReceptiveAccount balance asString.
	spaces := spaces copyFrom: 1 to: (spaces size -1). ! !


!SpecialAccountSummary methodsFor: 'report' stamp: 'GL 11/4/2024 16:18:33'!
report

	portfolio accept: self.
	
	^report contents.! !


!classDefinition: #TreeStructureReport category: #'Portfolio-Solucion'!
AccountVisitor subclass: #TreeStructureReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TreeStructureReport methodsFor: 'visit' stamp: 'GL 11/4/2024 15:52:03'!
visitPortfolio: aPortfolio

	report  nextPutAll:  spaces ,'portfolio'. 
	
	spaces := spaces , ' '. 
	report nextPut: Character cr. 
		
	aPortfolio visitAllAccountsWith: self. 

	spaces := spaces copyFrom: 1 to: (spaces size -1) .
	! !

!TreeStructureReport methodsFor: 'visit' stamp: 'GL 11/4/2024 15:54:24'!
visitReceptiveAccount: aReceptiveAccount

	report nextPutAll: spaces , 'account'.! !


!TreeStructureReport methodsFor: 'report' stamp: 'GL 11/4/2024 16:19:37'!
report

	portfolio accept: self.
	
	^report contents. ! !


!classDefinition: #TransactionVisitor category: #'Portfolio-Solucion'!
Object subclass: #TransactionVisitor
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransactionVisitor methodsFor: 'visit' stamp: 'GL 11/4/2024 15:21:54'!
visitDeposit: aDeposit

	self subclassResponsibility! !

!TransactionVisitor methodsFor: 'visit' stamp: 'GL 11/4/2024 15:21:57'!
visitDepositLeg: aDepositLeg

	self subclassResponsibility! !

!TransactionVisitor methodsFor: 'visit' stamp: 'GL 11/4/2024 15:22:00'!
visitExtractionLeg: aExtractionLeg

	self subclassResponsibility! !

!TransactionVisitor methodsFor: 'visit' stamp: 'GL 11/4/2024 15:22:03'!
visitWithdraw: aWithdraw

	self subclassResponsibility! !


!TransactionVisitor methodsFor: 'initialization' stamp: 'GL 11/4/2024 16:13:09'!
initializeWith: anAccount

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionVisitor class' category: #'Portfolio-Solucion'!
TransactionVisitor class
	instanceVariableNames: ''!

!TransactionVisitor class methodsFor: 'instance creation' stamp: 'GL 11/4/2024 16:05:09'!
for: aReceptiveAccount

	^self new initializeWith: aReceptiveAccount. ! !


!classDefinition: #AccountSummary category: #'Portfolio-Solucion'!
TransactionVisitor subclass: #AccountSummary
	instanceVariableNames: 'report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'report' stamp: 'GL 11/4/2024 16:06:28'!
lines
	
	account visitAllTransactionsWith: self.
	
	report add: 'Balance = ', account balance asString.
	
	^report.
	! !


!AccountSummary methodsFor: 'visit' stamp: 'GL 11/4/2024 15:26:17'!
visitDeposit: aDeposit

	report add: 'Deposito por ', aDeposit value asString. ! !

!AccountSummary methodsFor: 'visit' stamp: 'GL 11/4/2024 16:09:31'!
visitDepositLeg: aDepositLeg

	report add: 'Entrada por transferencia de ', aDepositLeg value asString. ! !

!AccountSummary methodsFor: 'visit' stamp: 'GL 11/4/2024 15:25:28'!
visitExtractionLeg: aExtractionLeg

	report add: 'Salida por transferencia de ', aExtractionLeg value asString. ! !

!AccountSummary methodsFor: 'visit' stamp: 'GL 11/4/2024 15:25:49'!
visitWithdraw: aWithdraw

	report add: 'Extraccion por ', aWithdraw value asString. ! !


!AccountSummary methodsFor: 'initialization' stamp: 'GL 11/4/2024 16:05:59'!
initializeWith: anAccount 

	account := anAccount.
	report := OrderedCollection new. ! !


!classDefinition: #TransferNet category: #'Portfolio-Solucion'!
TransactionVisitor subclass: #TransferNet
	instanceVariableNames: 'net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'visit' stamp: 'GL 11/4/2024 15:21:54'!
visitDeposit: aDeposit! !

!TransferNet methodsFor: 'visit' stamp: 'GL 11/4/2024 15:29:14'!
visitDepositLeg: aDepositLeg

	net := net + aDepositLeg value! !

!TransferNet methodsFor: 'visit' stamp: 'GL 11/4/2024 15:29:04'!
visitExtractionLeg: aExtractionLeg

	net := net - aExtractionLeg value ! !

!TransferNet methodsFor: 'visit' stamp: 'GL 11/4/2024 15:22:03'!
visitWithdraw: aWithdraw! !


!TransferNet methodsFor: 'report' stamp: 'GL 11/4/2024 16:13:31'!
net

	account visitAllTransactionsWith: self.
	
	^'Transferencia neta = ', net asString . ! !


!TransferNet methodsFor: 'initialization' stamp: 'GL 11/4/2024 16:13:09'!
initializeWith: anAccount 

	account := anAccount.
	net := 0. ! !


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
