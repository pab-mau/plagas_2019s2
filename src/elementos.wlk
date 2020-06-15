import plagas.*



class Barrios {
	
	var property elementos = []
	
	method agregarElemento (elemento) { elementos.add(elemento)}
	
	method sacarElemento(elemento) { elementos.remove(elemento)}
	
	method agregarListaElementos(lista) { elementos.addAll(lista)}
	
	method cantidadDeElementosNoBuenos() {
		
		return elementos.count({ele=>ele.noEsBueno()})
	}
	
	
	method esCopado () {
		
		return elementos.count({ele=>ele.esBueno()}) > self.cantidadDeElementosNoBuenos()
	
}




}	

class Hogar {
	var property nivelDeMugre
	var property confort

	method esBueno() { return nivelDeMugre <= confort / 2}
	
	method noEsBueno() { return not self.esBueno()}
	
	method recibirAtaque(plaga) {
		
		nivelDeMugre = nivelDeMugre + plaga.danioQueProduce()
	    plaga.atacar()
	}
	
}


class Huerta {
	
	var property capacidadDeProduccion
	var property nivelASuperar
	var property nivelParaTodasLasHuertas
	
	method esBueno() {return  capacidadDeProduccion > nivelASuperar
		                 and nivelASuperar == nivelParaTodasLasHuertas 
	
	}
	
	method noEsBueno() { return not self.esBueno()}
	
	method recibirAtaque(plaga) {
		
		if(plaga.transmiteEnfermedades()){
			
			capacidadDeProduccion = (capacidadDeProduccion - plaga.danioQueProduce() * 0.1) - 10 
			plaga.atacar()			
		}
		
		else { capacidadDeProduccion = capacidadDeProduccion - plaga.danioQueProduce() * 0.1 
			   plaga.atacar()
	
	    }
	}
}


	
class Mascota {
	
	var property nivelDeSalud
	
	method esBueno() { return nivelDeSalud > 250}
	
	method noEsBueno() { return not self.esBueno()}
	
	method recibirAtaque(plaga) {
		
		if(plaga.transmiteEnfermedades()){nivelDeSalud -= plaga.danioQueProduce()			                           
		                                  plaga.atacar()
		}
	   else { plaga.atacar()}
	}
}	
	
	
	


