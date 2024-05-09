# Matriz De Ingreso de Datos
# Los elementos del circuito se escriben en matriz A
# Cada elemento se escribe en una fila de la matriz A
# El numero de elementos es igual al numero de filas de Matriz A
# Columna 1: Tipo
# Columna 2: Magnitud
# Columna 3: Nodo Positivo/Malla Positivo
# Columna 4: Nodo Negativo/Malla Negativo
#
# ANALISIS DE NODOS
# Tipo 1 -> Resistor
# Tipo 2 -> Fuente de Corriente
# Tipo 3 -> Fuente de Voltaje
#
#       T   MAG N+  N-										
#(1)┌	  1	  R	  R+	R-	┐		
#(2)|	  2	  I	  I+	I-	|	
#(3)|	  3	  V	  V+	V-  |
#(:)|	  -	  -	  -	  -	  |
#(L)└	  -	  -	  -	  -	  ┘
#
# ANALISIS DE MALLAS
# Tipo 1 -> Resistor
# Tipo 2 -> Fuente de Voltaje
# Tipo 3 -> Fuente de Corriente
#
#       T   MAG M+  M-										
#(1)┌	  1	  R	  R+	R-	┐		
#(2)|	  2	  V	  V+	V-	|	
#(3)|	  3	  I	  I+	I-  |
#(:)|	  -	  -	  -	  -	  |
#(L)└	  -	  -	  -	  -	  ┘

clc
clear

          
nodos_mallas_1_2 % Programa 1 Ingreaso de Datos Automatico
nodos_mallas_2 % Programa 2 Conexiones
nodos_mallas_3 % Programa 3 Resistores
nodos_mallas_4 % Programa 4 Sumatoria Fuentes de Corriente/Fuentes de Voltaje
nodos_mallas_5 % Programa 5 (Super Nodos/Mallas Simple)
nodos_mallas_6 % Programa 6 (Super Nodos/Mallas Normal)

rref(matC)



