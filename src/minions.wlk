import campeones.*

class OleadaMinion{
	var property plusDeAtaque
	var property cantMinions	
	
	method ataqueTotal(){
		if(not self.estaMuerto()){
			return plusDeAtaque + cantMinions
		}else{
			return 0
		}
	} 

	method recibirAtaque(campeon){
		cantMinions -= self.cantMuertesFrenteAAtaqueDe(campeon)
	}
	
	method estaMuerto() = cantMinions == 0
	
	method cantMuertesFrenteAAtaqueDe(campeon){
		return campeon.ataqueTotal().min(cantMinions)
	}
}

class EjercitoDeMinions{
	var property oleadas = []
	
	method agregarOleada(oleada){
		oleadas.add(oleada)
	}
	method todosMuertos() = oleadas.all{oleada=>oleada.estaMuerto()}
	
	method recibirAtaque(campeon){
		oleadas.forEach{oleada=>oleada.recibirAtaque(campeon)}
	}
	
	method ataqueTotal(){
		return oleadas.sum({ oleada=>oleada.ataqueTotal() })
	}
	
	method cantMuertesFrenteAAtaqueDe(campeon){
		return oleadas.sum({oleada=> oleada.cantMuertesFrenteAAtaqueDe(campeon) })
	}
}
