; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Hola Mundo sin Irvine32
; Descripción: Imprime un mensaje en consola utilizando directamente la API de Windows (Win32).


.386 ; Esta directiva le permite a ensamblador reconocer que se va a trabajar con arquitectura intel 80386

.model flat, stdcall 
; model flat, se trabaja con las direcciones de memoria en forma secuencial.
; stdcall nos permite obtener los servicios que proporciona windows.
.stack 4096
; Nos permite reservar un espacio para el manejo de la pila dentro de la RAM.

; SERVICIO DE WINDOWS
getStdHandle PROTO, ;proto declara un prototipo
	ntStdHandle:DWORD

WriteConsoleA PROTO,
	hConsoleOutput:DWORD,
	IpBuffer: PTR BYTE,
	nNumberOfCharsToWrite:DWORD,
	IpNumberCharsWritten:PTR DWORD,
	IpReserved:DWORD

;hConsoleHandle nos permite manejar en donde vamos a escribir, en este caso la consola
;IpBuffer Nos va permitir ir a la direcccion donde se encuentra el primer caracter.
;nNumberOfCharsToWrite es el numero de caracteres que se van escribir
;IpNumberCharsWritten se guarda en una direccion el numero de caracteres escritos realmente
;IpReserved es un parámetro reservado.

ExitProcess PROTO,
dwExitCode: DWORD

; Declaracion de función para terminación de proceso . DWORD va recibir el código para finalizar el programa correctamente.

STD_OUTPUT_HANDLE_EQU -11
; EQU crea una constante simbolica.
; STD_OUTPUT_HANDLE se representa con el -11 

.data
mensaje BYTE "Hola, mundo!", 13, 10
;13 significa Carriage Line (CL)
;10 Line Feed (LF)

longitud EQU ($ - mensaje)
; Calcula la cantidad de bytes que ocupa el mensaje
; $ representa la posición de donde comenzó la cadena

CaracteresEscritos DWORD ?
; CaracteresEscritos reserva una variable de 32 bits
; ? Reserva el espacio de memoria, pero no lo inicializa

.code
main PROC
; PROC inidica el inicio del procedimiento

	INOKE GetStdHandle, STD_OUTPUT_HANDLE
	
	mov ebx, eax

	INVOKE WriteConsoleA,
		ebx,
		ADOR mensaje,
		longitud,
		ADOR CaracteresEscritos,

		0

	INOKE ExitProcess, 0 
	
