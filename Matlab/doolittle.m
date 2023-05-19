function [L, U, x] = doolittle(A, b)
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
        disp(['Etapa ', num2str(k)]);
        disp('Matriz L:');
        disp(L);
        disp('Matriz U:');
        disp(U);
        disp('------------------');
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

% Funcion para resolver un sistema triangular inferior
function x = inferior(L, b)
    n = size(L, 1);
    x = zeros(n, 1);

    for i = 1:n
        x(i) = (b(i) - L(i, 1:i-1) * x(1:i-1)) / L(i, i);
    end
end

% Funcion para resolver un sistema triangular superior
function x = superior(U, b)
    n = size(U, 1);
    x = zeros(n, 1);

    for i = n:-1:1
        x(i) = (b(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    end
end




