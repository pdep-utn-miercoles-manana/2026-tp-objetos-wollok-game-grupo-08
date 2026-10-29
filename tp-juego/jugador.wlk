import cliente.*
import juego.*
import barra.*
import pizzaMiniJuego.*

class Jugador {
    var property puntaje = 0
    var property barraActual = barraSuperior
    var property pizzasEnMano = 0
    var property minijuegoActual = null

    method entregarPedido(unJugador) {
        // hace falta que valide si tiene una pizza en mano, aca no estoy seguro
        if (pizzasEnMano <= 0) {
            throw new DomainException(message = "No hay pizzas en mano para entregar")
        } 
        // se fija si hay clientes en la barra en la que esta
        if (barraActual.clientes().isEmpty()) {
            throw new DomainException(message = "No hay clientes en esta barra")
        }
        
        // agarra al primer cliente de la barra
        const clienteAAtender = barraActual.clientes().first()
        
        clienteAAtender.recibirPedido(pizzasEnMano, unJugador)
        
        // pierde todas las pizzas que tenia encima
        self.perderPizzas()
    }

    // con esto arrancaria el minijuego
    method prepararPizza() {
        // se crea el minijuego
        minijuegoActual = new PizzaMiniJuego(jugador = self, clicksTotales = 10)
        minijuegoActual.iniciar()
    }
    
    method crearPizza() {
        pizzasEnMano += 1
        // cuando se termina la pizza cerramos el minijuego
        minijuegoActual = null
        console.println("¡Pizza creada! Pizzas en mano: " + pizzasEnMano)
    }
    
    method perderPizzas() {
        pizzasEnMano = 0
    }
    
    method sumarPuntos(puntosObtenidos) {
        puntaje += puntosObtenidos
    }
    
    method restarPuntos(puntosPerdidos) {
        puntaje = (puntaje - puntosPerdidos).max(0)
    }

    method moverseAbajo() {
        const numeroDeBarraActual = self.obtenerNumeroDeBarraActual(barraActual)

        if (numeroDeBarraActual < juego.barras().size()) {
            barraActual = juego.barras().get(numeroDeBarraActual)
        }
    }

    method moverseArriba() {
        const numeroDeBarraActual = self.obtenerNumeroDeBarraActual(barraActual)

        if (numeroDeBarraActual > 1) {
            barraActual = juego.barras().get(numeroDeBarraActual - 2)
        }
    }

    method obtenerNumeroDeBarraActual(barra) {
        return barra.numero()
    }
}