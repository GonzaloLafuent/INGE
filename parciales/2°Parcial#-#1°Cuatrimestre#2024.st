!classDefinition: #ConcreteTaskTest category: #'2°Parcial - 1°Cuatrimestre 2024'!
TestCase subclass: #ConcreteTaskTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!ConcreteTaskTest methodsFor: 'test' stamp: 'GL 11/17/2024 11:33:20'!
test01ConcreteAssignmentThatTakesLessOrEqualOfDedicationTimeOfADeveloperFinisheInOneDay

	|assignment startingTime|
	
	startingTime := DateAndTime now.
	
	assignment := ConcreteTask startsOn: startingTime 
										inChargeOf: self firstDeveloper 
										takes: 8*hour dependsOn: OrderedCollection new.
	
	self assert: (assignment finishDateIs: startingTime + (Duration days: 1)).! !

!ConcreteTaskTest methodsFor: 'test' stamp: 'GL 11/17/2024 11:33:20'!
test02ConcreteAssignmentThatTakesMoreOfDedicationTimeOfADeveloperFinishesInSeveralDays

	|assignment startingTime|
	
	startingTime := DateAndTime now.
	assignment := ConcreteTask startsOn: startingTime 
										inChargeOf: self firstDeveloper 
										takes: 12*hour dependsOn: OrderedCollection new.
	
	self assert: (assignment finishDateIs: startingTime + (Duration days: 2)).! !

!ConcreteTaskTest methodsFor: 'test' stamp: 'GL 11/17/2024 11:33:20'!
test03ConcreteAssignmentOfATeamTakesTimeOfTheSlowesdtDeveloper

	|assignment startingTime|

	startingTime := DateAndTime now.
	assignment := ConcreteTask startsOn: startingTime 
										inChargeOf: self team
										takes: 16*hour dependsOn: OrderedCollection new.
	
	self assert: (assignment finishDateIs: startingTime + (Duration days: 3)).! !

!ConcreteTaskTest methodsFor: 'test' stamp: 'GL 11/17/2024 11:33:20'!
test04startDateOfACocreteAssignmetsWithNoDependeciesItsTheWishedStartingDate

	|assignment startingTime|

	startingTime := DateAndTime now.
	assignment := ConcreteTask startsOn: startingTime 
										inChargeOf: self firstDeveloper 
										takes: 16*hour dependsOn: OrderedCollection new.
	
	self assert: (assignment startingDateIs: startingTime).! !

!ConcreteTaskTest methodsFor: 'test' stamp: 'GL 11/17/2024 11:33:20'!
test05ConcreateAssignmentStartsWhenFinishItLastDependencie

	|assignment startingTime task1 task2|

	startingTime := DateAndTime now.
	
	task1 := ConcreteTask startsOn: startingTime inChargeOf: self firstDeveloper takes: 32*hour dependsOn: {}.
	task2 := ConcreteTask startsOn: startingTime inChargeOf: self firstDeveloper takes: 16*hour dependsOn: {}. 
	
	assignment := ConcreteTask startsOn: startingTime 
										inChargeOf: self firstDeveloper
										takes: 16*hour dependsOn: {task1. task2}.
	
	self assert: (assignment startingDateIs: task1 finishDate).
	self deny: (assignment  startingDateIs: startingTime ). ! !

!ConcreteTaskTest methodsFor: 'test' stamp: 'GL 11/17/2024 11:33:20'!
test06ConcreateAssignmentStartsInDesireStartingDateWhenAllDepenciesFinishFirst

	|assignment startingTime task1 task2|

	startingTime := DateAndTime now.
	
	task1 := ConcreteTask startsOn: startingTime inChargeOf: self firstDeveloper takes: 8*hour dependsOn: {}.
	task2 := ConcreteTask startsOn: startingTime inChargeOf: self firstDeveloper takes: 8*hour dependsOn: {}. 
	
	assignment := ConcreteTask startsOn: startingTime + (Duration days: 2) 
										inChargeOf: self firstDeveloper
										takes: 16*hour dependsOn: {task1. task2}.
	
	self assert: (assignment startingDateIs: startingTime +(Duration days: 2)). ! !

!ConcreteTaskTest methodsFor: 'test' stamp: 'GL 11/17/2024 11:33:20'!
test07finishDateIsAffectdByStartingActualDate

	|assignment startingTime task1 |

	startingTime := DateAndTime now.
	
	task1 := ConcreteTask startsOn: startingTime inChargeOf: self firstDeveloper takes: 24*hour dependsOn: {}.
	
	assignment := ConcreteTask startsOn: startingTime 
										inChargeOf: self firstDeveloper
										takes: 16*hour 
										dependsOn: {task1}.
	
	self assert: (assignment finishDateIs: startingTime +(Duration days: 5)).
	self deny: (assignment finishDateIs: startingTime +(Duration days: 1) ). ! !


!ConcreteTaskTest methodsFor: 'setup' stamp: 'GL 11/16/2024 18:13:31'!
developer

	! !

!ConcreteTaskTest methodsFor: 'setup' stamp: 'GL 11/16/2024 18:14:11'!
firstDeveloper

	^(Developer named: 'Developer 1' cost: 60 andADedicationTime: 8*hour).! !

!ConcreteTaskTest methodsFor: 'setup' stamp: 'GL 11/16/2024 18:15:55'!
secondDeveloper

	^Developer named: 'Developer 2' cost: 80 andADedicationTime: 6*hour. 
	
	
	! !

!ConcreteTaskTest methodsFor: 'setup' stamp: 'GL 11/16/2024 18:15:22'!
team

	^Team with: (OrderedCollection with: self firstDeveloper with: self secondDeveloper ).! !


!classDefinition: #ProjectTest category: #'2°Parcial - 1°Cuatrimestre 2024'!
TestCase subclass: #ProjectTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:15:54'!
test01ProjectStartsAtTheStartingDateOfHisOnlyTask

	|startingTime project|
	
	startingTime := DateAndTime now.
	
	project := Project named: 'First project' dependsOn: {self taskFor: self firstDeveloper startingOn: startingTime}.
		 
	self assert: (project startingDateIs: startingTime).! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:16:08'!
test02ProjectStartsAtTheEarliestStaringDateOfItsSubtasks

	|firstTaskStartingDate secondTaskStartingDate project |
	
	firstTaskStartingDate := DateAndTime now.
	secondTaskStartingDate := DateAndTime now - (Duration days: 1). 
	
	project := Project named: 'First project' dependsOn: {self taskFor: self firstDeveloper startingOn: firstTaskStartingDate. 
													     self taskFor: self firstDeveloper startingOn: secondTaskStartingDate }.
		 
	self assert: (project startingDateIs: secondTaskStartingDate).
	self deny: (project startingDateIs: firstTaskStartingDate ).! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:16:16'!
test03ProjectFinishesAtTheFinishDateOfHisOnlyTask

	|firstTaskStartingDate project firstTask |
	
	firstTaskStartingDate := DateAndTime now.
	firstTask := self taskFor: self firstDeveloper startingOn: firstTaskStartingDate.

	project := Project named: 'First project' dependsOn: {firstTask}.
		 
	self assert: (project finishDateIs: firstTask finishDate ).! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:16:22'!
test04ProjectFinishesAtTheLataestFinishDateOfItsSubtasks

	|firstTaskStartingDate secondTaskStartingDate project firstTask secondTask |
	
	firstTaskStartingDate := DateAndTime now.
	secondTaskStartingDate := DateAndTime now + (Duration days: 3). 
	
	firstTask := self taskFor: self firstDeveloper startingOn: firstTaskStartingDate.
	secondTask := self taskFor: self firstDeveloper startingOn: secondTaskStartingDate.
	
	project := Project named: 'First project' dependsOn: {firstTask. secondTask }.
		 
	self assert: (project finishDateIs: secondTask finishDate ).
	self deny: (project finishDateIs: firstTask finishDate ).! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:16:30'!
test05ProjectHasNoOverAssignmentsWhenDevelopersHasNoOverAssigment

	| project firstTask secondTask |
	
	firstTask := self taskFor: self firstDeveloper startingOn: DateAndTime now.
	secondTask := self taskFor: self firstDeveloper startingOn: DateAndTime now + (Duration days: 3).
	
	project := Project named: 'First project' dependsOn: {firstTask. secondTask }.
	
	self deny: project worksheet hasOverAssigment.	 
	! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:17:24'!
test06ProjectHasOverAssignmentsWhenDeveloperHasOverAssigment

	| project firstTask secondTask startingDate developer|
	
	startingDate := DateAndTime  now.
	developer := self firstDeveloper. 
	
	firstTask := self taskFor: developer startingOn: startingDate .
	secondTask := self taskFor: developer startingOn: startingDate.
	
	project := Project named: 'First project' dependsOn: {firstTask. secondTask }.
	
	self assert: project worksheet hasOverAssigment.	 
	! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:18:11'!
test07DeveloperWithNoTaskHasNoOverwork

	| project firstTask secondTask startingDate worksheet |
	
	startingDate := DateAndTime  now.
	firstTask := self taskFor: self firstDeveloper startingOn: startingDate .
	secondTask := self taskFor: self firstDeveloper startingOn: startingDate.
	
	project := Project named: 'First project' dependsOn: {firstTask. secondTask }.
	worksheet := Worksheet of: project.
	
	self assert: ((worksheet overAssignDaysOf: self secondDeveloper) isEmpty).	 
	! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:19:08'!
test08DeveloperWithOneTaskHasNoOverwork

	| project firstTask startingDate worksheet developer |
	
	startingDate := DateAndTime  now.
	
	developer := self firstDeveloper. 
	firstTask := self taskFor: developer startingOn: startingDate .
	
	project := Project named: 'First project' dependsOn: {firstTask}.
	worksheet := Worksheet of: project.
	
	self assert: ((worksheet overAssignDaysOf: developer) isEmpty).	 
	! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:20:14'!
test09DeveloperWithManyTaskOneDayHasOverwork

	| project firstTask startingDate worksheet secondTask overAssingDays  developer|
	
	startingDate := DateAndTime  now.
	developer := self firstDeveloper. 
	
	firstTask := self taskFor: developer startingOn: startingDate .
	secondTask := self taskFor: developer startingOn: startingDate. 
	
	project := Project named: 'First project' dependsOn: {firstTask. secondTask}.
	worksheet := Worksheet of: project.
	overAssingDays := worksheet overAssignDaysOf: developer.
	
	self deny: overAssingDays isEmpty.	 
	self assert: (overAssingDays includes: startingDate).
	self assert: (overAssingDays includes: firstTask finishDate).
	! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:21:55'!
test10TeamCanHaveOverAssignDevelopers

	| project firstTask startingDate worksheet secondTask overAssingDays developer|
	
	startingDate := DateAndTime  now.
	developer := self firstDeveloper. 
	
	firstTask := self taskFor: (Team with: {developer}) startingOn: startingDate .
	secondTask := self taskFor: (Team with: {developer}) startingOn: startingDate. 
	
	project := Project named: 'First project' dependsOn: {firstTask. secondTask}.
	worksheet := Worksheet of: project.
	overAssingDays := worksheet overAssignDaysOf: developer.
	
	self deny: overAssingDays isEmpty.	 
	self assert: (overAssingDays includes: startingDate).
	self assert: (overAssingDays includes: firstTask finishDate).
	! !

!ProjectTest methodsFor: 'test' stamp: 'GL 11/17/2024 16:29:46'!
test11CostOfThePorjectsIsTheSumOfAllTheCostOfSubtasks

	| project firstTask startingDate worksheet secondTask developer |
	
	startingDate := DateAndTime now.
	developer := self firstDeveloper.
	
	firstTask := self taskFor: developer startingOn: startingDate .
	secondTask := self taskFor: (Team with:{developer}) startingOn: startingDate. 
	
	project := Project named: 'First project' dependsOn: {firstTask. secondTask}.
	worksheet := Worksheet of: project.
	
	self assert: worksheet cost equals: 960. ! !


!ProjectTest methodsFor: 'setup' stamp: 'GL 11/17/2024 11:40:40'!
firstDeveloper

	^Developer named: 'First developer'  cost: 60 andADedicationTime: 8*hour.! !

!ProjectTest methodsFor: 'setup' stamp: 'GL 11/17/2024 16:18:30'!
secondDeveloper

	^Developer named: 'Second developer'  cost: 60 andADedicationTime: 8*hour.! !

!ProjectTest methodsFor: 'setup' stamp: 'GL 11/17/2024 16:15:15'!
taskFor: aWorker startingOn: aStartingDate

	^ConcreteTask startsOn: aStartingDate inChargeOf: aWorker takes: 8*hour dependsOn:{}. ! !

!ProjectTest methodsFor: 'setup' stamp: 'GL 11/17/2024 15:59:11'!
teamTaskStartingOn: aStartingDate

	^ConcreteTask startsOn: aStartingDate inChargeOf: (Team with: {self firstDeveloper}) takes: 8*hour dependsOn:{}. ! !


!classDefinition: #Task category: #'2°Parcial - 1°Cuatrimestre 2024'!
Object subclass: #Task
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!Task methodsFor: 'accessing' stamp: 'GL 11/17/2024 12:12:12'!
finishDate

	self subclassResponsibility! !

!Task methodsFor: 'accessing' stamp: 'GL 11/17/2024 12:12:19'!
startingDate

	self subclassResponsibility! !


!Task methodsFor: 'testing' stamp: 'GL 11/17/2024 12:12:29'!
finishDateIs: aFinishDate

	self subclassResponsibility! !

!Task methodsFor: 'testing' stamp: 'GL 11/17/2024 12:12:24'!
startingDateIs: aStartingDate

	self subclassResponsibility! !


!Task methodsFor: 'worksheet' stamp: 'GL 11/17/2024 12:43:22'!
addToWorksheet: aWorksheet

	self subclassResponsibility! !


!classDefinition: #ConcreteTask category: #'2°Parcial - 1°Cuatrimestre 2024'!
Task subclass: #ConcreteTask
	instanceVariableNames: 'expectedStartingDate worker timeOfTheAssignment depentTasks'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!ConcreteTask methodsFor: 'initialization' stamp: 'GL 11/17/2024 11:24:37'!
initializeStartsOn: aStartingDate inChargeOf: aDeveloper takes: anAmountOfTime dependsOn: aCollectionOfAssingments  
	
	expectedStartingDate := aStartingDate.
	worker := aDeveloper.
	timeOfTheAssignment := anAmountOfTime.
	depentTasks := aCollectionOfAssingments. ! !


!ConcreteTask methodsFor: 'accessing' stamp: 'GL 11/17/2024 11:24:37'!
finishDate
	 
	^self startingDate + (worker amountOfDaysToFinish: timeOfTheAssignment). 
! !

!ConcreteTask methodsFor: 'accessing' stamp: 'GL 11/17/2024 11:24:29'!
startingDate
	
	depentTasks ifEmpty: [^expectedStartingDate]. 
	
	^expectedStartingDate max: (depentTasks max: [:aTask | aTask finishDate]).! !


!ConcreteTask methodsFor: 'testing' stamp: 'GL 11/17/2024 11:23:26'!
finishDateIs: aFinishDate

	^self finishDate = aFinishDate. ! !

!ConcreteTask methodsFor: 'testing' stamp: 'GL 11/17/2024 11:23:55'!
startingDateIs: aStartingDate

	^self startingDate = aStartingDate . ! !


!ConcreteTask methodsFor: 'worksheet' stamp: 'GL 11/17/2024 13:07:54'!
addToWorksheet: aWorksheet 
	
	|day lastDay|
	
	day := self startingDate.
	lastDay := self finishDate. 
	
	[day <= lastDay] whileTrue: [
		worker addToWorksheet: aWorksheet on: day. 
		day := day + (Duration days: 1).
	] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConcreteTask class' category: #'2°Parcial - 1°Cuatrimestre 2024'!
ConcreteTask class
	instanceVariableNames: ''!

!ConcreteTask class methodsFor: 'instance creation' stamp: 'GL 11/16/2024 17:48:00'!
startsOn: aStartingDate inChargeOf: aDeveloper takes: anAmountOfTime dependsOn: aCollectionOfTasks  
	
	^self new initializeStartsOn: aStartingDate inChargeOf: aDeveloper takes: anAmountOfTime dependsOn: aCollectionOfTasks. ! !


!classDefinition: #Project category: #'2°Parcial - 1°Cuatrimestre 2024'!
Task subclass: #Project
	instanceVariableNames: 'name subtasks'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!Project methodsFor: 'initialization' stamp: 'GL 11/17/2024 11:45:11'!
initializeWithName: aName andSubtasks: aCollectionOfSubtasks 
	
	name := aName.
	subtasks := aCollectionOfSubtasks.! !


!Project methodsFor: 'testing' stamp: 'GL 11/17/2024 11:57:20'!
finishDateIs: aFinishDate 

	^self finishDate = aFinishDate. 	! !

!Project methodsFor: 'testing' stamp: 'GL 11/17/2024 11:46:11'!
startingDateIs: aStartingDate 
		
	^self startingDate = aStartingDate. ! !


!Project methodsFor: 'accessing' stamp: 'GL 11/17/2024 11:58:00'!
finishDate

	^subtasks max:[:aSubtask  | aSubtask finishDate ]. ! !

!Project methodsFor: 'accessing' stamp: 'GL 11/17/2024 11:47:06'!
startingDate
	
	^subtasks min: [:aSubtask | aSubtask startingDate ]. ! !

!Project methodsFor: 'accessing' stamp: 'GL 11/17/2024 12:42:33'!
worksheet
	
	^Worksheet of: self. ! !


!Project methodsFor: 'worksheet' stamp: 'GL 11/17/2024 12:46:53'!
addToWorksheet: aWorksheet 
	
	subtasks do: [:aTask | aTask addToWorksheet: aWorksheet ]. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Project class' category: #'2°Parcial - 1°Cuatrimestre 2024'!
Project class
	instanceVariableNames: ''!

!Project class methodsFor: 'instance creation' stamp: 'GL 11/17/2024 11:44:41'!
named: aName dependsOn: aCollectionOfSubtasks 
	
	^self new initializeWithName: aName andSubtasks: aCollectionOfSubtasks ! !


!classDefinition: #Worker category: #'2°Parcial - 1°Cuatrimestre 2024'!
Object subclass: #Worker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!Worker methodsFor: 'calculating' stamp: 'GL 11/16/2024 18:36:13'!
amountOfDaysToFinish: aTimeOfATask

	self subclassResponsibility! !


!classDefinition: #Developer category: #'2°Parcial - 1°Cuatrimestre 2024'!
Worker subclass: #Developer
	instanceVariableNames: 'name costPerHour dedicationTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!Developer methodsFor: 'calculating' stamp: 'GL 11/16/2024 17:10:16'!
amountOfDaysToFinish: aTimeOfATask
	
	^Duration days: ((aTimeOfATask  / dedicationTime ) 	ceiling )! !

!Developer methodsFor: 'calculating' stamp: 'GL 11/17/2024 16:29:04'!
costWithDaysWorked: amountOfDaysWork 
	
	^costPerHour value * amountOfDaysWork value * dedicationTime amount. ! !


!Developer methodsFor: 'accesing' stamp: 'GL 11/17/2024 12:32:39'!
name

	^name. ! !


!Developer methodsFor: 'worksheet' stamp: 'GL 11/17/2024 16:11:09'!
addToWorksheet: aWorksheet on: day

	aWorksheet add: day to: self.! !


!Developer methodsFor: 'intialization' stamp: 'GL 11/16/2024 17:04:06'!
initializeWithname: aName cost: aCostPerHour andADedicationTime: aTimeMeasure 
	
	name := aName.
	costPerHour := aCostPerHour.
	dedicationTime := aTimeMeasure.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Developer class' category: #'2°Parcial - 1°Cuatrimestre 2024'!
Developer class
	instanceVariableNames: ''!

!Developer class methodsFor: 'instance creation' stamp: 'GL 11/16/2024 17:03:37'!
named: aName cost: aCostPerHour andADedicationTime: aTimeMeasure

	^self new initializeWithname: aName cost: aCostPerHour andADedicationTime: aTimeMeasure. ! !


!classDefinition: #Team category: #'2°Parcial - 1°Cuatrimestre 2024'!
Worker subclass: #Team
	instanceVariableNames: 'collectionOfTeamMembers teamMembers'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!Team methodsFor: 'intialization' stamp: 'GL 11/16/2024 17:25:02'!
initializeWith: aCollectionOfTeamMembers 
	
	teamMembers := aCollectionOfTeamMembers.! !


!Team methodsFor: 'worksheet' stamp: 'GL 11/17/2024 16:00:57'!
addToWorksheet: aWorksheet on: day

	teamMembers do: [:aDeveloper | aDeveloper addToWorksheet: aWorksheet on: day ]. ! !


!Team methodsFor: 'calculating' stamp: 'GL 11/16/2024 17:32:14'!
amountOfDaysToFinish: aTimeOfATask 
	
	^teamMembers max: [:aDeveloper | aDeveloper amountOfDaysToFinish: aTimeOfATask ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Team class' category: #'2°Parcial - 1°Cuatrimestre 2024'!
Team class
	instanceVariableNames: ''!

!Team class methodsFor: 'instance creation' stamp: 'GL 11/16/2024 17:24:43'!
with: aCollectionOfTeamMembers 
	
	^self new initializeWith: aCollectionOfTeamMembers ! !


!classDefinition: #Worksheet category: #'2°Parcial - 1°Cuatrimestre 2024'!
Object subclass: #Worksheet
	instanceVariableNames: 'collectionOfSubtasks subtasks workSheet'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2°Parcial - 1°Cuatrimestre 2024'!

!Worksheet methodsFor: 'initialization' stamp: 'GL 11/17/2024 12:41:57'!
initializeOf: aProject 
	
	workSheet := Dictionary new.
	
	aProject addToWorksheet: self.! !


!Worksheet methodsFor: 'adding' stamp: 'GL 11/17/2024 13:06:47'!
add: aDate to: aDeveloperName

	workSheet at: aDeveloperName ifPresent: [:developerDates | developerDates add: aDate ]  
								    ifAbsent: [workSheet at: aDeveloperName put: (Bag with: aDate) ]! !


!Worksheet methodsFor: 'testing' stamp: 'GL 11/17/2024 13:13:59'!
hasOverAssigment
	
	^workSheet keys anySatisfy: [:aDeveloper | (workSheet at: aDeveloper) 
		                                                                 anySatisfy: [:date | 
											                        ((workSheet at: aDeveloper) occurrencesOf: date) > 1] ]! !


!Worksheet methodsFor: 'accesing' stamp: 'GL 11/17/2024 16:29:37'!
cost
	
	^workSheet keys sum:[:aWorker| aWorker costWithDaysWorked: (workSheet at: aWorker) asSet size  ]! !

!Worksheet methodsFor: 'accesing' stamp: 'GL 11/17/2024 15:51:00'!
overAssignDaysOf: aDeveloperName 
	
	workSheet at: aDeveloperName ifPresent: [:developerDates | ^(developerDates select: [:aDate | 
			                                                                                           ((developerDates occurrencesOf: aDate)> 1)]) asSet ]
								    ifAbsent: [^{}] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Worksheet class' category: #'2°Parcial - 1°Cuatrimestre 2024'!
Worksheet class
	instanceVariableNames: ''!

!Worksheet class methodsFor: 'instance creation' stamp: 'GL 11/17/2024 12:58:26'!
of: aProject 

	^self new initializeOf: aProject ! !
