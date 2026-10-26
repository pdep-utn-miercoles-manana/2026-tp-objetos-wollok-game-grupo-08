import jugador.* 
import barra.*

object juego {
    var property estado = "EN CURSO"
    var property tiempo = 0
    const jugador = new Jugador()
    
    const barraSuperior = barraSuperior
    const barraMediaSuperior = barraMediaSuperior
    const barraMediaInferior = barraMediaInferior
    const barraInferior = barraInferior
    
    method iniciar() {
        estado = "JUGANDO"
        
    }
    
    method pausar() {
        estado = "PAUSADO"
    }
    
    method finalizar() {
        estado = "FINALIZADO"
        self.mostrarPuntaje()
    }
    
    method mostrarPuntaje() {
        console.println("Puntaje final: " + jugador.puntaje())
    }
} 