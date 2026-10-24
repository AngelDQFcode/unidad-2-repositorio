; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 1. Ciclos numéricos
; Descripción: Programa que imprime números del 1 al 5 usando un ciclo LOOP

INCLUDE Irvine32.inc

.data

.code
main PROC
	mov ecx, 5 // Inicializa el contador del ciclo en 5

ciclo:
	mov eax, ecx // Mueve el valor del contador del ciclo a EAX
	call WriteDec // Imprime el valor de EAX osea el contador del ciclo
	call CRLF  // Imprime un salto de línea

	loop ciclo // Repite el ciclo
	
	exit

main ENDP
END main