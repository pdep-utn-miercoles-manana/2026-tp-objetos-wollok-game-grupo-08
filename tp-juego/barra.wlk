import cliente.*

class Barra {
  const property numero = 0
  const property clientes = []

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
}

const barraSuperior = new Barra(numero = 1)

const barraMediaSuperior = new Barra(numero = 2)

const barraMediaInferior = new Barra(numero = 3)

const barraInferior = new Barra(numero = 4)