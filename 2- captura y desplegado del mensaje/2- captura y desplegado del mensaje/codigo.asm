; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: [Tu horario]
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 2. captura y desplegado del mensaje
; Descripción: en este programa se solicita al usuario que ingrese su nombre y luego se despliega en pantalla. 
;usamos la función ReadString para capturar el nombre y WriteString para desplegarlo.
;utilizamos la función crlf para hacer un salto de línea después de cada mensaje.



INCLUDE Irvine32.inc

.data
	mensaje BYTE "Escribe tu nombre: ", 0 ; 0 es para indicar que la cadena termina

	nombre BYTE 15 DUP(0) ; INICIALIZAMOS EL ARREGLO EN 0 PORQUE ES UN VALOR NULO

.code 
main PROC
	mov edx, OFFSET mensaje ; apuntamos a la direccion en donde esta mensaje
	call WriteString ; para desplegarlo
	
	mov edx, OFFSET nombre ; ahora la direccion de nombre
	mov ecx, SIZEOF nombre ;numero de caracteres disponibles

	call ReadString ; lee lo que ingreso el usuario
	call crlf ; salto de linea 

	mov edx, OFFSET nombre ; volvemos apuntar a la memoria en donde ya debe de haber algo
	call WriteString ; para desplegarlo
	call crlf ; salto de linea
	exit

main ENDP

END main