
; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 14 registro de existencia en almacén
; Descripción: en este programa se solicita al usuario que ingrese una cantidad de 1 a 99, se valida la entrada y se muestra la cantidad de unidades ingresadas.
;usamos dword para almacenar la cantidad recibida y la cantidad actual, y usamos un buffer de entrada y un buffer de salida para leer y mostrar los datos.


INCLUDE irvine32.inc


.data

msgPrompt BYTE "ingrese una cantidad de 1 a 99",0
msgError BYTE "entrada invalida, intente de nuevo",0Dh,0Ah,0
msgResultado BYTE "la cantidad de unidades es: ",0
msgUnidades BYTE "unidades",0

cantidadrecibida DWORD 0
cantidadactual DWORD 0

bufferEntrada BYTE 20 DUP(0)
bufferSalida BYTE 12 DUP(0)

.code
main PROC
mov edx, OFFSET msgPrompt
call WriteString
mov edx , OFFSET bufferEntrada
mov ecx , sizeof bufferEntrada
call readString


cmp eax, 1
jl error       // si la cantidad ingresada es menor a 1, mostramos error

cmp eax, 2
jg error        // si la cantidad ingresada es mayor a 2, mostramos error

mov ecx, eax
mov esi, OFSET bufferEntrada

mov bl, [esi]  // cargamos el primer caracter del buffer de entrada en bl
cmp bl, '0'
jb mostrar_error		// si el primer caracter es menor que '0', mostramos error
cmp bl, '9'
ja mostrar_error     // si el primer caracter es mayor que '9', mostramos error
inc esi
loop validar_loop    // decrementamos ecx y repetimos el bucle hasta que ecx sea 0

mov esi, OFSET
	

main ENDP


END main