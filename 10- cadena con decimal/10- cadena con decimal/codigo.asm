
; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 10 cadena con decimal
; Descripción: en este codigo se calcula el porcentaje de avance de una descarga de un archivo, el número de bytes descargados y pendientes, el número de grupos completos y el residuo del agrupamiento.

INCLUDE Irvine32.inc
; la tiene en gemini el angel PENDIENTE CORREGIRLA
.data
	; Constantes
	bloquesRecibidos DWORD 125
	tamanoBloque DWORD 512
	tamanoTotal DWORD 100000

	; Variables 
	bytesDescargados DWORD ?
	bytesPendientes DWORD ?
	porcentajeAvance DWORD ?
	gruposCompletos DWORD ?
	residuoGrupos DWORD ?
	
	; buffer
	buffer BYTE 11 DUP(0)

	; Mensajes
	msgDescargados BYTE "Bytes descargados: ", 0
	msgPendientes BYTE "Bytes pendientes: ", 0
	msgPorcentaje BYTE "Porcentaje entero de avance: ", 0
	msgGruposCompletos BYTE "Grupos completos: ", 0
	msgResiduo BYTE "Residuo del agrupamiento: ", 0

.code 
main PROC
	; calculo de bytes descargados y pendientes
	mov eax, bloquesRecibidos
	mov ebx, tamanoBloques

	mul ebx
	mov bytesPendientes, eax

	;calculo porcentaje
	mov eax, bytesDescargados
	mov ebx, 100
	mul ebx
	mov ebx, tamanoTotal
	mov edx, 0
	div ebx
	mov porcentajeAvance, eax


	; calculo grupos completos
	mov eax, bytesDescagados
	mov edx, 0
	mov ebx, 1024
	div ebx
	mov gruposCompletos, eax
	mov residuoGrupos, edx

	; imprimir?

	mov edx, OFFSET msgDescargados
	call WriteString
	mov eax, bytesDescagados
	mov esi, OFFSET buffer
	call convertirDecimal
	mov edx, OFFSET buffer
	call WriteString
	call crlf

	mov edx, OFFSET msgPendientes
	call WriteString 
	mov eax, bytesPendientes
	mov esi, OFFSET buffer
	call convertirDecimal
	mov edx, OFFSET buffer
	call WriteString
	call crlf

	mov edx, OFFSET msgPorcentaje
	call WriteString
	mov eax, porcentajeAvance
	mov esi, OFFSET buffer
	call convertirDecimal
	mov edx, OFFSET buffer
	call WriteString
	;simbolo de porcentaje?
	call crlf

	mov edx, OFFSET msgGrupos
	call WriteString
	mov eax, gruposCompletos
	mov esi, OFFSET buffer
	call convertirDecimal
	mov edx, OFFSET buffer
	call WriteString
	call crlf

	mov edx, OFFSET msgResiduo
	call WriteString
	mov eax, residuoGrupos
	mov esi, OFFSET buffer
	call convertirDecimal
	mov edx, OFFSET buffer
	call WriteString
	call crlf

	exit

main ENDP

convertirDecimal PROC
	push eax	
	push ebx
	push ecx
	push edx
	push esi

	mov ebx, 10 ; el divisor
	mov ecx, 0 

	; si el numero que se va a convertir es 0
	cmp eax, 0
	jne cicloDividir
	
	mov al, '0'
	mov [esi], al
	mov al, 0
	mov [esi + 1], al
	jmp finConvertir

cicloDividir:
	mov edx, 0
	div ebx
	add dl, '0'
	push dx
	inc ecx
	cmp eax, 0
	jne cicloDividir

cicloExtraer: 
	pop dx
	mov [esi], dl
	inc esi
	loop cicloExtraer

	; terminador nulo usando al
	mov al, 00h
	mov [esi], al

finConvertir:
	pop esi
	pop edx
	pop ecx
	pop edx
	pop eax
	ret

convertirDecimal ENDP

END main