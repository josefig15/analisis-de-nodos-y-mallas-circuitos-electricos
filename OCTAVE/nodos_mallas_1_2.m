# PROGRMA 0_2 INGRESO DATOS AUTOMATICO
# 1) Programa pregunta el numero de Elementos del circuito
# 2) Programa pregunta el numero de Nodos/Mallas del circuito.
# 2.1) Numero Nodos = Numero Total de Nodos - 1 
# 3) Programa crea matriz A "Ingreso" 
# 4) Programa empieza a ingresar automaticamente cada elemento a la matriz.
# 4.1) Pregunta El tipo: 1) Resistor 2)F.Corriente 3)F.Voltaje
# 4.2) Pregunta el valor del elemento.
# 4.3) Pregunta Numero Nodo/Malla Positivo.
# 4.4) Pregunta Numero nodo/Malla Negativo.

disp("TIPO DE ANALISIS?")
input("1)NODOS 2)MALLAS ? ")
O = ans;
input("NUMERO DE ELEMENTOS? ")
L = ans;  
input("NUMERO DE NODOS/MALLAS? ")
Q = ans;

matA = zeros(L,4); %Creacion Matriz A "INGRESO"

U = 0;  % Contador Super Nodos/Mallas Simples.
D = 0;  % Contador Super Nodos/Mallas Normales.
for F = 1:L
  disp(" ") % Salto de linea.
  disp("ELEMENTO NUMERO")
  disp(F)
  
  if O == 1         % Analisis de Nodos
    disp("TIPO? 1)R 2)I 3)V ")
  elseif O == 2     % Analisis de Mallas
    disp("TIPO? 1)R 2)V 3)I ")
  endif
  input("? ")
  T = ans;
  
  if T>3 
    disp("ERROR TIPO DE ELEMENTO NO EXISTENTE")
    return
  endif
 
  input("VALOR? ")
  M = ans;
  input("NODO/MALLA POSITIVO? ")
  P = ans;
  input("NODO/MALLA NEGATIVO? ")
  N = ans;
  
  % Escribiendo datos matriz
  matA(F,1) = T;
  matA(F,2) = M;
  matA(F,3) = P;
  matA(F,4) = N;
  
  % Banderas
  E = P==N;         % Indicador Nodos Iguales
  Z = P==0 && N==0; % Indicador Nodos a cero.
  I = P!=0 && N==0; % Indicador Nodo Positivo diferente de cero.
  J = P==0 && N!=0; % Indicador Nodo Negativo diferente de cero.
  K = P!=0 && N!=0; % Indicador Ningun Nodo a cero.
  
  if E || Z
    disp("ERROR 1: DOS NODOS A CERO O DOS NODOS IGUALES")
    return
  endif
  
  if T == 3       % Cuando Tipo F.Voltaje
    if I || J     % Tipo Super Nodo Simple.
      U = U + 1;  % Incrementa contador SNS.
    elseif K      % Tipo Super Nodo Normal.
      D = D + 1;  % Incrementa contador SNN.
    endif
  endif
  
endfor

% PROCESO CALCULO PROPIEDADES CIRCUITO
disp("Numero de SN/SM Simples:")
disp(U)
disp("Numero de SN/SM Normales:")
disp(D)

G = Q - 1;      % Numero Maximo SNN (G)

if D > G        % Cuando Numero SNN (D) > Numero Maximo SNN (G)
  disp("ERROR 2: EXCESO SUPER NODOS/SUPER MALLAS")
  return
endif

if D!=0 && D<=G % Cuando Numero SNN (D)!=0 AND Numero SNN(D) <= Numero Maximo SNN (G) 
  H = Q - D;    % Numero maximo SNS (H) = Numero Nodos (Q) - Numero SNN (D)
endif

if D == 0       % Cuando Numero SNN (D) = 0
  H = Q;        % Numero Maximo SNS (H) = Numero Nodos (Q)
endif

if U > H        % Cuando Numero SNS (U) > Numero Maximo SNS (H)
  disp("ERROR 2: EXCESO SUPER NODOS/SUPER MALLAS")
endif


  

  

