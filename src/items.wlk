import campeones.*

class AnilloDeDoran {
	
	method puntosDeVidaQueOtorga(campeon) = 60 	
	
	method puntosDeAtaqueQueOtorga(campeon) = 15
	
	method puntosDeDanioQueOtorga(campeon) = 5
	
	method bloqueosQueOtorga(campeon){}
	
	method efectoNegativo(campeon){
		campeon.puntosDeDanioTotal( campeon.puntosDeDanioTotal() - 10 )
	}
	
}

class TomoAmplificador{
	
	var puntosDeVida 
	var ataque
	
	method puntosDeVidaQueOtorga(campeon){
		puntosDeVida = 0.25 * campeon.puntoDeDanio() 
		return puntosDeVida
	}
	
	method puntosDeAtaqueQueOtorga(campeon){
		ataque= 0.05 * campeon.puntosDeDanio()
		return ataque
	}
	
	method puntosDeDanioQueOtorga(campeon)=0
	
	method bloqueosQueOtorga(campeon){campeon.bloqueo(campeon.bloqueo() + 2 )}
	
	method efectoNegativo(campeon){
		campeon.bloqueo( campeon.bloqueo() + 1 )
		campeon.puntosDeDanioTotal( campeon.puntosDeDanioTotal() + 30 )
	}
		
}

class SombreroDebadon inherits TomoAmplificador{
	
	override method puntosDeVidaQueOtorga(campeon){
		super(campeon)  
		return puntosDeVida + 5
	}
	
	override method puntosDeAtaqueQueOtorga(campeon){
		return campeon.ataque() * 2
	}
	
	override method puntosDeDanioQueOtorga(campeon)= 5
	
	override method efectoNegativo(campeon){}
}







