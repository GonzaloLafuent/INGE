!classDefinition: #CartaDeTrucoTest category: #'ISW1-2021-1C-2doParcial'!
TestCase subclass: #CartaDeTrucoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test01SonIgualesConMismoPaloYNumero

	self assert: (CartaDeTruco bastoCon: 1) = (CartaDeTruco bastoCon: 1) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test02SonDistintasConDistintoPalo

	self deny: (CartaDeTruco bastoCon: 1) = (CartaDeTruco oroCon: 1) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test03SonDistintasConNumeroAunqueIgualPalo

	self deny: (CartaDeTruco bastoCon: 1) = (CartaDeTruco bastoCon: 2) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test04CartasIgualesTienenElMismoHash

	self assert: (CartaDeTruco bastoCon: 1) hash equals: (CartaDeTruco bastoCon: 1) hash

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test05UnaCartaEsDistintaACualquierObjetoQueNoSeaCarta

	self deny: (CartaDeTruco bastoCon: 1) = 1! !


!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test07NoHayCartaDeTrucoConNumeroOcho

	self 
		should: [ CartaDeTruco oroCon: 8 ]
		raise: Error
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test08NoHayCartaDeTrucoConNumeroNueve

	self 
		should: [ CartaDeTruco oroCon: 9 ]
		raise: Error
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:12'!
test09LosPalosDeLaCartaDeTrucoSonBastoOroEspadaYCopa

	self 
		should: [ CartaDeTruco palo: #otro numero: 1 ]
		raise: Error
		withMessageText: CartaDeTruco paloInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test10NoSePuedeCrearCartaConNumeroMenorAUno

	self 
		should: [ CartaDeTruco espadaCon: 0 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test11NoSePuedeCrearCartaConNumeroMayorADoce

	self 
		should: [ CartaDeTruco espadaCon: 13 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test12ElNumeroDeLaCartaDebeSerEntero

	self 
		should: [ CartaDeTruco espadaCon: 1.1 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !


!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:55:30'!
test13LaTablaDeValoresEsCorrecta

	self assert: (CartaDeTruco anchoDeEspada mataA: CartaDeTruco anchoDeBasto).
	self assert: (CartaDeTruco anchoDeBasto mataA: CartaDeTruco sieteDeEspada).
	self assert: (CartaDeTruco sieteDeEspada mataA: CartaDeTruco sieteDeOro).
	self assert: (CartaDeTruco sieteDeOro mataA: (CartaDeTruco espadaCon: 3)).
	self assert: ((CartaDeTruco espadaCon: 3) empardaCon: (CartaDeTruco oroCon: 3)).
	self assert: ((CartaDeTruco espadaCon: 3) mataA: (CartaDeTruco espadaCon: 2)).
	self assert: ((CartaDeTruco espadaCon: 2) empardaCon: (CartaDeTruco oroCon: 2)).
	self assert: ((CartaDeTruco espadaCon: 2) mataA: (CartaDeTruco oroCon: 1)).
	self assert: ((CartaDeTruco oroCon: 1) empardaCon: (CartaDeTruco copaCon: 1)).
	self assert: ((CartaDeTruco oroCon: 1) mataA: (CartaDeTruco espadaCon: 12)).
	self assert: ((CartaDeTruco espadaCon: 12) empardaCon: (CartaDeTruco oroCon: 12)).
	self assert: ((CartaDeTruco espadaCon: 12) mataA: (CartaDeTruco espadaCon: 11)).
	self assert: ((CartaDeTruco espadaCon: 11) empardaCon: (CartaDeTruco oroCon: 11)).
	self assert: ((CartaDeTruco espadaCon: 11) mataA: (CartaDeTruco espadaCon: 10)).
	self assert: ((CartaDeTruco espadaCon: 10) empardaCon: (CartaDeTruco oroCon: 10)).
	self assert: ((CartaDeTruco espadaCon: 10) mataA: (CartaDeTruco copaCon: 7)).
	self assert: ((CartaDeTruco copaCon: 7) empardaCon: (CartaDeTruco bastoCon: 7)).
	self assert: ((CartaDeTruco copaCon: 7) mataA: (CartaDeTruco espadaCon: 6)).
	self assert: ((CartaDeTruco espadaCon: 6) empardaCon: (CartaDeTruco oroCon: 6)).
	self assert: ((CartaDeTruco espadaCon: 6) mataA: (CartaDeTruco espadaCon: 5)).
	self assert: ((CartaDeTruco espadaCon: 5) empardaCon: (CartaDeTruco oroCon: 5)).
	self assert: ((CartaDeTruco espadaCon: 5) mataA: (CartaDeTruco espadaCon: 4)).
	self assert: ((CartaDeTruco espadaCon: 4) empardaCon: (CartaDeTruco oroCon: 4)).

	{ 3. 2. 12. 11. 10. 6. 5. 4 } do: [ :unNumero |
		CartaDeTruco palos do: [ :unPalo | 
			self assert: ((CartaDeTruco espadaCon: unNumero) empardaCon: (CartaDeTruco palo: unPalo numero: unNumero)) ]]
	! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:49:51'!
test14HayCartasQueNoSonPardas

	self deny: (CartaDeTruco anchoDeEspada empardaCon: CartaDeTruco anchoDeBasto)! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:49:59'!
test15HayCartasQuePierdenConOtras

	self deny: (CartaDeTruco anchoDeBasto mataA: CartaDeTruco anchoDeEspada)! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:53:21'!
test16SieteDeCopasYDeBastoEsSieteFalso

	self assert: (CartaDeTruco copaCon: 7) esSieteFalso.
	self assert: (CartaDeTruco bastoCon: 7) esSieteFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:54:57'!
test17SieteDeOroYDeEspadaNoSonSieteFalso

	self deny: (CartaDeTruco sieteDeOro) esSieteFalso.
	self deny: (CartaDeTruco sieteDeEspada) esSieteFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:55:53'!
test18AnchoDeOroYDeCopaSonAnchoFalsos

	self assert: (CartaDeTruco oroCon: 1) esAnchoFalso.
	self assert: (CartaDeTruco copaCon: 1) esAnchoFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:56:28'!
test19AnchoDeEspadaYDeBastosNoSonAnchoFalsos

	self deny: (CartaDeTruco anchoDeEspada) esAnchoFalso.
	self deny: (CartaDeTruco anchoDeBasto) esAnchoFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 11:58:24'!
test20FallaBuscandoValorDeCartaInválida

	"Creo una carta de manera inválida para probar la correctitud del la tabla de valores - Hernan"
	self 
		should: [ CartaDeTruco new initializePalo: #invalido numero: 1; valor ]
		raise: Error 
		withMessageText: CartaDeTruco tablaDeValoresIncorrectaOCartaInvalidaErrorDescription! !


!classDefinition: #TrucoTest category: #'ISW1-2021-1C-2doParcial'!
TestCase subclass: #TrucoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 20:54:10'!
test01ManoNoPuedeTenerMasDeTresCartas
	
	self should: [Truco conCartasDeMano: self setConCartasDeMas cartasDePie: self setDeCartasValidoDePie  ] 
		raise: Error 
		withMessageText: Truco setDeCartasInvalidoErrorMessage. ! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 20:54:10'!
test02PieNoPuedeTenerMasDeTresCartas
	
	self should: [Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setConCartasDeMas ] 
		raise: Error 
		withMessageText: Truco setDeCartasInvalidoErrorMessage.! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 20:54:10'!
test03ManoNoPuedeTenerMenosDeTresCartas
	
	self should: [Truco conCartasDeMano: {} cartasDePie: self setDeCartasValidoDePie ] 
		raise: Error 
		withMessageText: Truco setDeCartasInvalidoErrorMessage. ! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 20:54:10'!
test04PieNoPuedeTenerMenosDeTresCartas
	
	self should: [Truco conCartasDeMano: self setDeCartasValidoDePie cartasDePie:{} ] 
		raise: Error 
		withMessageText: Truco setDeCartasInvalidoErrorMessage. ! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 20:55:33'!
test05ManoNoPuedeTenerCartasRepetidas

	self should: [Truco conCartasDeMano: self setDeCartasRepetidas cartasDePie: self setDeCartasValidoDePie ] 
		raise: Error 
		withMessageText: Truco setDeCartasInvalidoErrorMessage. ! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 20:55:49'!
test06PieNoPuedeTenerCartasRepetidas

	self should: [Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasRepetidas ] 
		raise: Error 
		withMessageText: Truco setDeCartasInvalidoErrorMessage. ! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 20:57:01'!
test07ManoYPieNoPuedenCompartirCartas

	self should: [Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDeMano ] 
		raise: Error 
		withMessageText: Truco setDeCartasInvalidoErrorMessage. ! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 21:16:54'!
test08JuegoRecienArrancadoNoPoseeCartasJugadas

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 
	
	self assert: (truco cartasJugadasDeMano: OrderedCollection new ).
	self assert: (truco cartasJugadasDePie: OrderedCollection new). 
! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 12:08:27'!
test09ManoNoPuedeJugarUnaCartNoPertenencienteASuMano

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 
	
	self should: [truco manoJuegaCarta: CartaDeTruco anchoDeBasto ] 
		raise: Error 
		withExceptionDo: [:error | 
							self assert: (truco cartasJugadasDeMano: OrderedCollection new).
							self assert: error messageText equals: EnfrentamientoNormal cartaInvalidaErrorMessage.	
						].! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 21:17:24'!
test10ManoPuedeJugarUnaCartaEnJuegoRecienComenzado

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: CartaDeTruco anchoDeEspada. 
	
	self assert: (truco cartasJugadasDeMano: (OrderedCollection with: CartaDeTruco anchoDeEspada)). ! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 11:12:24'!
test11PieNoPuedeJugarUnaCartaEnPrimeraRonda

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 
	
	self should: [truco pieJuegaCarta: CartaDeTruco anchoDeBasto ] 
		raise: Error 
		withExceptionDo: [:error | 
							self assert: (truco cartasJugadasDePie: OrderedCollection new).
							self assert: error messageText equals: EstadoDeEnfrentamiento turnoInvalidoErrorMessage.
	
						].! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 12:08:27'!
test12PieNoPuedeJugarUnaCartQueNoPerteneceASuMano

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: CartaDeTruco anchoDeEspada. 
	
	self should: [truco pieJuegaCarta: CartaDeTruco anchoDeEspada ] 
		raise: Error 
		withExceptionDo: [:error | 
							self assert: (truco cartasJugadasDePie: OrderedCollection new).
							self assert: error messageText equals: EnfrentamientoNormal cartaInvalidaErrorMessage.	
						].! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/17/2024 21:27:49'!
test13PiePuedeJugarUnaCartaCuandoEsSuTurno
	
	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: CartaDeTruco anchoDeEspada. 
	truco pieJuegaCarta: CartaDeTruco anchoDeBasto.
	 
	self assert: (truco cartasJugadasDePie: (OrderedCollection with: CartaDeTruco anchoDeBasto)).! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 11:13:53'!
test14GanaManoPrimeraRondaElProximoTurnoEsDeMano

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: CartaDeTruco anchoDeEspada. 
	truco pieJuegaCarta: CartaDeTruco anchoDeBasto.
	 
	truco manoJuegaCarta: (CartaDeTruco oroCon: 7).
	
	self assert: (truco cartasJugadasDeMano: (OrderedCollection with: CartaDeTruco anchoDeEspada with: (CartaDeTruco oroCon: 7))).! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 11:14:10'!
test15GanaPiePrimeraRondaElProximoTurnoEsDePie

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: (CartaDeTruco oroCon: 7). 
	truco pieJuegaCarta: CartaDeTruco anchoDeBasto. 
	truco pieJuegaCarta: (CartaDeTruco espadaCon: 7).
	
	self assert: (truco cartasJugadasDePie: (OrderedCollection with: CartaDeTruco anchoDeBasto with: (CartaDeTruco espadaCon: 7))).! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 11:14:33'!
test16ManoNoPuedeJugarUnaCartaCuandoNoEsSuTurno

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: (CartaDeTruco oroCon: 7). 
	truco pieJuegaCarta: CartaDeTruco anchoDeBasto.
	
	self should:[truco manoJuegaCarta: (CartaDeTruco anchoDeEspada ).] 
		raise: Error  
		withExceptionDo: [:error | 
							self assert: error messageText equals: EstadoDeEnfrentamiento turnoInvalidoErrorMessage.
							self assert: (truco cartasJugadasDeMano: (OrderedCollection with: (CartaDeTruco oroCon: 7))) 
						 ]
	

	! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 12:00:23'!
test17ManoGanaDosEnfrentamientosGanaRonda

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: (CartaDeTruco anchoDeEspada ). 
	truco pieJuegaCarta: CartaDeTruco anchoDeBasto.
	truco manoJuegaCarta: (CartaDeTruco oroCon: 7 ). 
	truco pieJuegaCarta: (CartaDeTruco copaCon: 3).

	self assert: truco ganaMano.
	self deny: truco ganaPie.
	
	

	! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 12:00:33'!
test18PieGanaDosEnfrentamientosGanaRonda

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: (CartaDeTruco oroCon: 3 ). 
	truco pieJuegaCarta: CartaDeTruco anchoDeBasto.
	truco pieJuegaCarta: (CartaDeTruco espadaCon: 7).
	truco manoJuegaCarta: (CartaDeTruco oroCon: 7 ). 

	self assert: truco ganaPie.
	self deny: truco ganaMano.
	
	

	! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 12:00:44'!
test19EmpardaLaPrimeraYGanaManoLaSegundaGanaManoLaRonda

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: (CartaDeTruco oroCon: 3). 
	truco pieJuegaCarta: (CartaDeTruco copaCon: 3).
	truco manoJuegaCarta: (CartaDeTruco anchoDeEspada). 
	truco pieJuegaCarta: (CartaDeTruco anchoDeBasto ). 
	
	self assert: truco ganaMano.
	self deny: truco ganaPie.
	
	

	! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 12:55:46'!
test20EmpardaLaPrimeraYGanaPieLaSegundaGanaPieLaRonda

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: (CartaDeTruco oroCon: 3 ). 
	truco pieJuegaCarta: (CartaDeTruco copaCon: 3).
	truco manoJuegaCarta: (CartaDeTruco oroCon: 7).
	truco pieJuegaCarta: (CartaDeTruco anchoDeBasto ). 

	self assert: truco ganaPie.
	self deny: truco ganaMano.
	
	

	! !

!TrucoTest methodsFor: 'test' stamp: 'GL 11/18/2024 12:57:47'!
test21ManoNoPuedeJugarEnEnfrentamientoTerminado

	|truco|
	
	truco := Truco conCartasDeMano: self setDeCartasValidoDeMano cartasDePie: self setDeCartasValidoDePie. 

	truco manoJuegaCarta: (CartaDeTruco oroCon: 3 ). 
	truco pieJuegaCarta: (CartaDeTruco copaCon: 3).
	truco manoJuegaCarta: (CartaDeTruco oroCon: 7).
	truco pieJuegaCarta: (CartaDeTruco anchoDeBasto ). 

	self should:[truco manoJuegaCarta: (CartaDeTruco anchoDeEspada ) ]  
		raise: Error  
		withExceptionDo: [:error|
							self assert: error messageText equals: Enfrentamiento rondaTerminadaErrorMessage.
							self assert: (truco cartasJugadasDeMano: OrderedCollection new)
						]
	

	! !


!TrucoTest methodsFor: 'support' stamp: 'GL 11/17/2024 20:42:57'!
setConCartasDeMas

	^{CartaDeTruco bastoCon: 3. CartaDeTruco bastoCon: 1. CartaDeTruco bastoCon: 2. CartaDeTruco bastoCon: 4}! !

!TrucoTest methodsFor: 'support' stamp: 'GL 11/17/2024 20:46:42'!
setDeCartasRepetidas

	^{CartaDeTruco anchoDeBasto. CartaDeTruco anchoDeBasto. CartaDeTruco anchoDeBasto}.! !

!TrucoTest methodsFor: 'support' stamp: 'GL 11/17/2024 17:18:33'!
setDeCartasValidoDeMano

	^{CartaDeTruco anchoDeEspada. CartaDeTruco sieteDeOro. CartaDeTruco oroCon: 3}.! !

!TrucoTest methodsFor: 'support' stamp: 'GL 11/17/2024 17:19:16'!
setDeCartasValidoDePie

	^{CartaDeTruco anchoDeBasto. CartaDeTruco sieteDeEspada. CartaDeTruco copaCon: 3}.! !


!classDefinition: #CartaDeTruco category: #'ISW1-2021-1C-2doParcial'!
Object subclass: #CartaDeTruco
	instanceVariableNames: 'palo numero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!CartaDeTruco methodsFor: 'initialization' stamp: 'HAW 7/3/2021 15:27:51'!
initializePalo: unPalo numero: unNumero 
	
	palo := unPalo.
	numero := unNumero.! !


!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:44:36'!
= unaCarta 
	
	^(unaCarta isKindOf: self class) and: [(unaCarta paloEs: palo) and: [ unaCarta numeroEs: numero ]]! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/5/2021 10:49:51'!
empardaCon: cartaParda

	^self valor = cartaParda valor! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:43:24'!
hash
	
	^palo hash bitXor: numero hash ! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/5/2021 10:49:59'!
mataA: cartaPerdedora

	^self valor < cartaPerdedora valor! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:41:53'!
numeroEs: unNumero

	^numero = unNumero ! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:41:39'!
paloEs: unPalo

	^palo = unPalo ! !


!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:20'!
esAncho

	^ self numeroEs: 1! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:31'!
esAnchoDeBasto
	
	^self esAncho and: [ self esDeBasto ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:41'!
esAnchoDeEspada
	
	^self esAncho and: [ self esDeEspada ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:20'!
esAnchoFalso
	
	^self esAncho and: [ self esDeOro or: [ self esDeCopa ]]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:32'!
esCaballo
	
	^self numeroEs: 11! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:25:29'!
esDeBasto
	
	^self paloEs: self basto! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:09'!
esDeCopa
	
	^self paloEs: self copa! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:18'!
esDeEspada
	
	^self paloEs: self espada ! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:35'!
esDeOro
	
	^self paloEs: self oro! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:22'!
esRey
	
	^self numeroEs: 12! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:16:57'!
esSiete
	
	^self numeroEs: 7! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:27:00'!
esSieteDeEspadas
	
	^self esSiete and: [ self esDeEspada ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:27:15'!
esSieteDeOro
	
	^self esSiete and: [ self esDeOro ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:09'!
esSieteFalso
	
	^self esSiete and: [ self esDeCopa or: [ self esDeBasto ]]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:43'!
esSota
	
	^self numeroEs: 10! !


!CartaDeTruco methodsFor: 'printing' stamp: 'HAW 7/3/2021 15:14:43'!
printOn: aStream

	aStream 
		print: numero;
		nextPutAll: ' de ';
		nextPutAll: 	palo ! !


!CartaDeTruco methodsFor: 'valor' stamp: 'HAW 7/3/2021 14:51:09'!
valor
	
	^self class valorDe: self! !


!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:33'!
basto
	
	^self class basto! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:44'!
copa

	^ self class copa! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:08'!
espada
	
	^self class espada! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:26:27'!
oro

	^ self class oro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartaDeTruco class' category: #'ISW1-2021-1C-2doParcial'!
CartaDeTruco class
	instanceVariableNames: 'ordenDePrioridad'!

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 17:49:37'!
anchoDeBasto
	
	^self bastoCon: 1! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 17:49:57'!
anchoDeEspada
	
	^self espadaCon: 1! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:03'!
bastoCon: unNumero

	^self palo: self basto numero: unNumero! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:08'!
copaCon: unNumero

	^self palo: self copa numero: unNumero! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:16'!
espadaCon: unNumero

	^self palo: self espada numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:34'!
oroCon: unNumero

	^self palo: self oro numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 18:06:08'!
palo: unPalo numero: unNumero 
	
	self assertNúmeroEsVálido: unNumero.
	self assertPaloEsVálido: unPalo.
	
	^self new initializePalo: unPalo numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 15:12:50'!
sieteDeEspada
	
	^self espadaCon: 7! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 15:17:44'!
sieteDeOro
	
	^self oroCon: 7! !


!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:56:25'!
basto
	
	^#basto! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:57:25'!
copa
	
	^#copa! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:55:44'!
espada
	
	^#espada! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:57:43'!
oro
	
	^#oro! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/4/2021 18:07:36'!
palos

	"No se puede acceder a self en backtick, por eso se usa CartaDeTruco como receiver - Hernan"
	^ `{CartaDeTruco espada. CartaDeTruco basto. CartaDeTruco oro. CartaDeTruco copa }`! !


!CartaDeTruco class methodsFor: 'initialization' stamp: 'HAW 7/5/2021 10:52:07'!
initializeOrdenDePrioridad
	
	"Cuanto más chico sea el índice de la carta en esta colección, más valor tiene - Hernan"
	ordenDePrioridad := OrderedCollection new.
	
	ordenDePrioridad 
		add: [ :carta | carta esAnchoDeEspada ];
		add: [ :carta | carta esAnchoDeBasto ];
		add: [ :carta | carta esSieteDeEspadas ];
		add: [ :carta | carta esSieteDeOro ];
		add: [ :carta | carta numeroEs: 3 ];
		add: [ :carta | carta numeroEs: 2 ];
		add: [ :carta | carta esAnchoFalso ];
		add: [ :carta | carta esRey ];
		add: [ :carta | carta esCaballo ];
		add: [ :carta | carta esSota ];
		add: [ :carta | carta esSieteFalso ];
		add: [ :carta | carta numeroEs: 6 ];
		add: [ :carta | carta numeroEs: 5 ];
		add: [ :carta | carta numeroEs: 4 ];
		yourself.
	
	! !


!CartaDeTruco class methodsFor: 'valor' stamp: 'HAW 7/3/2021 14:54:01'!
ordenDePrioridad
	
	^ordenDePrioridad ifNil: [ self initializeOrdenDePrioridad ] ! !

!CartaDeTruco class methodsFor: 'valor' stamp: 'HAW 7/5/2021 11:58:24'!
valorDe: unaCarta 
	
	self ordenDePrioridad withIndexDo: [ :bloqueDeVerificacion :index |
		(bloqueDeVerificacion value: unaCarta) ifTrue: [ ^index ]].
	
	self error: self tablaDeValoresIncorrectaOCartaInvalidaErrorDescription! !


!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:02'!
numeroDeCartaInvalidoErrorDescription
	
	^'El truco no se puede jugar con ochos ni con nueves'! !

!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:12'!
paloInvalidoErrorDescription
	
	^'Los palos de la carta solo pueden ser espada, basto, oro y copa'! !

!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:24'!
tablaDeValoresIncorrectaOCartaInvalidaErrorDescription
	
	^'Error de programación: Tabla de valores incorrecta o carta inválida'! !


!CartaDeTruco class methodsFor: 'assertions' stamp: 'HAW 7/5/2021 11:58:02'!
assertNúmeroEsVálido: unNumero

	unNumero < 1 ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	unNumero > 12 ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	(unNumero between: 8 and: 9) ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	unNumero isInteger ifFalse: [ self error: self numeroDeCartaInvalidoErrorDescription ]! !

!CartaDeTruco class methodsFor: 'assertions' stamp: 'HAW 7/5/2021 11:58:12'!
assertPaloEsVálido: unPalo

	^ (self palos includes: unPalo) ifFalse: [ self error: self paloInvalidoErrorDescription ]! !


!classDefinition: #Enfrentamiento category: #'ISW1-2021-1C-2doParcial'!
Object subclass: #Enfrentamiento
	instanceVariableNames: 'estado ronda cartasJugadasPorMano cartasJugadasPorPie enfrentamientoDeMano enfrentamientosDePie'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!Enfrentamiento methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:12:34'!
cartaJugadaPorMano: unaCarta de: unaManoDeCartas

	self subclassResponsibility! !

!Enfrentamiento methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:14:00'!
cartaJugadaPorPie: unaCarta de: unaManoDeCartas

	self subclassResponsibility! !


!Enfrentamiento methodsFor: 'accesing' stamp: 'GL 11/18/2024 12:20:49'!
cartaDeMano

	^cartasJugadasPorMano last. ! !

!Enfrentamiento methodsFor: 'accesing' stamp: 'GL 11/18/2024 12:20:54'!
cartaDePie

	^cartasJugadasPorPie last. ! !

!Enfrentamiento methodsFor: 'accesing' stamp: 'GL 11/18/2024 12:20:57'!
cartasJugadasPorMano
	
	^cartasJugadasPorMano. ! !

!Enfrentamiento methodsFor: 'accesing' stamp: 'GL 11/18/2024 12:21:01'!
cartasJugadasPorPie
	
	^cartasJugadasPorPie. ! !


!Enfrentamiento methodsFor: 'testing' stamp: 'GL 11/18/2024 12:21:17'!
ganoMano

	^enfrentamientoDeMano = 2. ! !

!Enfrentamiento methodsFor: 'testing' stamp: 'GL 11/18/2024 12:21:22'!
ganoPie

	^enfrentamientosDePie = 2. ! !


!Enfrentamiento methodsFor: 'enfrentamiento' stamp: 'GL 11/18/2024 12:11:51'!
enfrentar

	self subclassResponsibility! !

!Enfrentamiento methodsFor: 'enfrentamiento' stamp: 'GL 11/18/2024 12:39:36'!
incrementarGanadosDeMano: unNumero

	enfrentamientoDeMano := enfrentamientoDeMano  + unNumero. ! !

!Enfrentamiento methodsFor: 'enfrentamiento' stamp: 'GL 11/18/2024 12:39:58'!
incrementarGanadosDePie: unNumero

	enfrentamientosDePie := enfrentamientosDePie + unNumero. ! !

!Enfrentamiento methodsFor: 'enfrentamiento' stamp: 'GL 11/18/2024 12:22:28'!
manoMataAPie

	self si: self cartaDeMano mataA: self cartaDePie hacer: [self empiezaMano. self incrementarGanadosDeMano: 1].! !

!Enfrentamiento methodsFor: 'enfrentamiento' stamp: 'GL 11/18/2024 12:22:24'!
pieMataAMano

	self si: self cartaDePie mataA: self cartaDeMano hacer: [self empiezaPie. self incrementarGanadosDePie: 1.] ! !

!Enfrentamiento methodsFor: 'enfrentamiento' stamp: 'GL 11/18/2024 12:22:19'!
si: unaCarta mataA: otraCarta hacer: unBloque

	(unaCarta mataA: otraCarta) ifTrue: [unBloque value]. ! !


!Enfrentamiento methodsFor: 'asserting' stamp: 'GL 11/18/2024 12:21:50'!
assertsUnaCarta: unaCarta estaIncluidaEn: unaManoDeCartas

	^ (unaManoDeCartas includes: unaCarta) ifFalse:[self error: self class cartaInvalidaErrorMessage]! !


!Enfrentamiento methodsFor: 'estado' stamp: 'GL 11/18/2024 12:26:54'!
empiezaMano

	self estado: (EmpiezaMano en: self). ! !

!Enfrentamiento methodsFor: 'estado' stamp: 'GL 11/18/2024 12:26:57'!
empiezaPie

	self estado: (EmpiezaPie en: self). ! !

!Enfrentamiento methodsFor: 'estado' stamp: 'GL 11/18/2024 12:26:50'!
estado: unEstado

	estado := unEstado.! !

!Enfrentamiento methodsFor: 'estado' stamp: 'GL 11/18/2024 12:27:00'!
juegaMano

	self estado: (JuegaMano en: self). ! !

!Enfrentamiento methodsFor: 'estado' stamp: 'GL 11/18/2024 12:27:04'!
juegaPie

	self estado: (JuegaPie en: self). ! !


!Enfrentamiento methodsFor: 'initialization' stamp: 'GL 11/18/2024 12:37:27'!
initializeDe: unTruco conCartasDeMano: cartasDeMano yCartasDePie: cartasDePie 
	
	ronda := unTruco.
	cartasJugadasPorMano := cartasDeMano.
	cartasJugadasPorPie := cartasDePie.
	estado := EmpiezaMano en: self. 
	
	enfrentamientoDeMano  := 0.
	enfrentamientosDePie  := 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Enfrentamiento class' category: #'ISW1-2021-1C-2doParcial'!
Enfrentamiento class
	instanceVariableNames: ''!

!Enfrentamiento class methodsFor: 'instance creation' stamp: 'GL 11/18/2024 12:42:39'!
de: aTruco conCartasDeMano: aRenameMe1 cartasDePie: aRenameMe2 ganador: aRenameMe3 
	
	^self new initializeDe: aTruco conCartasDeMano: aRenameMe1 cartasDePie: aRenameMe2 ganador: aRenameMe3 ! !

!Enfrentamiento class methodsFor: 'instance creation' stamp: 'GL 11/18/2024 12:35:17'!
de: unTruco conCartasDeMano: cartasDeMano yCartasDePie: cartasDePie 

	^self new initializeDe: unTruco conCartasDeMano: cartasDeMano yCartasDePie: cartasDePie. ! !


!Enfrentamiento class methodsFor: 'error message' stamp: 'GL 11/18/2024 12:53:10'!
rondaTerminadaErrorMessage

	^'ronda terminada'! !


!classDefinition: #EnfrentamientoNormal category: #'ISW1-2021-1C-2doParcial'!
Enfrentamiento subclass: #EnfrentamientoNormal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!EnfrentamientoNormal methodsFor: 'initialization' stamp: 'GL 11/18/2024 11:32:42'!
initialize

	cartasJugadasPorMano := OrderedCollection  new.
	cartasJugadasPorPie := OrderedCollection new. 
	enfrentamientoDeMano := 0.
	enfrentamientosDePie := 0. ! !

!EnfrentamientoNormal methodsFor: 'initialization' stamp: 'GL 11/18/2024 10:54:47'!
initializeCon: unEstadoDeEnfrentamiento En: unJuegoDeTruco

	self initialize. 
	
	estado := unEstadoDeEnfrentamiento en: self. 
	ronda := unJuegoDeTruco. 
	! !

!EnfrentamientoNormal methodsFor: 'initialization' stamp: 'GL 11/18/2024 10:53:12'!
initializePrimerEnfrentamientoDe: unJuegoDeTruco

	self initialize.

	ronda  := unJuegoDeTruco.
	estado :=  EmpiezaMano en: self.! !


!EnfrentamientoNormal methodsFor: 'jugar' stamp: 'GL 11/18/2024 11:47:40'!
cartaJugadaPorMano: unaCarta de: unaManoDeCartas

	self assertsUnaCarta: unaCarta estaIncluidaEn: unaManoDeCartas. 
	
	cartasJugadasPorMano add: unaCarta. 
	
	estado proximoEstado.! !

!EnfrentamientoNormal methodsFor: 'jugar' stamp: 'GL 11/18/2024 11:47:46'!
cartaJugadaPorPie: unaCarta de: unaManoDeCartas

	self assertsUnaCarta: unaCarta estaIncluidaEn: unaManoDeCartas. 
	
	cartasJugadasPorPie add: unaCarta. 
	
	estado proximoEstado.! !

!EnfrentamientoNormal methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:06:37'!
enfrentar	

	self manoMataAPie.
	self pieMataAMano.
	(self cartaDePie empardaCon: self cartaDeMano ) ifTrue: [ronda enfrentamientoEmpardado]. ! !

!EnfrentamientoNormal methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:24:32'!
incrementarGanadosDeMano: unNumero

	enfrentamientoDeMano := enfrentamientoDeMano  + unNumero. ! !

!EnfrentamientoNormal methodsFor: 'jugar' stamp: 'GL 11/18/2024 11:52:19'!
incrementarGanadosDePie: unNumero

	enfrentamientosDePie := enfrentamientosDePie  + unNumero. ! !

!EnfrentamientoNormal methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:40'!
juegaManoUnaCarta: unaCarta de: unaManoDeCartas

	estado juegaManoUnaCarta: unaCarta de: unaManoDeCartas . ! !

!EnfrentamientoNormal methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:51'!
juegaPieUnaCarta: unaCarta de: unaManoDeCartas
	
	estado juegaPieUnaCarta: unaCarta de: unaManoDeCartas .! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnfrentamientoNormal class' category: #'ISW1-2021-1C-2doParcial'!
EnfrentamientoNormal class
	instanceVariableNames: ''!

!EnfrentamientoNormal class methodsFor: 'instance creation' stamp: 'GL 11/18/2024 10:54:47'!
conEstado: unEstadoDeEnfrentamiento de: unJuegoDeTruco

	^self new initializeCon: unEstadoDeEnfrentamiento En: unJuegoDeTruco. ! !

!EnfrentamientoNormal class methodsFor: 'instance creation' stamp: 'GL 11/18/2024 10:49:38'!
primerEnfrentamientoDe: unJuegoDeTruco

	^self new initializePrimerEnfrentamientoDe: unJuegoDeTruco. ! !


!EnfrentamientoNormal class methodsFor: 'error messages' stamp: 'GL 11/18/2024 10:19:44'!
cartaInvalidaErrorMessage

	^'Carta invalida'.! !


!classDefinition: #EnfrentamientoTerminado category: #'ISW1-2021-1C-2doParcial'!
Enfrentamiento subclass: #EnfrentamientoTerminado
	instanceVariableNames: 'renameMe1 renameMe2 renameMe3 quienGano'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!EnfrentamientoTerminado methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:53:35'!
juegaManoUnaCarta: unaCarta de: unaManoDeCartas 

	self error: self class rondaTerminadaErrorMessage. ! !

!EnfrentamientoTerminado methodsFor: 'jugar' stamp: 'GL 11/18/2024 11:27:14'!
juegaPieUnaCarta: unaCarta de: unaManoDeCartas 

	self error: self class rondaTerminadaErrorMessage. 
! !



!EnfrentamientoTerminado methodsFor: 'initialization' stamp: 'GL 11/18/2024 12:44:31'!
initializeDe: aTruco conCartasDeMano: cartasDeMano cartasDePie: cartasDePie ganador: unGanador 
	
	ronda := aTruco.
	cartasJugadasPorMano := cartasDeMano.
	cartasJugadasPorPie := cartasDePie.
	quienGano := unGanador. ! !



!EnfrentamientoTerminado methodsFor: 'as yet unclassified' stamp: 'GL 11/18/2024 12:46:18'!
ganoMano

	^quienGano. ! !

!EnfrentamientoTerminado methodsFor: 'as yet unclassified' stamp: 'GL 11/18/2024 12:46:24'!
ganoPie

	^quienGano not. ! !


!classDefinition: #EnfretamietoEmpardado category: #'ISW1-2021-1C-2doParcial'!
Enfrentamiento subclass: #EnfretamietoEmpardado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!EnfretamietoEmpardado methodsFor: 'enfrentamiento' stamp: 'GL 11/18/2024 12:28:54'!
manoMataAPie

	self si: self cartaDeMano mataA: self cartaDePie hacer: [self incrementarGanadosDeMano: 2].! !

!EnfretamietoEmpardado methodsFor: 'enfrentamiento' stamp: 'GL 11/18/2024 12:29:16'!
pieMataAMano

	self si: self cartaDePie mataA: self cartaDeMano hacer: [self incrementarGanadosDePie: 2].! !


!EnfretamietoEmpardado methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:17:34'!
cartaJugadaPorMano: unaCarta de: unaManoDeCartas

	self assertsUnaCarta: unaCarta estaIncluidaEn: unaManoDeCartas. 
	
	cartasJugadasPorMano add: unaCarta. 
	
	estado proximoEstado.! !

!EnfretamietoEmpardado methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:17:28'!
cartaJugadaPorPie: unaCarta de: unaManoDeCartas

	self assertsUnaCarta: unaCarta estaIncluidaEn: unaManoDeCartas. 
	
	cartasJugadasPorPie add: unaCarta. 
	
	estado proximoEstado.! !

!EnfretamietoEmpardado methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:28:12'!
enfrentar
	
	self pieMataAMano.
	self manoMataAPie. 
	
	ronda enfrentamientoTerminado.! !

!EnfretamietoEmpardado methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:16:06'!
juegaManoUnaCarta: unaCarta de: unaManoDeCartas

	estado juegaManoUnaCarta: unaCarta de: unaManoDeCartas.! !

!EnfretamietoEmpardado methodsFor: 'jugar' stamp: 'GL 11/18/2024 12:16:31'!
juegaPieUnaCarta: unaCarta de: unaManoDeCartas

	estado juegaPieUnaCarta: unaCarta de: unaManoDeCartas.! !


!classDefinition: #EstadoDeEnfrentamiento category: #'ISW1-2021-1C-2doParcial'!
Object subclass: #EstadoDeEnfrentamiento
	instanceVariableNames: 'enfrentamiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!EstadoDeEnfrentamiento methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:39'!
juegaManoUnaCarta: unaCarta de: unaManoDeCartas 

	self subclassResponsibility! !

!EstadoDeEnfrentamiento methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:51'!
juegaPieUnaCarta: unaCarta de: unaManoDeCartas 

	self subclassResponsibility! !


!EstadoDeEnfrentamiento methodsFor: 'estado' stamp: 'GL 11/18/2024 11:03:01'!
empardaRonda

	self subclassResponsibility! !

!EstadoDeEnfrentamiento methodsFor: 'estado' stamp: 'GL 11/18/2024 11:36:34'!
proximoEstado

	self subclassResponsibility! !


!EstadoDeEnfrentamiento methodsFor: 'intialization' stamp: 'GL 11/18/2024 10:52:23'!
initializeWith: unEnfrentamiento

	enfrentamiento  := unEnfrentamiento. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeEnfrentamiento class' category: #'ISW1-2021-1C-2doParcial'!
EstadoDeEnfrentamiento class
	instanceVariableNames: ''!

!EstadoDeEnfrentamiento class methodsFor: 'error message' stamp: 'GL 11/18/2024 10:11:24'!
rondaTerminadaErrorMessage

	^'Ronda Terminada'! !

!EstadoDeEnfrentamiento class methodsFor: 'error message' stamp: 'GL 11/18/2024 10:11:01'!
turnoInvalidoErrorMessage

	^'Turno invalido'! !


!EstadoDeEnfrentamiento class methodsFor: 'instance creation' stamp: 'GL 11/18/2024 11:06:32'!
en: unEnfrentamiento

	^self new initializeWith: unEnfrentamiento. ! !


!classDefinition: #EmpiezaMano category: #'ISW1-2021-1C-2doParcial'!
EstadoDeEnfrentamiento subclass: #EmpiezaMano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!EmpiezaMano methodsFor: 'jugar' stamp: 'GL 11/18/2024 11:09:23'!
juegaManoUnaCarta: unaCarta de: unaManoDeCartas  
	
	enfrentamiento cartaJugadaPorMano: unaCarta de: unaManoDeCartas.
	! !

!EmpiezaMano methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:51'!
juegaPieUnaCarta: unaCarta de: unaManoDeCartas 

	self error: self class turnoInvalidoErrorMessage.! !


!EmpiezaMano methodsFor: 'estado' stamp: 'GL 11/18/2024 11:03:01'!
empardaRonda

	! !

!EmpiezaMano methodsFor: 'estado' stamp: 'GL 11/18/2024 11:44:29'!
proximoEstado

	enfrentamiento juegaPie.! !


!classDefinition: #EmpiezaPie category: #'ISW1-2021-1C-2doParcial'!
EstadoDeEnfrentamiento subclass: #EmpiezaPie
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!EmpiezaPie methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:39'!
juegaManoUnaCarta: unaCarta de: unaManoDeCartas 

	self error: self class turnoInvalidoErrorMessage.! !

!EmpiezaPie methodsFor: 'jugar' stamp: 'GL 11/18/2024 11:09:54'!
juegaPieUnaCarta: unaCarta de: unaManoDeCartas 

	enfrentamiento cartaJugadaPorPie: unaCarta de: unaManoDeCartas. ! !


!EmpiezaPie methodsFor: 'estado' stamp: 'GL 11/18/2024 11:03:01'!
empardaRonda

	! !

!EmpiezaPie methodsFor: 'estado' stamp: 'GL 11/18/2024 11:44:46'!
proximoEstado

	enfrentamiento juegaMano. ! !


!classDefinition: #JuegaMano category: #'ISW1-2021-1C-2doParcial'!
EstadoDeEnfrentamiento subclass: #JuegaMano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!JuegaMano methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:40'!
juegaManoUnaCarta: unaCarta de: unaManoDeCartas 

	enfrentamiento cartaJugadaPorMano: unaCarta de: unaManoDeCartas.
	! !

!JuegaMano methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:51'!
juegaPieUnaCarta: unaCarta de: unaManoDeCartas 

	self error: self class turnoInvalidoErrorMessage.

! !


!JuegaMano methodsFor: 'estado' stamp: 'GL 11/18/2024 11:03:14'!
empardaRonda

	^EmpiezaMano en: enfrentamiento. ! !

!JuegaMano methodsFor: 'estado' stamp: 'GL 11/18/2024 11:43:06'!
proximoEstado

	enfrentamiento enfrentar.! !


!classDefinition: #JuegaPie category: #'ISW1-2021-1C-2doParcial'!
EstadoDeEnfrentamiento subclass: #JuegaPie
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!JuegaPie methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:48:40'!
juegaManoUnaCarta: unaCarta de: unaManoDeCartas 


	self error: self class turnoInvalidoErrorMessage. ! !

!JuegaPie methodsFor: 'jugar' stamp: 'GL 11/18/2024 11:09:48'!
juegaPieUnaCarta: unaCarta de: unaManoDeCartas 

	enfrentamiento cartaJugadaPorPie: unaCarta de: unaManoDeCartas. ! !


!JuegaPie methodsFor: 'estado' stamp: 'GL 11/18/2024 11:03:29'!
empardaRonda

	^EmpiezaPie en: enfrentamiento. ! !

!JuegaPie methodsFor: 'estado' stamp: 'GL 11/18/2024 11:59:06'!
proximoEstado

	enfrentamiento enfrentar.! !


!classDefinition: #Truco category: #'ISW1-2021-1C-2doParcial'!
Object subclass: #Truco
	instanceVariableNames: 'cartasDeMano cartasDePie cartasJugadasPorMano cartasJugadasPorPie turno rondasGanadasPorMano rondasGanadasPorPie enfrentamiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!Truco methodsFor: 'initialization' stamp: 'GL 11/18/2024 12:08:27'!
initializeConCartasDeMano: setDeCartasDeMano cartasDePie: setDeCartasDePie 
	
	cartasDeMano := setDeCartasDeMano.
	cartasDePie  := setDeCartasDePie. 
	
	enfrentamiento := EnfrentamientoNormal primerEnfrentamientoDe: self. ! !


!Truco methodsFor: 'error messages' stamp: 'GL 11/17/2024 18:05:59'!
cartaYaUtilizadaErrorMessage

	^'Carta ya utilizada'! !

!Truco methodsFor: 'error messages' stamp: 'GL 11/17/2024 21:12:29'!
jugadaInvalidaErrorMessage
	
	^'Jugada invalida'! !

!Truco methodsFor: 'error messages' stamp: 'GL 11/17/2024 18:05:27'!
turnoNoCorrespondidoErrorMessage

	^'Turno no correspondido'! !


!Truco methodsFor: 'testing' stamp: 'GL 11/18/2024 11:07:54'!
cartasJugadasDeMano: unaColeccionDeCartasJugadas 

	^enfrentamiento cartasJugadasPorMano = unaColeccionDeCartasJugadas.! !

!Truco methodsFor: 'testing' stamp: 'GL 11/18/2024 11:08:04'!
cartasJugadasDePie: unaColeccionDeCartas 

	^enfrentamiento cartasJugadasPorPie = unaColeccionDeCartas.! !

!Truco methodsFor: 'testing' stamp: 'GL 11/18/2024 11:58:13'!
ganaMano
	
	^enfrentamiento ganoMano .! !

!Truco methodsFor: 'testing' stamp: 'GL 11/18/2024 11:57:55'!
ganaPie
	
	^enfrentamiento ganoPie.! !


!Truco methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:22:36'!
manoJuegaCarta: unaCarta 

	enfrentamiento juegaManoUnaCarta: unaCarta de: cartasDeMano.! !

!Truco methodsFor: 'jugar' stamp: 'GL 11/18/2024 10:22:30'!
pieJuegaCarta: unaCarta 

	enfrentamiento juegaPieUnaCarta: unaCarta de: cartasDePie.! !


!Truco methodsFor: 'enfretamientos' stamp: 'GL 11/18/2024 12:33:40'!
enfrentamientoEmpardado

	enfrentamiento := EnfretamietoEmpardado de: self conCartasDeMano: enfrentamiento cartasJugadasPorMano 
														yCartasDePie: enfrentamiento cartasJugadasPorPie. ! !

!Truco methodsFor: 'enfretamientos' stamp: 'GL 11/18/2024 12:42:13'!
enfrentamientoTerminado

	enfrentamiento := EnfrentamientoTerminado de: self conCartasDeMano: enfrentamiento cartasJugadasPorMano 
	                                                                                           cartasDePie: enfrentamiento  cartasJugadasPorPie
														  ganador: enfrentamiento ganoMano. ! !


!Truco methodsFor: 'asserting' stamp: 'GL 11/17/2024 21:12:06'!
assert: unaCarta perteneceA: setDeCartas 
	
	(setDeCartas includes: unaCarta) ifFalse: [self error: self jugadaInvalidaErrorMessage].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Truco class' category: #'ISW1-2021-1C-2doParcial'!
Truco class
	instanceVariableNames: ''!

!Truco class methodsFor: 'instance creation' stamp: 'GL 11/17/2024 20:48:23'!
conCartasDeMano: setDeCartasDeMano cartasDePie: setDeCartasDePie 

	self assertCantidadValidaDeCartasDeMano: setDeCartasDeMano yCartasDePie: setDeCartasDePie. 
	self assertNoHayCartasRepetidasEn: setDeCartasDeMano yEn: setDeCartasDePie. 
	
	^self new initializeConCartasDeMano: setDeCartasDeMano cartasDePie: setDeCartasDePie ! !


!Truco class methodsFor: 'asserting' stamp: 'GL 11/17/2024 20:40:37'!
assertCantidadValidaDeCartasDeMano: unSetDeCartas yCartasDePie: otroSetDeCartas

	self assertCantidadValidadDeCartas: unSetDeCartas.
	self assertCantidadValidadDeCartas: otroSetDeCartas. 
! !

!Truco class methodsFor: 'asserting' stamp: 'GL 11/17/2024 20:54:10'!
assertCantidadValidadDeCartas: unSetDeCartas

	unSetDeCartas size = 3 ifFalse: [self error: self setDeCartasInvalidoErrorMessage ]. ! !

!Truco class methodsFor: 'asserting' stamp: 'GL 11/17/2024 20:58:17'!
assertNoHayCartasDe: unSetDeCartas en: otroSetDeCartas 

	(unSetDeCartas noneSatisfy:[:aCart | (otroSetDeCartas occurrencesOf: aCart) >= 1 ]) 
					ifFalse:[self error: self setDeCartasInvalidoErrorMessage ]. ! !

!Truco class methodsFor: 'asserting' stamp: 'GL 11/17/2024 20:54:10'!
assertNoHayCartasRepetidas: unSetDeCartas

	(unSetDeCartas noneSatisfy:[:aCart | (unSetDeCartas occurrencesOf: aCart) >= 2] )
						ifFalse:[self error: self setDeCartasInvalidoErrorMessage ].! !

!Truco class methodsFor: 'asserting' stamp: 'GL 11/17/2024 20:51:26'!
assertNoHayCartasRepetidasEn: setDeCartasDeMano yEn: setDeCartasDePie. 
	
	self assertNoHayCartasRepetidas: setDeCartasDeMano. 
	self assertNoHayCartasRepetidas: setDeCartasDePie.
	
	self assertNoHayCartasDe: setDeCartasDeMano en: setDeCartasDePie. ! !


!Truco class methodsFor: 'error messages' stamp: 'GL 11/17/2024 20:54:10'!
setDeCartasInvalidoErrorMessage

	^'Cantidad Invalidad de cartas'.! !
