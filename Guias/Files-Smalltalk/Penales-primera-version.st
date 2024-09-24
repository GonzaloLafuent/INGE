!classDefinition: #PenalesTest category: #Penales!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:52'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:47'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:41'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:36'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:29'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 18:39:22'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !


!classDefinition: #Arquero category: #Penales!
Object subclass: #Arquero
	instanceVariableNames: 'fuerzaBase modoDeLanzarse posicionamiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Arquero methodsFor: 'initialization' stamp: 'GL 9/23/2024 17:47:58'!
initializeEligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerzaBase 
	posicionamiento := EligeAntesDeTiro new. 
	fuerzaBase := unaFuerzaBase.! !

!Arquero methodsFor: 'initialization' stamp: 'GL 9/23/2024 17:48:15'!
initializeEsperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerzaBase 
	posicionamiento := EsperaPorTiro new.
	fuerzaBase := unaFuerzaBase.! !


!Arquero methodsFor: 'accesing' stamp: 'GL 9/22/2024 19:16:51'!
fuerzaBase
	^fuerzaBase. ! !

!Arquero methodsFor: 'accesing' stamp: 'GL 9/22/2024 12:13:31'!
modoDeLanzarse
	^modoDeLanzarse. ! !

!Arquero methodsFor: 'accesing' stamp: 'GL 9/22/2024 12:14:04'!
posicionamieto
	^posicionamiento. ! !


!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 16:56:34'!
fuerzaDeAtajadaDeTiroDe: unDelantero con: unaPelota
	^unDelantero fuerzaDeAtajadaDe: unaPelota con: self.! !

!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 11:30:25'!
fuerzaDeAtajadaEligeAntesDeTiroFrenteAUnRemateDeCostaAzulAColocar
	^fuerzaBase * 2. 
! !

!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 11:33:28'!
fuerzaDeAtajadaEligeAntesDeTiroFrenteAUnRemateDeCostaAzulAMatar
	^fuerzaBase. ! !

!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 11:28:29'!
fuerzaDeAtajadaEligeAntesDeTiroFrenteAUnRemateDeJabulaniAColocar
	^fuerzaBase + (fuerzaBase / 2).! !

!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 11:33:36'!
fuerzaDeAtajadaEligeAntesDeTiroFrenteAUnRemateDeJabulaniAMatar
	^fuerzaBase.! !

!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 11:30:46'!
fuerzaDeAtajadaEsperaPorTiroFrenteAUnRemateDeCostaAzulAColocar
	^fuerzaBase. ! !

!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 11:33:44'!
fuerzaDeAtajadaEsperaPorTiroFrenteAUnRemateDeCostaAzulAMatar
	^fuerzaBase.! !

!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 11:31:01'!
fuerzaDeAtajadaEsperaPorTiroFrenteAUnRemateDeJabulaniAColocar
	^fuerzaBase.! !

!Arquero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 11:33:52'!
fuerzaDeAtajadaEsperaPorTiroFrenteAUnRemateDeJabulaniAMatar
	^fuerzaBase.! !


!Arquero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:07:54'!
fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAColocar
	^posicionamiento fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAColocar: self! !

!Arquero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:08:20'!
fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAMatar
	^posicionamiento fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAMatar: self! !

!Arquero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:08:50'!
fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAColocar
	^posicionamiento fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAColocar: self! !

!Arquero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:09:25'!
fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAMatar
	^posicionamiento fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAMatar: self! !

!Arquero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:36:25'!
posicionadoEn: unaPosicionDeArquero recibeUnRemateAColocarDeCostaAzulEn: unJuegoDePenales
	posicionamiento esperaEn: unaPosicionDeArquero unRemateAColocarDeCostaAZulEn: unJuegoDePenales.! !

!Arquero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:36:33'!
posicionadoEn: unaPosicionDeArquero recibeUnRemateAColocarDeJabulaniEn: unJuegoDePenales
	posicionamiento esperaEn: unaPosicionDeArquero unRemateAColocarDeJabulaniEn: unJuegoDePenales.! !

!Arquero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:36:40'!
posicionadoEn: unaPosicionDeArquero recibeUnRemateAMatarDeCostaAzulEn: unJuegoDePenales
	posicionamiento esperaEn: unaPosicionDeArquero unRemateAMatarDeCostaAZulEn: unJuegoDePenales.! !

!Arquero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:36:50'!
posicionadoEn: unaPosicionDeArquero recibeUnRemateAMatarDeJabulaniEn: unJuegoDePenales
	posicionamiento esperaEn: unaPosicionDeArquero unRemateAMatarDeJabulaniEn: unJuegoDePenales.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #Penales!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'GL 9/22/2024 09:58:41'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerzaBase 
	^self new initializeEligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerzaBase.! !

!Arquero class methodsFor: 'instance creation' stamp: 'GL 9/21/2024 11:18:07'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerzaBase 
	
	^self new initializeEsperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerzaBase. ! !


!classDefinition: #Delantero category: #Penales!
Object subclass: #Delantero
	instanceVariableNames: 'tipoDeTiro fuerzaBase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Delantero methodsFor: 'initialization' stamp: 'GL 9/23/2024 16:47:43'!
initializeDecideTirarAColocarSuFuerzaBaseEs: unaFuerzaBase 
	fuerzaBase := unaFuerzaBase.
	tipoDeTiro  := TiroAColocar new.! !

!Delantero methodsFor: 'initialization' stamp: 'GL 9/23/2024 16:47:53'!
initializeDecideTirarAMatarSuFuerzaBaseEs: unaFuerzaBasica 
	fuerzaBase := unaFuerzaBasica.
	tipoDeTiro := TiroAMatar new.! !


!Delantero methodsFor: 'accesing' stamp: 'GL 9/22/2024 19:16:51'!
fuerzaBase
	^fuerzaBase. ! !

!Delantero methodsFor: 'accesing' stamp: 'GL 9/22/2024 12:15:47'!
tipoDeTiro
	^tipoDeTiro. ! !


!Delantero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 16:57:49'!
fuerzaDeAtajadaDe: unArquero con: unaPelota
	^tipoDeTiro fuerzaDeAtajadaDe: unaPelota con: unArquero! !

!Delantero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 16:49:00'!
fuerzaDeRemateCon: unaPelota
	^tipoDeTiro fuerzaDeRemateCon: unaPelota por: self ! !

!Delantero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 10:36:06'!
fuerzaDeTiroAColocar
	^fuerzaBase/2. ! !

!Delantero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 10:36:34'!
fuerzaDeTiroAColocarConCostaAzul
	^self fuerzaDeTiroAColocar * (4/5).! !

!Delantero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 10:37:01'!
fuerzaDeTiroAColocarConJabulani
	^self fuerzaDeTiroAColocar. ! !

!Delantero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 10:38:19'!
fuerzaDeTiroAMatarConCostaAzul
	^fuerzaBase. ! !

!Delantero methodsFor: 'fuerza' stamp: 'GL 9/23/2024 10:38:35'!
fuerzaDeTiroAMatarConJabulani
	^fuerzaBase * (120/100). ! !


!Delantero methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:31:50'!
remataContraUn: unArquero posicionadoEn: unaPosicionDeArquero con: unaPelota enUnjuegoDePenales: unJuegoDePenales.
	^tipoDeTiro seRemataContra: unArquero posicionadoEn: unaPosicionDeArquero con: unaPelota en: unJuegoDePenales.! !


!Delantero methodsFor: 'direccion' stamp: 'GL 9/23/2024 17:53:33'!
assertRemateAlAngulo: unaPosicionDeRemate
	^(unaPosicionDeRemate x = 2 or: [unaPosicionDeRemate x= 0]) and: (unaPosicionDeRemate y ~= 1).! !

!Delantero methodsFor: 'direccion' stamp: 'GL 9/23/2024 17:28:13'!
direccionDeRemateAMatarDeJabulaniA: unaPosicionDeTiro
	(self assertRemateAlAngulo: unaPosicionDeTiro) ifTrue: [
		^(unaPosicionDeTiro x) @ 1.
	].
	^unaPosicionDeTiro.
	! !

!Delantero methodsFor: 'direccion' stamp: 'GL 9/23/2024 18:07:22'!
direccionDeRemateAmatarDeCostaAzulA: unaPosicionDeTiro.
	(self assertRemateAlAngulo: unaPosicionDeTiro) ifTrue:[
		^(unaPosicionDeTiro x) @ 1. 
	].	
	(self assertRemateAlAngulo: unaPosicionDeTiro) not ifTrue: [
		^(unaPosicionDeTiro x) @ ((unaPosicionDeTiro y) + 2).
	].
	^unaPosicionDeTiro.! !

!Delantero methodsFor: 'direccion' stamp: 'GL 9/23/2024 17:23:38'!
direccionDeTiroDirigidoA: posicionDeRemate con: pelota.
	^tipoDeTiro direccionDeTiroDirigidoA: posicionDeRemate con: pelota por: self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #Penales!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'GL 9/21/2024 11:10:36'!
decideTirarAColocarSuFuerzaBaseEs: unaFuerzaBase 
	
	^self new initializeDecideTirarAColocarSuFuerzaBaseEs: unaFuerzaBase. ! !

!Delantero class methodsFor: 'instance creation' stamp: 'GL 9/22/2024 16:08:42'!
decideTirarAMatarSuFuerzaBaseEs: unaFuerzaBasica 
	^self new initializeDecideTirarAMatarSuFuerzaBaseEs: unaFuerzaBasica. ! !


!classDefinition: #Pelota category: #Penales!
Object subclass: #Pelota
	instanceVariableNames: 'tipoDePelota'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Pelota methodsFor: 'initialization' stamp: 'GL 9/21/2024 11:13:48'!
initializeJabulaniSudafricanaRapida
	tipoDePelota := #jabulani.! !

!Pelota methodsFor: 'initialization' stamp: 'GL 9/22/2024 13:28:33'!
initializePlayeraLentaCostaAzul
	tipoDePelota := #costaAzul.! !


!Pelota methodsFor: 'accesing' stamp: 'GL 9/22/2024 11:58:28'!
tipo
	^tipoDePelota. ! !


!Pelota methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:12:16'!
seRemataAColocarContra: unArquero posicionadoEn: unaPosicionDeArquero en: unJuegoDePenales

	self subclassResponsibility! !

!Pelota methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:12:25'!
seRemataAMatarContra: unArquero posicionadoEn: unaPosicionDeArquero en: unJuegoDePenales

	self subclassResponsibility! !


!Pelota methodsFor: 'fuerza' stamp: 'GL 9/23/2024 17:00:11'!
fuerzaDeAtajadaDeRemateAColocarDe: unArquero

	self subclassResponsibility! !

!Pelota methodsFor: 'fuerza' stamp: 'GL 9/23/2024 17:01:33'!
fuerzaDeAtajadaDeRemateAMatarDe: unArquero

	self subclassResponsibility! !

!Pelota methodsFor: 'fuerza' stamp: 'GL 9/23/2024 16:50:56'!
fuerzaDeRemateAColocarPor: unDelantero

	self subclassResponsibility! !

!Pelota methodsFor: 'fuerza' stamp: 'GL 9/23/2024 16:51:42'!
fuerzaDeRemateAMatarPor: unDelantero

	self subclassResponsibility! !


!Pelota methodsFor: 'direccion' stamp: 'GL 9/23/2024 17:25:57'!
direccionDeTiroAMatarDirigidoA: posicionDeRemate por: unDelantero

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #Penales!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 'GL 9/23/2024 16:46:03'!
jabulaniSudafricanaRapida
	^Jabulani new.! !

!Pelota class methodsFor: 'instance creation' stamp: 'GL 9/23/2024 16:46:15'!
playeraLentaCostaAzul
	^CostaAzul new.! !


!classDefinition: #CostaAzul category: #Penales!
Pelota subclass: #CostaAzul
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:27:40'!
direccionDeTiroAMatarDirigidoA: posicionDeRemate por: unDelantero
	^unDelantero direccionDeRemateAmatarDeCostaAzulA: posicionDeRemate! !

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:04:12'!
fuerzaDeAtajadaDeRemateAColocarDe: unArquero
	^unArquero fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAColocar! !

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:05:15'!
fuerzaDeAtajadaDeRemateAMatarDe: unArquero
	^unArquero fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAMatar. ! !

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:50:56'!
fuerzaDeRemateAColocarPor: unDelantero
	^unDelantero fuerzaDeTiroAColocarConCostaAzul. ! !

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:51:42'!
fuerzaDeRemateAMatarPor: unDelantero
	^unDelantero fuerzaDeTiroAMatarConCostaAzul. ! !

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:35:30'!
seRemataAColocarContra: unArquero posicionadoEn: unaPosicionDeArquero en: unJuegoDePenales.
	unArquero posicionadoEn: unaPosicionDeArquero recibeUnRemateAColocarDeCostaAzulEn: unJuegoDePenales! !

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:35:39'!
seRemataAMatarContra: unArquero posicionadoEn: unaPosicionDeArquero en: unJuegoDePenales
	unArquero posicionadoEn: unaPosicionDeArquero recibeUnRemateAMatarDeCostaAzulEn: unJuegoDePenales.! !


!classDefinition: #Jabulani category: #Penales!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:28:13'!
direccionDeTiroAMatarDirigidoA: posicionDeRemate por: unDelantero
	^unDelantero direccionDeRemateAMatarDeJabulaniA: posicionDeRemate! !

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:05:52'!
fuerzaDeAtajadaDeRemateAColocarDe: unArquero
	^unArquero fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAColocar. ! !

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:06:12'!
fuerzaDeAtajadaDeRemateAMatarDe: unArquero
	^unArquero fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAMatar. ! !

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:50:56'!
fuerzaDeRemateAColocarPor: unDelantero
	^unDelantero fuerzaDeTiroAColocarConJabulani. ! !

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:51:42'!
fuerzaDeRemateAMatarPor: unDelantero
	^unDelantero fuerzaDeTiroAMatarConJabulani. ! !

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:35:50'!
seRemataAColocarContra: unArquero posicionadoEn: unaPosicionDeArquero en: unJuegoDePenales
	unArquero posicionadoEn: unaPosicionDeArquero recibeUnRemateAColocarDeJabulaniEn: unJuegoDePenales.! !

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:35:57'!
seRemataAMatarContra: unArquero posicionadoEn: unaPosicionDeArquero en: unJuegoDePenales
	unArquero posicionadoEn: unaPosicionDeArquero recibeUnRemateAMatarDeJabulaniEn: unJuegoDePenales.! !


!classDefinition: #Penales category: #Penales!
Object subclass: #Penales
	instanceVariableNames: 'delantero arquero puntajeArquero puntajeDelantero direccionRemateResultante fuerzaTiroResultante fuerzaAtajadaResultante var1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Penales methodsFor: 'initialization' stamp: 'GL 9/22/2024 09:45:03'!
initializeConDelantero: unDelantero yArquero: unArquero 
	puntajeArquero := 0.
	puntajeDelantero := 0.
	delantero := unDelantero.
	arquero := unArquero.! !


!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 17:17:21'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: unaPosicionDeTiro arqueroSeLanzaEnDirección: unaPosicionDeArquero
	
	self assertPosicionDeTiroValida: unaPosicionDeTiro. 
	self assertPosicionDeArqueroValida: unaPosicionDeArquero. 
	
	var1 := VerVar verRemateDeDelantero: delantero a: arquero con: pelota hacia: unaPosicionDeTiro. 
	
	delantero remataContraUn: arquero posicionadoEn: unaPosicionDeArquero con: pelota enUnjuegoDePenales: self.
	
	! !

!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 17:38:11'!
remateDeCostaAzulAColocarConAqueroQueEligeDireccionDeTiro: unaPosicionDeArquero
	(unaPosicionDeArquero ~=  self varDireccionRemateResultante) ifTrue: [self sumarPuntajeDelantero. ^self ].
	
	(self varFuerzaResultanteDeTiro > self varFuerzaResultanteDeAtajada ) ifTrue: [self sumarPuntajeDelantero. ^self].
	
	self sumarPuntajeArquero. ! !

!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 09:52:37'!
remateDeCostaAzulAColocarConAqueroQueEsperaPorTiroYSeAdelanta: unaPosicionDeArquero
	self sumarPuntajeDelantero.! !

!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 18:10:17'!
remateDeCostaAzulAMatarConAqueroQueEligeDireccionDeTiro: unaPosicionDeArquero
	self varDireccionRemateResultante y > 2 ifTrue: [self sumarPuntajeArquero. ^self].
	unaPosicionDeArquero y ~=  (self varDireccionRemateResultante) y ifTrue: [
		self sumarPuntajeDelantero. ^self.
	].
				
	self varFuerzaResultanteDeTiro > self varFuerzaResultanteDeAtajada ifTrue: [self sumarPuntajeDelantero. ^self].
				
	self sumarPuntajeArquero. ^self. ! !

!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 10:02:18'!
remateDeCostaAzulAMatarConAqueroQueEsperaPorTiroYSeAdelanta: unaPosicionDeArquero
	self sumarPuntajeArquero.! !

!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 17:39:42'!
remateDeJabulaniAColocarConAqueroQueEligeDireccionDeTiro: unaPosicionDeArquero
	(unaPosicionDeArquero ~=  self varDireccionRemateResultante ) ifTrue: [self sumarPuntajeDelantero. ^self ].
	
	(self varFuerzaResultanteDeTiro > self varFuerzaResultanteDeAtajada ) ifTrue: [self sumarPuntajeDelantero. ^self].
	
	self sumarPuntajeArquero. ! !

!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 17:40:22'!
remateDeJabulaniAColocarConAqueroQueEsperaPorTiroYSeAdelanta: unaPosicionDeArquero
	unaPosicionDeArquero x ~=  (self varDireccionRemateResultante) x ifTrue: [
			self sumarPuntajeDelantero. ^self.
	].
				
	self varFuerzaResultanteDeTiro > self varFuerzaResultanteDeAtajada ifTrue: [self sumarPuntajeDelantero. ^self].
				
	self sumarPuntajeArquero. ^self. ! !

!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 17:40:56'!
remateDeJabulaniAMatarConAqueroQueEligeDireccionDeTiro: unaPosicionDeArquero
	unaPosicionDeArquero x ~=  self varDireccionRemateResultante x ifTrue: [
		self sumarPuntajeDelantero. ^self.
	].
		
	self varFuerzaResultanteDeTiro > self varFuerzaResultanteDeAtajada ifTrue: [self sumarPuntajeDelantero. ^self].
				
	self sumarPuntajeArquero. ! !

!Penales methodsFor: 'jugar' stamp: 'GL 9/23/2024 09:58:52'!
remateDeJabulaniAMatarConAqueroQueEsperaPorTiro: unaPosicionDeArquero
	self sumarPuntajeDelantero.! !


!Penales methodsFor: 'accesing' stamp: 'GL 9/21/2024 11:45:20'!
puntajeDeArquero
	^puntajeArquero. ! !

!Penales methodsFor: 'accesing' stamp: 'GL 9/21/2024 11:45:27'!
puntajeDeDelantero
	^puntajeDelantero. ! !


!Penales methodsFor: 'testing' stamp: 'GL 9/21/2024 11:43:32'!
assertPosicionDeArqueroValida: unaPosicion
	(self assertPosicionValida: unaPosicion) ifFalse:[self error: self class direccionArqueroFueraDeRango ].! !

!Penales methodsFor: 'testing' stamp: 'GL 9/21/2024 11:43:58'!
assertPosicionDeTiroValida: unaPosicion
	(self assertPosicionValida: unaPosicion) ifFalse:[self error: self class direccionTiroFueraDeRango ].! !

!Penales methodsFor: 'testing' stamp: 'GL 9/21/2024 11:42:32'!
assertPosicionValida: unaPosicion
	^unaPosicion >= (0@0) and: [unaPosicion <=(2@2)]! !

!Penales methodsFor: 'testing' stamp: 'GL 9/22/2024 17:50:24'!
assertRemateAlAngulo: unaPosicionDeRemate
	^(unaPosicionDeRemate x = 2 or: [unaPosicionDeRemate x= 0]) and: (unaPosicionDeRemate y ~= 1)! !


!Penales methodsFor: 'var' stamp: 'GL 9/23/2024 16:41:59'!
varDireccionRemateResultante
	^ var1 verDireccionDeRemateResultante. ! !

!Penales methodsFor: 'var' stamp: 'GL 9/23/2024 16:41:29'!
varFuerzaResultanteDeAtajada
	^var1 verFuerzaDeAtajadaResultante. ! !

!Penales methodsFor: 'var' stamp: 'GL 9/23/2024 16:42:10'!
varFuerzaResultanteDeTiro
	"^pelota esPateadaPor: delantero."
	^var1 verFuerzaDeTiroResultante. ! !


!Penales methodsFor: 'sumar puntaje' stamp: 'GL 9/22/2024 12:55:13'!
sumarPuntajeArquero
	puntajeArquero := puntajeArquero + 1.! !

!Penales methodsFor: 'sumar puntaje' stamp: 'GL 9/22/2024 12:54:56'!
sumarPuntajeDelantero
	puntajeDelantero := puntajeDelantero + 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #Penales!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!Penales class methodsFor: 'instance creation' stamp: 'GL 9/21/2024 11:22:18'!
conDelantero: delantero yArquero: arquero 

	^self new initializeConDelantero: delantero yArquero: arquero ! !


!classDefinition: #Posicionamiento category: #Penales!
Object subclass: #Posicionamiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Posicionamiento methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:07:54'!
fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAColocar: unArquero

	self subclassResponsibility! !

!Posicionamiento methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:08:20'!
fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAMatar: unArquero

	self subclassResponsibility! !

!Posicionamiento methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:08:50'!
fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAColocar: unArquero

	self subclassResponsibility! !

!Posicionamiento methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:09:25'!
fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAMatar: unArquero

	self subclassResponsibility! !


!Posicionamiento methodsFor: 'juego' stamp: 'GL 9/23/2024 16:23:08'!
esperaEn: unaPosicionDeArquero unRemateAColocarDeCostaAZulEn: unJuegoDePenales

	self subclassResponsibility! !

!Posicionamiento methodsFor: 'juego' stamp: 'GL 9/23/2024 16:23:14'!
esperaEn: unaPosicionDeArquero unRemateAColocarDeJabulaniEn: unJuegoDePenales

	self subclassResponsibility! !

!Posicionamiento methodsFor: 'juego' stamp: 'GL 9/23/2024 16:23:18'!
esperaEn: unaPosicionDeArquero unRemateAMatarDeCostaAZulEn: unJuegoDePenales

	self subclassResponsibility! !

!Posicionamiento methodsFor: 'juego' stamp: 'GL 9/23/2024 16:23:26'!
esperaEn: unaPosicionDeArquero unRemateAMatarDeJabulaniEn: unJuegoDePenales

	self subclassResponsibility! !


!classDefinition: #EligeAntesDeTiro category: #Penales!
Posicionamiento subclass: #EligeAntesDeTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EligeAntesDeTiro methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:10:26'!
fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAColocar: unArquero
	^unArquero fuerzaDeAtajadaEligeAntesDeTiroFrenteAUnRemateDeCostaAzulAColocar. ! !

!EligeAntesDeTiro methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:10:52'!
fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAMatar: unArquero
	^unArquero fuerzaDeAtajadaEligeAntesDeTiroFrenteAUnRemateDeCostaAzulAMatar. ! !

!EligeAntesDeTiro methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:11:15'!
fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAColocar: unArquero
	^unArquero fuerzaDeAtajadaEligeAntesDeTiroFrenteAUnRemateDeJabulaniAColocar. ! !

!EligeAntesDeTiro methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:11:33'!
fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAMatar: unArquero
	^unArquero fuerzaDeAtajadaEligeAntesDeTiroFrenteAUnRemateDeJabulaniAMatar. ! !


!EligeAntesDeTiro methodsFor: 'juego' stamp: 'GL 9/23/2024 16:28:09'!
esperaEn: unaPosicionDeArquero unRemateAColocarDeCostaAZulEn: unJuegoDePenales
	unJuegoDePenales remateDeCostaAzulAColocarConAqueroQueEligeDireccionDeTiro: unaPosicionDeArquero.! !

!EligeAntesDeTiro methodsFor: 'juego' stamp: 'GL 9/23/2024 16:29:13'!
esperaEn: unaPosicionDeArquero unRemateAColocarDeJabulaniEn: unJuegoDePenales
	unJuegoDePenales remateDeJabulaniAColocarConAqueroQueEligeDireccionDeTiro: unaPosicionDeArquero.
	
! !

!EligeAntesDeTiro methodsFor: 'juego' stamp: 'GL 9/23/2024 16:29:39'!
esperaEn: unaPosicionDeArquero unRemateAMatarDeCostaAZulEn: unJuegoDePenales
	unJuegoDePenales remateDeCostaAzulAMatarConAqueroQueEligeDireccionDeTiro: unaPosicionDeArquero. 	
! !

!EligeAntesDeTiro methodsFor: 'juego' stamp: 'GL 9/23/2024 16:30:31'!
esperaEn: unaPosicionDeArquero unRemateAMatarDeJabulaniEn: unJuegoDePenales
	unJuegoDePenales remateDeJabulaniAMatarConAqueroQueEligeDireccionDeTiro: unaPosicionDeArquero 
! !


!classDefinition: #EsperaPorTiro category: #Penales!
Posicionamiento subclass: #EsperaPorTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EsperaPorTiro methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:12:05'!
fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAColocar: unArquero
	^unArquero fuerzaDeAtajadaEsperaPorTiroFrenteAUnRemateDeCostaAzulAColocar. ! !

!EsperaPorTiro methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:12:38'!
fuerzaDeAtajadaFrenteAUnRemateDeCostaAzulAMatar: unArquero
	^unArquero fuerzaDeAtajadaEsperaPorTiroFrenteAUnRemateDeCostaAzulAMatar. ! !

!EsperaPorTiro methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:12:57'!
fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAColocar: unArquero
	^unArquero fuerzaDeAtajadaEsperaPorTiroFrenteAUnRemateDeJabulaniAColocar. ! !

!EsperaPorTiro methodsFor: 'posicionamiento' stamp: 'GL 9/23/2024 17:13:09'!
fuerzaDeAtajadaFrenteAUnRemateDeJabulaniAMatar: unArquero
	^unArquero fuerzaDeAtajadaEsperaPorTiroFrenteAUnRemateDeJabulaniAMatar. ! !


!EsperaPorTiro methodsFor: 'juego' stamp: 'GL 9/23/2024 16:35:33'!
esperaEn: unaPosicionDeArquero unRemateAColocarDeCostaAZulEn: unJuegoDePenales
	unJuegoDePenales remateDeCostaAzulAColocarConAqueroQueEsperaPorTiroYSeAdelanta: unaPosicionDeArquero.
	
! !

!EsperaPorTiro methodsFor: 'juego' stamp: 'GL 9/23/2024 16:35:57'!
esperaEn: unaPosicionDeArquero unRemateAColocarDeJabulaniEn: unJuegoDePenales
	unJuegoDePenales remateDeJabulaniAColocarConAqueroQueEsperaPorTiroYSeAdelanta: unaPosicionDeArquero.
	
! !

!EsperaPorTiro methodsFor: 'juego' stamp: 'GL 9/23/2024 16:36:18'!
esperaEn: unaPosicionDeArquero unRemateAMatarDeCostaAZulEn: unJuegoDePenales
	unJuegoDePenales remateDeCostaAzulAMatarConAqueroQueEsperaPorTiroYSeAdelanta: unaPosicionDeArquero.
! !

!EsperaPorTiro methodsFor: 'juego' stamp: 'GL 9/23/2024 16:38:35'!
esperaEn: unaPosicionDeArquero unRemateAMatarDeJabulaniEn: unJuegoDePenales
	unJuegoDePenales remateDeJabulaniAMatarConAqueroQueEsperaPorTiro: unaPosicionDeArquero. ! !


!classDefinition: #TipoDeTiro category: #Penales!
Object subclass: #TipoDeTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TipoDeTiro methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:20:18'!
direccionDeTiroDirigidoA: posicionDeRemate con: pelota

	self subclassResponsibility! !

!TipoDeTiro methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:22:02'!
direccionDeTiroDirigidoA: posicionDeRemate con: pelota por: unDelantero

	self subclassResponsibility! !

!TipoDeTiro methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:58:07'!
fuerzaDeAtajadaDe: unArquero con: unaPelota

	self subclassResponsibility! !

!TipoDeTiro methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:49:00'!
fuerzaDeRemateCon: unaPelota por: unDelantero

	self subclassResponsibility! !

!TipoDeTiro methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:09:42'!
seRemataContra: unArquero posicionadoEn: unaPosicionDeArquero con: unaPelota en: unJuegoDePenales

	self subclassResponsibility! !


!classDefinition: #TiroAColocar category: #Penales!
TipoDeTiro subclass: #TiroAColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TiroAColocar methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:24:02'!
direccionDeTiroDirigidoA: posicionDeRemate con: pelota por: unDelantero
	^posicionDeRemate.! !

!TiroAColocar methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:00:11'!
fuerzaDeAtajadaDe: unArquero con: unaPelota
	^unaPelota fuerzaDeAtajadaDeRemateAColocarDe: unArquero.! !

!TiroAColocar methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:50:56'!
fuerzaDeRemateCon: unaPelota por: unDelantero
	^unaPelota fuerzaDeRemateAColocarPor: unDelantero.! !

!TiroAColocar methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:33:31'!
seRemataContra: unArquero posicionadoEn: unaPosicionDeArquero con: unaPelota en: unJuegoDePenales
	unaPelota seRemataAColocarContra: unArquero posicionadoEn: unaPosicionDeArquero en: unJuegoDePenales! !


!classDefinition: #TiroAMatar category: #Penales!
TipoDeTiro subclass: #TiroAMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TiroAMatar methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:25:58'!
direccionDeTiroDirigidoA: posicionDeRemate con: pelota por: unDelantero
	^pelota direccionDeTiroAMatarDirigidoA: posicionDeRemate por: unDelantero. ! !

!TiroAMatar methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:01:33'!
fuerzaDeAtajadaDe: unArquero con: unaPelota
	^unaPelota fuerzaDeAtajadaDeRemateAMatarDe: unArquero! !

!TiroAMatar methodsFor: 'tiro' stamp: 'GL 9/23/2024 16:51:42'!
fuerzaDeRemateCon: unaPelota por: unDelantero
	^unaPelota fuerzaDeRemateAMatarPor: unDelantero! !

!TiroAMatar methodsFor: 'tiro' stamp: 'GL 9/23/2024 11:56:34'!
seRemataA: posicionDeRemate con: pelota por: unDelantero
	"^pelota seRemataAMatarHacia: posicionDeRemate por: unDelantero" ! !

!TiroAMatar methodsFor: 'tiro' stamp: 'GL 9/23/2024 17:34:56'!
seRemataContra: unArquero posicionadoEn: unaPosicionDeArquero con: unaPelota en: unJuegoDePenales.
	^unaPelota seRemataAMatarContra: unArquero posicionadoEn: unaPosicionDeArquero en: unJuegoDePenales.! !


!classDefinition: #VerVar category: #Penales!
Object subclass: #VerVar
	instanceVariableNames: 'pelota posicionDeRemate delantero arquero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!VerVar methodsFor: 'intialize' stamp: 'GL 9/23/2024 10:28:08'!
initializeverRemateDeDelantero: unDelantero a: unArquero con: unaPelota hacia: unaPosicionDeRemate.
	delantero := unDelantero.
	arquero := unArquero.
	pelota :=  unaPelota.
	posicionDeRemate := unaPosicionDeRemate. ! !


!VerVar methodsFor: 'ver var' stamp: 'GL 9/23/2024 17:19:31'!
verDireccionDeRemateResultante
	^delantero direccionDeTiroDirigidoA: posicionDeRemate con: pelota.! !

!VerVar methodsFor: 'ver var' stamp: 'GL 9/23/2024 16:54:28'!
verFuerzaDeAtajadaResultante
	^arquero fuerzaDeAtajadaDeTiroDe: delantero con: pelota.! !

!VerVar methodsFor: 'ver var' stamp: 'GL 9/23/2024 16:44:43'!
verFuerzaDeTiroResultante
	^delantero fuerzaDeRemateCon: pelota. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VerVar class' category: #Penales!
VerVar class
	instanceVariableNames: ''!

!VerVar class methodsFor: 'instance creation' stamp: 'GL 9/23/2024 10:28:20'!
verRemateDeDelantero: unDelantero a: unArquero con: unaPelota hacia: unaPosicionDeRemate
	^self new initializeverRemateDeDelantero: unDelantero a: unArquero con: unaPelota hacia: unaPosicionDeRemate! !
