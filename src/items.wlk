import campeones.*

class AnilloDeDoran {
	
	method puntosDeVidaQueOtorga() = 60 	
	
	method aportarAt(campeon){
			campeon.ataqueTotal( campeon.ataqueTotal() + 15) 
	}
	
	method darEfecto(campeon){
		if( campeon.items().contains(self) ){
			self.aportarAt(campeon)
			campeon.puntosDeDanio(campeon.puntosDeDanio() + 5)
		}
		else {
			campeon.puntosDeDanio(campeon.puntosDeDanio() - 10)
			campeon.ataqueTotal( campeon.ataqueTotal() - 15) 
		}
	}
	
}

class TomoAmplificador{
	
	var ph 
	var at
	
	method aportarPh(campeon){
		ph = 0.25 * campeon.puntosDeDanio() 
		campeon.vidaTotal(campeon.vidaTotal() + ph )
	}
	
	method aportarAt(campeon){
		at= 0.05 * campeon.puntosDeDanio()
		campeon.ataqueTotal( campeon.ataqueTotal() + at )
	}
	
	method darEfecto(campeon){
		if( campeon.items().contains(self) ){
			self.aportarPh(campeon)
			self.aportarAt(campeon)
			campeon.bloqueo( campeon.bloqueo() + 2 )
		}
		else {
//			campeon.vidaTotal(campeon.vidaTotal() - 30)
			campeon.bloqueo( campeon.bloqueo() + 1 )
			campeon.puntosDeDanio(campeon.puntosDeDanio() + 30)
			campeon.vidaTotal(campeon.vidaTotal() - ph )
			campeon.ataqueTotal( campeon.ataqueTotal() - at )
		}
	}
		
}

class SombreroDebadon inherits TomoAmplificador{
	
	override method aportarPh(campeon){
		super(campeon) 
		campeon.vidaTotal( campeon.vidaTotal() + 5 )
	}
	
	override method aportarAt(campeon){
		campeon.ataqueTotal( campeon.ataqueTotal() + campeon.ataqueTotal() * 2 )
	}
	
	
	override method darEfecto(campeon){
		if( campeon.items().contains(self) ){
			self.aportarPh(campeon)
			self.aportarAt(campeon)
			campeon.bloqueo( campeon.bloqueo() + 2 )
			campeon.puntosDeDanio( campeon.puntosDeDanio() + 5 )
		}
		
	}
}







