
; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4.1 Mayor, menor o igual con entrada del usuario
; Descripción: Lee dos números ingresados por el usuario, los compara y despliega el resultado.
;en este programa se comparan dos numeros ingresados por el usuario y se despliega un mensaje indicando si son iguales, si el primero es mayor o si el primero es menor.

INCLUDE Irvine32.inc

.data

.code
main PROC

	mov edx, OFFSET prompt2
	call WriteString 
	call ReadInt
	mov ecx, eax

	mov edx, OFFSET prompt1
	call WriteString   
	call ReadInt                // lee el primer número
	mov ebx, eax

	mov eax, ecx
	mov ebx, ebx
	
	cmp eax, ebx

	je iguales // si son iguales

	mov edx, OFFSET msgDiferentes
	call WriteString

	jge mayor // si el primer numero es mayor o igual
	mov edx, OFFSET msgMenor
	call WriteString

	

	jmp fin
	
iguales: // si son iguales
	mov edx, OFFSET msgiguales
	call WriteString

mayor: // si el primer numero es mayor
	mov edx, OFFSET msgEsmayoroigual
	call WriteString

fin:
	call Crif
	exit

main ENOP
END main