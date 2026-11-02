import cliente.*

class Barra {
  const property numero = 0
  const property clientes = []
  const property position
  const property image = "barra.jpg"

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
  }
  
  method removerCliente(cliente) {
    clientes.remove(cliente)
    cliente.barra(null)
  }

  method retirarOtroCliente(clienteActual) {
    const otrosClientes = clientes.filter({ cliente => cliente != clienteActual })
    if(!otrosClientes.isEmpty()) {
      self.removerCliente(otrosClientes.anyOne())
    }
  }

  method actualizarPosicionesClientes() {
    var desplazamiento = 3
    clientes.forEach({ cliente => 
        cliente.position(game.at(desplazamiento, position.y()))
        desplazamiento += 1
    })
  }
}

const barraSuperior = new Barra(numero = 1, position = game.at(0, 6))
const barraMediaSuperior = new Barra(numero = 2, position = game.at(0, 4))
const barraMediaInferior = new Barra(numero = 3, position = game.at(0, 2))
const barraInferior = new Barra(numero = 4, position = game.at(0, 0))