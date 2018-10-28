import items.*

class Campeon{
	
	var property puntosDeVida
	var property vidaTotal 
	var property ataque
	var property ataqueTotal 		
	var property puntosDeDanio 
	var property bloqueo 	
	var property items	
	
/*	constructor(_puntosDeVida, _vidaTotal, _ataque,
		_ataqueTotal, _puntosDeDanio, _bloqueo, _items){
		puntosDeVida = _puntosDeVida
		vidaTotal = _vidaTotal
		ataque = _ataque
		ataqueTotal = _ataqueTotal	
		puntosDeDanio = _puntosDeDanio
		bloqueo = _bloqueo
		items = _items		
	}
*/	

	
	method estaMuerto() = vidaTotal <= puntosDeDanio
	method equiparItem(item){
		items.add(item)
		item.darEfecto(self)
	}
	method desequiparItem(item){
		items.remove(item)
		item.darEfecto(self)
	}
	method atacar(alguien){
		if(bloqueo >0){
			alguien.cantMinions(alguien.cantMinions() - ataqueTotal.max(0))		//revisar si funciona
			bloqueo -= 1.max(0)
		}else{
			alguien.cantMinions(alguien.cantMinions() - ataqueTotal)
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