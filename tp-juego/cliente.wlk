import jugador.*
import estadosCliente.*

class Cliente {
  var property paciencia = 10
  var property pedido
  const property puntos = 10
  var property barra = null
  var property estado = esperando
  
  method estaEsperando() = estado.estaEsperando()
  
  method estaAtendido() = estado.estaAtendido()
  
  method estaEnojado() = estado.estaEnojado()
  
  method recibirPedido() = estado.recibirPedido(self)
  
  method enojarse() = estado.enojarse(self)
  
  method reaccionar() {
    
  }
}

class Hambriento inherits Cliente {
  override method reaccionar() {
    jugador.perderPizzas()
  }
}

class Critico inherits Cliente {
  override method reaccionar() {
    jugador.restarPuntos(30)
  }
}

class Casual inherits Cliente {
  
}

class Familia inherits Cliente {
  override method reaccionar() {
    if (barra != null) barra.removerCliente(self)
  }
}