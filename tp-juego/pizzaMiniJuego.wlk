import jugador.*
import wollok.game.*

class PizzaMiniJuego {
    var property clicksTotales = 10
    var property clicksActuales = 0
    const property jugador
    
    method iniciar() {
        clicksActuales = 0
    }
    
    method registrarClick() {
        clicksActuales = clicksActuales + 1
        if (clicksActuales >= clicksTotales) {
            self.completarPizza()
        }
    }
    
    method completarPizza() {
        jugador.crearPizza()
        // aca habria indicar que termine el jeugo
    }
}