import campeones.*

class AnilloDeDoran {
	
	var property habilidadActiva = false
	
	method precio() = 300
	
	method puntosDeVidaQueOtorga(campeon) = 60 	
	
	method puntosDeAtaqueQueOtorga(campeon) = 15
	
	method puntosDeDanioQueOtorga(campeon) = 5
	
	method bloqueosQueOtorga(campeon) = 0
	
	method efectoNegativo(campeon){
		campeon.puntosDeDanio(campeon.puntosDeDanio() - 10)
	}
	method habilidadActivable(campeon){}
}

class TomoAmplificador{
	
	var property habilidadActiva = false
	var uso = 1
	
	method precio() = 500
	
	method puntosDeVidaQueOtorga(campeon) =	 0.25 * campeon.puntosDeDanioTotal() 
	
	method puntosDeAtaqueQueOtorga(campeon) = 0.05 * campeon.puntosDeDanioTotal()
	
	method puntosDeDanioQueOtorga(campeon)=0
	
	method bloqueosQueOtorga(campeon) = 2
	
	method efectoNegativo(campeon){
		campeon.bloqueo( campeon.bloqueo() + 1 )
		campeon.puntosDeDanio(campeon.puntosDeDanio() + 30)
	}
	method habilidadActivable(campeon){
	
		if(habilidadActiva and uso >0 and campeon.dinero()<500){
			campeon.dinero(500)
			uso = 0
		}
	}
		
}

class SombreroDeRabadon inherits TomoAmplificador{
	
	override method precio() = super() + 100
	
	override method puntosDeVidaQueOtorga(campeon) = super(campeon)  + 5
	
	override method puntosDeAtaqueQueOtorga(campeon) = campeon.ataque() * 2
	
	override method puntosDeDanioQueOtorga(campeon)= 5
	
	override method bloqueosQueOtorga(campeon) = 0
	
	override method efectoNegativo(campeon){}
	
	override method habilidadActivable(campeon){}
}

class PocionDeVida{
	
	var property habilidadActiva = false
	var property uso = 2
	
	method precio() = 50
	
	method puntosDeVidaQueOtorga(campeon) = 0 	
	
	method puntosDeAtaqueQueOtorga(campeon) = 0
	
	method puntosDeDanioQueOtorga(campeon) = 0
	
	method bloqueosQueOtorga(campeon) = 0
	
	method efectoNegativo(campeon){}
	
	method habilidadActivable(campeon){

		if(habilidadActiva and uso > 0){
			campeon.puntosDeDanio((campeon.puntosDeDanio() - 50).max(0))
			uso -= 1
		}
	}
}
	






