!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'aStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/18/2024 20:33:53'!
setUp
	aStack := OOStack new.
	aStack push: 'winter is coming'.
	aStack push: 'winning is everything'.
	aStack push: 'The winds of Winter'.
	aStack push: 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/19/2024 12:24:12'!
test01FindOfAnEmptyStackShouldBeAnEmptySolution
	|emptyStack finder expectedResult|
	
	emptyStack := OOStack new.
	
	finder := SentenceFinderByPrefix for: emptyStack.
	expectedResult := 		OrderedCollection new.
	
	self assert: (finder find: 'Wint' in: emptyStack) = expectedResult.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/19/2024 12:24:23'!
test02FindAEmptyPrefixInAStackShouldReturnAllTheElementsOfTheStack
	|finder expectedResult|
	
	finder := SentenceFinderByPrefix for: aStack.
	expectedResult := 		OrderedCollection with: 'winter is coming' with: 'winning is everything'
					with: 'The winds of Winter' with: 'Winter is here'.
	
	self assert: (finder find: '' in: aStack) = expectedResult .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/19/2024 12:24:35'!
test03FindIsCaseSensitive
	|finder expectedResult|
	
	finder := SentenceFinderByPrefix for: aStack.
	
	expectedResult := OrderedCollection with: 'Winter is here'.
	
	self assert: (finder find: 'Wint' in: aStack) = expectedResult . 
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/19/2024 12:24:45'!
test04FindDoesntAlterateTheStackSize
	|finder|
	
	finder := SentenceFinderByPrefix for: aStack.
	
	finder find: 'Wint' in: aStack. 
	
	self assert: aStack size  = 4 . 
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/19/2024 12:24:54'!
test05ThePrefixDoesntMatchWithNoSentence
	|finder expectedResult|
	
	finder := SentenceFinderByPrefix for: aStack.
	expectedResult := 		OrderedCollection new.
		
	self assert: (finder find: 'Gan' in: aStack) = expectedResult .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/19/2024 12:25:17'!
test06FindDoesntAlterateTheStackOrderOfElements
	|finder stack|
	
	finder := SentenceFinderByPrefix for: aStack.
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	finder find: 'Wint' in: aStack. 
	
	self assert: aStack top  = stack top. 
	
	
	
	! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'GL 9/18/2024 21:01:41'!
isEmpty
	^self state isEmpty.! !

!OOStack methodsFor: 'accessing' stamp: 'l 9/13/2024 21:20:34'!
size
	^stack size. ! !

!OOStack methodsFor: 'accessing' stamp: 'GL 9/18/2024 21:03:08'!
state
	|indexState state|
	
	indexState := (self size sign) + 1.
	state := StateStack subclasses at: indexState. 
	
	^state for: self. 
	! !


!OOStack methodsFor: 'pop Methods' stamp: 'GL 9/18/2024 21:02:14'!
pop
	^self state pop.! !

!OOStack methodsFor: 'pop Methods' stamp: 'GL 9/15/2024 18:28:03'!
popFromEmptyStack
	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'pop Methods' stamp: 'GL 9/18/2024 21:05:35'!
popFromNonEmptyStack
	|popedElement|
	popedElement := stack removeFirst.
	^popedElement.! !


!OOStack methodsFor: 'push Methods' stamp: 'GL 9/18/2024 21:12:22'!
push: aElement
	stack addFirst: aElement.
	! !


!OOStack methodsFor: 'initialization' stamp: 'GL 9/18/2024 21:04:05'!
initialize
	stack := OrderedCollection new.! !


!OOStack methodsFor: 'top methods' stamp: 'GL 9/18/2024 21:11:41'!
top
	^self state top.! !

!OOStack methodsFor: 'top methods' stamp: 'GL 9/17/2024 16:37:52'!
topANonEmptyStack
	 ^stack first! !

!OOStack methodsFor: 'top methods' stamp: 'GL 9/15/2024 18:43:48'!
topAnEmptyStack
	^self error: self class stackEmptyErrorDescription. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack backupStack result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'GL 9/19/2024 12:22:19'!
find: aPrefix in: aStack
	result := OrderedCollection new.
	
	self selectSentencesBy: [ :element| 
		(element beginsWith: aPrefix) ifTrue: [result addFirst: element].
	].

	^result.

! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'GL 9/19/2024 12:27:45'!
initializeWith: aStack
	stack := aStack.
	backupStack := OOStack new.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'GL 9/19/2024 12:28:02'!
restoreStack
	[backupStack isEmpty not] whileTrue:[
		stack push: (backupStack pop). 
	].
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'GL 9/19/2024 12:28:11'!
selectSentencesBy: aBlockToExecute
	|element|
	
	[stack isEmpty not] whileTrue:[
		element := (backupStack push: stack pop) top.	
		aBlockToExecute value: element. 
	].
	
	self restoreStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'GL 9/19/2024 12:15:21'!
for: aStack
	^self new initializeWith: aStack.! !


!classDefinition: #StateStack category: #'Stack-Exercise'!
Object subclass: #StateStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateStack methodsFor: 'initialization' stamp: 'GL 9/18/2024 20:58:13'!
for: aStack
	stack := aStack.! !


!StateStack methodsFor: 'accessing' stamp: 'l 9/13/2024 21:53:32'!
isEmpty

	self subclassResponsibility! !

!StateStack methodsFor: 'accessing' stamp: 'GL 9/18/2024 21:09:49'!
pop
	self subclassResponsibility. ! !

!StateStack methodsFor: 'accessing' stamp: 'GL 9/18/2024 21:09:43'!
top
	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateStack class' category: #'Stack-Exercise'!
StateStack class
	instanceVariableNames: ''!

!StateStack class methodsFor: 'as yet unclassified' stamp: 'GL 9/18/2024 20:57:52'!
for: aStack
	^self new for: aStack.! !


!classDefinition: #EmptyStack category: #'Stack-Exercise'!
StateStack subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'accesing' stamp: 'l 9/13/2024 21:53:41'!
isEmpty
	^true.! !

!EmptyStack methodsFor: 'accesing' stamp: 'GL 9/18/2024 20:59:19'!
pop
	stack popFromEmptyStack. ! !

!EmptyStack methodsFor: 'accesing' stamp: 'GL 9/18/2024 21:00:39'!
top
	^stack topAnEmptyStack. ! !


!classDefinition: #NonEmptyStack category: #'Stack-Exercise'!
StateStack subclass: #NonEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStack methodsFor: 'accessing' stamp: 'l 9/13/2024 21:53:49'!
isEmpty
	^false.! !

!NonEmptyStack methodsFor: 'accessing' stamp: 'GL 9/18/2024 21:00:53'!
pop
	^stack popFromNonEmptyStack. ! !

!NonEmptyStack methodsFor: 'accessing' stamp: 'GL 9/18/2024 21:01:17'!
top
	^stack topANonEmptyStack. ! !
