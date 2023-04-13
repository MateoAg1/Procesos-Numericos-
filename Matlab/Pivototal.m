% Verificar si la matriz puede ser resuelta por el método de pivoteo total
A = [1 2 -3; 4 5 6; 7 8 9];
b = [1; 2; 3];
if det(A) == 0
    disp('La matriz no puede ser resuelta por el método de pivoteo total');
else
    % Resolver la matriz por el método de pivoteo total
    Ab = [A b];
    [rref_Ab, pivots] = rref(Ab);
    disp('Matriz aumentada:');
    disp(Ab);
    disp('Matriz escalonada reducida por filas:');
    disp(rref_Ab);
    disp('Pivotes:');
    disp(pivots);
    disp('Solución:');
    disp(rref_Ab(:,end));
end
