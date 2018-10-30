import items.*

class Campeon{
	
	const property puntosDeVida
	const property ataque
	var property puntosDeDanio = 0
	var property items = []	
	var property bloqueo = 0
	var property dinero = 0
	var property puntosDeDanioQueCura = 0

	
	method vidaTotal() = puntosDeVida + items.sum { 
		item => item.puntosDeVidaQueOtorga(self)
	}
	method ataqueTotal() = ataque + items.sum{
		item => item.puntosDeAtaqueQueOtorga(self)
	}
	
	method puntosDeDanioTotal() = puntosDeDanio + items.sum{
		item=> item.puntosDeDanioQueOtorga(self) - puntosDeDanioQueCura}
		
	method bloqueoTotal() = bloqueo + items.sum{
		item => item.bloqueosQueOtorga(self)
	}	
	method estaMuerto() = self.vidaTotal() <= self.puntosDeDanioTotal()
	
	method equiparItem(item){
		items.add(item)
	}
	method desequiparItem(item){
		items.remove(item)
		item.efectoNegativo(self)
	}
	
	method comprar(item){
		if(dinero >= item.precio()){
			dinero = (dinero - item.precio()).max(0)
			self.equiparItem(item)
		}
	}
	
	method vender(item){
		dinero = dinero + (item.precio()/2)
		self.desequiparItem(item)
	}	

	method dineroPorAtaque(alguien){
		alguien.recompensa(self)
	}
	method atacar(alguien){
		self.dineroPorAtaque(alguien)
		if(bloqueo > 0){
			alguien.recibirAtaque(self)
			bloqueo = (bloqueo - 1).max(0)
		}else{
			alguien.defenderse(self)
			alguien.recibirAtaque(self)
		}
	}
	method activarHabilidad(item){
			item.habilidadActiva(true)
			item.habilidadActivable(self)
	}
}

class OleadaMinion{
	
	var property plusDeAtaque
	var property cantMinions	
	
	method ataqueTotal(){
		if(cantMinions > 0){
			return plusDeAtaque + cantMinions
		}else{
			return plusDeAtaque
		}
	} 
	method recibirAtaque(campeon){
		self.cantMinions((self.cantMinions() - campeon.ataqueTotal()).max(0))
	}
	
	method defenderse(campeon){
		campeon.puntosDeDanio(campeon.puntosDeDanio() + self.ataqueTotal())
	}
	method estaMuerto() = cantMinions == 0
	
	method recompensa(campeon){
		if((self.cantMinions() - campeon.ataqueTotal()) <= 0){
			campeon.dinero(campeon.dinero() + self.cantMinions())
		}else{
			campeon.dinero(campeon.dinero() + campeon.ataqueTotal())
		}	
	}
}

class EjercitoDeMinions{
	var property oleadas = []
	
	method todosMuertos() = oleadas.all{oleada=>oleada.estaMuerto()}
	
	method recibirAtaque(campeon){
		oleadas.forEach{oleada=>oleada.recibirAtaque(campeon)}
	}
	method defenderse(campeon){
		oleadas.forEach{oleada=>oleada.defenderse(campeon)}
	}
	method recompensa(campeon){
		oleadas.forEach{oleada=>oleada.recompensa(campeon)}
	}
}








