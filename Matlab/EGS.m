% Creamos una matriz de ejemplo
A = [2 1 -1 2; -3 -1 2 -3; -2 1 2 -1; 1 -1 1 -1];

% Verificamos si la matriz es resoluble por el método de eliminación gaussiana
if det(A) == 0
    disp('La matriz no se puede resolver por eliminación gaussiana');
else
    % Creamos una copia de la matriz
    B = A;

    % Imprimimos la tabla de la matriz original
    disp('Matriz original:');
    disp(A);

    % Realizamos las operaciones de eliminación gaussiana
    for k = 1:size(B,1)-1 % Recorremos las filas de la matriz
        for i = k+1:size(B,1) % Recorremos las filas debajo de la fila actual
            factor = B(i,k) / B(k,k); % Calculamos el factor de eliminación
            for j = k:size(B,2) % Recorremos las columnas de la fila actual
                B(i,j) = B(i,j) - factor * B(k,j); % Realizamos la eliminación gaussiana
            end
        end
        
        % Imprimimos la tabla de la matriz copia
        disp(['Matriz después de la iteración ', num2str(k), ':']);
        disp(B);
    end

    % Imprimimos la solución del sistema
    disp('La solución del sistema es:');
    disp(B(:,end) ./ diag(B));
end
