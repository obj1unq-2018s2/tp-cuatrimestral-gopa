import items.*

class Campeon{
	
	const property puntosDeVida
<<<<<<< HEAD
	var property vidaTotal	
	var property ataque		
=======
	var property vidaTotal 
	const property ataque
	var property ataqueTotal 		
>>>>>>> branch 'master' of https://github.com/obj1unq-2018s2/tp-cuatrimestral-gopa.git
	var property puntosDeDanio = 0
	var property bloqueo 	
	var property items	
	
	method estaMuerto() = vidaTotal <= puntosDeDanio
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