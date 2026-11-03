PIZZERO ARGENTO - EJECUCION

1. Extraer el ZIP completo.
2. Abrir la carpeta principal del proyecto en Visual Studio Code (la que contiene package.json).
3. Abrir una terminal en esa carpeta.
4. Ejecutar:

   wollok run tp-juego.pizzeroArgento

5. Abrir en el navegador la direccion local que indique Wollok en la terminal.

CONTROLES
- Flecha arriba: subir a la barra superior.
- Flecha abajo: bajar a la barra siguiente.
- X: iniciar la preparacion de una pizza.
- Espacio: avanzar la preparacion (10 pulsaciones).
- C: entregar la pizza al primer cliente de la barra actual.

NOTAS
- Las imagenes estan en assets/ y se configuran desde package.json.
- El fondo incluye las cuatro barras; los clientes y el pizzero se dibujan encima.
- Al retirarse, los clientes se desvanecen antes de desaparecer.
