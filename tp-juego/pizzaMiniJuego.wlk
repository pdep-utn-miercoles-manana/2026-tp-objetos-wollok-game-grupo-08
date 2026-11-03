import jugador.*
import wollok.game.*

class PizzaMiniJuego {
  var property clicksTotales = 10
  var property clicksActuales = 0
  var property estaVisible = false
  const property jugador

  // Nuevo estado para la animación de la tecla
    var property presionada = false
    // La imagen cambia dinámicamente si está presionada o no
    method image() = if (presionada) "zpresionada.png" else "znopresionada.png"

  const property position = game.at(1, 5)
  method text() = "AMASAR: " + clicksActuales + "/" + clicksTotales
  method textColor() = "FFFFFFFF"
  
  method registrarClick() {
    clicksActuales += 1
    console.println("Clics actuales: " + clicksActuales + " / " + clicksTotales)

    presionada = true
    game.schedule(100, { presionada = false })

    if (clicksActuales >= clicksTotales) {
        self.completarPizza()
    }
  }
  
  method completarPizza() {
    jugador.crearPizza()
  }
}