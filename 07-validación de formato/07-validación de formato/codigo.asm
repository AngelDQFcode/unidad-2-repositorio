; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 7. Validación de formato
; Descripción: Captura una cadena y comprueba que sus caracteres cumplan reglas de formato (letras y números).

INCLUDE Irvine32.inc

.data
	msgValido BYTE "LA CADENA CUMPLE CON LAS REGLAS", 13, 10, 0
	msgNoValido BYTE "NO CUMPLE CON LAS REGLAS", 13, 10, 0
	buffer BYTE 50 DUP(0)

.code
main PROC
	mov edx, OFFSET buffer
	mov ecx, 50
	call ReadString
	
	cmp eax, 7 ; Validar que mida exactamente 7 caracteres
	jne invalido
 
	mov ecx, 3
	mov esi, OFFSET buffer

Validarletras:
	mov al, [esi]
	cmp al, 'A'
	jb invalido
	cmp al, 'Z'
	ja invalido
	inc esi
	loop Validarletras

	mov al, [esi]
	cmp al, '-'
	jne invalido
	inc esi

	mov ecx, 3
Validardigitos:
	mov al, [esi]
	cmp al, '0'
	jb invalido
	cmp al, '9'
	ja invalido
	inc esi
	loop Validardigitos

esValido:
	mov edx, OFFSET msgValido
	call WriteString
	jmp fin

invalido:
	mov edx, OFFSET msgNoValido
	call WriteString

fin:
	call Crlf
	exit

main ENDP
END main