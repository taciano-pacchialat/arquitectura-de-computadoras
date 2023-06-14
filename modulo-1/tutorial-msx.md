# Como usar MSX88 en Linux

## Dependencias

- WINE
- DOSBox
- MSX88 para DOS, se puede encontrar [acá](https://web.archive.org/web/20130609122924/http://msx88.diatel.upm.es/Vista%20y%20Linux.htm), y descargar desde [este link](https://web.archive.org/web/20130609122924/http://msx88.diatel.upm.es/bbs_msx88/EXE/msx88.zip). Los ejecutables `ASM88.EXE`, `LINK88.EXE` Y `MSX88.EXE` deben estar en la misma carpeta que los archivos `*.asm` (o, `msx.exe` de la version de Windows).
- MSX88 para Windows. No me funcionaba para compilar, pero el emulador puede andar mas rapido

## Configuracion de DOSBox (si se va a usar el emulador en DOSBox)

En el archivo de configurcion, en mi caso `~/.dosbox/dosbox-0.74-3.conf`, cambiar las siguientes lineas:

- En la sección `[cpu]` alterar los siguientes campos:
  - `core=dynamic` CPU core usado en emulación. Auto debería elegir dynamic por defecto, pero no en mi caso
  - `cycles=max` Máxima cantidad de instrucciones por unidad de tiempo

Yo preferí dejar el assembler y el linker de DOS y el emulador de Windows en la carpeta de práctica, porque uno compila y el otro permite mas velocidad.

## Build & run

En la carpeta `Practica/` hay dos scripts. Utilizarlos de la siguiente forma para un archivo de ejemplo `PRUEBA.asm`:

- `./build.sh PRUEBA` (importante no incluir la extension, ya que usa el basename para el .asm y el .O)
- `./run.sh` para lanzar MSX88. Una vez en el simulador, correr `l prueba` y luego `g` para ejecutar

Tip: `v 31` incrementa la velocidad de ejecucion al máximo posible

*Autor: **Tomás Badenes***
