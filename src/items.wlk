import campeones.*

class AnilloDeDoran {
	
	method puntosDeVidaQueOtorga(campeon) = 60 	
	
	method puntosDeAtaqueQueOtorga(campeon) = 15
	
	method puntosDeDanioQueOtorga(campeon) = 5
	
	method bloqueosQueOtorga(campeon) = 0
	
	method efectoNegativo(campeon){
		campeon.puntosDeDanio(campeon.puntosDeDanio() - 10)
	}
	
}

class TomoAmplificador{
	
	var puntosDeVida 
	var ataque
	
	method puntosDeVidaQueOtorga(campeon){
		puntosDeVida = 0.25 * campeon.puntosDeDanioTotal() 
		return puntosDeVida
	}
	
	method puntosDeAtaqueQueOtorga(campeon){
		ataque= 0.05 * campeon.puntosDeDanioTotal()
		return ataque
	}
	
	method puntosDeDanioQueOtorga(campeon)=0
	
	method bloqueosQueOtorga(campeon) = 2
	
	method efectoNegativo(campeon){
		campeon.bloqueo( campeon.bloqueo() + 1 )
		campeon.puntosDeDanio(campeon.puntosDeDanio() + 30)
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
	override method bloqueosQueOtorga(campeon) = 0
	
	override method efectoNegativo(campeon){}
}







