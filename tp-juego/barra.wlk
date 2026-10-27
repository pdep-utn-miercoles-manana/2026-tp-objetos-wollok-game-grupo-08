import cliente.*

class Barra {
  const property numero = 0
  const property clientes = []
  
  method agregarCliente(cliente) {
    clientes.add(cliente)
    cliente.barra(self)
  }
  
  method removerCliente(cliente) {
    clientes.remove(cliente)
  }
}

const barraSuperior = new Barra(numero = 1)

const barraMediaSuperior = new Barra(numero = 2)

const barraMediaInferior = new Barra(numero = 3)

const barraInferior = new Barra(numero = 4)