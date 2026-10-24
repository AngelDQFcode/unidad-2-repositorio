; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 12 desplazamiento y rotación
; Descripción: aqui utilizamos las instrucciones de desplazamiento y rotación para ver su funcionamiento en el registro AL
;implementamos las instrucciones SHL, SHR, SAR, ROL, ROR, RCL y RCR para ver su funcionamiento en el registro AL

INCLUDE Irvine32.inc
.code 
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	; 1 - SHL: DESPLAZAR UNA POSICION A LA IZQUIERDA 
	mov al, 00001100b
	shl al, 1

	call dumpRegs
	call WriteBin

	; 2 - SHR: DESPLAZAR UNA POSICION A LA DERECHA
	mov al, 00001101b
	shr al, 1

	call dumpRegs
	call WriteBin

	; 3 - SAR: CONSERVAR EÑ SIGNO
	mov al, -8
	sar al, 1

	call dumpRegs
	call WriteBin

	; 4 - SAR: CON OPERACIONES NO EXACTAS
	mov al, 9
	sar al, 1

	call dumpRegs
	call WriteBin

	; 5 - CONTEO: DESPLAZAR 2 BITS HACIA LA IZQUIERDA CON CONSTANTE 
	mov al, 00001111b
	shl al, 2

	call dumpRegs
	call WriteBin

	; 6 - DESPLAZAR 2 BTS HACIA LA DERECHA UTILIZANDO CL
	mov al, 00001111b
	mov cl, 2
	shr al, cl

	; 7 - ROR, ROL, RCL, RCR




	exit

main ENDP

END main