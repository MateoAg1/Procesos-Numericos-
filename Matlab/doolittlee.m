function [L, U, x] = doolittlee(A, b)
    % Verificar que la matriz de entrada sea cuadrada
    [m, n] = size(A);
    if m ~= n
        error('La matriz de entrada debe ser cuadrada.');
    end

    % Verificar que la matriz de entrada sea no singular
    if det(A) == 0
        error('La matriz de entrada es singular.');
    end

    % Verificar que el tamaño de la matriz b 
    if numel(b) ~= n % numero de elementos de la matriz
        error('El tamaño de la matriz b debe ser igual al numero de columnas de A.');
    end

    % matrices L y U con ceros
    L = zeros(n);
    U = zeros(n);

    % Descomposición de Doolittle
    for k = 1:n %k es la columna y la fila actual que se esta procesando en cada iteracion
        % Calcular los elementos de la matriz U
        U(k, k:n) = A(k, k:n) - L(k, 1:k-1) * U(1:k-1, k:n); 

        % Calcular los elementos de la matriz L
        for i = k+1:n
            L(i, k) = (A(i, k) - L(i, 1:k-1) * U(1:k-1, k)) / U(k, k);
        end
        
        % Mostrar etapa actual
        disp('Etapa ');
        disp('Matriz L:');
        disp(L);
        disp('Matriz U:');
        disp(U);
        disp('');
    end

    % Agregar unos en la diagonal de L
    L(1:n+1:end) = 1;

    % Resolver el sistema de ecuaciones
    y = inferior(L, b);
    x = superior(U, y);
    
    % Mostrar resultados
    disp('Matriz L final:');
    disp(L);
    disp('Matriz U final:');
    disp(U);
    disp('Vector solución:');
    disp(x);
end
