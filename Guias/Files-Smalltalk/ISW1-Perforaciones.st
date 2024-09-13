!classDefinition: #TestDePerforación category: #'ISW1-Perforaciones'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!TestDePerforación methodsFor: 'test' stamp: 'GL 9/13/2024 11:19:18'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: Tierra new equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:58'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:52'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:05'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:09'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: CapaDeSuelo arenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:45'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.	
			CapaDeSuelo tierra.
} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:03:00'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota ].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:43'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	
	self assert: (CapaDeSuelo concretoConResistencia: 5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:48'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: (CapaDeSuelo concretoConResistencia: 4) equals: excavadora capaDeSueloInmediata

	
	! !


!classDefinition: #CapaDeSuelo category: #'ISW1-Perforaciones'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: 'tipo resistencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!CapaDeSuelo methodsFor: 'initialization' stamp: 'GL 9/13/2024 11:05:25'!
initializeArenoso
	
	"tipo := #Arenoso."! !

!CapaDeSuelo methodsFor: 'initialization' stamp: 'GL 9/13/2024 11:05:11'!
initializeConcretoConResistencia: resistenciaInicial 

	resistencia := resistenciaInicial.
	"tipo := #Concreto."! !

!CapaDeSuelo methodsFor: 'initialization' stamp: 'GL 9/13/2024 11:05:17'!
initializeTierra
	
	"tipo := #Tierra."! !


!CapaDeSuelo methodsFor: 'tipo' stamp: 'GL 9/10/2024 21:35:47'!
esArenoso
	^self class = #Arenoso! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'GL 9/10/2024 21:35:55'!
esConcreto
	^self class = #Concreto! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'GL 9/10/2024 21:36:05'!
esTierra
	^self class = #Tierra! !


!CapaDeSuelo methodsFor: 'comparing' stamp: 'GL 9/13/2024 11:22:12'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) and: [resistencia = unaCapaDeSuelo resistencia].! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'GL 9/10/2024 21:36:27'!
hash

	^self class hash + resistencia hash! !


!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
sinResistencia
	^resistencia = 0! !


!CapaDeSuelo methodsFor: 'accessing' stamp: 'ARM 5/8/2023 13:10:35'!
resistencia

	^ resistencia.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'GL 9/13/2024 11:05:53'!
tipo

	"^tipo"! !


!CapaDeSuelo methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:30:26'!
golpearConMechaDiamante: unaPerforadora

	self subclassResponsibility! !

!CapaDeSuelo methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:30:32'!
golpearConMechaSoft: unaPerforadora

	self subclassResponsibility! !

!CapaDeSuelo methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:30:37'!
golpearConMechaWidia: unaPerforadora

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: #'ISW1-Perforaciones'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'GL 9/13/2024 11:04:13'!
arenoso

	^Arenoso new.! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'GL 9/13/2024 11:08:44'!
concretoConResistencia: resistencia 

	^Concreto new initializeConcretoConResistencia: resistencia ! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'GL 9/13/2024 11:04:40'!
tierra

	^Tierra new.! !


!classDefinition: #Arenoso category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #Arenoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Arenoso methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:48:31'!
golpearConMechaDiamante: unaPerforadora
	unaPerforadora golpeSueloArenosoConMechaDiamante. ! !

!Arenoso methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:48:52'!
golpearConMechaSoft: unaPerforadora
	unaPerforadora golpeSueloArenosoConMechaSoft. ! !

!Arenoso methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:49:15'!
golpearConMechaWidia: unaPerforadora
	unaPerforadora golpeSueloArenosoConMechaWidia. ! !


!classDefinition: #Concreto category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #Concreto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Concreto methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:50:59'!
golpearConMechaDiamante: unaPerforadora
	unaPerforadora golpeSueloConcretoConMechaDiamante. ! !

!Concreto methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:51:17'!
golpearConMechaSoft: unaPerforadora
	unaPerforadora golpeSueloConcretoConMechaSoft. ! !

!Concreto methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:51:55'!
golpearConMechaWidia: unaPerforadora
	unaPerforadora golpeSueloConcretoConMechaWidia. ! !


!classDefinition: #Tierra category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #Tierra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Tierra methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:52:41'!
golpearConMechaDiamante: unaPerforadora
	unaPerforadora golpeSueloTierraConMechaDiamante.! !

!Tierra methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:52:57'!
golpearConMechaSoft: unaPerforadora
	unaPerforadora golpeSueloTierraConMechaSoft. ! !

!Tierra methodsFor: 'golpear' stamp: 'GL 9/13/2024 10:53:18'!
golpearConMechaWidia: unaPerforadora
	unaPerforadora golpeSueloTierraConMechaWidia. ! !


!classDefinition: #EstadoMecha category: #'ISW1-Perforaciones'!
Object subclass: #EstadoMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!EstadoMecha methodsFor: 'as yet unclassified' stamp: 'GL 9/13/2024 11:28:49'!
= unEstadoDeMecha
	^self class = unEstadoDeMecha class.! !

!EstadoMecha methodsFor: 'as yet unclassified' stamp: 'GL 9/13/2024 10:24:53'!
darGolpeDeTaladro: unaPerforadora

	self subclassResponsibility! !


!classDefinition: #ConMechaDiamante category: #'ISW1-Perforaciones'!
EstadoMecha subclass: #ConMechaDiamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!ConMechaDiamante methodsFor: 'as yet unclassified' stamp: 'GL 9/13/2024 10:45:50'!
darGolpeDeTaladro: unaPerforadora
	unaPerforadora golpeConMechaDiamante. ! !


!classDefinition: #ConMechaRota category: #'ISW1-Perforaciones'!
EstadoMecha subclass: #ConMechaRota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!ConMechaRota methodsFor: 'as yet unclassified' stamp: 'GL 9/13/2024 10:46:11'!
darGolpeDeTaladro: unaPerforadora
	unaPerforadora golpeMechaRota. ! !


!classDefinition: #ConMechaSoft category: #'ISW1-Perforaciones'!
EstadoMecha subclass: #ConMechaSoft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!ConMechaSoft methodsFor: 'as yet unclassified' stamp: 'GL 9/13/2024 10:46:39'!
darGolpeDeTaladro: unaPerforadora
	unaPerforadora golpeConMechaSoft. ! !


!classDefinition: #ConMechaWidia category: #'ISW1-Perforaciones'!
EstadoMecha subclass: #ConMechaWidia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!ConMechaWidia methodsFor: 'as yet unclassified' stamp: 'GL 9/13/2024 10:46:56'!
darGolpeDeTaladro: unaPerforadora
	unaPerforadora golpeConMechaWidia. ! !


!classDefinition: #SinMecha category: #'ISW1-Perforaciones'!
EstadoMecha subclass: #SinMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!SinMecha methodsFor: 'as yet unclassified' stamp: 'GL 9/13/2024 10:24:53'!
darGolpeDeTaladro: unaPerforadora
	self subclassResponsibility! !


!classDefinition: #Perforadora category: #'ISW1-Perforaciones'!
Object subclass: #Perforadora
	instanceVariableNames: 'estadoMecha vecesQueGolpeoCapaActual capasDeSueloDebajo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 11:41:26'!
darGolpeDeTaladro
	estadoMecha darGolpeDeTaladro: self.! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 11:33:59'!
golpeConMechaDiamante
	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	self capaDeSueloInmediata golpearConMechaDiamante: self ! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 11:34:03'!
golpeConMechaSoft
	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	self capaDeSueloInmediata golpearConMechaSoft: self.! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 11:34:08'!
golpeConMechaWidia
	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	self capaDeSueloInmediata golpearConMechaWidia: self.! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 10:34:35'!
golpeMechaRota
	self error: 'error'.! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 10:34:06'!
golpeSinMecha
	self error: 'No puede perforar'.! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 11:01:54'!
golpeSueloArenosoConMechaDiamante
	estadoMecha := ConMechaRota new.
	self error: 'Se rompió'.! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 10:37:36'!
golpeSueloArenosoConMechaSoft
	self pasarAProximaCapa.! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 10:37:40'!
golpeSueloArenosoConMechaWidia
	self pasarAProximaCapa.! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 10:42:16'!
golpeSueloConcretoConMechaDiamante
		vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
		capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
		^vecesQueGolpeoCapaActual.
	! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 11:01:54'!
golpeSueloConcretoConMechaSoft
		estadoMecha := ConMechaRota new. 
		self error: 'Se rompió'.
		! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 11:01:54'!
golpeSueloConcretoConMechaWidia
		 vecesQueGolpeoCapaActual = 3 ifTrue: [ estadoMecha := ConMechaRota new. self error: 'Se rompió' ].
		^self .
! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 10:39:35'!
golpeSueloTierraConMechaDiamante
	self pasarAProximaCapa.
	! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 10:39:56'!
golpeSueloTierraConMechaSoft
	^self.
		! !

!Perforadora methodsFor: 'perforar' stamp: 'GL 9/13/2024 10:40:20'!
golpeSueloTierraConMechaWidia
	 vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].

	! !


!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 9/3/2024 16:45:24'!
pasarAProximaCapa
	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	capasDeSueloDebajo ifEmpty: [^self].! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 4/27/2023 20:46:30'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: CapaDeSuelo arenoso;
			yourself! !


!Perforadora methodsFor: 'initialization' stamp: 'GL 9/13/2024 11:12:57'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente

	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.
	
	vecesQueGolpeoCapaActual := 0.
	estadoMecha := SinMecha new.! !


!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'GL 9/13/2024 11:26:57'!
conMechaRota

	^estadoMecha = ConMechaRota new! !

!Perforadora methodsFor: 'accessing' stamp: 'GL 9/13/2024 11:30:18'!
sinMecha

	^estadoMecha =SinMecha new.! !


!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:17'!
sobreSueloArenoso
	^capasDeSueloDebajo first esArenoso! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:16:14'!
sobreSueloConcreto
	^capasDeSueloDebajo first esConcreto! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:58'!
sobreSueloTierra
	^capasDeSueloDebajo first esTierra! !


!Perforadora methodsFor: 'colocar mecha' stamp: 'GL 9/13/2024 11:01:40'!
ponerMechaDiamante
	estadoMecha := ConMechaDiamante new.! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'GL 9/13/2024 11:02:10'!
ponerMechaSoft
	estadoMecha := ConMechaSoft new.! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'GL 9/13/2024 11:02:22'!
ponerMechaWidia
	estadoMecha := ConMechaWidia new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: #'ISW1-Perforaciones'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:07:05'!
sobreSuelo: capasDeSueloAExcavar 

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !
