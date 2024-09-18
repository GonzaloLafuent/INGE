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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/17/2024 16:03:44'!
test01FindOfAnEmptyStackShouldBeAnEmptySolution
	|stack finder emptyCollection|
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	emptyCollection := 		OrderedCollection new.
	
	self assert: (finder find: 'a' in: stack) = emptyCollection.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/17/2024 21:43:22'!
test02FindAEmptyPrefixInAStackShouldReturnAllTheElementsOfTheStack
	|stack finder aCollection|
	
	stack := OOStack new.
	
	stack push: 'hola como va?'. 
	stack push: 'todo bien vos?'.
	
	finder := SentenceFinderByPrefix new.
	aCollection := 		OrderedCollection with: 'hola como va?' with: 'todo bien vos?'.
	
	self assert: (finder find: '' in: stack) = aCollection.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GL 9/17/2024 16:32:52'!
test03FindIsCaseSensitive
	|finder stack collection|
	
	stack := OOStack new.
	
	stack push: 'hola como va?'.
	stack push: 'Hola como va?'.
	
	finder := SentenceFinderByPrefix new.
	
	collection := OrderedCollection with: 'hola como va?'.
	
	self assert: (finder find: 'hola' in: stack = collection). 
	
	
	
	! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackState stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'GL 9/15/2024 18:22:16'!
isEmpty
	^stackState isEmpty.! !

!OOStack methodsFor: 'accessing' stamp: 'l 9/13/2024 21:20:34'!
size
	^stack size. ! !


!OOStack methodsFor: 'pop Methods' stamp: 'GL 9/15/2024 18:47:00'!
pop
	^stackState pop: self.! !

!OOStack methodsFor: 'pop Methods' stamp: 'GL 9/15/2024 18:28:03'!
popFromEmptyStack
	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'pop Methods' stamp: 'GL 9/17/2024 16:37:17'!
popFromNonEmptyStack
	"Aca nos queda revisar que pasa cuando llegamos a cero para cmabiar el estado de nuevo a empty"
	|popedElement index classState|
	popedElement := stack removeFirst.
	index := (stack size sign) + 1.
	classState := StateStack subclasses at: index. 
	stackState := classState new. 
	^popedElement.! !


!OOStack methodsFor: 'push Methods' stamp: 'GL 9/15/2024 18:46:52'!
push: aElement
	stackState push: aElement to: self.
	! !

!OOStack methodsFor: 'push Methods' stamp: 'GL 9/17/2024 16:36:02'!
pushToAEmptyStack: anElement
	stackState := NonEmptyStack new.
	stack addFirst: anElement.
	
	! !

!OOStack methodsFor: 'push Methods' stamp: 'GL 9/15/2024 18:38:47'!
pushToANonEmptyStack: anElement
	stack addFirst: anElement.
	
! !


!OOStack methodsFor: 'initialization' stamp: 'l 9/13/2024 21:48:14'!
initialize
	stackState := EmptyStack new.
	stack := OrderedCollection new.! !


!OOStack methodsFor: 'top methods' stamp: 'GL 9/15/2024 18:46:27'!
top
	^stackState top: self.! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'GL 9/17/2024 21:49:15'!
find: aPrefix in: aStack
	|auxiliarStack elementToCompare result element|
	
	result := OrderedCollection new.
	auxiliarStack := OOStack new.

	[aStack isEmpty not] whileTrue:[
		elementToCompare := aStack pop.	
		(elementToCompare beginsWith: aPrefix) ifTrue: [result addFirst: elementToCompare].
		auxiliarStack push: elementToCompare.
	].

	[auxiliarStack isEmpty not] whileTrue:[
		element := auxiliarStack pop.	
		aStack push: element.
	].	
	
	^result.

! !


!classDefinition: #StateStack category: #'Stack-Exercise'!
Object subclass: #StateStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateStack methodsFor: 'as yet unclassified' stamp: 'l 9/13/2024 21:53:32'!
isEmpty

	self subclassResponsibility! !

!StateStack methodsFor: 'as yet unclassified' stamp: 'GL 9/15/2024 18:28:57'!
pop: aStack
	self subclassResponsibility! !

!StateStack methodsFor: 'as yet unclassified' stamp: 'GL 9/15/2024 18:37:15'!
push: anElement to: aStack

	self subclassResponsibility! !

!StateStack methodsFor: 'as yet unclassified' stamp: 'GL 9/15/2024 18:45:28'!
top: aStack

	self subclassResponsibility! !


!classDefinition: #EmptyStack category: #'Stack-Exercise'!
StateStack subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'l 9/13/2024 21:53:41'!
isEmpty
	^true.! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'GL 9/15/2024 18:28:41'!
pop: aStack
	aStack popFromEmptyStack. ! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'GL 9/15/2024 20:01:01'!
push: anElement to: aStack
	aStack pushToAEmptyStack: anElement.! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'GL 9/15/2024 18:45:52'!
top: aStack
	^aStack topAnEmptyStack. ! !


!classDefinition: #NonEmptyStack category: #'Stack-Exercise'!
StateStack subclass: #NonEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStack methodsFor: 'as yet unclassified' stamp: 'l 9/13/2024 21:53:49'!
isEmpty
	^false.! !

!NonEmptyStack methodsFor: 'as yet unclassified' stamp: 'GL 9/17/2024 16:37:17'!
pop: aStack
	^aStack popFromNonEmptyStack. ! !

!NonEmptyStack methodsFor: 'as yet unclassified' stamp: 'GL 9/15/2024 18:40:53'!
push: anElement to: aStack
	aStack pushToANonEmptyStack: anElement. ! !

!NonEmptyStack methodsFor: 'as yet unclassified' stamp: 'GL 9/17/2024 16:37:52'!
top: aStack
	^aStack topANonEmptyStack. ! !
