import items.*

class Campeon{
	
	const property puntosDeVida
	const property ataque
	var property puntosDeDanio = 0
	var property bloqueo = 0
	var property items = []	
	var property dinero = 0
	
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
		if((alguien.cantMinions() - self.ataqueTotal()) <= 0){
			return alguien.cantMinions()
		}else{
			return self.ataqueTotal()
		}	
	}
	
	method atacar(alguien){
		dinero = dinero + self.dineroPorAtaque(alguien)
		if(bloqueo > 0){
			alguien.cantMinions((alguien.cantMinions() - self.ataqueTotal()).max(0))
			bloqueo = (bloqueo - 1).max(0)
		}else{
			alguien.cantMinions((alguien.cantMinions() - self.ataqueTotal()).max(0))
			alguien.defenderse(self)
		}
	}
	method activarHabilidad(item){
		if(items.contains(item)){
			item.habilidadActiva(true)
			item.habilidadActivable(self)
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
	method estaMuerto() = cantMinions == 0
}