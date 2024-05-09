% VARIABLES GLOBALES
% L -> NUMERO DE ELEMENTOS
% Q -> NUMERO DE NODOS/MALLAS
% O -> TIPO DE ANALISIS (O=1 NODOS, O=2 MALLAS)

% PROGRAMA 2: CONEXIONES
disp("Programa 2 CONEXIONES")

% Proceso para crear matrices de trabajo
 matB = zeros( L , Q );     % Mat B Conexiones
 matC = zeros( Q , Q + 1 ); % Mat C Ecuaciones
 
% Proceso para escribir conexiones
for F = 1:L             % Recorre Filas Mat A = Filas Mat B  
  
  T = matA(F,1);        % Tipo
  P = matA(F,3);        % Positivo
  N = matA(F,4);        % Negativo
  
  K = P!=0 && N!=0;     % Indicador Positivo y Negativo diferente de cero
  D = T == 3 && K;      % Indicador Suoer Nodo Normal
  
  if T==1 || T==2 || D  % Tipo 1 , Tipo 2 y Tipo 3 Normal
    if P != 0           % Positivo Diferente de Cero
      matB(F,P) = 1;    % Escribe Conexion Mat B fila F, Columna Positivo
    endif
    if N != 0           % Negativo Diferente de Cero
      matB(F,N) = 1;    % Escribe Conexion Mat B fila F, Columna Positivo
    endif
  endif
  
endfor

  disp("Matriz Conexiones")
  matB
  [matA,matB]