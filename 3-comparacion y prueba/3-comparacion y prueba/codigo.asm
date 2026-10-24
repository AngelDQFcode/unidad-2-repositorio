; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 3. Comparación y prueba
; Descripción: en este programa se muestran las banderas de comparación y prueba, así como su funcionamiento.
;vemos que la bandera de cero se activa cuando el resultado de la comparación es igual, la bandera de signo se activa cuando el resultado es negativo, la bandera de acarreo se activa cuando hay un acarreo en la operación, y la bandera de desbordamiento se activa cuando hay un desbordamiento en la operación. La instrucción TEST realiza una operación AND entre dos operandos y actualiza las banderas según el resultado.

.code 
main PROC
	; CONDICION: ZERO FLAG 
	mov EBX, 1
	cmp ebx, 1
	call dumpRegs

	mov EAX, 01h
	cmp EAX, EBX
	call dumpRegs

	mov cl, 11111111b
	cmp cl, cl
	call dumpRegs

	; CONDICION 2: SING  FLAG
	mov EAX, 0
	mov EBX, 0

	mov al, -5
	mov bl, 1

	cmp al, bl
	call dumpRegs

	; CONDICION 3: CARRY FLAG
	mov EAX, 0
	mov EBX, 0

	mov al, 255
	add al, 1

	call dumpRegs


	; CONDICION 4: OVERFLOW FLAG
	mov EAX, 0
	mov EBX, 0

	mov al, -128
	mov bl, 1
	cpm al, bl
	call dumpRegs

	; CONDICION 5: TEST

	mov EAX, 0
	mov EAX, 5 ; 00000101b
	test EAX, 1

	; 00000101b
	;-
	; 00000001b
	;---------------
	; 00000001b

	mov eax, 0
	mov al, 100000000b
	test al, al
	call dumpRegs

	exit

main ENDP

END main