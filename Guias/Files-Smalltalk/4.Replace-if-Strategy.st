!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:18:11'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := ElectricMotorcycle new.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:18:24'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := Helicopter new.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:18:35'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := ElectricMotorcycle new.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:18:50'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := GasolineMotorcycle new.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:19:07'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := Helicopter new.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:19:18'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := Helicopter new.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:19:31'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := ElectricMotorcycle new.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:19:44'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := GasolineMotorcycle  new.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'GL 9/8/2024 17:19:52'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := Helicopter new.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #Engine category: #'4.Replace-if-Strategy'!
Object subclass: #Engine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Engine methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 13:01:41'!
acceleration
	self subclassResponsibility.! !

!Engine methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:39:29'!
acceleration: speed
	self subclassResponsibility.! !


!classDefinition: #Electric category: #'4.Replace-if-Strategy'!
Engine subclass: #Electric
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Electric methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 13:08:01'!
acceleration: speed
	^(speed + (5 * kilometer / hour)) * 2 ! !


!classDefinition: #Gasoline category: #'4.Replace-if-Strategy'!
Engine subclass: #Gasoline
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Gasoline methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 13:08:42'!
acceleration
	^10 * kilometer / hour. ! !


!classDefinition: #JetFueled category: #'4.Replace-if-Strategy'!
Engine subclass: #JetFueled
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!JetFueled methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 13:09:14'!
acceleration: speed
	^((speed amount + 1) ^ 2) * kilometer / hour. ! !


!classDefinition: #State category: #'4.Replace-if-Strategy'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!State methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 13:21:40'!
accelerate: vehicle
	self subclassResponsibility.! !


!classDefinition: #Off category: #'4.Replace-if-Strategy'!
State subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Off methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 13:21:07'!
accelerate: vehicle
	vehicle accelerateOffVehicle.! !


!classDefinition: #On category: #'4.Replace-if-Strategy'!
State subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!On methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 13:21:31'!
accelerate: vehicle
	vehicle accelerateOnVehicle.! !


!classDefinition: #Surrounding category: #'4.Replace-if-Strategy'!
Object subclass: #Surrounding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Surrounding methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:50:37'!
verifySpeedLimit: vehicle
	self subclassResponsibility. ! !


!classDefinition: #City category: #'4.Replace-if-Strategy'!
Surrounding subclass: #City
	instanceVariableNames: 'ddsdsds'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!City methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 17:02:38'!
verifySpeedLimit: vehicle
	vehicle speedShouldBeLessThan: (70 * kilometer / hour).! !


!classDefinition: #OpenRoad category: #'4.Replace-if-Strategy'!
Surrounding subclass: #OpenRoad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!OpenRoad methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 17:03:44'!
verifySpeedLimit: vehicle
	vehicle speedShouldBeLessThan: (130 * kilometer / hour).! !


!classDefinition: #Skies category: #'4.Replace-if-Strategy'!
Surrounding subclass: #Skies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Skies methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 17:04:12'!
verifySpeedLimit: vehicle
	 vehicle speedShouldBeLessThan: (500 * kilometer / hour)! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'state type speed altitude engineType where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'GL 9/8/2024 17:22:10'!
commonInitialization
	state := Off new.
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !

!Vehicle methodsFor: 'initialization' stamp: 'GL 9/8/2024 16:05:05'!
initialize 
	self subclassResponsibility.! !


!Vehicle methodsFor: 'move' stamp: 'GL 9/8/2024 17:06:53'!
accelerate
	state accelerate: self.! !

!Vehicle methodsFor: 'move' stamp: 'GL 9/8/2024 16:38:06'!
accelerateOffVehicle
	self error: self canNotAccelerateErrorMessage.! !

!Vehicle methodsFor: 'move' stamp: 'GL 9/8/2024 13:16:56'!
accelerateOnVehicle
	self subclassResponsibility.! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:24:00'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !

!Vehicle methodsFor: 'move' stamp: 'GL 9/8/2024 17:03:11'!
speedShouldBeLessThan: speedMeasure
	speed > (speedMeasure) ifTrue: [ speed := speedMeasure ]! !


!Vehicle methodsFor: 'on/off' stamp: 'GL 9/8/2024 13:19:22'!
turnOff

	state := Off new.
	speed := 0 * kilometer / hour! !

!Vehicle methodsFor: 'on/off' stamp: 'GL 9/8/2024 13:19:30'!
turnOn

	state := On new.! !


!Vehicle methodsFor: 'error messages' stamp: 'GL 9/8/2024 16:34:12'!
canNotAccelerateErrorMessage
	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-Strategy'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'NR 9/7/2024 08:53:59'!
electricMotorcycle

	^ self new initializeWithType: #Motorcycle engineType: #ElectricEngine andSurroundings: #city

! !

!Vehicle class methodsFor: 'instance creation' stamp: 'NR 9/7/2024 08:53:55'!
gasolineMotorcycle

	^ self new initializeWithType: #Motorcycle engineType: #GasolineEngine andSurroundings: #openRoad! !

!Vehicle class methodsFor: 'instance creation' stamp: 'NR 9/7/2024 08:54:07'!
helicopter

	^ self new initializeWithType: #Helicopter engineType: #JetFueledEngine andSurroundings: #skies! !


!classDefinition: #AirVehicle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #AirVehicle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!AirVehicle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:08:28'!
accelerateOnVehicle
	self subclassResponsibility.! !

!AirVehicle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:12:44'!
canNotAccelerateErrorMessage
	self subclassResponsibility. ! !

!AirVehicle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:05:25'!
initialize 
	self subclassResponsibility.! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
AirVehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 17:05:10'!
accelerateOnVehicle
	speed := speed + (engineType acceleration: speed).
	altitude := altitude + (5 * meter).
	
	where verifySpeedLimit: self.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:13:44'!
canNotAccelerateErrorMessage
	^'Can not fly when turned off'.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 17:26:31'!
initialize
	self commonInitialization. 
	where := Skies new.
	engineType  := JetFueled new.! !


!classDefinition: #LandVehicle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #LandVehicle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!LandVehicle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:30:55'!
accelerateOnVehicle
	self subclassResponsibility. ! !

!LandVehicle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:33:55'!
canNotAccelerateErrorMessage
	self subclassResponsibility. ! !

!LandVehicle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:20:50'!
initialize
	self subclassResponsibility. ! !


!classDefinition: #Motorcycle category: #'4.Replace-if-Strategy'!
LandVehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 17:06:20'!
accelerateMotorcycle: acceleration
	 speed := speed + acceleration.
	! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:31:37'!
accelerateOnVehicle
	self subclassResponsibility. ! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:34:20'!
canNotAccelerateErrorMessage
	^'Can not run when turned off'. ! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:21:08'!
initialize 
	self subclassResponsibility. ! !


!classDefinition: #ElectricMotorcycle category: #'4.Replace-if-Strategy'!
Motorcycle subclass: #ElectricMotorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!ElectricMotorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 17:05:54'!
accelerateOnVehicle 
	self accelerateMotorcycle: (engineType acceleration: speed). 
	where verifySpeedLimit: self.! !

!ElectricMotorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:28:34'!
initialize 
	self commonInitialization.
	engineType  := Electric new.
	where  := City new.! !


!classDefinition: #GasolineMotorcycle category: #'4.Replace-if-Strategy'!
Motorcycle subclass: #GasolineMotorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!GasolineMotorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 17:06:02'!
accelerateOnVehicle 
	self accelerateMotorcycle: (engineType acceleration). 
	where verifySpeedLimit: self.! !

!GasolineMotorcycle methodsFor: 'as yet unclassified' stamp: 'GL 9/8/2024 16:29:31'!
initialize
	self commonInitialization.
	engineType := Gasoline new.
	where := 	OpenRoad new.! !
