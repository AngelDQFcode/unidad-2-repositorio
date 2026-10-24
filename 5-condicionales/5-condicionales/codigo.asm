; Materia: Lenguajes de Interfaz
; Alumno: Ángel David Quiñónez Figueroa
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5. Condicionales
; Descripción: Ciclo condicional que repite un bloque e incrementa hasta que se cumple la condición de salida.
; utilizamos la instrucción CMP para comparar el valor del registro EBX con 10, y si es mayor, se salta a la etiqueta "fin" para finalizar el programa. 
;De lo contrario, se despliega el valor de EBX y se incrementa en 1, repitiendo el ciclo hasta que se cumpla la condición de salida.

INCLUDE Irvine32.inc

.data

.code
main PROC
	mov ebx, 1 ; VALOR INICIAL PARA INCREMENTAR
	
ciclo:
	cmp ebx, 10 ; CONDICION DE SALIDA
	jg fin ; SALTO A FINALIZAR EL CODIGO

	mov eax, ebx ; SE COPIA EL VALOR PARA DESPLEGARLO
	call WriteDec 
	call Crlf 

	inc ebx ; INCREMENTO DE +1 EN EL REGISTRO EBX

	jmp ciclo ; SALTO SIN CONDICION PARA REPETIR EL CODIGO
	
fin:
	exit

main ENDP
END main