function x = eliminacionGaussiana(A, b)
    % Verificar que el tamaño de la matriz A y el vector b sea compatible
    [m, n] = size(A);
    if m ~= n || n ~= length(b)
        error('El tamaño de la matriz A y el vector b no es compatible.');
    end

    % Concatenar matriz A y vector b en una matriz extendida
    Ab = [A b];

    % Eliminación Gaussiana
    for k = 1:n-1
        % Pivoteo parcial
        [~, maxIndex] = max(abs(Ab(k:n, k)));  % Encontrar índice del máximo valor en la columna k
        maxIndex = maxIndex + k - 1;  % Ajustar el índice al tamaño completo de la matriz
        Ab([k maxIndex], :) = Ab([maxIndex k], :);  % Intercambiar filas k y maxIndex

        % Mostrar paso actual
        disp(['Paso ', num2str(k)]);
        disp('Matriz extendida:');
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

    % Mostrar el vector solución
    disp('Vector solución:');
    disp(x);
end

