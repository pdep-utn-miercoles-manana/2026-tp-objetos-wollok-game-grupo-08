import wollok.game.*

object sonido {
    var property activo = true
    var musicaDeFondo = null
    var musicaIniciada = false

    method position() = game.at(11, 7)

    method image() = if (activo) "soundOnWhite.png" else "soundOffWhite.png"

    method iniciarMusica() {
        musicaDeFondo = game.sound("pizzero-argento-back-music.wav")
        musicaDeFondo.shouldLoop(true)
        game.schedule(500, { self.reproducirMusica() })
    }

    method reproducirMusica() {
        if (activo && !musicaIniciada) {
            musicaDeFondo.play()
            musicaIniciada = true
        }
    }

    method reproducir(nombreArchivo) {
        if (activo) {
            game.sound(nombreArchivo).play()
        }
    }

    method silenciar() {
        activo = false
        musicaIniciada = false
        if (musicaDeFondo != null) {
            musicaDeFondo.stop()
        }
    }

    method activar() {
        activo = true
        self.reproducirMusica()
    }
}
