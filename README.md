# analisis-de-nodos-y-mallas-circuitos-electricos
Este programa ha sido escrito dentro de las limitantes de una calculadora programable TI-83.
Utilizando solo 26 valriables (A-Z), 3 matrices y 3 vecttores.

Este es una modificacion del programa de analisis de Nodos para poder realizar analisis de Mallas. 
Gracias a la propiedad de la Dualidad de los circuitos Electricos, los mismos procesos utilizados para el analisis de Nodos pueden ocuparse para realizar analisis de Mallas.

### Cambios realizados al codigo para realizar Analisis de Mallas:
1) Los elementos del circuito se describen ahora por dos Mallas (La Malla que entra por terminal Positiva y Terminal Negativa).
2) Los Elementos del tipo 2 ahora pasan a ser las Fuentes Independiente de Voltaje.
3) Los Elementos del tipo 3 ahora pasan a ser las Fuentes Independiente de Corriente. (Las Super Mallas se comportan Igual que Los Super Nodos).

### INSTRUCCIONES DE USO CALCULADORA TI-83/84:
1) Ingresar individualmente cada programa en la calculadora y respetar el numero del programa, este numero corresponde al orden de operacion.
2) Ejecutar el programa "PROGRAMA 0.txt"
	
### INSTRUCCIONES DE USO OCTAVE:
1) Poner todos los script en un solo directorio.
2) Ejecutar el escript "nodos_mallas_0.m". (contiene el orden de operacion de cada programa).

### COMO AJUSTAR EL CIRCUITO USANDO ANALISIS DE NODOS:
1) Contar El Numero Total de Elementos que Componene el Circuito (Resistores, Fuentes de Voltaje y Fuentes de Corriente).
2) Designar un nodo 0 de referencia y asignar un Numero a cada Nodo.
3) Contar El Numero de Nodos dentro del Circuito. 
4) Asumir una polaridad cualquiera para los resistores y marcarlos con + el positivo y - para el negativo. (Guia para Identificar la Polaridad de Los Nodos).

### COMO AJUSTAR EL CIRCUITO USANDO ANALISIS DE MALLAS:
Asegurarse que el circuito no tenga elementos superpuestos uno sobre otros para poder describirse con mallas (Red Plana).
1) Contar El Numero Total de Elementos que Componene el Circuito (Resistores, Fuentes de Voltaje y Fuentes de Corriente).
2) Dibujar todas las mallas del circuito en sentido Horario y Asignarles un Numero.
3) Contar El Numero de Mallas dentro del Circuito. 
4) Asumir una polaridad cualquiera para los resistores y marcarlos con + el positivo y - para el negativo. (Guia para Identificar la Polaridad de Los Mallas).

### INGRESANDO LOS ELEMENTOS DEL CIRCUITO
Al ejecutar el Programa, automaticamente pregunta los datos del circuito:
1) Pregunta el tipo de Analisis, Para Analisis de Nodos es el Numero 1 y para Analisis de Mallas es Numero 2.
2) Pregunta el Numero de Elementos del Circuito.
3) Pregunta el Numero de Nodos/Mallas del Circuito.

Despues de Ingresar los datos del circuito, el Programa pregunta los datos correspondientes de cada Elemento del circuito y los almacena automaticamente en la Matriz A.
1) Pregunta el Numero deL Tipo de Elemento.
1.1) Para Analisis de Nodos: Numero 1 Resisitor, Numero 2 Fuente de Corriente y Numero 3 Fuente de Voltaje.
1.2) Para Analisis de Mallas: Numero 1 Resisitor, Numero 2 Fuente de Voltaje y Numero 3 Fuente de Corriente.
3) Pregunta el Valor del Elemento.
4) Pregunta el Nodo/Malla Conectado a la Terminal Positiva del Elemento.
5) Pregunta el Nodo/Malla Conectado a la Terminal Negativa del Elemento.

Los datos quedan almacenados en la MAtriz A de la siguiente manera:

MATRIZ A  ANALISIS DE NODOS
 
    	T  	M	N+      N-		
	1 ┌	1	R	R+ 	R-	┐	RESISTOR		
	2 |	2	I	I+ 	I-	|	FUENTE INDEPENDIENTE DE CORRIENTE 
	3 |	3	V	V+ 	V- 	|	FUENTE INDEPENDIENTE DE VOLTAJE
	: |	-	-	-	 -	|
	L └ 	-	-	-	 -	┘
		1	 2	3	 4

MATRIZ A  ANALISIS DE MALLAS

      	T  	M	M+       M-
	1 ┌	1	R	R+ 	R-	┐	RESISTOR		
	2 |	2	V	V+ 	V-	|	FUENTE INDEPENDIENTE DE CORRIENTE 
	3 |	3	I	I+ 	I- 	|	FUENTE INDEPENDIENTE DE VOLTAJE
	: |	-	-	-	 -	|
	L └ 	-	-	-	 -	┘
		1	 2	3	 4

* Columna 1: T Tipo del Elemento
* Columna 2: M Magnitud
* Columna 3: N+ Nodo Positivo / M+ Malla Positiva
* Columna 4: N- Nodo Negativo / M- Malla Negativa.
	

Cada fila de la matriz A representa un elemento del circuito.
El numero de filas de la matriz A es igual al numero de elementos del circuito.	

### REGLAS SOBRE EL CONTENIDO DE MATRIZ A:
	- UN ELEMENTO NO PUEDE TENER DOS NODOS CON EL MISMO NUMERO.
	- UN ELEMENTO NO PUEDE TEBER DOS NODOS CONECTADOS A LA REFERENCIA (NODO 0).
	- TENER DOS FUENTES DE CORRIENTE EN SERIE. *
	- TENER DOS FUENTES DE VOLTAJE EN PARALELO.

* El programa no puede detectar dos fuentes de corriente en serie, queda a discresion del usuario no cometer ese error.	

Si una de estas condicones se cumple, el programa lanza un mensaje de error e interrumpe la ejecucion del programa. 	

### MENSAJES DE ERROR:
	Error 1: Un elemento con dos Nodos iguales o un Elemento con dos Nodos a cero.
	Error 2: Exceso de Super Nodos (Fuentes de Voltaje).
