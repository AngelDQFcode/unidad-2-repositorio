; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6.1 Control de ocupación de un estacionamiento
; Descripción: Simula el control de un estacionamiento con límite de lugares e incrementos.
; En este código implementamos un menú para controlar la ocupación de un estacionamiento, donde el usuario puede ingresar o salir carros, y se muestra la cantidad actual de carros en el estacionamiento.

INCLUDE Irvine32.inc

.data
	msgMax BYTE "Estacionamiento lleno", 13, 10, 0
	msgMenu BYTE "1. Entrar carro | 2. Salir carro | 0. Cerrar. Opcion: ", 0
	msgActual BYTE "Carros en estacionamiento: ", 0
	msgVacio BYTE "El estacionamiento ya esta vacio.", 13, 10, 0

.code
main PROC
	mov ebx, 20 ; Limite de carros 
	mov ecx, 0  ; Carros actuales 

menu:
	mov edx, OFFSET msgActual
	call WriteString
	mov eax, ecx
	call WriteDec
	call Crlf

	mov edx, OFFSET msgMenu
	call WriteString
	call ReadInt
	call Crlf
	
	cmp eax, 0
	je fin
	cmp eax, 1
	je entro
	cmp eax, 2
	je salio
	
	jmp menu 

entro:
	cmp ecx, ebx       
	jge maximo         
	inc ecx            
	jmp menu

salio:
	cmp ecx, 0         
	je estavacio       
	dec ecx            
	jmp menu

estavacio:
	mov edx, OFFSET msgVacio
	call WriteString
	jmp menu

maximo:
	mov edx, OFFSET msgMax
	call WriteString
	jmp menu

fin:
	exit

main ENDP
END main