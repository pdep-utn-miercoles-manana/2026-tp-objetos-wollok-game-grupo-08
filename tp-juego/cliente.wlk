import jugador.*
import barra.*

class Cliente {
    var property paciencia = 10
    var property pedido = 1
    const property puntos = 10
    var property barra = null
    var property position = game.at(0, 0)
    

    method image() = "cliente_normal.jpg"

    method text() = "P:" + pedido + " | T:" + paciencia

    method recibirPedido(unJugador) {
        unJugador.perderPizzas()
        unJugador.sumarPuntos(puntos)
    }

    method validarPedido(cantidadEntregada, unJugador) {
        if (cantidadEntregada >= pedido) { 
            self.recibirPedido(unJugador)            
        } else {
            self.enojarse(unJugador)
        }
        self.irse()
    }

    method pasarTiempo() {
        paciencia = paciencia - 1
        if (paciencia <= 0) {
            self.enojarse(jugador)
            self.irse()
        }
    }
    
    method irse() {
        if (barra != null) {
            barra.removerCliente(self)
        }
    }
    
    method enojarse(unJugador) {}
}

class Hambriento inherits Cliente {
    override method image() = "cliente_hambriento.jpg"
    override method enojarse(_unJugador) {
        _unJugador.perderPizzas()
    }
}

class Critico inherits Cliente {
    override method image() = "cliente_critico.jpg"
    override method enojarse(unJugador) {
        unJugador.restarPuntos(30)
    }
}

class Casual inherits Cliente {
    override method image() = "cliente_casual.jpg"
}

class Familia inherits Cliente {
    override method image() = "cliente_familia.jpg"
    override method enojarse(unJugador) {
        if(barra != null) {
            barra.retirarOtroCliente(self)
        }
    }
}