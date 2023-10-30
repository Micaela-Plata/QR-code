class Planeta {
	const habitantes = []
	
	method poder() = habitantes.sum {h=>h.poder()}
	
}

class Persona {
	var inteligencia
	var valentia
	
	method poder() = valentia + inteligencia
}

class Combatiente inherits Persona {
	const armas = []
	
	override method poder() = super() + self.potenciaArmas()
	
	method potenciaArmas() = armas.filter {a=>a.esUtil()}.sum{a=>a.potencia()} 
}

class Arma {
	var property potencia
	var desgastada = false
	
	method esUtil() = potencia > 10 and not desgastada
}

class Maestro inherits Persona {
	var tiempoDeUnLado
	var midiclorianos 
	var sableDeLuz
	var lado = luminoso
	
	override method poder() = super() + midiclorianos/100 + self.poderDelSable()
	
	method poderDelSable() = lado.poderDelSable(sableDeLuz)
	
	method vivirSuceso(unSuceso, self) {
		tiempoDeUnLado = tiempoDeUnLado +=1
		lado.vivirSuceso(unSuceso)
	}
	
	method cambiarDeLado(){
		lado = lado.opuesto()
	}
}

class LadoLuminoso {
	var tiempoDelLadoDeLaLuz
	var pazInterior = 100
	
	method poderDelSable(sable) = sable.potencia() * tiempoDelLadoDeLaLuz

	method vivirSuceso(unSuceso,maestro){
		pazInterior += unSuceso.cargaEmocional()
		if(pazInterior <=0)
			maestro.cambiarDeLado()
	}
	
	method opuesto() = new LadoOscuro()
}

class LadoOscuro {
	var odio = 200
	var tiempoDelLadoOscuro
	
	method  poderDelSable(sable) = sable.potencia() * 2  + tiempoDelLadoOscuro
	
	method vivirSucesos(unSuceso, maestro){
		odio *= 1.1
		if(unSuceso.cargaEmocional() > odio)
			maestro.cambiarDeLado()
	}
	
	method opuesto() = new LadoLuminoso()
	
	// solo para testear
	
	method descripcion = "Oscuro"
}




