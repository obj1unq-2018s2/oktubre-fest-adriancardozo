class Carpa {
	var property limiteDeGente = 0
	const property personas = #{}
	var property tieneBanda = false
	var property marcaCerveza
	method cumplePreferenciaMusicalDe(persona) = persona.leGustaLaMusica() == tieneBanda
	method dejaEntrarA(persona) = not self.superaLimiteDeGente(self.cantidadDePersonas() + 1) and not persona.estaEbria()
	method superaLimiteDeGente(cantidad) = cantidad > limiteDeGente
	method cantidadDePersonas() = personas.size()
	method hacerEntrarA(persona){
			personas.add(persona)
	}
	method cantidadDeEbriosEmpedernidos() = personas.count { persona => persona.esEbrioEmpedernido() }
}

class Jarra {
	var property capacidad = 0
	var property marcaCerveza
	method cantidadDeAlcohol() = capacidad * marcaCerveza.porcentajeDeGraduacion()
}

class Persona {
	var property peso = 0
	const property jarrasCompradas = #{}
	var property leGustaLaMusica = false
	var property nivelDeAguante = 0
	method estaEbria() = (self.cantidadDeAlcoholIngerido() * peso) > nivelDeAguante	
	method cantidadDeAlcoholIngerido() = jarrasCompradas.sum { jarra => jarra.cantidadDeAlcohol() }
	method esEbrioEmpedernido() = jarrasCompradas.all { jarra => jarra.capacidad() >= 1 }
}

class Belga inherits Persona{
	method leGusta(marca) = marca.gramosDeLupuloPorLitro() > 4
	method quiereEntrarA(carpa) = self.leGusta(carpa.marcaCerveza()) and carpa.cumplePreferenciaMusicalDe(self) 
	method puedeEntrarA(carpa) = self.quiereEntrarA(carpa) and carpa.dejaEntrarA(self)
	method entrarA(carpa){
		if(self.puedeEntrarA(carpa)){
			carpa.hacerEntrar(self)
		}
		else{
			self.error("La persona no puede entrar a la carpa")
		}
	}
}

class Checo inherits Persona{
	method leGusta(marca) = marca.porcentajeDeGraduacion() > 0.08
	method quiereEntrarA(carpa) = self.leGusta(carpa.marcaCerveza()) and carpa.cumplePreferenciaMusicalDe(self) 
	method puedeEntrarA(carpa) = self.quiereEntrarA(carpa) and carpa.dejaEntrarA(self)
	method entrarA(carpa){
		if(self.puedeEntrarA(carpa)){
			carpa.hacerEntrar(self)
		}
		else{
			self.error("La persona no puede entrar a la carpa")
		}
	}
}

class Aleman inherits Persona{
	method leGusta(marca) = true
	method quiereEntrarA(carpa) = self.leGusta(carpa.marcaCerveza()) and carpa.cumplePreferenciaMusicalDe(self) and carpa.cantidadDePersonas().even()
	method puedeEntrarA(carpa) = self.quiereEntrarA(carpa) and carpa.dejaEntrarA(self)
	method entrarA(carpa){
		if(self.puedeEntrarA(carpa)){
			carpa.hacerEntrar(self)
		}
		else{
			self.error("La persona no puede entrar a la carpa")
		}
	}
}

class Marca {
	var property gramosDeLupuloPorLitrto = 0
	var pais
}

class MarcaRubia inherits Marca {
	const property porcentajeDeGraducion = 0
}

class MarcaNegra inherits Marca {
	method porcentajeDeGraduacion() = graduacionReglamentaria.porcentaje().min(gramosDeLupuloPorLitrto * 2)
}

class MarcaRoja inherits MarcaNegra {
	override method porcentajeDeGraduacion() = super() * 1.25
}

object graduacionReglamentaria {
	var property porcentaje = 0
}
