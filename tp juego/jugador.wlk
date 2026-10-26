import barra.*

class Jugador {
    var property barraActual = barraSuperior
    var property pizzasEnMano = 0
    var property puntaje = 0
    
    method moverArriba() {
        
    }
    
    method moverAbajo() {
        
    }
    
    method atenderCliente() {
        
    }
    
    method entregarPedido() {
        
    }
    
    method crearPizza() {
        pizzasEnMano += 1
    }
    
    method perderPizzas() {
        pizzasEnMano = 0
    }
    
    method sumarPuntos(puntos) {
        puntaje = puntaje + puntos
    }
    
    method perderPuntos(puntosQueResta) {
        puntaje = puntaje - puntosQueResta
    }
}