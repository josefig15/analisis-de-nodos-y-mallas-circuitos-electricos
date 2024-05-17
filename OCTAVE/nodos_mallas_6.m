 % Programa 6 V0.5.2
 % Este programa solo es para verificar el algoritmo de Super Nodos Normales
 % Va de afuera para adentro en la cadena de SN Normales
 
 disp("Programa 6 V0.5.2 Super Nodos Normales")
 
 L3 = zeros(1,L)           % Vector Super Nodos Normales, vacio

 D = 1;                    % Valor Inicial para entrar Bucle While.
 
 % Bucle Principal
 while  D >= 1
   
   U = 0;                           % Contador 1 Conexion            
   D = 0;                           % Contador 2 Conexion
   Z = 0;                           % Contador 0 Conexion (Solo este es de interes).                      
   
   for F = 1:L                      % Recorre Filas Mat A = Filas MAt B
     
    T = matA(F,1);                  % Tipo
    M = matA(F,2);                  % Magnitud
    P = matA(F,3);                  % Positivo
    N = matA(F,4);                  % Negativo
    
    K = P != 0 && N != 0;           % Indicador Positivo y Negativo diferente de Cero
    E = K && L3(F)==0;              % Indicador Super Nodo Normal No Operado
    
    if T == 3 && E                  % Tipo F.Voltaje y Ningun terminal a Cero
      
        G = 0;                      % Puntero fila mat C para LCk/LVK SN/SM
        H = 0;                      % Puntero fila mat C para Ecuacion SN/SM
        I = 0;                      % Indicador Concatenamiento Positivo         
        J = 0;                      % Indicador Concatenamiento Negativo
      
        % Proceso para encontrar concatenamiento
        for Y = 1:L                 % Recorre Filas Mat B = Filas Mat A
          if matB(Y,P) && Y != F    % Conexion con otro SN/SM en Positivo
            I = 1;
          endif
          if matB(Y,N) && Y != F    % Conexion con otro SN/SM en Negativo
            J = 1;     
          endif 
        endfor
      
        disp("Fila F"),F
        disp("Conexion Positivo"),I
        disp("Conexion Negativo"),J
      
        % Condiciones no Operacion Super Nodo Normal/Super Malla Normal
        if I && J                   % Concatenamiento ambos Nodos (NO OPERACION)
          D = D + 1;
        endif
      
        % Condiciones Operacion Super Nodo Normal/Super Malla Normal
        if I!=1 || J!=1
             
             L3(F) = 1;                       % Indicador Super Nodo Operado
             
             % Cuando No Hay Super Nodo simple en una de las terminales
             if L2(P) == 0 && L2(N) == 0     

                  if I && J==0                % Concatenamiento en Positivo
                    U = U + 1;                % Contador 1 Conexion
                    G = P;                    % Puntero fila LCk/LVK = Positivo
                    H = N;                    % Puntero fila Ecuacion= Negativo
                  endif
       
                  if I==0 && J                % Concatenamiento en Negativo
                    U = U + 1;                % Contador 1 Conexion
                    G = N;                    % Puntero fila LCk/LVK = Negativo
                    H = P;                    % Puntero fila Ecuacion= Positivo 
                  endif
       
                  if I==0 && J==0             % No Concatenamiento 
                    Z = Z +1;                 % Contador 0 Conexion
                    G = N;                    % Puntero fila LCk/LVK = Negativo
                    H = P;                    % Puntero fila Ecuacion= Positivo
                  endif
        
             endif % Fin asignacion punteros super nodo Normal 
             
             % Cuando Si Hay Super Nodo simple en una de las terminales 
             if L2(P) || L2(N) 

                if L2(P) && L2(N) == 0        % Cuando Negativo Disponible
                  H = N;                      % Puntero fila Ecuacion= Negativo
                endif
                
                if L2(P) == 0 && L2(N)        % Cuando Positivo Disponible
                  H = P;                      % Puntero fila Ecuacion= Positivo
                endif                
                
                L2(H) = 1;                    % Escritura SN simple
             endif % Fin asignacion punteros Super Nodo Normal
             
             % Proceso escritura ecuaciones Super Nodo Normal
             for C = 1:Q+1
               % Cuando Positivo y Negativo No Conectados a Cero. Super Nodo Normal
               if !L2(P) && !L2(N)
                 matC(G,C) = matC(P,C) + matC(N,C); % Sumatoria Fila Positivo y Fila Negativo en fila puntero LCk/LVK (G)
               endif
               
               matC(H,C) = 0;       % Borrar Fila Puntero Ecuacion (H).
               % Cuando Columna Mat C = Positivo.
               if C == P            
                 if O == 1          % Analisis de Nodos
                    matC(H,C) = 1;  % La Terminal Positiva es Positiva.
                 elseif O == 2      % Analisis de Mallas
                    matC(H,C) = -1; % La Terminal Positiva es Negativa.
                 endif 
               endif  
               % Cuando Columna Mat C = Negativo.
               if C == N            
                 if O == 1          % Analisis de Nodos
                    matC(H,C) = -1; % La terminal Negativa es Negativa.
                 elseif O == 2      % Analisis de Mallas
                    matC(H,C) = 1;  % La terminal Negativa es Positiva.
                  endif
               endif
                % Cuando Columna Mat C = Ultima Columna.
               if C == Q + 1       
                 matC(H,C) = M;     % Escribe el valor de Super Nodo/Super Malla.
               endif
               
             endfor
             
        endif % fin Condiciones Operacion Super Nodo Normal
        
    endif % fin tipo 3 y habilitador E
    
   endfor
   
   disp("SNN/SMN 0 Conexiones"),Z
   disp("SNN/SMN 1 Conexiones"),U
   disp("SNN/SMN 2 Conexiones"),D
   disp("SNN/SMN Operados")
   L3
   % Proceso para borrar conexiones
   for F = 1:L
     
     if L3(F) == 1
       
       P = matA(F,3);
       N = matA(F,4);
       
       if matB(F,P) == 1
         matB(F,P) = 0;
       endif
       
       if matB(F,N) == 1
         matB(F,N) = 0;
       endif
       
     endif
     
   endfor
   disp("Matriz ecuaciones bucle while"),matC
endwhile

disp("Matriz Conexiones"),matB
disp("Matriz ecuaciones"),matC

