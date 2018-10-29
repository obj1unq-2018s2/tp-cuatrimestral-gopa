import items.*

class Campeon{
	
	const property puntosDeVida
	var property ataque
	var property ataqueTotal 		
	var property puntosDeDanio 
	var property bloqueo 	
	var property items = []	
	
	method vidaTotal() = puntosDeVida + items.sum { 
		item => item.puntosDeVidaQueOtorga()
	}
	
	method estaMuerto() = self.vidaTotal() <= puntosDeDanio
	
	method equiparItem(item){
		items.add(item)
		item.darEfecto(self)
	}

	method desequiparItem(item){
		items.remove(item)
		item.darEfecto(self)
	}

	method atacar(alguien){
		if(bloqueo > 0){
			alguien.cantMinions(alguien.cantMinions() - ataqueTotal)		
			bloqueo -= 1
		}else{
			alguien.cantMinions(alguien.cantMinions() - ataqueTotal)
			alguien.defenderse(self)
		}
	}
}

class OleadaMinion{
	
	var property plusDeAtaque
	var property cantMinions	
	
	method ataqueTotal(){
		if(cantMinions >= 0){
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