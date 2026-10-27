import barra.*
import cliente.*
import jugador.*

object juego {
  const barraSup = barraSuperior
  const barraMedSup = barraMediaSuperior
  const barraMedInf = barraMediaInferior
  const barraInf = barraInferior
  var estado = "SIN INICIAR"
  var clientesInicializados = false
  
  method iniciar() {
    if (!clientesInicializados) {
      self.cargarClientesIniciales()
      clientesInicializados = true
    }
    estado = "EN CURSO"
  }
  
  method cargarClientesIniciales() {
    barraSup.agregarCliente(new Hambriento(pedido = 1, paciencia = 5))
    barraSup.agregarCliente(new Hambriento(pedido = 2, paciencia = 6))
    barraSup.agregarCliente(new Hambriento(pedido = 3, paciencia = 7))
    
    barraMedSup.agregarCliente(new Hambriento(pedido = 4, paciencia = 5))
    barraMedSup.agregarCliente(new Hambriento(pedido = 5, paciencia = 6))
    
    barraMedInf.agregarCliente(new Hambriento(pedido = 6, paciencia = 7))
    barraMedInf.agregarCliente(new Hambriento(pedido = 7, paciencia = 5))
    barraMedInf.agregarCliente(new Hambriento(pedido = 8, paciencia = 6))
    barraMedInf.agregarCliente(new Hambriento(pedido = 9, paciencia = 7))
    
    barraInf.agregarCliente(new Hambriento(pedido = 10, paciencia = 5))
    barraInf.agregarCliente(new Hambriento(pedido = 11, paciencia = 6))
    barraInf.agregarCliente(new Hambriento(pedido = 12, paciencia = 7))
  }
  
  method pausar() {
    estado = "PAUSADO"
  }
  
  method finalizar() {
    estado = "FINALIZADO"
  }
}