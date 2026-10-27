import jugador.*
import barra.*

class Cliente {
    var property paciencia = 10
    var property pedido = 1
    const property puntos = 10
    var property barra = null
    
    // recibe las pizzas del jugador
    method recibirPedido(cantidadEntregada, unJugador) {
        
        if (cantidadEntregada >= pedido) { // si le das de mas al cliente obviamente se va a hacer el bld y se las va a llevar
            // si eran las suficientes el cliente se va
            self.irse()
            unJugador.sumarPuntos(puntos)
        } else {
            // si le das menos se enoja
            self.enojarse(unJugador)
            return 0
        }
    }
    
    // el timer del juego (esta en pizzeroArgento.wpgm) llama a este metodo periodicamente
    method pasarTiempo(unJugador) {
            paciencia = paciencia - 1
            if (paciencia <= 0) {
                self.enojarse(unJugador)
            }
    }
    
    method enojarse(unJugador) {
        self.reaccionar(unJugador) //el metodo polimorfico
        self.irse()
    }
    
    method irse() {
        if (barra != null) {
            barra.removerCliente(self)
        }
    }
    
    method reaccionar(unJugador) {
        // comportamiento por defecto
    }
}

class Hambriento inherits Cliente {
    override method reaccionar(unJugador) {
        unJugador.perderPizzas()
    }
}

class Critico inherits Cliente {
    override method reaccionar(unJugador) {
        unJugador.restarPuntos(30)
    }
}

class Casual inherits Cliente { //habria que sacar casual si tecnicamente no hace nada
    // no hace nada extra al irse, se retira nomas
}

class Familia inherits Cliente {
    override method reaccionar(unJugador) {
        // hace que se retire otro cliente de la misma barra
        if (barra != null and not barra.clientes().isEmpty()) {
            const clienteExtra = barra.clientes().any()
            barra.removerCliente(clienteExtra)
        }
    }
}