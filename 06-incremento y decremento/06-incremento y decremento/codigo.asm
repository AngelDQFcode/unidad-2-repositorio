; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6. incremento y decremento
; Descripción: incremento y decremento de un valor, en este caso el pin, para validar el acceso a un sistema.
INCLUDE Irvine32.inc

.data
	msgPIN BYTE "Ingrese el PIN: ", 0 
	msgIntentos BYTE "Intentos restantes: ", 0
	msgError BYTE "PIN incorrecto.", 0
	msgAcceso BYTE "Acceso permitido.", 0
	msgBloqueado BYTE "Autodestruccioin comenzada...", 0

	pinCorrecto = 1234 // PIN correcto para validar el acceso

.code 
main PROC
	
	mov ebx, 3 ; Numero de intentos para ingresar 

intentar: 
	mov edx, OFFSET msgPIN
	call WriteString
	call ReadInt ; se lee msgPIN y se guarda en eax 

	cmp eax, pinCorrecto ; comparamos 
	je acceso

	mov edx, OFFSET msgError
	call WriteString ; muestra el mensaje de error
	call crlf ; salto de linea
	
	dec ebx ; ebx-- resta 1 intento

	jz bloqueado ; si es 0 se va a bloqueado

	mov edx, OFFSET msgIntentos
	call WriteString

	mov eax, ebx
	call WriteDec ; creo que nos dice cuantos intentos nos quedan? 
	call crlf

	jmp intentar ;al parecer intentar es un ciclo

acceso:
	mov edx, OFFSET msgAcceso
	call WriteString
	call crlf
	jmp fin ; muestra que accedio y se va a fin

bloqueado: 
	mov edx, OFFSET msgBloqueado ; se muestra el mensaje de bloqueado y se va a fin
	call WriteString
	call crlf
	jmp fin
fin: 
	exit

main ENDP

END main