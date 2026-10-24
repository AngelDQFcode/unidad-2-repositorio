; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4. saltos
; Descripción: realizamos saltos condicionales y no condicionales con el fin de comparar dos valores y mostrar un mensaje dependiendo del resultado de la comparación.


INCLUDE Irvine32.inc

.data

.code
main PROC
	mov eax, 10
	mov ebx, 10
	
	cmp eax, ebx

	je iguales 

	mov edx, OFFSET msgDiferentes
	call WriteString

	jmp fin
	
iguales:
	mov edx, OFFSET msgiguales
	call WriteString

fin:
	call Crif
	exit



main ENDP

END main
