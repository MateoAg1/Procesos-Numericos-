function x = pivoteoTotal(A, b)
    % Verificar que el tamaño de la matriz A y el vector b sea compatible
    [m, n] = size(A);
    if m ~= n || n ~= length(b)
        error('El tamaño de la matriz A y el vector b no es compatible.');
    end

    % Concatenar matriz A y vector b en una matriz extendida
    Ab = [A b];

    % Inicializar vector de índices de permutación
    p = 1:n;

    % Pivoteo Total
    for k = 1:n-1
        % Encontrar el elemento de pivote máximo
        [~, maxIndex] = max(abs(Ab(k:n, k:n)));

        % Obtener índices de fila y columna del elemento de pivote máximo
        [rowIndex, colIndex] = ind2sub(size(Ab(k:n, k:n)), maxIndex);
        rowIndex = rowIndex + k - 1;
        colIndex = colIndex + k - 1;

        % Intercambiar filas y columnas según el pivote máximo
        Ab([k rowIndex], :) = Ab([rowIndex k], :);
        Ab(:, [k colIndex]) = Ab(:, [colIndex k]);

        % Actualizar el vector de índices de permutación
        p([k colIndex]) = p([colIndex k]);

        % Mostrar tabla actual
        disp(['Paso ', num2str(k)]);
        disp('Tabla actual:');
        disp(Ab);
        disp('');

        % Eliminación hacia adelante
        for i = k+1:n
            factor = Ab(i, k) / Ab(k, k);
            Ab(i, k:n+1) = Ab(i, k:n+1) - factor * Ab(k, k:n+1);
        end
    end

    % Mostrar la matriz triangular superior resultante
    disp('Matriz triangular superior:');
    disp(Ab);
    disp('');

    % Resolución del sistema triangular superior
    x = zeros(n, 1);
    x(n) = Ab(n, n+1) / Ab(n, n);
    for i = n-1:-1:1
        x(i) = (Ab(i, n+1) - Ab(i, i+1:n) * x(i+1:n)) / Ab(i, i);
    end

    % Mostrar el vector solución permutado
    x_perm = x(p);
    disp('Vector solución:');
    disp(x_perm);
end
