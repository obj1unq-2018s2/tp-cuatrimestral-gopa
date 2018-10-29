import items.*

class Campeon{
	
	const property puntosDeVida
	const property ataque
	var property puntosDeDanio = 0
	var property bloqueo = 0
	var property items = []	
	
	method vidaTotal() = puntosDeVida + items.sum { 
		item => item.puntosDeVidaQueOtorga(self)
	}
	method ataqueTotal() = ataque + items.sum{
		item => item.puntosDeAtaqueQueOtorga(self)
	}
	method puntosDeDanioTotal() = puntosDeDanio + items.sum{
		item => item.puntosDeDanioQueOtorga(self)
	}
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

	method atacar(alguien){
		if(bloqueo > 0){
//			alguien.cantMinions(alguien.cantMinions() - self.ataqueTotal())		
			bloqueo = bloqueo - 1.max(0)
		}else{
			alguien.cantMinions(alguien.cantMinions() - self.ataqueTotal())
			alguien.defenderse(self)
		}
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
	method defenderse(campeon){
		campeon.puntosDeDanio(campeon.puntosDeDanio() + self.ataqueTotal())
	}
	method estaMuerto() = cantMinions <= 0
}