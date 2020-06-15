import elementos.*

class PlagaDeCucarachas {
	
	var property poblacion
	var property pesoDeCadaBicho 
	
	
	method pesoDeLaPlaga () { return poblacion * pesoDeCadaBicho}
	
	method danioQueProduce() { return poblacion / 2}
	
	method transmiteEnfermedades () {
		
		return self.pesoDeLaPlaga() >= 10 and self.poblacion() >= 10
	}
	
	method poblacionAlAtacar() {
		poblacion = poblacion * 1.1
	}
	
    method atacar () {
    	
    	self.poblacionAlAtacar() 
    	self.pesoPorAtaque()
    		
    }
    
    method pesoPorAtaque() {
    	pesoDeCadaBicho +=   2
    }
	
}
	
class PlagaDePulgas inherits PlagaDeCucarachas {
	
	override method danioQueProduce () { return poblacion * 2}
	override method pesoPorAtaque() { pesoDeCadaBicho += 0}
	
}

class PlagaDeGarrapatas inherits PlagaDePulgas {
	
	override method poblacionAlAtacar() {
		
		poblacion = poblacion * 1.2
	}
	
}

class PlagaDeMosquitos inherits PlagaDePulgas {
	
	override method danioQueProduce() { return poblacion}
	
	override method transmiteEnfermedades() {
		
		return self.poblacion() >= 10 and poblacion % 3 == 0
	}
	
} 
	
	

