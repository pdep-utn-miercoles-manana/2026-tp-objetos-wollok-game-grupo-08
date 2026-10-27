import barra.*

object jugador {
  var property puntaje = 0
  var property barraActual = barraSuperior
  var property pizzasEnMano = 0
  
  method entregarPedido(cliente) {
    if (pizzasEnMano <= 0) {
      throw new DomainException(message = "No hay pizzas en mano para entregar")
    }
    const puntosObtenidos = cliente.recibirPedido()
    pizzasEnMano -= 1
    self.sumarPuntos(puntosObtenidos)
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
}