import cliente.*
import juego.*
import barra.*
import pizzaMiniJuego.*
import wollok.game.*
import tp-juego.pizzeroArgento.cartelPresionarZ

object jugador {
  var property puntaje = 0
  var property barraActual = barraSuperior
  var property pizzasEnMano = 0
  var property minijuegoActual = null
  var property position = game.at(2.5, 6)
  
  method entregarPedido() {
    self.validarEntrega()
    const clienteAAtender = barraActual.obtenerPrimerCliente()
    clienteAAtender.validarPedido(pizzasEnMano, self)
  }

  method validarEntrega() {
    if(pizzasEnMano <= 0) {
      throw new DomainException(message = "No hay pizzas en mano para entregar")
    }
  }
  
  method prepararPizza() {
        console.println("--- INTENTANDO PREPARAR PIZZA ---")
        minijuegoActual = new PizzaMiniJuego(jugador = self)
        game.addVisual(minijuegoActual)
        game.addVisual(cartelPresionarZ)
        minijuegoActual.estaVisible(true)
        console.println("--- PIZZA CREADA Y VISUALES AGREGADOS ---")
    }
    
    method crearPizza() {
        pizzasEnMano += 1
        
        // Removemos el minijuego si existe
        if (minijuegoActual != null) {
            try { game.removeVisual(minijuegoActual)} catch e {}
        }
        
        // Removemos el cartel de forma segura usando .contains() de Wollok
        if (game.allVisuals().contains(cartelPresionarZ)) {
            game.removeVisual(cartelPresionarZ)
        }
        
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
  
  method subir() {
        const numeroActual = barraActual.numero()
      if (numeroActual > 1) {
        barraActual = juego.barras().get(numeroActual - 2)
        position = game.at(2.5, position.y() + 2)
        }
    }
    
    method bajar() {
        const numeroActual = barraActual.numero()
      if (numeroActual < juego.barras().size()) {
        barraActual = juego.barras().get(numeroActual)
        position = game.at(2.5, position.y() - 2)
        }
    }
  
  method obtenerNumeroDeBarraActual(barra) = barra.numero()

  method image() = if (pizzasEnMano > 0) "jugador_con_pizza.png" else "jugador_normal.png"
}

object marcador {
  method position() = game.at(2.5, 7)
  method text() = "Puntos: " + jugador.puntaje() + " | Pizzas: " + jugador.pizzasEnMano()
  method textColor() = "FFFFFFFF"
}
