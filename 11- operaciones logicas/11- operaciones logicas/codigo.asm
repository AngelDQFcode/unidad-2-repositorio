
; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 11 operaciones lógicas
; Descripción: aqui realizamos operaciones logicas con el fin de evaluar el estado de un sistema de alarma, encendido y conectado.
;usamos el registro AL para almacenar el estado del sistema y realizar operaciones lógicas como AND, OR, XOR, NOT y TEST para evaluar y modificar el estado del sistema.

INCLUDE Irvine32.inc
; checar que este completa con el angel
.code 
main PROC
	; 0 - Encendido
	; 1 - Alarma
	; 2 - Conectado
	; Estado inicial: 00000101

	; 1. AND: EXTRAER EL ESTADO DE ENCENDIDO
	mov eax, 0
	mov ebx, 0
	mov al, 00000101b
	mov bl, al
	and bl, 00000101b
	nop

	call dumpRegs

	; 2. OR: ENCENDER ALARMA
	mov al, 00000101b
	or al, 00000010b

	call dumpRegs
	nop 

	; 3. XOR: DESCONECTAR Y CONECTAR COMPUTADOR
	mov al, 00000101b
	xor al, 00000010b

	call dumpRegs
	nop

	; 4. NOT: DEVOLVER ESTADOS
	mov al, 00000101b
	not al
	
	call dumpRegs
	nop

	; 5. TEST: EVALUAR ALARMA Y REALIZAR SALTO
	mov al, 00000010b



	exit

main ENDP

END main