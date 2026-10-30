import cliente.*
import juego.*
import barra.*
import pizzaMiniJuego.*

class Jugador {
  var property puntaje = 0
  var property barraActual = barraSuperior
  var property pizzasEnMano = 0
  var property minijuegoActual = null
  
  method entregarPedido() {
    self.validarEntrega()
    // agarra al primer cliente de la barra
    const clienteAAtender = barraActual.obtenerPrimerCliente()
    clienteAAtender.validarPedido(pizzasEnMano, self)
  }

  method validarEntrega() {
    if(pizzasEnMano <= 0) {
      throw new DomainException(message = "No hay pizzas en mano para entregar")
    }
  }
  
  // con esto arrancaria el minijuego
  method prepararPizza() {
    // se crea el minijuego
    minijuegoActual = new PizzaMiniJuego(jugador = self)
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
  
  method obtenerNumeroDeBarraActual(barra) = barra.numero()
}