function x = factorizacionLU(A, b)
    % Factorización LU
    [L, U] = lu(A);
    
    % Resolución del sistema utilizando la factorización LU
    y = L \ b;
    x = U \ y;
    
    % Impresión de tablas
    disp('Matriz A:');
    disp(A);
    
    disp('Vector b:');
    disp(b);
    
    disp('Matriz L:');
    disp(L);
    
    disp('Matriz U:');
    disp(U);
    
    disp('Vector y:');
    disp(y);
    
    disp('Solución x:');
    disp(x);
end



