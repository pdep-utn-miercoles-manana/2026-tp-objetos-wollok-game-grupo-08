import jugador.*
import wollok.game.*

class PizzaMiniJuego {
  var property clicksTotales = 10
  var property clicksActuales = 0
  const property jugador

  const property position = game.at(3, 3)
  const property image = "minijuego_pizza_fondo.jpg"
  method text() = "Amasa: " + clicksActuales + "/" + clicksTotales
  
  method registrarClick() {
    clicksActuales += 1
    if (clicksActuales >= clicksTotales) self.completarPizza()
  }
  
  method completarPizza() {
    jugador.crearPizza()
  }
}