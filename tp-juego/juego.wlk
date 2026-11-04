import wollok.game.*
import barra.*
import cliente.*
import jugador.*

object juego {
  var clientesInicializados = false
  var property finalizado = false
  
  const property barras = [barraSuperior, barraMediaSuperior, barraMediaInferior, barraInferior]

  method noQuedanClientes() = barras.all({ barra => barra.clientes().isEmpty() })

  method terminar() {
    finalizado = true
  }

  method reiniciar() {
    finalizado = false
    clientesInicializados = false
    self.iniciar()
  }
  
  method iniciar() {
    if (!clientesInicializados) {
      self.cargarClientesIniciales()
      clientesInicializados = true
    }
  }
  
  method cargarClientesIniciales() {
    self.cargarClientesEn(barraSuperior, [
      new Hambriento(pedido = 1, paciencia = 60),
      new Critico(pedido = 2, paciencia = 80),
      new Casual(pedido = 1, paciencia = 70),
      new Familia(pedido = 3, paciencia = 90)
    ])
    self.cargarClientesEn(barraMediaSuperior, [
      new Critico(pedido = 2, paciencia = 80),
      new Familia(pedido = 3, paciencia = 90),
      new Casual(pedido = 1, paciencia = 70),
      new Hambriento(pedido = 1, paciencia = 60)
    ])
    self.cargarClientesEn(barraMediaInferior, [
      new Casual(pedido = 1, paciencia = 70),
      new Hambriento(pedido = 1, paciencia = 60),
      new Familia(pedido = 3, paciencia = 90),
      new Critico(pedido = 2, paciencia = 80)
    ])
    self.cargarClientesEn(barraInferior, [
      new Familia(pedido = 3, paciencia = 90),
      new Casual(pedido = 1, paciencia = 70),
      new Critico(pedido = 2, paciencia = 80),
      new Hambriento(pedido = 1, paciencia = 60)
    ])
  }

  method cargarClientesEn(barra, clientes) {
    clientes.forEach({ cliente =>
      barra.agregarCliente(cliente)
      cliente.estaEnJuego(true)
      game.addVisual(cliente)
      game.addVisual(cliente.visualPaciencia())
      game.addVisual(cliente.visualPedido())
    })
    }
  
}