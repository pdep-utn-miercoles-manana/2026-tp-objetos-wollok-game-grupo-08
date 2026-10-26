import cliente.*

class Barra {
    const property numero
    const property clientes = []
    
    method agregarCliente(c) {
        clientes.add(c)
    }
    
    method removerCliente(c) {
        clientes.remove(c)
    }
    
    method actualizarClientes() {
        clientes.forEach({ c => c.actualizar(1) })
    }
}

barraSuperior = new Barra(numero = 1)
barraMediaSuperior = new Barra(numero = 2)
barraMediaInferior = new Barra(numero = 3)
barraInferior = new Barra(numero = 4)