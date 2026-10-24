
; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 13. extracción (práctica)
; Descripción: en esta práctica se realiza la extracción de los nibbles de un valor de 32 bits y se convierte a su representación hexadecimal.
;utiliza la función WriteString para mostrar la cadena resultante en la consola.

INCLUDE irvine32.inc


.data
DWORD 12AB34CDh            ; Valor de 32 bits a convertir
    bufferHex BYTE  9 DUP(?)             ; Búfer de 9 bytes (8 caracteres + 1 terminador nulo)

.code
	main PROC
    mov eax, valor                       ; Cargar el valor de 32 bits en EAX
    mov bufferHex[8], 0                  ; Colocar el terminador nulo (00h) en la posición 8
    mov esi, 7                           ; ESI comienza en la posición 7[cite: 1]
    
    mov dl, al
    and dl, 0Fh                          ; Máscara para conservar solo el nibble inferior

    cmp dl, 9
    jbe es_numero
    add dl, 'A' - 10                     ; Convertir a letra 'A'-'F'
    jmp guardar
    add dl, '0'                          ; Convertir a número '0'-'9'

    mov bufferHex[esi], dl               ; Escribir carácter en la posición ESI[cite: 1]
    shr eax, 4                           ; Desplazar 4 bits a la derecha para el siguiente dígito
    dec esi                              ; DEC ESI: retroceder una posición[cite: 1]
    jge bucle                            ; Repetir mientras ESI >= 0[cite: 1]

 mov edx, OFFSET bufferHex            ; EDX debe contener la dirección de la cadena
    call WriteString                     ; Muestra la cadena hasta encontrar el terminador nulo (00h)
    call Crlf                            ; Salto de línea

    exit
main ENDP
END main

main ENDP


END main