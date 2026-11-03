import jugador.*
import wollok.game.*

class PizzaMiniJuego {
  var property clicksTotales = 10
  var property clicksActuales = 0
  var property estaVisible = false
  const property jugador

  const property position = game.at(8, 5)
  method text() = "AMASAR: " + clicksActuales + "/" + clicksTotales
  method textColor() = "FFFFFFFF"
  
  method registrarClick() {
    clicksActuales += 1
    if (clicksActuales >= clicksTotales) self.completarPizza()
  }
  
  method completarPizza() {
    jugador.crearPizza()
  }
}