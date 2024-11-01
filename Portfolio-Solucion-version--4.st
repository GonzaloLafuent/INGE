!classDefinition: #AccountSummaryTest category: #'Portfolio-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/30/2024 16:15:50'!
test00
	
	|account report accountSummaryCreator|
	
	account := ReceptiveAccount new.
	report := OrderedCollection with: 'Balance = 0'. 
	
	accountSummaryCreator := AccountSummaryCreator createReportFor: account.
	
	self assert: accountSummaryCreator createReport equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/30/2024 16:17:38'!
test01
	
	|account report accountSummaryCreator|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Balance = 100'.
	accountSummaryCreator := AccountSummaryCreator createReportFor: account. 
	
	self assert: accountSummaryCreator createReport equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/30/2024 16:20:01'!
test02
	
	|account report accountSummaryCreator|
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' with: 'Balance = 50'.
	accountSummaryCreator  := AccountSummaryCreator createReportFor: account. 
	
	self assert: accountSummaryCreator createReport equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/30/2024 16:21:00'!
test03
	
	|account report anotherAccount accountSummaryCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 
	Transfer of: 20 from: account to: anotherAccount. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' 
								with: 'Salida por transferencia de 20' with:  'Balance = 30'.
	
	accountSummaryCreator := AccountSummaryCreator createReportFor: account.
	
	self assert: accountSummaryCreator createReport equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/30/2024 16:21:50'!
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
	
	accountSummaryCreator := AccountSummaryCreator createReportFor: account.
	
	self assert: accountSummaryCreator createReport equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/30/2024 16:30:05'!
test05

	|portfolio report accounSummaryCreator|
	
	portfolio := Portfolio new.
	report := OrderedCollection with: 'Balance = 0'.
	accounSummaryCreator := AccountSummaryCreator createReportFor: portfolio. 
	 
	self assert: accounSummaryCreator createReport equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/30/2024 16:31:40'!
test06

	|portfolio report account accountSummaryCreator|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account .
	
	portfolio := Portfolio with: account. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Balance = 100'.
	accountSummaryCreator := AccountSummaryCreator createReportFor: portfolio. 
	 
	self assert: accountSummaryCreator createReport equals: report.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'GL 10/30/2024 16:33:28'!
test07

	|portfolio report account anotherAccount anothgerPortfolio accountSummaryCreator|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account .
	
	anotherAccount := ReceptiveAccount new.
	Withdraw register: 50 on: account. 
	
	anothgerPortfolio := Portfolio with: anotherAccount. 
	portfolio := Portfolio with: account with: anothgerPortfolio. 
	
	report := OrderedCollection with: 'Deposito por 100' with: 'Extraccion por 50' with: 'Balance = 50'.
	accountSummaryCreator := AccountSummaryCreator createReportFor: portfolio. 
	 
	self assert: accountSummaryCreator createReport equals: report.
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


!classDefinition: #SpecialAccountSummaryTest category: #'Portfolio-Solucion'!
TestCase subclass: #SpecialAccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!SpecialAccountSummaryTest methodsFor: 'test' stamp: 'GL 10/31/2024 20:59:12'!
test00
	
	|report portfolio specialAccountSummaryCreator|
	
	report := WriteStream on: String new.
	
	portfolio := Portfolio new.
	specialAccountSummaryCreator := SpecialAccountSummaryCreator createReportFor: portfolio.
	
	report := report nextPutAll: 'portfolio'; nextPut: Character cr; nextPutAll: 'Balance = 0'; contents.
	
	self assert: specialAccountSummaryCreator createReport equals: report. ! !


!classDefinition: #StructureCreatorReportTest category: #'Portfolio-Solucion'!
TestCase subclass: #StructureCreatorReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!StructureCreatorReportTest methodsFor: 'test' stamp: 'GL 10/31/2024 17:26:30'!
test00

	|portfolio structureCreatorReport|
	
	portfolio := Portfolio new.
	structureCreatorReport := PortfolioStructureCreator createReportFor: portfolio.
	
	self assert: structureCreatorReport createReport equals: 'portfolio'.! !

!StructureCreatorReportTest methodsFor: 'test' stamp: 'GL 10/31/2024 18:30:20'!
test01

	|portfolio account structureCreatorReport report|
	
	report := WriteStream on: String new.
	report := report nextPutAll: 'portfolio'; nextPut: Character cr; nextPut: Character space; nextPutAll: 'account'; contents. 
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	structureCreatorReport := PortfolioStructureCreator createReportFor: portfolio.
	
	portfolio add: account. 
	
	self assert: structureCreatorReport createReport equals: report.! !

!StructureCreatorReportTest methodsFor: 'test' stamp: 'GL 10/31/2024 18:32:19'!
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
	
	 
	structureCreatorReport := PortfolioStructureCreator createReportFor: portfolio.
	
	anotherPortfolio add: anotherAccount. 
	portfolio add: account. 
	portfolio add: anotherPortfolio. 
	
	self assert: structureCreatorReport createReport equals: report.! !

!StructureCreatorReportTest methodsFor: 'test' stamp: 'GL 10/31/2024 18:12:13'!
test03

	|account|
	
	account := ReceptiveAccount new.
	
	self should: [PortfolioStructureCreator createReportFor: account] 
		raise: Error 
		withMessageText: 'Invalid report for this type of account'.
	
	! !


!classDefinition: #TransferNetTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/30/2024 16:56:19'!
test00

	|account report transferNetCreator|
	
	account := ReceptiveAccount new.
	report := 'Transferencia neta = 0'.
	
	transferNetCreator := TransferNetCreator createReportFor: account. 
	
	self assert: transferNetCreator createReport equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/30/2024 16:59:00'!
test01

	|account report anotherAccount transferNetCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Transfer of: 20 from: account to: anotherAccount. 
	transferNetCreator := TransferNetCreator createReportFor: account.
	
	report := 'Transferencia neta = -20'.
	
	self assert: transferNetCreator createReport equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/30/2024 17:00:27'!
test02

	|account report anotherAccount transferNetCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Transfer of: 20 from: account to: anotherAccount. 
	Transfer of: 30 from: anotherAccount to: account. 
		
	report := 'Transferencia neta = 10'.
	transferNetCreator := TransferNetCreator createReportFor: account. 
	
	self assert: transferNetCreator createReport equals: report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/30/2024 17:01:21'!
test03

	|portfolio transferNetCreator|
	
	portfolio := Portfolio new.
	transferNetCreator := TransferNetCreator createReportFor: portfolio .
	
	self assert: transferNetCreator createReport equals: 'Transferencia neta = 0'.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/30/2024 17:02:02'!
test04

	|portfolio account anotherAccount transferNetCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount  new.
	
	Transfer of: 20 from: account to: anotherAccount.
	portfolio  := Portfolio  with: account. 
	transferNetCreator := TransferNetCreator createReportFor: portfolio. 
	
	
	self assert: transferNetCreator createReport equals: 'Transferencia neta = -20'.! !

!TransferNetTest methodsFor: 'tests' stamp: 'GL 10/30/2024 17:02:57'!
test05

	|portfolio account anotherAccount otherAccount anotherPortfolio transferNetCreator|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount  new.
	otherAccount := ReceptiveAccount new.
	
	Transfer of: 20 from: account to: anotherAccount.
	Transfer of: 30 from: anotherAccount to: otherAccount .
	
	anotherPortfolio  := Portfolio with: otherAccount . 
	portfolio  := Portfolio  with: account with: anotherPortfolio. 
	transferNetCreator := TransferNetCreator createReportFor: portfolio. 
	
	self assert: transferNetCreator createReport equals: 'Transferencia neta = 10'.! !


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


!Portfolio methodsFor: 'operation' stamp: 'GL 10/30/2024 20:19:07'!
operateWith: aTypeOfOperation 

	aTypeOfOperation operateOnPortfolio: self. ! !

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


!ReceptiveAccount methodsFor: 'operation' stamp: 'GL 10/30/2024 20:19:19'!
operateWith: aTypeOfOperation 
	
	aTypeOfOperation operateOnReceptiveAccount: self. ! !


!classDefinition: #AccountOperation category: #'Portfolio-Solucion'!
Object subclass: #AccountOperation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountOperation methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:37'!
operateOnDeposit: aDeposit

	self subclassResponsibility! !

!AccountOperation methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:12'!
operateOnDepositLeg: aDepositLeg

	self subclassResponsibility! !

!AccountOperation methodsFor: 'operate' stamp: 'GL 10/30/2024 20:12:23'!
operateOnExtractionLeg: aExtractionLeg

	self subclassResponsibility! !

!AccountOperation methodsFor: 'operate' stamp: 'GL 10/30/2024 20:20:03'!
operateOnPortfolio: aPortfolio

	self subclassResponsibility! !

!AccountOperation methodsFor: 'operate' stamp: 'GL 10/30/2024 20:20:09'!
operateOnReceptiveAccount: aReceptiveAccount

	self subclassResponsibility! !

!AccountOperation methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:55'!
operateOnWithdraw: aWithdraw

	self subclassResponsibility! !


!classDefinition: #AccountReport category: #'Portfolio-Solucion'!
AccountOperation subclass: #AccountReport
	instanceVariableNames: 'report account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountReport methodsFor: 'initialization' stamp: 'GL 10/30/2024 16:09:39'!
initializeWith: anAccount

	report := OrderedCollection new.
	account := anAccount. ! !


!AccountReport methodsFor: 'create' stamp: 'GL 10/30/2024 16:12:03'!
createReport

	self subclassResponsibility! !


!AccountReport methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:37'!
operateOnDeposit: aDeposit

	self subclassResponsibility! !

!AccountReport methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:12'!
operateOnDepositLeg: aDepositLeg

	self subclassResponsibility! !

!AccountReport methodsFor: 'operate' stamp: 'GL 10/30/2024 20:12:23'!
operateOnExtractionLeg: aExtractionLeg

	self subclassResponsibility! !

!AccountReport methodsFor: 'operate' stamp: 'GL 10/30/2024 20:20:16'!
operateOnPortfolio: aPortfolio

	self subclassResponsibility! !

!AccountReport methodsFor: 'operate' stamp: 'GL 10/30/2024 20:20:20'!
operateOnReceptiveAccount: aReceptiveAccount

	self subclassResponsibility! !

!AccountReport methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:55'!
operateOnWithdraw: aWithdraw

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: #'Portfolio-Solucion'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'create' stamp: 'GL 10/30/2024 16:07:29'!
createReportFor: anAccount
	
	^self new initializeWith: anAccount.! !


!classDefinition: #AccountSummaryCreator category: #'Portfolio-Solucion'!
AccountReport subclass: #AccountSummaryCreator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryCreator methodsFor: 'create' stamp: 'GL 10/30/2024 20:26:06'!
createReport

	account operateWith: self.
	
	report add: 'Balance = ', account balance asString. 
	
	^report.! !


!AccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:37'!
operateOnDeposit: aDeposit

	report add: 'Deposito por ', aDeposit value asString ! !

!AccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:12'!
operateOnDepositLeg: aDepositLeg

	report add:  'Entrada por transferencia de ', aDepositLeg value asString. ! !

!AccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:12:23'!
operateOnExtractionLeg: aExtractionLeg

	report add: 'Salida por transferencia de ', aExtractionLeg value asString. ! !

!AccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:20:57'!
operateOnPortfolio: aPortfolio

	aPortfolio do: [:anAccount | anAccount operateWith: self ].! !

!AccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:21:54'!
operateOnReceptiveAccount: aReceptiveAccount
	
	aReceptiveAccount do: [:aTransaction | aTransaction operateWith: self]. ! !

!AccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:55'!
operateOnWithdraw: aWithdraw

	report add: 'Extraccion por ', aWithdraw value asString. ! !


!classDefinition: #PortfolioReport category: #'Portfolio-Solucion'!
AccountReport subclass: #PortfolioReport
	instanceVariableNames: 'spaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioReport methodsFor: 'operate' stamp: 'GL 10/31/2024 17:14:50'!
operateOnDeposit: aPortfolio

	self subclassResponsibility! !

!PortfolioReport methodsFor: 'operate' stamp: 'GL 10/31/2024 17:14:55'!
operateOnDepositLeg: aTransferLeg

	self subclassResponsibility! !

!PortfolioReport methodsFor: 'operate' stamp: 'GL 10/31/2024 20:46:35'!
operateOnExtractionLeg: aTransferLeg

	self subclassResponsibility! !

!PortfolioReport methodsFor: 'operate' stamp: 'GL 10/31/2024 17:15:04'!
operateOnPortfolio: aPortfolio

	self subclassResponsibility. ! !

!PortfolioReport methodsFor: 'operate' stamp: 'GL 10/31/2024 17:15:14'!
operateOnReceptiveAccount: aReceptiveAccount

	self subclassResponsibility.! !

!PortfolioReport methodsFor: 'operate' stamp: 'GL 10/31/2024 17:15:22'!
operateOnWithdraw: aWithdraw

	self subclassResponsibility! !


!PortfolioReport methodsFor: 'create' stamp: 'GL 10/31/2024 18:00:43'!
createReport

	account operateWith: self.
	
	^report contents.! !


!PortfolioReport methodsFor: 'initialization' stamp: 'GL 10/31/2024 20:37:46'!
initializeWith: anAccount

	account  := anAccount.
	report := WriteStream on: String new. 
	spaces := 0.! !


!classDefinition: #PortfolioStructureCreator category: #'Portfolio-Solucion'!
PortfolioReport subclass: #PortfolioStructureCreator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioStructureCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 17:14:50'!
operateOnDeposit: aPortfolio! !

!PortfolioStructureCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 17:14:55'!
operateOnDepositLeg: aTransferLeg! !

!PortfolioStructureCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 20:46:56'!
operateOnExtractionLeg: aTransferLeg! !

!PortfolioStructureCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 18:24:23'!
operateOnPortfolio: aPortfolio

	report  nextPutAll: 'portfolio'. 
	spaces := spaces + 1.
	
	aPortfolio do: [:anAccount|
		report nextPut: Character cr. 
		spaces timesRepeat: [report nextPut: Character space].
		anAccount operateWith: self. 
	].

	spaces := spaces - 1.! !

!PortfolioStructureCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 18:25:01'!
operateOnReceptiveAccount: aReceptiveAccount
	
	report nextPutAll: 'account'.! !

!PortfolioStructureCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 17:15:22'!
operateOnWithdraw: aWithdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioStructureCreator class' category: #'Portfolio-Solucion'!
PortfolioStructureCreator class
	instanceVariableNames: ''!

!PortfolioStructureCreator class methodsFor: 'create' stamp: 'GL 10/31/2024 17:28:59'!
createReportFor: anAccount

	|isPortfolio|
	
	isPortfolio := (PortfolioValidator isPortfolio: anAccount) validate.
	
	isPortfolio ifFalse: [ self error:'Invalid report for this type of account'].
	
	^self new initializeWith: anAccount.! !


!classDefinition: #SpecialAccountSummaryCreator category: #'Portfolio-Solucion'!
PortfolioReport subclass: #SpecialAccountSummaryCreator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!SpecialAccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 20:44:22'!
operateOnDeposit: aDeposit

	report nextPutAll: 'Deposito por ', aDeposit value. 
	! !

!SpecialAccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 20:48:30'!
operateOnDepositLeg: aDepositLeg

	report nextPutAll: 'Entrada por deposito de ', aDepositLeg value.! !

!SpecialAccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 20:47:55'!
operateOnExtractionLeg: aExtractionLeg

	report nextPutAll: 'Salida por extraccion de ', aExtractionLeg value. ! !

!SpecialAccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 20:57:55'!
operateOnPortfolio: aPortfolio
	
	report  nextPutAll: 'portfolio'. 
	spaces := spaces + 1.
	
	aPortfolio do: [:anAccount|
		report nextPut: Character cr. 
		spaces timesRepeat: [report nextPut: Character space].
		anAccount operateWith: self. 
	].

	spaces := spaces - 1.

	report nextPut: Character cr. 
	spaces timesRepeat: [report nextPut: Character space].
	report nextPutAll: 'Balance = ', aPortfolio balance asString. 
! !

!SpecialAccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 20:42:31'!
operateOnReceptiveAccount: aReceptiveAccount
	
	report  nextPutAll: 'account'. 
	spaces := spaces + 1.
	
	aReceptiveAccount do: [:aTransaction|
		report nextPut: Character cr. 
		spaces timesRepeat: [report nextPut: Character space].
		aTransaction operateWith: self. 
	].

	report nextPut: Character cr. 
	spaces timesRepeat: [report nextPut: Character space].
	report nextPutAll: 'Balance = ', aReceptiveAccount balance. 

	spaces := spaces - 1.! !

!SpecialAccountSummaryCreator methodsFor: 'operate' stamp: 'GL 10/31/2024 20:44:37'!
operateOnWithdraw: aWithdraw

	report nextPutAll: 'Extraccion por ', aWithdraw value.! !


!classDefinition: #TransferNetCreator category: #'Portfolio-Solucion'!
AccountReport subclass: #TransferNetCreator
	instanceVariableNames: 'net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetCreator methodsFor: 'create' stamp: 'GL 10/30/2024 20:26:22'!
createReport

	report := 'Transferencia neta = '.
	
	account operateWith: self.
	
	^report, net asString. ! !


!TransferNetCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:37'!
operateOnDeposit: aDeposit! !

!TransferNetCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:12'!
operateOnDepositLeg: aDepositLeg

	net := net + aDepositLeg value! !

!TransferNetCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:12:23'!
operateOnExtractionLeg: aExtractionLeg

	net := net - aExtractionLeg value. ! !

!TransferNetCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:30:23'!
operateOnPortfolio: aPortfolio

	aPortfolio do: [:anAccount | anAccount operateWith: self] .! !

!TransferNetCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:28:34'!
operateOnReceptiveAccount: aReceptiveAccount

	aReceptiveAccount do:[:aTransaction | aTransaction operateWith: self ]. ! !

!TransferNetCreator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:11:55'!
operateOnWithdraw: aWithdraw! !


!TransferNetCreator methodsFor: 'initialization' stamp: 'GL 10/30/2024 16:57:20'!
initializeWith: anAccount

	report := ''.
	net := 0. 
	account  := anAccount. ! !


!classDefinition: #PortfolioValidator category: #'Portfolio-Solucion'!
AccountOperation subclass: #PortfolioValidator
	instanceVariableNames: 'account validation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioValidator methodsFor: 'initialization' stamp: 'GL 10/31/2024 17:28:06'!
initializeWith: anAccount
	
	validation := false.
	account := anAccount ! !


!PortfolioValidator methodsFor: 'validation' stamp: 'GL 10/30/2024 20:37:46'!
validate
	
	account operateWith: self. 
	
	^validation.! !


!PortfolioValidator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:37:35'!
operateOnPortfolio: aPortfolio

	validation := true.! !

!PortfolioValidator methodsFor: 'operate' stamp: 'GL 10/30/2024 20:37:24'!
operateOnReceptiveAccount: aPortfolio
	
	validation := false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioValidator class' category: #'Portfolio-Solucion'!
PortfolioValidator class
	instanceVariableNames: ''!

!PortfolioValidator class methodsFor: 'instance creation' stamp: 'GL 10/30/2024 20:35:13'!
isPortfolio: anAccount

	^self new initializeWith: anAccount. ! !


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


!AccountTransaction methodsFor: 'report' stamp: 'GL 10/29/2024 21:37:35'!
addToReportOfType: aTypeOfReport

	self subclassResponsibility! !


!AccountTransaction methodsFor: 'operate' stamp: 'GL 10/30/2024 20:22:43'!
operateWith: aTypeOfOperation

	self subclassResponsibility! !


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


!Deposit methodsFor: 'report' stamp: 'GL 10/30/2024 20:11:37'!
addToReportOfType: aTypeOfReport

	aTypeOfReport operateOnDeposit: self. ! !


!Deposit methodsFor: 'operate' stamp: 'GL 10/30/2024 20:23:03'!
operateWith: aTypeOfOperation 

	aTypeOfOperation operateOnDeposit: self. ! !

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


!TransferLeg methodsFor: 'report' stamp: 'GL 10/30/2024 15:49:16'!
addToReportOfType: aTypeOfReport

	self subclassResponsibility! !


!TransferLeg methodsFor: 'initialization' stamp: 'GL 10/26/2024 13:20:47'!
initializeFor: aTransfer
	
	transfer := aTransfer. ! !


!TransferLeg methodsFor: 'operate' stamp: 'GL 10/30/2024 20:22:49'!
operateWith: aTypeOfOperation

	self subclassResponsibility! !

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


!DepositLeg methodsFor: 'report' stamp: 'GL 10/30/2024 20:11:12'!
addToReportOfType: aTypeOfReport
	
	aTypeOfReport operateOnDepositLeg: self. 

	! !


!DepositLeg methodsFor: 'operate' stamp: 'GL 10/30/2024 20:23:16'!
operateWith: aTypeOfOperation 

	aTypeOfOperation operateOnDepositLeg: self.! !


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


!ExtractionLeg methodsFor: 'report' stamp: 'GL 10/30/2024 20:12:23'!
addToReportOfType: aTypeOfReport

	
	aTypeOfReport operateOnExtractionLeg: self.
	! !


!ExtractionLeg methodsFor: 'operate' stamp: 'GL 10/30/2024 20:23:28'!
operateWith: aTypeOfOperation 

	aTypeOfOperation operateOnExtractionLeg: self.! !


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


!Withdraw methodsFor: 'report' stamp: 'GL 10/30/2024 20:11:55'!
addToReportOfType: aTypeOfReport

	aTypeOfReport operateOnWithdraw: self. ! !


!Withdraw methodsFor: 'operate' stamp: 'GL 10/30/2024 20:23:38'!
operateWith: aTypeOfOperation 

	aTypeOfOperation operateOnWithdraw: self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


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
