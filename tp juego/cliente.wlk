import jugador.*

class Cliente {
    var property paciencia = 100
    var property pedido = 1
    var property estado = "ESPERANDO"
    var property puntos = 10
    
    method actualizar(tiempo) {
        paciencia = paciencia - tiempo
        if (paciencia <= 0) {
            self.enojarse()
        }
    }
    
    method atender() {
        estado = "ATENDIDO"
    }
    
    method enojarse() {
        estado = "ENOJADO"
        self.abandonar()
    }
    
    method abandonar() {
        estado = "ABANDONO"
    }
    
    method mostrarPedido() {
        return "Pedido: " + pedido
    }
}

class Hambriento inherits Cliente {
    var property paciencia = 50
    
    override method enojarse(jugador) {
        super()
        jugador.perderPizzas()
    }
}

class Critico inherits Cliente {
    var property paciencia = 30
    var property puntosQueResta = 15
    
    override method enojarse(jugador) {
        super()
        jugador.perderPuntos(puntosQueResta)
    }
}

class Casual inherits Cliente {
    var property paciencia = 80
    
    override method enojarse() {
        super()
    }
}

class Familia inherits Cliente {
    var property paciencia = 60
    var property clientes = 4
    var property barra = null
    
    override method enojarse() {
        super()
    }
}