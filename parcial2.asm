Title Parcial2 <parcial2.Asm>

INCLUDE Irvine32.inc
;poner aqui las definiciones de simbolos o constantes

.data
;poner aqui las variables a utilizar
MSG1 Byte "El exito consiste en ir de",0
nLen1 =($-MSG1-Byte)/ Type MSG1
MSG2 Byte "omsaisutne le redrep nis osacarf ne osacarf",0
nLen2 =($-MSG2-Byte)/ Type MSG2

.code
Main PROC

	Call ClrScr ; Limpia la pantalla
;Mostrar las dos cadenas en pantalla (10%)
mov EDX, offSet MSG1
call WriteString
Call CrLf

mov EDX, offSet MSG2
call WriteString
Call CrLf

;Ingresar MSG2 en forma normal a la pila (10%)
;almaceno
mov EAX,0
mov ECX, nLen2
mov ESI, offSet MSG2
Inicio1:
mov AL,[ESI]
Push AX
add ESI, Type MSG2
loop Inicio1
Call CrLf

;extraigo ;Extraer de la pila todos los caracteres ingresados (30%)
mov EAX, 0
mov ECX, nLen2
Inicio2:
pop AX
Call WriteChar ;Mostrar los caracteres extraídos en pantalla (5%)
loop Inicio2
Call CrLf

;Ingresar MSG1 en forma invertida a la pila (20%)
;almaceno
mov EAX,0
mov ECX, nLen1
mov ESI, offSet MSG1
add ESI, nLen1
sub ESI, Type nLen1

Inicio3:
mov AL,[ESI]
Call WriteChar
Push AX
sub ESI, Type MSG2
loop Inicio3
Call CrLf

;extraigo ;Extraer de la pila todos los caracteres ingresados (30%)
mov EAX, 0
mov ECX, nLen1
Inicio4:
pop AX
Call WriteChar ;Mostrar los caracteres extraídos en pantalla (5%)
loop Inicio4
Call CrLf

;Extraer de la pila todos los caracteres ingresados (30%)

;Mostrar los caracteres extraídos en pantalla (5%)


	Call CrLf ;Hace un salto de linea
	Call WaitMsg ;Espera a que presionen <Enter>
	Exit ;Termina el programa
	
Main ENDP
END main