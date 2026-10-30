import jugador.*
import barra.*

class Cliente {
    var property paciencia = 10
    var property pedido = 1
    const property puntos = 10
    var property barra = null
    

    method recibirPedido(unJugador) {
        // si le das de mas al cliente obviamente se va a hacer el bld y se las va a llevar
        unJugador.perderPizzas()
        unJugador.sumarPuntos(puntos)
    }

    method validarPedido(cantidadEntregada, unJugador) {
        if (cantidadEntregada >= pedido) { 
            self.recibirPedido(unJugador)            
        } else {
            // si le das menos se enoja
            self.enojarse(unJugador)
        }
        self.irse()
    }
    
    // el timer del juego (esta en pizzeroArgento.wpgm) llama a este metodo periodicamente
    method pasarTiempo(unJugador) {
        paciencia = paciencia - 1
        if (paciencia <= 0) {
            self.enojarse(unJugador)
        }
    }
    
    method irse() {
        if (barra != null) {
            barra.removerCliente(self)
        }
    }
    
    method enojarse(unJugador) {
        // comportamiento por defecto
    }
}

class Hambriento inherits Cliente {
    override method enojarse(unJugador) {
        unJugador.perderPizzas()
    }
}

class Critico inherits Cliente {
    override method enojarse(unJugador) {
        unJugador.restarPuntos(30)
    }
}

class Casual inherits Cliente { // habria que sacar casual si tecnicamente no hace nada
    // no hace nada extra al irse, se retira nomas
}

class Familia inherits Cliente {
    override method enojarse(unJugador) {
        // hace que se retire otro cliente de la misma barra
        if(barra != null) {
            barra.retirarOtroCliente(self)
        }
    }
}