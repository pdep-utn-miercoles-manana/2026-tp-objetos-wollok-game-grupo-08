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
            barra.agregarCliente(new Hambriento(pedido = 1, paciencia = 15))
            barra.agregarCliente(new Critico(pedido = 2, paciencia = 12))
            barra.agregarCliente(new Casual(pedido = 1, paciencia = 20))
            barra.agregarCliente(new Familia(pedido = 3, paciencia = 18))
            barra.agregarCliente(new Hambriento(pedido = 2, paciencia = 10))
          
            barra.clientes().forEach({ cliente => game.addVisual(cliente) })
        })
    }
  
}