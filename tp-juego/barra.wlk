import cliente.*
import wollok.game.*

class Barra {
  const property numero = 0
  const property clientes = []
  const property position

  method obtenerPrimerCliente() {
    self.validarSiHayClientes()
    return clientes.first()
  }

  method validarSiHayClientes() {
    if(clientes.isEmpty()) {
      throw new DomainException(message = "No hay clientes en esta barra")
    }
  }
  
  method agregarCliente(cliente) {
    clientes.add(cliente)
    cliente.barra(self)
    cliente.inicializarBarraPaciencia()
    cliente.inicializarVisualPedido()
    self.actualizarPosicionesClientes()
  }
  
  method removerCliente(cliente) {
    clientes.remove(cliente)
    cliente.barra(null)
    self.actualizarPosicionesClientes()
  }

  method retirarOtroCliente(clienteActual) {
    const otrosClientes = clientes.filter({ cliente => cliente != clienteActual })
    if(!otrosClientes.isEmpty()) {
      otrosClientes.anyOne().irse()
    }
  }

  method actualizarPosicionesClientes() {
    var desplazamiento = 4
    clientes.forEach({ cliente => 
        cliente.position(game.at(desplazamiento, position.y()))
        desplazamiento += 2
    })
  }
}

const barraSuperior = new Barra(numero = 1, position = game.at(0, 5.5))
const barraMediaSuperior = new Barra(numero = 2, position = game.at(0, 4))
const barraMediaInferior = new Barra(numero = 3, position = game.at(0, 2))
const barraInferior = new Barra(numero = 4, position = game.at(0, 0.25))