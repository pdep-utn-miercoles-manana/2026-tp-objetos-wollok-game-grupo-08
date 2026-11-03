import jugador.*
import sonido.*
import wollok.game.*

class PizzaMiniJuego {
  var property clicksTotales = 10
  var property clicksActuales = 0
  var property estaVisible = false
  const property jugador


  const property position = game.at(1, 5)
  method text() = "AMASAR: " + clicksActuales + "/" + clicksTotales
  method textColor() = "FFFFFFFF"
  
  method registrarClick() {
    clicksActuales += 1
    console.println("Clics actuales: " + clicksActuales + " / " + clicksTotales)

    if (clicksActuales >= clicksTotales) {
        self.completarPizza()
    }
  }
  
  method completarPizza() {
    sonido.reproducir("pizza-ready.wav")
    jugador.crearPizza()
  }
}