object esperando {
  method estaEsperando() = true
  
  method estaAtendido() = false
  
  method estaEnojado() = false
  
  method recibirPedido(cliente) {
    cliente.cambiarEstado(atendido)
    return cliente.puntos()
  }
  
  method enojarse(cliente) {
    cliente.cambiarEstado(enojado)
    cliente.reaccionar()
  }
}

object atendido {
  method estaEsperando() = false
  
  method estaAtendido() = true
  
  method estaEnojado() = false
  
  method recibirPedido(cliente) {
    throw new DomainException(message = "El cliente ya fue atendido")
  }
  
  method enojarse(cliente) {
    throw new DomainException(message = "El cliente ya fue atendido")
  }
}

object enojado {
  method estaEsperando() = false
  
  method estaAtendido() = false
  
  method estaEnojado() = true
  
  method recibirPedido(cliente) {
    throw new DomainException(
      message = "El cliente está enojado y rechaza el pedido"
    )
  }
  
  method enojarse(cliente) {
    throw new DomainException(message = "El cliente ya está enojado")
  }
}