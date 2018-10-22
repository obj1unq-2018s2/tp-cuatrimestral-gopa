import items.*

class Campeon{
	
	var property puntosDeVida	
	var property ataque		
	var property puntosDeDanio = 0
	var property bloqueo 	
	var property items	
	
	method estaMuerto() = puntosDeVida <= puntosDeDanio
	method equiparItem(item){
		items.add{item}
		item.darEfecto(self)
	}
	method desequiparItem(item){
		items.remove{item}
		item.darEfecto(self)
	}
	method atacar(alguien){
		if(bloqueo >0){
			alguien.cantMinions(alguien.cantMinions() - ataque.max(0))		//revisar si funciona
			bloqueo -= 1.max(0)
		}else{
			alguien.cantMinions(alguien.cantMinions() - ataque)
			alguien.defenderse(self)
		}
	}
}

class OleadaMinion{
	
	var property plusDeAtaque
	var property cantMinions	
	
	method ataqueTotal() = plusDeAtaque + cantMinions
	method defenderse(campeon){
		campeon.puntosDeDanio(campeon.puntosDeDanio() + self.ataqueTotal())
	}
	method estaMuerto() = cantMinions == 0
}