import wollok.game.*
import barra.*
import cliente.*
import jugador.*

object juego {
  var clientesInicializados = false
  
  const property barras = [barraSuperior, barraMediaSuperior, barraMediaInferior, barraInferior]
  
  method iniciar() {
    if (!clientesInicializados) {
      self.cargarClientesIniciales()
      clientesInicializados = true
    }
  }
  
  method cargarClientesIniciales() {
        barras.forEach({ barra =>
            barra.agregarCliente(new Hambriento(pedido = 1, paciencia = 60))
            barra.agregarCliente(new Critico(pedido = 2, paciencia = 80))
            barra.agregarCliente(new Casual(pedido = 1, paciencia = 70))
            barra.agregarCliente(new Familia(pedido = 3, paciencia = 90))
            //barra.agregarCliente(new Hambriento(pedido = 2, paciencia = 100))
          
            barra.actualizarPosicionesClientes()
            barra.clientes().forEach({ cliente =>
                cliente.estaEnJuego(true)
                game.addVisual(cliente)
                game.addVisual(cliente.visualPaciencia())
                game.addVisual(cliente.visualPedido())
            })
        })
    }
  
}