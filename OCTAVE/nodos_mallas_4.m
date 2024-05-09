 % VARIABLES GLOBALES
 % L -> NUMERO DE ELEMENTOS
 % Q -> NUMERO DE NODOS/MALLAS
 % O -> TIPO DE ANALISIS (O=1 NODOS, O=2 MALLAS)

 % Programas 4 FUENTE CORRIENTE V0_2 MODIFICADO
 
 disp("Programa 4")
 
 S = 0;
 
 for F = 1:Q            % Recorre Filas Mat C = Columnas Mat B
   for Y = 1:L          % Recorre Filas Mat B = Filas Mat A   
     
     T = matA(Y,1);     % Tipo
     M = matA(Y,2);     % Magnitud
     P = matA(Y,3);     % Positivo
     N = matA(Y,4);     % Negativo
     X = matB(Y,F);     % Conexion
     
     if T == 2 && X     % Si tipo 2 y Conexion fila Mat B
       
       if P == F        % Cuando Positivo igual fila Mat C ecuacion
         if O == 1      % Analisis de Nodos.
            S = M + S;
         elseif O == 2  % Analisis de Mallas.
            S = -M + S;
         endif
       endif
       
       if P != F        % Cuando Positivo diferente fila Mat C ecuacion
         if O == 1      % Analisis de Nodos.
            S = -M + S;
         elseif O == 2  % Analisis de Mallas.
            S = M + S;
         endif
       endif
       
     endif
     
   endfor
   
   matC( F , Q + 1 ) = S;
   S = 0;
   
 endfor
 
 % Proceso para Borrar conexiones Resistores
 for F = 1:L            % Recorre Filas Mat A = Filas Mat B  
   
   T = matA(F,1);       % Tipo
   
   P = matA(F,3);       % Positivo
   N = matA(F,4);       % Negativo
   
   if T == 2            % Tipo 2
     
     if P != 0          % Positivo Diferente de Cero
       matB(F,P) = 0;   % Borra Conexion Mat B fila F, Columna Positivo
     endif
     
     if N != 0          % Negativo Diferentede Cero
       matB(F,N) = 0;   % Borra Conexion Mat B fila F, Columna Negativo
     endif
     
   endif
   
 endfor

 disp("Matriz Ecuacion"),matC
 disp("Matriz Conexiones"),matB
