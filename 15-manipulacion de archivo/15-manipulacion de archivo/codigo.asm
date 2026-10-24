
; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 15 manipulación de archivo
; Descripción: en este codigo se crea un archivo de texto llamado inventario.txt y se escribe el texto "125" en él. 
;Luego, se cierra el archivo y se muestra un mensaje de éxito o error según corresponda.

INCLUDE irvine32.inc


.data
nombreArchivo BYTE "inventario.txt", 0
texto BYTE "125", 0
archivo HANDLE DWORD ?
mensajeExitoso BYTE "Archivo creado y escrito correctamente.", 0
mensajeError BYTE "Error al crear o escribir en el archivo.", 0


.code
;1.crear archivo
main PROC
	mov edx, OFFSET nombreArchivo
	call CreateOutputFile
	cmp eax, INVALID_HANDLE_VALUE
	je error

	mov archivoHandle, eax

	;2.escribir texto
	mov eax, archivoHandle
	mov edx, OFFSET texto
	mov ecx, sizeof texto - 1
	call writeFile

	jc errorEscritura

	cmp eax sizeof texto - 1
	jne errorEscritura

	3;cerrar archivo
	mov eax, archivoHandle
	call CloseFile
	
	test eax, eax
	jz error
	mov edx, OFFSET mensajeExitoso
	call WriteString
	jmp fin

	errorEscritura:
		mov eax, archivoHandle
		call CloseFile
		
		error:

		mov edx, OFFSET mensajeError
		call WriteString


		fin:
		exit



main ENDP


END main