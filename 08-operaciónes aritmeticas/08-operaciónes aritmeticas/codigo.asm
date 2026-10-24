
; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 8. Validación de formato
; Descripción: en la validación de formato se realizan operaciones aritméticas y se validan los flags de la CPU.
;en este caso se realizan operaciones de suma, resta, multiplicación y división, y se validan los flags de acarreo y desbordamiento.

INCLUDE Irvine32.inc

.code 
main PROC
	; OPERACIONES: ADD Y SUB

	mov eax, 50
	mov ebx, 20

	add eax, ebx
	sub eax, 15

	nop ; significa que no hay ninguna operacion 

	; 2. CF: ACARREO EN UNA SUMA SIN SIGNO

	mov eax, 0
	mov al, 255
	add al, 1

	nop

	; 3. OF: CONDICION DE DESBORDAMIENTO

	mov eax, 0
	mov al, 127
	add al, 1

	nop

	; 4. MUL: MULTIPLICACION DE VALORES DENTRO DE 32 BITS

	mov eax, 25
	mov ebx, 3

	mul ebx

	nop

	; 5. MUL: PRODUCTO QUE NECESITA MAS DE 32 BITS

	mov eax, 65537
	mov ebx, 65537

	mul ebx

	nop ; se detiene????

	; 6. IMUL: MULTIPLICACION CON SIGNO

	mov eax, -5

	imul eax, eax, 3

	nop

	; 7. DIV: DIVISION SIN SIGNO

	mov eax, 125
	mov edx, 0 ; nos da el residuo
	mov ebx, 12

	div ebx

	nop

	; IDIV: DIVISION CON SIGNO

	mov eax, -125

	cdq

	mov ebx, 12

	idiv ebx

	exit

main ENDP

END main