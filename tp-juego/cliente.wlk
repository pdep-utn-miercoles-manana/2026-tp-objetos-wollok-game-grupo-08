import jugador.*
import barra.*
import wollok.game.*

class Cliente {
    var property paciencia = 10
    var property pedido = 1
    const property puntos = 10
    var property barra = null
    var property position = game.at(3, 6)
    var property etapaDesvanecimiento = 0
    var property estaEnJuego = false
    

    method imagenNormal() = "clienteNormal.png"

    method imagenDesvanecida() {
        if (etapaDesvanecimiento == 1) return "clienteNormal1.png"
        if (etapaDesvanecimiento == 2) return "clienteNormal2.png"
        if (etapaDesvanecimiento == 3) return "clienteNormal3.png"
        return "clienteNormal4.png"
    }

    method image() = if (etapaDesvanecimiento == 0) self.imagenNormal() else self.imagenDesvanecida()

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
        if (estaEnJuego && etapaDesvanecimiento == 0) {
            etapaDesvanecimiento = 1
            game.schedule(120, { self.avanzarDesvanecimiento() })
        }
    }

    method avanzarDesvanecimiento() {
        if (etapaDesvanecimiento < 4) {
            etapaDesvanecimiento += 1
            game.schedule(120, { self.avanzarDesvanecimiento() })
        } else {
            game.removeVisual(self)
            estaEnJuego = false
        }
    }
    
    method enojarse(unJugador) {}
}

class Hambriento inherits Cliente {
    override method imagenNormal() = "clienteNormal.png"
    override method imagenDesvanecida() {
        if (etapaDesvanecimiento == 1) return "clienteNormal1.png"
        if (etapaDesvanecimiento == 2) return "clienteNormal2.png"
        if (etapaDesvanecimiento == 3) return "clienteNormal3.png"
        return "clienteNormal4.png"
    }
    override method enojarse(_unJugador) {
        _unJugador.perderPizzas()
    }
}

class Critico inherits Cliente {
    override method imagenNormal() = "clienteCritico.png"
    override method imagenDesvanecida() {
        if (etapaDesvanecimiento == 1) return "clienteCritico1.png"
        if (etapaDesvanecimiento == 2) return "clienteCritico2.png"
        if (etapaDesvanecimiento == 3) return "clienteCritico3.png"
        return "clienteCritico4.png"
    }
    override method enojarse(unJugador) {
        unJugador.restarPuntos(30)
    }
}

class Casual inherits Cliente {
    override method imagenNormal() = "clienteNormal.png"
    override method imagenDesvanecida() {
        if (etapaDesvanecimiento == 1) return "clienteNormal1.png"
        if (etapaDesvanecimiento == 2) return "clienteNormal2.png"
        if (etapaDesvanecimiento == 3) return "clienteNormal3.png"
        return "clienteNormal4.png"
    }
}

class Familia inherits Cliente {
    override method imagenNormal() = "clienteFamilia.png"
    override method imagenDesvanecida() {
        if (etapaDesvanecimiento == 1) return "clienteFamilia1.png"
        if (etapaDesvanecimiento == 2) return "clienteFamilia2.png"
        if (etapaDesvanecimiento == 3) return "clienteFamilia3.png"
        return "clienteFamilia4.png"
    }
    override method enojarse(unJugador) {
        if(barra != null) {
            barra.retirarOtroCliente(self)
        }
    }
}