 % VARIABLES GLOBALES
 % L -> NUMERO DE ELEMENTOS
 % Q -> NUMERO DE NODOS/MALLAS
 % O -> TIPO DE ANALISIS (O=1 NODOS, O=2 MALLAS) 
 
 % Programa 5 SUPER NODOS/MALLAS SIMPLES

  disp("Programa 5")
  
  L2 = zeros(1,Q);          % Vector Super Nodos Simples, vacio
  
  for F = 1:L
    
    T = matA(F,1);          % Tipo
    M = matA(F,2);          % Magnitud
    P = matA(F,3);          % Positivo
    N = matA(F,4);          % Negativo
    
    I = P != 0 && N == 0;   % Indicador Positivo diferente de cero
    J = P == 0 && N != 0;   % Indicador Negativo diferente de cero
    
    if T == 3 && ( I || J ) % Tipo F.Voltaje y Un terminal diferente de cero
      
      if I == 1             % Positivo Diferente de Cero.        
        H = P;              % Puntero fila Ecuacion = Positivo.
      endif
      
      if J == 1             % Negativo Diferente de Cero.
        H = N;              % Puntero fila Ecuacion = Negativo.
      endif
      
       L2(H) = 1;           % Escribe posicion indicador SNS L2          
      
      % Proceso escritura ecuacion Super Nodos
      for C = 1:Q+1          % Recorre columnas de Fila F mat C ecuaciones

        matC(H,C) = 0;       % Borra fila puntero H ecuacion mat C,  
        
        if C == P && I       % Cuando Columna mat C = Nodo Positivo y Nodo Positivo != 0
          if O == 1          % Analisis de Nodos
            matC(H,C) = 1;
          elseif O == 2      % Analisis de Mallas
            matC(H,C) = -1;
          endif
        endif
        
        if C == N && J       % Cuando Columna mat C = Nodo Negativo y Nodo Negativo != 0
          if O == 1          % Analisis de Nodos
            matC(H,C) = -1;
          elseif O == 2      % Analisis de Mallas
            matC(H,C) = 1;
          endif
        endif
        
        if C == Q + 1        % cuando ultima columna Mat C
          matC(H,C) = M;
        endif
         
      endfor
        
    endif
 
  endfor
  
  disp("Matriz Ecuacion"),matC
  disp("Vector Super Modos/Mallas Simples"),L2
