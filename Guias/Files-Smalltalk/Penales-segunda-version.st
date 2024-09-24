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
	instanceVariableNames: 'fuerzaBase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Arquero methodsFor: 'initialization' stamp: 'GL 9/23/2024 21:26:09'!
intializeConUnaFuerza: unaFuerzaBase
	fuerzaBase := unaFuerzaBase. ! !


!Arquero methodsFor: 'fuerza de atajada' stamp: 'GL 9/24/2024 08:39:01'!
fuerzaDeAtajadaDeTiroDe: unDelantero con: unaPelota
	^unDelantero fuerzaDeAtajadaDe: self con: unaPelota.! !

!Arquero methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:47:39'!
fuerzaDeAtajarCostaAzulAColocar

	self subclassResponsibility! !

!Arquero methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:47:46'!
fuerzaDeAtajarCostaAzulAMatar

	self subclassResponsibility! !

!Arquero methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:47:53'!
fuerzaDeAtajarJabulaniAColocar

	self subclassResponsibility! !

!Arquero methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:47:59'!
fuerzaDeAtajarJabulaniAMatar

	self subclassResponsibility! !


!Arquero methodsFor: 'atajada de tiro' stamp: 'GL 9/23/2024 21:12:34'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAColocarDeCostaAzulEn: unJuegoDePenales

	self subclassResponsibility! !

!Arquero methodsFor: 'atajada de tiro' stamp: 'GL 9/23/2024 21:12:39'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAColocarDeJabulaniEn: unJuegoDePenales

	self subclassResponsibility! !

!Arquero methodsFor: 'atajada de tiro' stamp: 'GL 9/23/2024 21:12:44'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAMatarDeCostaAzulEn: unJuegoDePenales

	self subclassResponsibility! !

!Arquero methodsFor: 'atajada de tiro' stamp: 'GL 9/23/2024 21:12:51'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAMatarDeJabulaniEn: unJuegoDePenales

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #Penales!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'GL 9/24/2024 08:42:03'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerzaBase 
	^ArqueroEligeAntesDeTiro new intializeConUnaFuerza: unaFuerzaBase.! !

!Arquero class methodsFor: 'instance creation' stamp: 'GL 9/23/2024 21:27:46'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerzaBase 
	
	^ArqueroEsperaPorTiro new intializeConUnaFuerza: unaFuerzaBase. ! !


!classDefinition: #ArqueroEligeAntesDeTiro category: #Penales!
Arquero subclass: #ArqueroEligeAntesDeTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!ArqueroEligeAntesDeTiro methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:48:25'!
fuerzaDeAtajarCostaAzulAColocar
	^fuerzaBase * 2.! !

!ArqueroEligeAntesDeTiro methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:48:50'!
fuerzaDeAtajarCostaAzulAMatar
	^fuerzaBase.! !

!ArqueroEligeAntesDeTiro methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:49:10'!
fuerzaDeAtajarJabulaniAColocar
	^fuerzaBase + (fuerzaBase / 2).! !

!ArqueroEligeAntesDeTiro methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:49:24'!
fuerzaDeAtajarJabulaniAMatar
	^fuerzaBase.! !


!ArqueroEligeAntesDeTiro methodsFor: 'atajada de tiro' stamp: 'GL 9/24/2024 09:20:57'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAColocarDeCostaAzulEn: unJuegoDePenales
	unJuegoDePenales delanteroRemataCostaAzulAColocarContraAqueroQueEligeDireccionDeTiroUbicadoEn: unaPosicionDeArquero.! !

!ArqueroEligeAntesDeTiro methodsFor: 'atajada de tiro' stamp: 'GL 9/24/2024 09:22:23'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAColocarDeJabulaniEn: unJuegoDePenales
	unJuegoDePenales delanteroRemataJabulaniAColocarContraAqueroQueEligeDireccionDeTiroUbicadoEn: unaPosicionDeArquero. ! !

!ArqueroEligeAntesDeTiro methodsFor: 'atajada de tiro' stamp: 'GL 9/24/2024 09:21:28'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAMatarDeCostaAzulEn: unJuegoDePenales 
	unJuegoDePenales delanteroRemataCostaAzulAMatarContraAqueroQueEligeDireccionDeTiroUbicadoEn: unaPosicionDeArquero. ! !

!ArqueroEligeAntesDeTiro methodsFor: 'atajada de tiro' stamp: 'GL 9/24/2024 09:18:16'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAMatarDeJabulaniEn: unJuegoDePenales
	unJuegoDePenales delanteroRemataJabulaniAMatarContraAqueroQueEligeDireccionDeTiroUbicadoEn: unaPosicionDeArquero. ! !


!classDefinition: #ArqueroEsperaPorTiro category: #Penales!
Arquero subclass: #ArqueroEsperaPorTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!ArqueroEsperaPorTiro methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:49:46'!
fuerzaDeAtajarCostaAzulAColocar
	^fuerzaBase.! !

!ArqueroEsperaPorTiro methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:49:52'!
fuerzaDeAtajarCostaAzulAMatar
	^fuerzaBase.! !

!ArqueroEsperaPorTiro methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:50:16'!
fuerzaDeAtajarJabulaniAColocar
	^fuerzaBase. ! !

!ArqueroEsperaPorTiro methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:50:24'!
fuerzaDeAtajarJabulaniAMatar
	^fuerzaBase. ! !


!ArqueroEsperaPorTiro methodsFor: 'atajada de tiro' stamp: 'GL 9/24/2024 09:20:33'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAColocarDeCostaAzulEn: unJuegoDePenales
	unJuegoDePenales delanteroRemataCostaAzulAColocarContraAqueroQueEsperaPorTiroYSeAdelantaUbicadEn: unaPosicionDeArquero. ! !

!ArqueroEsperaPorTiro methodsFor: 'atajada de tiro' stamp: 'GL 9/24/2024 09:23:01'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAColocarDeJabulaniEn: unJuegoDePenales
	unJuegoDePenales delanteroRemataJabulaniAColocarContraAqueroQueEsperaPorTiroYSeAdelantaUbicadoEn: unaPosicionDeArquero. ! !

!ArqueroEsperaPorTiro methodsFor: 'atajada de tiro' stamp: 'GL 9/24/2024 09:22:02'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAMatarDeCostaAzulEn: unJuegoDePenales 
	unJuegoDePenales delanteroRemataCostaAzulAMatarContraAqueroQueEsperaPorTiroYSeAdelantaUbicadoEn: unaPosicionDeArquero. ! !

!ArqueroEsperaPorTiro methodsFor: 'atajada de tiro' stamp: 'GL 9/24/2024 09:23:21'!
ubicadoEn: unaPosicionDeArquero RecibeUnRemateAMatarDeJabulaniEn: unJuegoDePenales
	unJuegoDePenales delanteroRemataJabulaniAMatarContraAqueroQueEsperaPorTiroUbicadoEn: unaPosicionDeArquero. ! !


!classDefinition: #AusenciaDeVar category: #Penales!
Object subclass: #AusenciaDeVar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!AusenciaDeVar methodsFor: 'ver var' stamp: 'GL 9/24/2024 09:57:06'!
verDireccionDeRemateResultante
	^self error: 'No hay jugada para analizar'.! !

!AusenciaDeVar methodsFor: 'ver var' stamp: 'GL 9/24/2024 09:57:38'!
verFuerzaDeAtajadaResultante
	^self error: 'No hay jugada para analizar'.! !

!AusenciaDeVar methodsFor: 'ver var' stamp: 'GL 9/24/2024 09:58:08'!
verFuerzaDeTiroResultante
	^self error: 'No hay jugada para analizar'. ! !


!classDefinition: #Delantero category: #Penales!
Object subclass: #Delantero
	instanceVariableNames: 'fuerzaBase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Delantero methodsFor: 'initialization' stamp: 'GL 9/23/2024 21:23:57'!
initializeConUnaFuerza: unaFuerzaBase
	fuerzaBase := unaFuerzaBase. ! !


!Delantero methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:42:33'!
fuerzaDeAtajadaDe: unArquero con: unaPelota

	self subclassResponsibility! !


!Delantero methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:02:48'!
remataContraUn: unArquero posicionadoEn: unaPosicionDeArquero con: unaPelota enUnjuegoDePenales: unJuegoDePenales

	self subclassResponsibility! !


!Delantero methodsFor: 'direccion' stamp: 'GL 9/23/2024 17:53:33'!
assertRemateAlAngulo: unaPosicionDeRemate
	^(unaPosicionDeRemate x = 2 or: [unaPosicionDeRemate x= 0]) and: (unaPosicionDeRemate y ~= 1).! !

!Delantero methodsFor: 'direccion' stamp: 'GL 9/23/2024 20:59:19'!
direccionDeRemateAMatarDeCostaAzulA: unaPosicionDeTiro.
	(self assertRemateAlAngulo: unaPosicionDeTiro) ifTrue:[
		^(unaPosicionDeTiro x) @ 1. 
	].	
	(self assertRemateAlAngulo: unaPosicionDeTiro) not ifTrue: [
		^(unaPosicionDeTiro x) @ ((unaPosicionDeTiro y) + 2).
	].
	^unaPosicionDeTiro.! !

!Delantero methodsFor: 'direccion' stamp: 'GL 9/23/2024 17:28:13'!
direccionDeRemateAMatarDeJabulaniA: unaPosicionDeTiro
	(self assertRemateAlAngulo: unaPosicionDeTiro) ifTrue: [
		^(unaPosicionDeTiro x) @ 1.
	].
	^unaPosicionDeTiro.
	! !

!Delantero methodsFor: 'direccion' stamp: 'GL 9/23/2024 20:55:11'!
direccionDeTiroDirigidoA: posicionDeRemate con: pelota

	self subclassResponsibility! !


!Delantero methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:24:34'!
fuerzaDeRemateCon: unaPelota

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #Penales!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'GL 9/23/2024 21:24:18'!
decideTirarAColocarSuFuerzaBaseEs: unaFuerzaBase 
	
	^DelanteroRemataAColocar new initializeConUnaFuerza: unaFuerzaBase. ! !

!Delantero class methodsFor: 'instance creation' stamp: 'GL 9/23/2024 21:24:40'!
decideTirarAMatarSuFuerzaBaseEs: unaFuerzaBasica 
	
	^DelanteroRemataAMatar  new initializeConUnaFuerza: unaFuerzaBasica. 
	! !


!classDefinition: #DelanteroRemataAColocar category: #Penales!
Delantero subclass: #DelanteroRemataAColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!DelanteroRemataAColocar methodsFor: 'direccion' stamp: 'GL 9/23/2024 21:35:40'!
direccionDeTiroDirigidoA: posicionDeRemate con: pelota.
	^pelota direccionDeRematarlaAColocarA: posicionDeRemate por: self.! !


!DelanteroRemataAColocar methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:05:59'!
remataContraUn: unArquero posicionadoEn: unaPosicionDeArquero con: unaPelota enUnjuegoDePenales: unJuegoDePenales.
	^unaPelota esRematadaAColocarA: unArquero ubicadoEn: unaPosicionDeArquero enUnJuegoDePenales: unJuegoDePenales.! !


!DelanteroRemataAColocar methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:33:17'!
fuerzaDeRemateAColocarConCostaAzul
	^(fuerzaBase/2) * (4/5)
	! !

!DelanteroRemataAColocar methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:33:35'!
fuerzaDeRemateAColocarConJabulani
	^fuerzaBase/2.! !

!DelanteroRemataAColocar methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:27:36'!
fuerzaDeRemateCon: unaPelota
	^unaPelota fuerzaDeRematarlaAColocarCon: self.! !


!DelanteroRemataAColocar methodsFor: 'fuerza de atajada' stamp: 'GL 9/24/2024 08:37:04'!
fuerzaDeAtajadaDe: unArquero con: unaPelota
	^unaPelota fuerzaDeAtajarlaAColocarPor: unArquero.! !


!classDefinition: #DelanteroRemataAMatar category: #Penales!
Delantero subclass: #DelanteroRemataAMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!DelanteroRemataAMatar methodsFor: 'direccion' stamp: 'GL 9/24/2024 08:43:41'!
direccionDeTiroDirigidoA: posicionDeRemate con: pelota.
	^pelota direccionDeRematarlaAMatarA: posicionDeRemate por: self! !


!DelanteroRemataAMatar methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:06:26'!
remataContraUn: unArquero posicionadoEn: unaPosicionDeArquero con: unaPelota enUnjuegoDePenales: unJuegoDePenales.
	^unaPelota esRematadaAMatarA: unArquero ubicadoEn: unaPosicionDeArquero  enUnJuegoDePenales: unJuegoDePenales. ! !


!DelanteroRemataAMatar methodsFor: 'fuerza de atajada' stamp: 'GL 9/24/2024 08:37:32'!
fuerzaDeAtajadaDe: unArquero con: unaPelota
	^unaPelota fuerzaDeAtajarlaAMatarPor: unArquero.! !


!DelanteroRemataAMatar methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:34:04'!
fuerzaDeRemateAMatarConCostaAzul
	^fuerzaBase.! !

!DelanteroRemataAMatar methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:34:19'!
fuerzaDeRemateAMatarConJabulani
	^fuerzaBase * (120/100).! !

!DelanteroRemataAMatar methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:27:44'!
fuerzaDeRemateCon: unaPelota
	^unaPelota fuerzaDeRematarlaAMatarCon: self.! !


!classDefinition: #Pelota category: #Penales!
Object subclass: #Pelota
	instanceVariableNames: 'tipoDePelota'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Pelota methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:06:54'!
esRematadaAColocarA: unArquero ubicadoEn: unaPosicionDeArquero enUnJuegoDePenales: unJuegoDePenales

	self subclassResponsibility! !

!Pelota methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:07:02'!
esRematadaAMatarA: unArquero ubicadoEn: unaPosicionDeArquero enUnJuegoDePenales: unJuegoDePenales

	self subclassResponsibility! !


!Pelota methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:27:20'!
fuerzaDeRematarlaAColocarCon: unDelantero

	self subclassResponsibility! !

!Pelota methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 20:26:38'!
fuerzaDeRematarlaAMatarCon: unDelantero

	self subclassResponsibility! !


!Pelota methodsFor: 'direccion' stamp: 'GL 9/23/2024 20:58:39'!
direccionDeRematarlaAColocarA: posicionDeRemate por: unDelantero

	self subclassResponsibility! !

!Pelota methodsFor: 'direccion' stamp: 'GL 9/23/2024 20:58:47'!
direccionDeRematarlaAMatarA: posicionDeRemate por: unDelantero

	self subclassResponsibility! !


!Pelota methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:45:40'!
fuerzaDeAtajarlaAColocarPor: unArquero

	self subclassResponsibility! !

!Pelota methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:45:49'!
fuerzaDeAtajarlaAMatarPor: unArquero

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

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:19:38'!
esRematadaAColocarA: unArquero ubicadoEn: unaPosicionDeArquero enUnJuegoDePenales: unJuegoDePenales.
	^unArquero ubicadoEn: unaPosicionDeArquero RecibeUnRemateAColocarDeCostaAzulEn: unJuegoDePenales! !

!CostaAzul methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:20:23'!
esRematadaAMatarA: unArquero ubicadoEn: unaPosicionDeArquero enUnJuegoDePenales: unJuegoDePenales
	unArquero ubicadoEn: unaPosicionDeArquero RecibeUnRemateAMatarDeCostaAzulEn: unJuegoDePenales. ! !


!CostaAzul methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:52:11'!
fuerzaDeAtajarlaAColocarPor: unArquero
	^unArquero fuerzaDeAtajarCostaAzulAColocar. ! !

!CostaAzul methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:51:55'!
fuerzaDeAtajarlaAMatarPor: unArquero
	^unArquero fuerzaDeAtajarCostaAzulAMatar. ! !


!CostaAzul methodsFor: 'direccion' stamp: 'GL 9/23/2024 21:00:19'!
direccionDeRematarlaAColocarA: posicionDeRemate por: unDelantero
	^posicionDeRemate. ! !

!CostaAzul methodsFor: 'direccion' stamp: 'GL 9/23/2024 21:00:12'!
direccionDeRematarlaAMatarA: posicionDeRemate por: unDelantero
	^unDelantero direccionDeRemateAMatarDeCostaAzulA: posicionDeRemate. 
	! !


!CostaAzul methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 21:30:48'!
fuerzaDeRematarlaAColocarCon: unDelantero
	^unDelantero fuerzaDeRemateAColocarConCostaAzul. ! !

!CostaAzul methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 21:31:10'!
fuerzaDeRematarlaAMatarCon: unDelantero
	^unDelantero fuerzaDeRemateAMatarConCostaAzul. ! !


!classDefinition: #Jabulani category: #Penales!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:20:54'!
esRematadaAColocarA: unArquero ubicadoEn: unaPosicionDeArquero enUnJuegoDePenales: unJuegoDePenales
	unArquero ubicadoEn: unaPosicionDeArquero RecibeUnRemateAColocarDeJabulaniEn: unJuegoDePenales. ! !

!Jabulani methodsFor: 'tiro' stamp: 'GL 9/23/2024 21:21:19'!
esRematadaAMatarA: unArquero ubicadoEn: unaPosicionDeArquero enUnJuegoDePenales: unJuegoDePenales.
	unArquero ubicadoEn: unaPosicionDeArquero RecibeUnRemateAMatarDeJabulaniEn: unJuegoDePenales. ! !


!Jabulani methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 21:29:41'!
fuerzaDeRematarlaAColocarCon: unDelantero
	^unDelantero fuerzaDeRemateAColocarConJabulani. ! !

!Jabulani methodsFor: 'fuerza de tiro' stamp: 'GL 9/23/2024 21:30:17'!
fuerzaDeRematarlaAMatarCon: unDelantero
	^unDelantero fuerzaDeRemateAMatarConJabulani. ! !


!Jabulani methodsFor: 'direccion' stamp: 'GL 9/23/2024 21:00:30'!
direccionDeRematarlaAColocarA: posicionDeRemate por: unDelantero
	^posicionDeRemate.
	! !

!Jabulani methodsFor: 'direccion' stamp: 'GL 9/23/2024 21:00:54'!
direccionDeRematarlaAMatarA: posicionDeRemate por: unDelantero
	^unDelantero direccionDeRemateAMatarDeJabulaniA: posicionDeRemate.! !


!Jabulani methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:52:32'!
fuerzaDeAtajarlaAColocarPor: unArquero
	^unArquero fuerzaDeAtajarJabulaniAColocar. ! !

!Jabulani methodsFor: 'fuerza de atajada' stamp: 'GL 9/23/2024 20:52:48'!
fuerzaDeAtajarlaAMatarPor: unArquero
	^unArquero fuerzaDeAtajarJabulaniAMatar. ! !


!classDefinition: #Penales category: #Penales!
Object subclass: #Penales
	instanceVariableNames: 'delantero arquero puntajeArquero puntajeDelantero var'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Penales methodsFor: 'initialization' stamp: 'GL 9/24/2024 09:58:23'!
initializeConDelantero: unDelantero yArquero: unArquero 
	puntajeArquero := 0.
	puntajeDelantero := 0.
	var := AusenciaDeVar new. 
	delantero := unDelantero.
	arquero := unArquero.! !


!Penales methodsFor: 'jugar' stamp: 'GL 9/24/2024 09:11:59'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: unaPosicionDeTiro arqueroSeLanzaEnDirección: unaPosicionDeArquero
	
	self assertPosicionDeTiroValida: unaPosicionDeTiro. 
	self assertPosicionDeArqueroValida: unaPosicionDeArquero. 
	
	var := VerVar verRemateDeDelantero: delantero a: arquero con: pelota hacia: unaPosicionDeTiro. 
	
	delantero remataContraUn: arquero posicionadoEn: unaPosicionDeArquero con: pelota enUnjuegoDePenales: self.
	
	! !


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


!Penales methodsFor: 'var' stamp: 'GL 9/24/2024 09:12:11'!
varDireccionRemateResultante
	^ var verDireccionDeRemateResultante. ! !

!Penales methodsFor: 'var' stamp: 'GL 9/24/2024 09:12:21'!
varFuerzaResultanteDeAtajada
	^var verFuerzaDeAtajadaResultante. ! !

!Penales methodsFor: 'var' stamp: 'GL 9/24/2024 09:12:28'!
varFuerzaResultanteDeTiro
	^var verFuerzaDeTiroResultante. ! !


!Penales methodsFor: 'puntaje' stamp: 'GL 9/21/2024 11:45:20'!
puntajeDeArquero
	^puntajeArquero. ! !

!Penales methodsFor: 'puntaje' stamp: 'GL 9/21/2024 11:45:27'!
puntajeDeDelantero
	^puntajeDelantero. ! !

!Penales methodsFor: 'puntaje' stamp: 'GL 9/22/2024 12:55:13'!
sumarPuntajeArquero
	puntajeArquero := puntajeArquero + 1.! !

!Penales methodsFor: 'puntaje' stamp: 'GL 9/22/2024 12:54:56'!
sumarPuntajeDelantero
	puntajeDelantero := puntajeDelantero + 1.! !


!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:54:33'!
decidirPuntajeEnBaseAPosicionDeArquero: unaPosicionDeArquero yPosicionDeTiro: unaPosicionDeTiro
	(unaPosicionDeArquero ~=  unaPosicionDeTiro) ifTrue: [self sumarPuntajeDelantero. ^self ].
	
	(self varFuerzaResultanteDeTiro > self varFuerzaResultanteDeAtajada ) ifTrue: [self sumarPuntajeDelantero. ^self].
	
	self sumarPuntajeArquero. ! !

!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:54:33'!
delanteroRemataCostaAzulAColocarContraAqueroQueEligeDireccionDeTiroUbicadoEn: unaPosicionDeArquero
	self decidirPuntajeEnBaseAPosicionDeArquero: unaPosicionDeArquero yPosicionDeTiro: (self varDireccionRemateResultante). ! !

!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:20:33'!
delanteroRemataCostaAzulAColocarContraAqueroQueEsperaPorTiroYSeAdelantaUbicadEn: unaPosicionDeArquero
	self sumarPuntajeDelantero.! !

!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:54:33'!
delanteroRemataCostaAzulAMatarContraAqueroQueEligeDireccionDeTiroUbicadoEn: unaPosicionDeArquero
	self varDireccionRemateResultante y > 2 ifTrue: [self sumarPuntajeArquero. ^self].
	
	self decidirPuntajeEnBaseAPosicionDeArquero: (unaPosicionDeArquero y) yPosicionDeTiro: ((self varDireccionRemateResultante) y). 
	! !

!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:22:02'!
delanteroRemataCostaAzulAMatarContraAqueroQueEsperaPorTiroYSeAdelantaUbicadoEn: unaPosicionDeArquero
	self sumarPuntajeArquero.! !

!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:54:33'!
delanteroRemataJabulaniAColocarContraAqueroQueEligeDireccionDeTiroUbicadoEn: unaPosicionDeArquero
	self decidirPuntajeEnBaseAPosicionDeArquero: unaPosicionDeArquero yPosicionDeTiro: (self varDireccionRemateResultante). ! !

!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:54:33'!
delanteroRemataJabulaniAColocarContraAqueroQueEsperaPorTiroYSeAdelantaUbicadoEn: unaPosicionDeArquero
	self decidirPuntajeEnBaseAPosicionDeArquero: (unaPosicionDeArquero x) yPosicionDeTiro: ((self varDireccionRemateResultante) x). ! !

!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:54:33'!
delanteroRemataJabulaniAMatarContraAqueroQueEligeDireccionDeTiroUbicadoEn: unaPosicionDeArquero
	self decidirPuntajeEnBaseAPosicionDeArquero: (unaPosicionDeArquero x) yPosicionDeTiro: ((self varDireccionRemateResultante) x). ! !

!Penales methodsFor: 'casos de juego' stamp: 'GL 9/24/2024 09:23:21'!
delanteroRemataJabulaniAMatarContraAqueroQueEsperaPorTiroUbicadoEn: unaPosicionDeArquero
	self sumarPuntajeDelantero.! !

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
