import campeones.*

class AnilloDeDoran {
	
	var ph =60 
	var at =15
	
	method aportarPh(campeon){
			campeon.puntosDeVida(campeon.puntosDeVIda() + ph )
	}
	
	method aportarAt(campeon){
			campeon.ataque( campeon.ataque() + at ) 
	}
	
	method darEfecto(campeon){
		if( campeon.items().contains(self) ){
			self.aportarPh(campeon)
			self.aportarAt(campeon)
			campeon.puntosDeDanio(campeon.puntosDeDanio() - 5)
		}
		else {
			campeon.puntosDeVida(campeon.puntosDeVida() + 10)
		}
	}
	
}

class TomoAmplificador{
	
	var ph 
	var at
	
	method aportarPh(campeon){
		ph = 2.5 * campeon.puntosDeDanio() 
		campeon.puntosDeVida(campeon.puntosDeVIda() + ph )
	}
	
	method aportarAt(campeon){
		at= 0.5 * campeon.puntosDeDanio()
		campeon.ataque( campeon.ataque() + at )
	}
	
	method darEfecto(campeon){
		if( campeon.items().contains(self) ){
			self.aportarPh(campeon)
			self.aportarAt(campeon)
			campeon.bloqueo( campeon.bloqueo() + 2 )
		}
		else {
			campeon.puntosDeVida(campeon.puntosDeVida() - 30)
			campeon.bloqueo( campeon.bloqueo() + 1 )
		}
	}
		
}

class SombreroDebadon inherits TomoAmplificador{
	
}







