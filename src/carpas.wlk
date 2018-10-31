class Carpa {
	var property limiteDeGente = 0
	var property tieneBanda = false
	var property marcaCerveza
	
}

class Jarra {
	var property capacidad = 0
	var property marcaCerveza
}

class Persona {
	var property peso = 0
	var property jarrasCompradas = #{}
	var property leGustaLaMusica = false
	var property nivelDeAguante = 0
	method estaEbria() = (self.cantidadDeAlcoholIngerido() * peso) > nivelDeAguante	
}

class Belga inherits Persona{
	method leGusta(marca) = marca.gramosDeLupuloPorLitro() > 4
}

class Checo inherits Persona{
	//method leGusta(marca) = marca.gramosDeLupuloPorLitro() > 4
}

class Aleman inherits Persona{
	method leGusta(marca) = true
}

class Marca {
	
}

