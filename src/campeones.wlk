import items.*

class Campeon{
	const property puntosDeVida
	const property ataque
	
	var property puntosDeDanio = 0
	var property items = []	
	var property bloqueo = 0
	var property dinero = 0

	method vidaTotal() = puntosDeVida + items.sum { 
		item => item.puntosDeVidaQueOtorga(self)
	}
	method ataqueTotal() = ataque + items.sum{
		item => item.puntosDeAtaqueQueOtorga(self)
	}	
	
	method estaMuerto() = self.vidaTotal() <= puntosDeDanio
		
	method equiparItem(item){
		items.add(item)
		item.efectoAlEquipar(self)
	}
	method desequiparItem(item){
		items.remove(item)
		item.efectoAlDesequipar(self)
	}
	
	method comprar(item){
		if(dinero < item.precio()){
			// TODO tirar excepción acá
		}
		
		dinero = (dinero - item.precio())
		self.equiparItem(item)
		
	}
	
	method vender(item){
		dinero = dinero + (item.precio()/2)
		self.desequiparItem(item)
	}	

	method dineroPorAtaque(alguien){
		dinero += alguien.cantMuertesFrenteAAtaqueDe(self)
	}

	method atacar(alguien){
		self.dineroPorAtaque(alguien)
		if(bloqueo > 0) {
			bloqueo -= 1
		} else {
			alguien.defenderse(self)
		}
		alguien.recibirAtaque(self)
	}

	method activarHabilidad(item){
		item.habilidadActiva(true)
		item.habilidadActivable(self)
	}
}
