; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5.1 Repetir hasta que el usuario ingrese 0
; Descripción: Ciclo que solicita la entrada de números y se repite hasta ingresar un cero.
;aqui aplicamos el ciclo while, ya que se repite hasta que el usuario ingrese un 0.

INCLUDE Irvine32.inc

.data
	prompt BYTE "Ingrese un numero (0 para salir): ", 0

.code
main PROC

ciclo:	
	mov edx, OFFSET prompt
	call WriteString
	
	call ReadInt
	call Crlf

	cmp eax, 0
	jne ciclo 

	exit

main ENDP
END main